const express = require("express");
const {
  fetchProducts,
} = require("../../controllers/products/product.controller");

const router = express.Router();

router.get("/getProduct", fetchProducts);

module.exports = router;
