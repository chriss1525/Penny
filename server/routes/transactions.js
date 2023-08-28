const express = require("express");
const router = express.Router();
const { supabase } = require("../utils/db.js");
const fetch = require("node-fetch");
require('dotenv').config();

router.get("/", async (req, res) => {
  try {
    const access = req.header("Authorization");

    if (!access) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    // Fetch the user's transactions from the database using the user's access token
    const userData = await fetch(`${process.env.SUPABASE_URL}/auth/v1/user`, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${access}`,
        apikey: process.env.SUPABASE_KEY,
      },
    });

    const user = await userData.json();
    console.log(user);

    if (!user.ok) {
      return res.status(401).json({ error: "Unauthorized" });
    } 

    // Get all transactions for a specific user using the correct column name
    const { data, error } = await supabase 
      .from("transactions")
      .select("amount, transaction_type, balance, time, sender, recipient, sender_phone, recipient_phone, transaction_id")
      .eq("user_id", user.id) 
      .order("date", { ascending: false });

    if (error) {
      throw error;
    }

    res.status(200).json({ data });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error });
  }
});

module.exports = router;

