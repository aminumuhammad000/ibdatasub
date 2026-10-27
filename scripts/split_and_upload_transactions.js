const fs = require('fs');
const path = require('path');
const BSON = require('/tmp/bson-tool/node_modules/bson');

const backupDir = '/tmp/mongodb-backup/backup-2026-07-13/connecta_vtu';
const outDir = path.resolve(__dirname, '../supabase');

function toUuid(mongoId) {
  if (!mongoId) return null;
  const str = String(mongoId).toLowerCase().padStart(32, '0');
  return `${str.slice(0, 8)}-${str.slice(8, 12)}-${str.slice(12, 16)}-${str.slice(16, 20)}-${str.slice(20, 32)}`;
}

function escapeSql(val) {
  if (val === null || val === undefined) return 'NULL';
  if (typeof val === 'number') return isNaN(val) ? '0' : String(val);
  if (typeof val === 'boolean') return val ? 'TRUE' : 'FALSE';
  if (val instanceof Date) return `'${val.toISOString()}'`;
  return `'${String(val).replace(/'/g, "''")}'`;
}

console.log('Reading transactions from backup...');
const buf = fs.readFileSync(path.join(backupDir, 'transactions.bson'));
const txs = [];
let offset = 0;
while (offset < buf.length) {
  const size = buf.readInt32LE(offset);
  if (size <= 0 || offset + size > buf.length) break;
  try {
    txs.push(BSON.deserialize(buf.subarray(offset, offset + size)));
  } catch (e) {
    break;
  }
  offset += size;
}

console.log(`Total transactions read: ${txs.length}`);

// Split into 6 parts (~2,890 transactions each)
const NUM_PARTS = 6;
const partSize = Math.ceil(txs.length / NUM_PARTS);
const BATCH_SIZE = 200;

for (let part = 0; part < NUM_PARTS; part++) {
  const start = part * partSize;
  const end = Math.min(start + partSize, txs.length);
  const partTxs = txs.slice(start, end);

  let partSql = `-- ==============================================================================
-- Transactions Seed (Part ${part + 1} of ${NUM_PARTS}): Rows ${start + 1} to ${end} of ${txs.length}
-- ==============================================================================

`;

  let batch = [];
  for (const t of partTxs) {
    const id = toUuid(t._id);
    const userId = t.user_id ? toUuid(t.user_id) : null;
    const walletId = t.wallet_id ? toUuid(t.wallet_id) : null;
    const type = t.type || 'airtime_topup';
    const amount = Number(t.amount || 0);
    const fee = Number(t.fee || 0);
    const totalCharged = Number(t.total_charged || amount);
    const status = t.status === 'failed' ? 'failed' : 'successful';
    const referenceNumber = t.reference_number || t.reference || `TX-${id}`;
    const description = t.description || '';
    const paymentMethod = t.payment_method || 'wallet';
    const destinationAccount = t.destination_account || null;
    const createdAt = t.created_at ? new Date(t.created_at) : new Date();
    const updatedAt = t.updated_at ? new Date(t.updated_at) : new Date();

    batch.push(`(${escapeSql(id)}, ${escapeSql(userId)}, ${escapeSql(walletId)}, ${escapeSql(type)}, ${escapeSql(amount)}, ${escapeSql(fee)}, ${escapeSql(totalCharged)}, ${escapeSql(status)}, ${escapeSql(referenceNumber)}, ${escapeSql(description)}, ${escapeSql(paymentMethod)}, ${escapeSql(destinationAccount)}, ${escapeSql(createdAt)}, ${escapeSql(updatedAt)})`);

    if (batch.length >= BATCH_SIZE) {
      partSql += `INSERT INTO transactions (id, user_id, wallet_id, type, amount, fee, total_charged, status, reference_number, description, payment_method, destination_account, created_at, updated_at)
VALUES\n${batch.join(',\n')}\nON CONFLICT (reference_number) DO NOTHING;\n\n`;
      batch = [];
    }
  }

  if (batch.length > 0) {
    partSql += `INSERT INTO transactions (id, user_id, wallet_id, type, amount, fee, total_charged, status, reference_number, description, payment_method, destination_account, created_at, updated_at)
VALUES\n${batch.join(',\n')}\nON CONFLICT (reference_number) DO NOTHING;\n\n`;
  }

  const partFileName = `transactions_part${part + 1}.sql`;
  const partPath = path.join(outDir, partFileName);
  fs.writeFileSync(partPath, partSql);
  console.log(`Wrote ${partFileName} (${(partSql.length / 1024).toFixed(1)} KB, ${partTxs.length} rows)`);
}

console.log('Splitting completed successfully.');
