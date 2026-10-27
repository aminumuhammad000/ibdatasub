const fs = require('fs');
const path = require('path');

// Parse environment variables manually from .env.local
const envPath = path.resolve(__dirname, '../.env.local');
if (fs.existsSync(envPath)) {
  const content = fs.readFileSync(envPath, 'utf8');
  for (const line of content.split('\n')) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) continue;
    const idx = trimmed.indexOf('=');
    if (idx !== -1) {
      const key = trimmed.slice(0, idx).trim();
      const val = trimmed.slice(idx + 1).trim();
      if (!process.env[key]) process.env[key] = val;
    }
  }
}

const { createClient } = require(path.resolve(__dirname, '../node_modules/@supabase/supabase-js'));

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  process.env.SUPABASE_SECRET_KEY ||
  process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY ||
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

console.log(`Connecting to Supabase at: ${supabaseUrl}`);
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  console.log('Testing Supabase connection...');
  const { data: test, error: testErr } = await supabase.from('pricing_plans').select('id').limit(1);

  if (testErr && testErr.code === 'PGRST205') {
    console.error('\n⚠️  Notice: Database tables have not yet been created in this Supabase project.\n');
    console.log('To create the schema and seed your MongoDB backup:');
    console.log('1. Open your Supabase Dashboard: https://supabase.com/dashboard/project/ktjqbsoyuukmpvehcdkp');
    console.log('2. Click on the "SQL Editor" in the left sidebar.');
    console.log('3. Open and run: supabase/schema.sql (creates all tables and relationships).');
    console.log('4. Open and run: supabase/seed_data_core.sql (seeds all users, wallets, plans, settings from backup).');
    console.log('5. (Optional) Run: supabase/seed_transactions.sql (seeds the 17,340 historical transactions).\n');
    return;
  }

  console.log('✅ Connected and tables detected.');
}

if (require.main === module) {
  run().catch(err => {
    console.error('Seeding error:', err);
    process.exit(1);
  });
}

module.exports = { run };
