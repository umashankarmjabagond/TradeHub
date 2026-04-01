const { query } = require("../config/db.js");

const searchProductsFromCategories = async (value) => {
  const { rows } = await query(
    `
  SELECT id, name, slug
  FROM categories
  WHERE level = 3
    AND is_active = TRUE
    AND (
      name ILIKE '%' || $1 || '%'
      OR slug ILIKE '%' || $1 || '%'
    )
  ORDER BY 
    CASE 
      WHEN LOWER(name) = LOWER($1) THEN 1         -- exact match
      WHEN LOWER(name) LIKE LOWER($1) || '%' THEN 2  -- starts with
      ELSE 3                                      -- contains
    END,
    name
  LIMIT 20
  `,
    [value],
  );

  return rows;
};

const getLocationId = async (value) => {
  const { rows } = await query(
    `
    SELECT id
    FROM locations
    WHERE slug = $1 OR name = $1
    LIMIT 1
    `,
    [value],
  );

  return rows.length ? rows[0].id : null;
};

const getProducts = ({ product, categorySlug, locationId }) => {
  return query(
    `
    WITH RECURSIVE location_tree AS (
      SELECT id
      FROM locations
      WHERE ($3::uuid IS NULL OR id = $3)

      UNION ALL

      SELECT l.id
      FROM locations l
      JOIN location_tree lt ON l.parent_id = lt.id
    )
    SELECT
      p.id,
      p.name,
      p.price,
      p.quantity,
      p.image_url,
      p.rating,
      c.name AS category,
      c.slug AS category_slug,
      COALESCE(l.name, 'No Location') AS location
    FROM products p
    JOIN categories c ON c.id = p.category_id
    LEFT JOIN locations l ON l.id = p.location_id   -- ✅ FIXED
    WHERE p.status = 'active'
      AND ($1::text IS NULL OR p.name ILIKE '%' || $1 || '%')
      AND ($2::text IS NULL OR c.slug = $2)
      AND ($3::uuid IS NULL OR p.location_id IN (SELECT id FROM location_tree))
    ORDER BY p.created_at DESC
    `,
    [product || null, categorySlug || null, locationId || null],
  );
};

// Admin: Create product
const createProduct = async ({
  name,
  slug,
  price,
  quantity,
  imageUrl,
  categoryId,
  locationId,
  rating,
  description,
  userId,
}) => {
  return query(
    `
    INSERT INTO products (
  name,
  price,
  quantity,
  image_url,
  category_id,
  location_id,
  rating,
  description,
  status,
  user_id
)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
    RETURNING *
    `,
    [
      name,
      price,
      quantity,
      imageUrl,
      categoryId,
      locationId,
      rating,
      description,
      "active",
      userId,
    ],
  );
};

// Admin: Update product
const updateProduct = async ({
  id,
  name,
  slug,
  price,
  quantity,
  imageUrl,
  categoryId,
  rating,
  description,
}) => {
  const updates = [];
  const values = [];
  let paramCount = 1;

  if (name !== undefined) {
    updates.push(`name = $${paramCount++}`);
    values.push(name);
  }
  if (slug !== undefined) {
    updates.push(`slug = $${paramCount++}`);
    values.push(slug);
  }
  if (price !== undefined) {
    updates.push(`price = $${paramCount++}`);
    values.push(price);
  }
  if (quantity !== undefined) {
    updates.push(`quantity = $${paramCount++}`);
    values.push(quantity);
  }
  if (imageUrl !== undefined) {
    updates.push(`image_url = $${paramCount++}`);
    values.push(imageUrl);
  }
  if (categoryId !== undefined) {
    updates.push(`category_id = $${paramCount++}`);
    values.push(categoryId);
  }
  if (rating !== undefined) {
    updates.push(`rating = $${paramCount++}`);
    values.push(rating);
  }
  if (description !== undefined) {
    updates.push(`description = $${paramCount++}`);
    values.push(description);
  }

  if (updates.length === 0) {
    return query("SELECT * FROM products WHERE id = $1", [id]);
  }

  updates.push(`updated_at = NOW()`);
  values.push(id);

  return query(
    `UPDATE products SET ${updates.join(", ")} WHERE id = $${paramCount} RETURNING *`,
    values,
  );
};

// Admin: Delete product (soft delete - mark as inactive)
const deleteProduct = async (id) => {
  return query(
    "UPDATE products SET status = $1, updated_at = NOW() WHERE id = $2",
    ["inactive", id],
  );
};

const createProductImage = async ({ productId, imageUrl, isPrimary }) => {
  return query(
    `
    INSERT INTO product_images (
      product_id,
      image_url,
      is_primary
    )
    VALUES ($1, $2, $3)
    `,
    [productId, imageUrl, isPrimary],
  );
};

module.exports = {
  searchProductsFromCategories,
  getLocationId,
  getProducts,
  createProduct,
  updateProduct,
  deleteProduct,
  createProductImage,
};
