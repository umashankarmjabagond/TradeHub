const { query } = require("../config/db.js");

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
      p.slug,
      p.price,
      p.quantity,
      p.image_url,
      p.rating,
      c.name AS category,
      c.slug AS category_slug,
      l.name AS location
    FROM products p
    JOIN categories c ON c.id = p.category_id
    JOIN locations l ON l.id = p.location_id
    WHERE p.status = 'active'
      AND ($1::text IS NULL OR p.name ILIKE '%' || $1 || '%')
      AND ($2::text IS NULL OR c.slug = $2)
      AND ($3::uuid IS NULL OR p.location_id IN (SELECT id FROM location_tree))
    ORDER BY p.created_at DESC
    `,
    [product || null, categorySlug || null, locationId || null],
  );
};

module.exports = {
  getLocationId,
  getProducts,
};
