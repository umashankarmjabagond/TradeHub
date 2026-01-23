const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

const routes = require("./routes");
app.use("/", routes);

app.get("/health", (req, res) => {
  res.json({ status: "OK" });
});

module.exports = app;
