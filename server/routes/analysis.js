const express = require('express');
const router = express.Router();
const supabase = require('../utils/db.js');

router.get('/', async (req, res) => {
  try {
    const user = req.session.userSession.user;

    // Check percentage send_money against balance per day per user
    const sendMoney = await supabase
      .from('transactions')
      .select('DATE_TRUNC(\'day\', date) AS transaction_date')
      .select('user_id')
      .select('SUM(CASE WHEN transaction_type = \'send_money\' THEN amount ELSE 0 END) AS total_send_money')
      .select('MAX(CASE WHEN transaction_type = \'send_money\' THEN amount ELSE 0 END) AS max_send_money')
      .eq('user_id', user.id);

    // Check percentage received_money against balance per day per user
    const receivedMoney = await supabase
      .from('transactions')
      .select(`
        DATE_TRUNC('day', date) AS transaction_date,
        user_id,
        SUM(CASE WHEN transaction_type = 'received_money' THEN amount ELSE 0 END) AS total_received_money
      `)
      .eq('user_id', user.id);

    // Execute queries
    const { data: sendMoneyData, error: sendMoneyError } = sendMoney;
    const { data: receivedMoneyData, error: receivedMoneyError } = receivedMoney;

    if (sendMoneyError || receivedMoneyError) {
      console.error('Error running query:', sendMoneyError || receivedMoneyError);
      return res.status(500).json({ error: 'An error occurred while running the query' });
    }

    // Combine send_money and received_money data
    const analysis = { sendMoneyData, receivedMoneyData };

    return res.status(200).json({ analysis });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred while running the query' });
  }
});

module.exports = router;

