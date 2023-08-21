const express = require("express");
const router = express.Router();
const supabase = require("../utils/db.js");

router.post("/", async (req, res) => {
  try {
    let balance = 0;

    const { message } = req.body;
    const amount = message.match(/\b(\d+)\s?Ksh\b/);
    const transactionType = message.includes("sent") ? "sent" : "received";

    if (transactionType === "sent") {
      balance -= parseInt(amount[1]);
    }

    if (transactionType === "received") {
      balance += parseInt(amount[1]);
    }

    const date = message.match(/\d{2}\/\d{2}\/\d{2}/);

    const { data, error } = await supabase
      .from("transactions")
      .insert({
        amount: amount[1],
        transaction_type: transactionType,
        date: date[0],
        balance: balance,
      })
      .select();

    if (error) throw error;
    res.status(200).json({ data });
  } catch (error) {
    res.status(500).json({ error });
  }
});

module.exports = router;
