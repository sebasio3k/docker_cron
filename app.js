console.log('- Hello 🤤 \n  ' + new Date().toLocaleString('sv-SE'));

const cron = require('node-cron');
const { syncDB } = require('./tasks/sync-db');

cron.schedule('1-59/5 * * * * *', syncDB);

console.log('\n STARTINGs...');
