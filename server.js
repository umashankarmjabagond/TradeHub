// const express = require("express");
// const app = express();
// app.use(express.json());
// const connectDB = require("./src/config/db");

// const cors = require("cors");

// // Enable CORS for all origins (default)
// app.use(cors());

// connectDB();

// const allRoutes = require("./routes");

// app.use("/", allRoutes);

// app.listen(3001, () => console.log("Auth Service on port 3001"));

const app = require("./src/app");

const PORT = process.env.PORT;

app.listen(PORT, () => {
  console.log(`Auth Service running on port ${PORT}`);
});
