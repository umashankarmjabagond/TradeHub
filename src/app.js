const express = require("express");
const cors = require("cors");

const app = express();

require("./config/db");

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const routes = require("./routes");
app.use("/", routes);

app.get("/health", (req, res) => {
  res.json({ status: "OK" });
});

module.exports = app;
