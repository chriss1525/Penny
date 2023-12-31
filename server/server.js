require("dotenv").config();
const express = require("express");
const cors = require("cors");
const session = require("express-session");

// Routes imports
const waitlist = require("./routes/waitlist");
const login = require("./user/login");
const register = require("./user/register");
const transactions = require("./routes/transactions");
const analysis = require("./routes/analysis");

// Express setup
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// Session setup
app.set('trust proxy', 1);
app.use(
	session({
		secret: process.env.SESSION_SECRET,
		resave: false,
		saveUninitialized: false,
		proxy: true
	})
);

// Routes setup
// http://localhost:3000/login/
app.use("/login", login);

// http://localhost:3000/register/
app.use("/register", register);

// http://localhost:3000/waitlist/
app.use("/waitlist", waitlist);

// http://localhost:3000/transactions/
app.use("/transactions", transactions);

// http://localhost:3000/analysis/
app.use("/analysis", analysis);
// Server setup
const port = process.env.PORT || 3000;
app.listen(port, () => {
	console.log(`Server listening on port ${port}`);
});
