const express = require("express");
const {
  fetchProducts,
  addProduct,
  editProduct,
  removeProduct,
  searchProducts,
} = require("../../controllers/products/product.controller");
const { isAdmin, verifyToken } = require("../../middleware/auth.middleware");
const { upload } = require("../../middleware/upload.middleware");

const router = express.Router();

// Public: Get products
router.get("/getProduct", fetchProducts);
router.get("/search", searchProducts);

// Admin: Create product
router.post("/add-product", verifyToken, upload.array("images", 5), addProduct);

// Admin: Update product
router.put("/update/:id", isAdmin, editProduct);

// Admin: Delete product
router.delete("/delete/:id", isAdmin, removeProduct);

module.exports = router;
