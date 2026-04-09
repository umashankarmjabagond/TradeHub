const express = require("express");
const {
  fetchProducts,
  addProduct,
  editProduct,
  removeProduct,
  searchProducts,
  fetchProductDetails,
} = require("../../controllers/products/product.controller");
const { isAdmin, verifyToken } = require("../../middleware/auth.middleware");
const { upload } = require("../../middleware/upload.middleware");

const router = express.Router();

// Public: Get products
router.get("/getProduct", fetchProducts);
router.get("/search", searchProducts);
router.get("/productDetails:id", fetchProductDetails);

router.post("/add-product", verifyToken, upload.array("images", 5), addProduct);

router.put("/update/:id", isAdmin, editProduct);

router.delete("/delete/:id", isAdmin, removeProduct);

module.exports = router;
