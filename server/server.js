require("dotenv").config();
const express = require("express");
const cors = require("cors");

// Routes imports
const waitlist = require("./routes/waitlist");

// Express setup
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// Routes setup
// http://localhost:3000/waitlist/
app.use("/waitlist", waitlist);

// Server setup
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});

// import processMessage function
const { processMessage } = require('./routes/process_messages.js');

// route that receives messages, breaks them down and collects amount, whether its sent or received, and the date
app.post('/process_message', (req, res) => {
  const { message } = req.body;

  // call processing funtion
  processMessage(message);

  // send response to client
  res.send('Message processed');
});
