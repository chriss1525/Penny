const express = require("express");
const router = express.Router();
const supabase = require("../utils/db");

router.post("/", async (req, res) => {
  try {
    const { email, name } = req.body;

    // Upsert is a combination of insert and update
    // If the email already exists, it will update the name
    // If the email doesn't exist, it will insert the email and name
    // The onConflict option tells Supabase to use the email column as the conflict column
    const { data, error } = await supabase
      .from("waitlist")
      .upsert({ email, name }, { onConflict: "email" })
      .eq("email", email)
      .select();

    if (error) throw error;

    res.status(200).json({ data: `${data[0].name} added to waitlist!` });
  } catch (error) {
    res.status(error.code).json({ error });
  }
});

module.exports = router;
