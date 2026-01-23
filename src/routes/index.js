const express = require("express");
const authRoutes = require("./authRoute/authRoutes");
const userRoutes = require("./userRoute/userRoutes");

const router = express.Router();
router.use("/auth", authRoutes);
router.use("/user", userRoutes);

module.exports = router;
