const { query } = require("../config/db.js");

const getMainCategories = () => {
  return query(`
    SELECT id, name, slug
    FROM categories
    WHERE level = 0
    ORDER BY name
  `);
};

const getCategoryBySlug = (slug) => {
  return query(
    `
    SELECT id, name, slug
    FROM categories
    WHERE slug = $1
    LIMIT 1
  `,
    [slug],
  );
};

const getAllDescendants = (parentId) => {
  return query(
    `
    SELECT id, name, slug, parent_id, level
    FROM categories
    WHERE parent_id = $1
       OR parent_id IN (
         SELECT id FROM categories WHERE parent_id = $1
       )
       OR parent_id IN (
         SELECT id FROM categories
         WHERE parent_id IN (
           SELECT id FROM categories WHERE parent_id = $1
         )
       )
    ORDER BY level, name
  `,
    [parentId],
  );
};

module.exports = {
  getMainCategories,
  getCategoryBySlug,
  getAllDescendants,
};
