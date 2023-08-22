const express = require("express");
const router = express.Router();
const supabase = require("../utils/db.js");

router.get("/transactions/:userID", async (req, res) => {
  try {
    const userID = req.params.userID;

    // Get all transactions for a specific user
    const { data, error } = await supabase
      .from("transactions")
      .select("amount, transaction_type, balance")
      .eq("id", userID)
      .order("date", { ascending: false });

    if (error) throw error;
    res.status(200).json({ data });
  } catch (error) {
    res.status(500).json({ error });
  }
});

module.exports = router;

