const express = require("express");
const router = express.Router();
const supabase = require("../utils/db.js");

router.get("/", async (req, res) => {
	try {
		const user = req.session.userSession.user;

		// Get all transactions for a specific user
		const { data, error } = await supabase
			.from("transactions")
			.select("*")
			.eq("user_id", user.id)
			.order("date", { ascending: false });

		if (error) throw error;
		res.status(200).json({ data });
	} catch (error) {
		res.status(500).json({ error });
	}
});

module.exports = router;
