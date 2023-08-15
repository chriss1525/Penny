// initialize express server
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
require ('dotenv').config();

// initialize body-parser to parse incoming parameters requests to req.body
app.use(express.json());

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
}
);

// import supabase library, initialize supabase client
const { createClient } = require('@supabase/supabase-js');
const supabaseUrl = 'https://xldizurqdzdhckzisfxh.supabase.co';
const supabaseKey = process.env.SUPABASE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);


// waitlist form submission
app.post('/waitlist', async (req, res) => {
  try {
    const { email, username } = req.body;
    // check if email is already in waitlist
    const { data, error } = await supabase
      .from('waitlist')
      .insert([
        { email: email }
      ]);
    // if email is already in waitlist, return error
    if (error) throw error;
    res.status(200).json({ data });
  }
  catch (error) {
    res.status(400).json({ error: error.message });
  } 
});


