const express = require("express");
const {
  fetchProducts,
  addProduct,
  editProduct,
  removeProduct,
} = require("../../controllers/products/product.controller");
const { isAdmin } = require("../../middleware/auth.middleware");

const router = express.Router();

// Public: Get products
router.get("/getProduct", fetchProducts);

// Admin: Create product
router.post("/create", isAdmin, addProduct);

// Admin: Update product
router.put("/update/:id", isAdmin, editProduct);

// Admin: Delete product
router.delete("/delete/:id", isAdmin, removeProduct);

module.exports = router;
