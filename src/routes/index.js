const express = require("express");
const userRoutes = require("./userRoute/user.routes");
const categoryRoutes = require("./categoryRoutes/category.routes");
const productRoutes = require("./product/product.routes");
const authRoutes = require("./authRoute/auth.routes");
const uploadImageRoutes = require("./imageUploadRoutes/imageUpload.routes");

const router = express.Router();
router.use("/auth", authRoutes);
router.use("/user", userRoutes);
router.use("/categories", categoryRoutes);
router.use("/products", productRoutes);
router.use("/upload", uploadImageRoutes);

module.exports = router;
