const {
  getCartItems,
  addToCartQuery,
  updateCartQuery,
  removeCartItemQuery,
  clearCartQuery,
} = require("../../queries/cart.query");

// GET CART
const getCart = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await getCartItems(userId);

    return res.status(200).json(result.rows);
  } catch (error) {
    console.error("Get cart error:", error);
    return res.status(500).json({
      message: "Failed to fetch cart",
      error: error.message,
    });
  }
};

// ADD TO CART
const addToCart = async (req, res) => {
  try {
    const userId = req.user.id;
    const { productId, quantity } = req.body;

    const result = await addToCartQuery(userId, productId, quantity || 1);

    return res.status(200).json({
      message: "Item added to cart",
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Add to cart error:", error);
    return res.status(500).json({
      message: "Failed to add item",
      error: error.message,
    });
  }
};

// UPDATE CART
const updateCart = async (req, res) => {
  try {
    const userId = req.user.id;
    const { cartId, quantity } = req.body;

    const result = await updateCartQuery(cartId, quantity, userId);

    return res.status(200).json({
      message: "Cart updated",
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Update cart error:", error);
    return res.status(500).json({
      message: "Failed to update cart",
      error: error.message,
    });
  }
};

// REMOVE ITEM
const removeCartItem = async (req, res) => {
  try {
    const userId = req.user.id;
    const { cartId } = req.params;

    await removeCartItemQuery(cartId, userId);

    return res.status(200).json({
      message: "Item removed from cart",
    });
  } catch (error) {
    console.error("Remove cart error:", error);
    return res.status(500).json({
      message: "Failed to remove item",
      error: error.message,
    });
  }
};

// CLEAR CART
const clearCart = async (req, res) => {
  try {
    const userId = req.user.id;

    await clearCartQuery(userId);

    return res.status(200).json({
      message: "Cart cleared",
    });
  } catch (error) {
    console.error("Clear cart error:", error);
    return res.status(500).json({
      message: "Failed to clear cart",
      error: error.message,
    });
  }
};

module.exports = {
  getCart,
  addToCart,
  updateCart,
  removeCartItem,
  clearCart,
};
