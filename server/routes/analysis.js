const express = require('express');
const router = express.Router();
const supabase = require('../utils/db.js');

router.get('/analysis/:id', async (req, res) => {
  try {
    const userId = req.params.id;
    const date_1 = req.query.date_1;
    const date_2 = req.query.date_2;

    const insights = [];

    const date = new Date(date_1);
    const end = new Date(date_2);

    while (date <= end) {
      const next = new Date(date);
      next.setDate(date.getDate() + 1);

      // Get all the entries for the current day
      const { data, error } = await supabase
        .from('transactions')
        .select('transaction_type, amount, balance')
        .eq('id', userId)
        .gte('date', date.toISOString())
        .lt('date', next.toISOString().split('T')[0]);

      if (error) throw error;

      // Calculate insights for the day
      const spent = data
        .filter(transaction => transaction.transaction_type === 'sent')
        .reduce((total, transaction) => total + transaction.amount, 0);

      const startbalanace = data[0].balance;

      const percentage_balance_spent = (spent / startbalance) * 100;

      // construct the insights for the day
      const dailyInsights = {
        date: date.toISOString().split('T')[0],
        spent,
        percentage_balance_spent
      };

      insights.push(dailyInsights);

      date.setDate(date.getDate() + 1);
    }

    res.status(200).json(insights);
  } catch (error) {
    res.status(500).json({ error });
  }
});

module.exports = router;
