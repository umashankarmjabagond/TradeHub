const express = require("express");
const authRoutes = require("./authRoute/authRoutes");
const userRoutes = require("./userRoute/userRoutes");
const categoryRoutes = require("./categoryRoutes/categoryRoutes");

const router = express.Router();
router.use("/auth", authRoutes);
router.use("/user", userRoutes);
router.use("/categories", categoryRoutes);

module.exports = router;
