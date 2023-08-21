const express = require('express'); // import express
const router = express.Router(); // create router
const supabase = require('../utils/db.js'); // import supabase

// route that receives messages, breaks them down and collects amount, whether its sent or received, and the date
let balance = 0;

async function processMessage(message) {
  const amount = message.match(/\b(\d+)\s?Ksh\b/);
  const transactionType = message.includes('sent') ? 'sent' : 'received';

  if (transactionType === 'sent') {
    balance -= parseInt(amount[1]);
  }

  if (transactionType === 'received') {
    balance += parseInt(amount[1]);
  }

  const date = message.match(/\d{2}\/\d{2}\/\d{2}/);

  const { data, error } = await supabase.from('transactions').insert([
    {
      amount: amount[1],
      transaction_type: transactionType,
      date: date[0],
      balance: balance,
    },
  ]);
}

module.exports = {
  processMessage
};

