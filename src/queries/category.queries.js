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

const getAllMarketCategoriesAndSubData = () => {
  return query(`
  SELECT
    main.id   AS main_id,
    main.name AS main_name,
    main.slug AS main_slug,
    sub.id    AS sub_id,
    sub.name  AS sub_name,
    sub.slug  AS sub_slug
  FROM categories main
  LEFT JOIN categories sub ON sub.parent_id = main.id
  WHERE main.parent_id IS NULL
  ORDER BY main.name, sub.name;
`);
};

module.exports = {
  getMainCategories,
  getCategoryBySlug,
  getAllDescendants,
  getAllMarketCategoriesAndSubData,
};
