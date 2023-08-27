const express = require('express');
const router = express.Router();
const supabase = require('../utils/db.js'); 

// Register a new user using supabase authentification
router.post('/', async (req, res) => {
  const { email, password, name } = req.body;
  const { data: user, error } = await supabase.auth.signUp({ email, password, options: { data: { name } } });
  if (error) {
    console.log(error);
    return res.status(400).json({ error: error.message });
  }
  return res.status(200).json({ user });
}
);

module.exports = router;