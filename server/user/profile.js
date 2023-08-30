const express = require('express');
const router = express.Router();
const supabase = require("../utils/db.js");

router.get('/profile/:userId', async (req, res) => {
  const userId = req.params.userId;

  try {
    const { data, error } = await supabase
      .from('users')
      .select('id, username, email, bio')
      .eq('id', userId)
      .single();

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

module.exports = router;

