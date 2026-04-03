const { query } = require("../config/db.js");

// GET CART
const getCartItems = async (userId) => {
  return query(
    `
    SELECT 
      c.id AS "cartId",
      c.quantity,

      p.id,
      p.name AS "itemName",
      p.price,
      p.image_url AS "imageUrl",

      c2.name AS category,

      COALESCE(l.name, 'Unknown') AS location

    FROM cart c
    JOIN products p ON p.id = c.product_id

    LEFT JOIN categories c2 ON c2.id = p.category_id 
    LEFT JOIN locations l ON l.id = p.location_id

    WHERE c.user_id = $1
    ORDER BY c.created_at DESC
    `,
    [userId],
  );
};

// ADD TO CART
const addToCartQuery = async (userId, productId, quantity) => {
  return query(
    `
    INSERT INTO cart (user_id, product_id, quantity)
    VALUES ($1, $2, $3)
    ON CONFLICT (user_id, product_id)
    DO UPDATE SET quantity = cart.quantity + EXCLUDED.quantity
    RETURNING *
    `,
    [userId, productId, quantity],
  );
};

// UPDATE CART
const updateCartQuery = async (cartId, quantity, userId) => {
  return query(
    `
    UPDATE cart
    SET quantity = $1, updated_at = CURRENT_TIMESTAMP
    WHERE id = $2 AND user_id = $3
    RETURNING *
    `,
    [quantity, cartId, userId],
  );
};

// REMOVE ITEM
const removeCartItemQuery = async (cartId, userId) => {
  return query(
    `
    DELETE FROM cart
    WHERE id = $1 AND user_id = $2
    RETURNING *
    `,
    [cartId, userId],
  );
};

// CLEAR CART
const clearCartQuery = async (userId) => {
  return query(
    `
    DELETE FROM cart
    WHERE user_id = $1
    `,
    [userId],
  );
};

module.exports = {
  getCartItems,
  addToCartQuery,
  updateCartQuery,
  removeCartItemQuery,
  clearCartQuery,
};
