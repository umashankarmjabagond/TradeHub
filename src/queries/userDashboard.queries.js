const { query } = require("../config/db");

const getDashboardStats = async (userId) => {
  return query(
    `
    SELECT
      (SELECT COUNT(*) FROM enquiries WHERE buyer_id = $1) AS total_enquiries,

      (SELECT COUNT(*) 
       FROM quotes q
       JOIN enquiries e ON e.id = q.enquiry_id
       WHERE e.buyer_id = $1) AS total_quotes,

      (SELECT COUNT(*) 
       FROM product_views 
       WHERE user_id = $1) AS total_views
    `,
    [userId],
  );
};

const getEnquiryTrend = async (userId) => {
  return query(
    `
    SELECT DATE(created_at) as date, COUNT(*) as count
    FROM enquiries
    WHERE buyer_id = $1
    AND created_at >= NOW() - INTERVAL '7 days'
    GROUP BY DATE(created_at)
    ORDER BY date;
    `,
    [userId],
  );
};

const getCategoryInterest = async (userId) => {
  return query(
    `
    SELECT c.name, COUNT(*) as count
    FROM product_views pv
    JOIN products p ON p.id = pv.product_id
    JOIN categories c ON c.id = p.category_id
    WHERE pv.user_id = $1
    GROUP BY c.name
    ORDER BY count DESC;
    `,
    [userId],
  );
};

const getRecentViews = async (userId) => {
  return query(
    `
    SELECT 
      p.id,
      p.name,
      p.image_url,
      p.price
    FROM product_views pv
    JOIN products p ON p.id = pv.product_id
    WHERE pv.user_id = $1
    ORDER BY pv.viewed_at DESC
    LIMIT 5;
    `,
    [userId],
  );
};

const getRecommendedProducts = async (userId) => {
  return query(
    `
    WITH user_categories AS (
      SELECT p.category_id
      FROM product_views pv
      JOIN products p ON p.id = pv.product_id
      WHERE pv.user_id = $1
      GROUP BY p.category_id
      ORDER BY COUNT(*) DESC
      LIMIT 5
    ),
    excluded_products AS (
      SELECT product_id FROM product_views WHERE user_id = $1
      UNION
      SELECT product_id FROM cart WHERE user_id = $1
    )

    SELECT 
      p.id,
      p.name,
      p.price,
      p.image_url,
      p.rating
    FROM products p
    WHERE p.category_id IN (SELECT category_id FROM user_categories)
    AND p.id NOT IN (SELECT product_id FROM excluded_products)
    AND p.status = 'active'
    ORDER BY p.created_at DESC
    LIMIT 10;
    `,
    [userId],
  );
};

const getTrendingProducts = async () => {
  return query(
    `
    SELECT 
      p.id,
      p.name,
      p.price,
      p.image_url,
      p.rating,
      COUNT(pv.id) as views
    FROM products p
    LEFT JOIN product_views pv ON pv.product_id = p.id
    WHERE p.status = 'active'
    GROUP BY p.id
    ORDER BY views DESC
    LIMIT 10;
    `,
  );
};

module.exports = {
  getDashboardStats,
  getEnquiryTrend,
  getCategoryInterest,
  getRecentViews,
  getRecommendedProducts,
  getTrendingProducts,
};
