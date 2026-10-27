const fs = require('fs');
const path = require('path');
const BSON = require('/tmp/bson-tool/node_modules/bson');
const { createClient } = require(path.resolve(__dirname, '../admin-next/node_modules/@supabase/supabase-js'));

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://ktjqbsoyuukmpvehcdkp.supabase.co';
const supabaseKey =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  process.env.SUPABASE_SECRET_KEY ||
  process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY ||
  'sb_publishable_ceITR7XipG_dBI7KnBAnZA_RrVBYtjp';

const supabase = createClient(supabaseUrl, supabaseKey, {
  auth: { persistSession: false },
});

function toUuid(mongoId) {
  if (!mongoId) return null;
  const str = String(mongoId).toLowerCase().padStart(32, '0');
  return `${str.slice(0, 8)}-${str.slice(8, 12)}-${str.slice(12, 16)}-${str.slice(16, 20)}-${str.slice(20, 32)}`;
}

async function main() {
  console.log(`Connecting to Supabase at: ${supabaseUrl}`);
  console.log('Reading transactions from backup archive...');

  const buf = fs.readFileSync('/tmp/mongodb-backup/backup-2026-07-13/connecta_vtu/transactions.bson');
  const allTxs = [];
  let offset = 0;
  while (offset < buf.length) {
    const size = buf.readInt32LE(offset);
    if (size <= 0 || offset + size > buf.length) break;
    try {
      allTxs.push(BSON.deserialize(buf.subarray(offset, offset + size)));
    } catch (e) {
      break;
    }
    offset += size;
  }

  const total = allTxs.length;
  console.log(`Total transactions to seed: ${total}`);

  const BATCH_SIZE = 250;
  let inserted = 0;

  for (let i = 0; i < total; i += BATCH_SIZE) {
    const chunk = allTxs.slice(i, i + BATCH_SIZE).map(t => {
      const id = toUuid(t._id);
      return {
        id,
        user_id: t.user_id ? toUuid(t.user_id) : null,
        wallet_id: t.wallet_id ? toUuid(t.wallet_id) : null,
        type: t.type || 'airtime_topup',
        amount: Number(t.amount || 0),
        fee: Number(t.fee || 0),
        total_charged: Number(t.total_charged || t.amount || 0),
        status: t.status === 'failed' ? 'failed' : 'successful',
        reference_number: t.reference_number || t.reference || `TX-${id}`,
        description: t.description || '',
        payment_method: t.payment_method || 'wallet',
        destination_account: t.destination_account || null,
        created_at: t.created_at ? new Date(t.created_at).toISOString() : new Date().toISOString(),
        updated_at: t.updated_at ? new Date(t.updated_at).toISOString() : new Date().toISOString(),
      };
    });

    let retries = 3;
    while (retries > 0) {
      const { error } = await supabase.from('transactions').upsert(chunk, { onConflict: 'reference_number' });
      if (!error) {
        inserted += chunk.length;
        const pct = ((inserted / total) * 100).toFixed(1);
        process.stdout.write(`\rProgress: ${inserted} / ${total} (${pct}%) inserted...`);
        break;
      }
      retries--;
      if (retries === 0) {
        console.error(`\nBatch error at index ${i}:`, error.message);
      } else {
        await new Promise(r => setTimeout(r, 1000));
      }
    }
  }

  console.log('\n\nVerifying total transactions in Supabase database...');
  const { count, error } = await supabase.from('transactions').select('id', { count: 'exact' });
  if (error) {
    console.error('Count query error:', error);
  } else {
    console.log(`✅ Success! Total transactions in Supabase: ${count}`);
  }
}

main().catch(err => {
  console.error('Upload script failed:', err);
  process.exit(1);
});
