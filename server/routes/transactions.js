const express = require("express");
const router = express.Router();
const supabase = require("../utils/db.js");

router.get("/", async (req, res) => {
  try {
    const access = req.header("Authorization");

    if (!access) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    // authenticate the user
    const { data: user, error } = await supabase.auth.api.getUserByCookie(access);

    if (error) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    const userID = user.id;

    // Get all transactions for a specific user
    const { data, error: transaction } = await supabase
      .from("transactions")
      .select("amount, transaction_type, balance, time, sender, recipient, sender_phone, recipient_phone, transaction_id")
      .eq("user_uid", userID)
      .order("date", { ascending: false });

    if (transaction.error) throw transaction.error;
    res.status(200).json({ data });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error });
  }
});

module.exports = router;

