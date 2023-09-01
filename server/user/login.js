const express = require('express'); 
const router = express.Router();
const supabase = require('../utils/db.js');

// Login a user using supabase authentification
router.post('/', async (req, res) => {
  const { email, password } = req.body;
  const { data, error } = await supabase.auth.signInWithPassword({ email, password });
  if (error) {
    console.log(error);
    return res.status(400).json({ error: error.message });
  }
  req.session.user = data.session;
  return res.status(200).json({ data });
}
);

module.exports = router;
