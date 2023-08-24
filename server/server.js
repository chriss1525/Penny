require("dotenv").config();
const express = require("express");
const cors = require("cors");

// Routes imports
const waitlist = require("./routes/waitlist");
const login = require("./auth/login");
const register = require("./auth/register");
const process_messages = require("./routes/process_messages");

// Express setup
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// Routes setup
// http://localhost:3000/login/
app.use("/login", login);

// http://localhost:3000/register/
app.use("/register", register);

// http://localhost:3000/waitlist/
app.use("/waitlist", waitlist);
// http://localhost:3000/process_messages/
app.use("/process_messages", process_messages);

// Server setup
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
