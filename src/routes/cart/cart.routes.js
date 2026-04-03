const express = require("express");

const { verifyToken } = require("../../middleware/auth.middleware");
const {
  getCart,
  addToCart,
  updateCart,
  removeCartItem,
  clearCart,
} = require("../../controllers/cart/cart.controller");

const router = express.Router();

router.get("/", verifyToken, getCart);
router.post("/add", verifyToken, addToCart);
router.put("/update", verifyToken, updateCart);
router.delete("/remove/:cartId", verifyToken, removeCartItem);
router.delete("/clear", verifyToken, clearCart);

module.exports = router;
