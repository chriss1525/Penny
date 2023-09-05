const express = require('express');
const router = express.Router();
const supabase = require('../utils/db.js');

router.get('/', async (req, res) => {
  try {
    const user = req.session.userSession.user;

    // get user transactions from db
    const { data: transactions, error } = await supabase
      .from('transactions')
      .select('*')
      .eq('user_id', user.id);

    if (error) {
      console.log('Error fetching transactions:', error);
      return res.status(500).json({ error: 'Error fetching transactions' });
    }

    // Initialize objects to store total send and received money per day
    const totalSendMoneyPerDay = {};
    const totalReceivedMoneyPerDay = {};

    // Calculate total send money and received money per day
    transactions.forEach((transaction) => {
      const date = new Date(transaction.date.replace(/-/g, '/'));

      // Check if the transaction is send money or receive money
      if (transaction.transaction_type === 'send_money') {
        const formattedDate = date.toLocaleDateString();
        totalSendMoneyPerDay[formattedDate] = totalSendMoneyPerDay[formattedDate] ? totalSendMoneyPerDay[formattedDate] + transaction.amount : transaction.amount;
      } else if (transaction.transaction_type === 'receive_money') {
        totalReceivedMoneyPerDay[formattedDate] = totalReceivedMoneyPerDay[formattedDate] ? totalReceivedMoneyPerDay[formattedDate] + transaction.amount : transaction.amount;
      }
    });

    // Send both calculated data in the JSON response
    return res.status(200).json({ totalSendMoneyPerDay, totalReceivedMoneyPerDay });

  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: 'An error occurred while running the query' });
  }
});

module.exports = router;
   
