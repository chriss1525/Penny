const express = require("express");
const router = express.Router();
const supabase = require("../utils/db.js");

// post transactions to db
router.post("/", async (req, res) => {
	try {
		// get user_id from session
		const {
			user: { id: user_id },
		} = req.session.userSession;

		const transactions = req.body;
		const { error } = await supabase.from("transactions").insert(
			transactions.map((transaction) => ({
				user_id,
				transaction_id: transaction.transaction_id,
				recipient: transaction.recipient,
				sender: transaction.sender,
				time: transaction.time,
				amount: transaction.amount,
				transaction_type: transaction.type,
				date: transaction.date,
				balance: parseFloat(transaction.balance.replace(",", "")), // Remove commas from balance and parse as float
				recipient_phone: transaction.recipient_phone,
        sender_phone: transaction.sender_phone,
        cost: transaction.cost,
			}))
		);

		if (error) throw error;
		res.status(200).json({ message: "Success" });
	} catch (error) {
		res.status(500).json({ error: error.message });
	}
});

// get all transactions for a specific user
router.get("/", async (req, res) => {
	try {
		const user = req.session.userSession.user;

		// Get all transactions for a specific user
		const { data, error } = await supabase
			.from("transactions")
			.select("*")
			.eq("user_id", user.id)
			.order("created_at", { ascending: false });

		if (error) throw error;
		res.status(200).json({ data });
	} catch (error) {
		res.status(500).json({ error });
	}
});

module.exports = router;
