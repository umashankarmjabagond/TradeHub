const { query } = require("../config/db");

/**
 * Get all main categories (sidebar)
 */
const getMainCategories = async () => {
  return query(`
    SELECT id, name, slug
    FROM categories
    WHERE parent_id IS NULL
    ORDER BY name
  `);
};

/**
 * Get category by slug
 */
const getCategoryBySlug = async (slug) => {
  return query(
    `
    SELECT id, name, slug
    FROM categories
    WHERE slug = $1
    `,
    [slug],
  );
};

/**
 * Get children categories by parent_id
 */
const getChildCategories = async (parentId) => {
  return query(
    `
    SELECT id, name, slug
    FROM categories
    WHERE parent_id = $1
    ORDER BY name
    `,
    [parentId],
  );
};

module.exports = {
  getMainCategories,
  getCategoryBySlug,
  getChildCategories,
};
