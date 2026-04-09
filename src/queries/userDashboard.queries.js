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
    LIMIT 15;
    `,
    [userId],
  );
};

const getRecommendedProducts = async (userId) => {
  return query(
    `
    SELECT DISTINCT ON (id) *
    FROM (

      (
        SELECT 
          p.id,
          p.name,
          p.price,
          p.image_url,
          p.rating,
          1 as priority,
          sl.created_at
        FROM products p
        JOIN search_logs sl
          ON p.name ILIKE '%' || sl.search_query || '%'
        WHERE sl.user_id = $1
        AND p.status = 'active'
        ORDER BY sl.created_at DESC
        LIMIT 5
      )

      UNION

      (
        SELECT 
          p.id,
          p.name,
          p.price,
          p.image_url,
          p.rating,
          2 as priority,
          pv.viewed_at as created_at
        FROM products p
        JOIN product_views pv ON pv.product_id = p.id
        WHERE pv.user_id = $1
        AND p.status = 'active'
        ORDER BY pv.viewed_at DESC
        LIMIT 5
      )

    ) t
    ORDER BY id, priority
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

const createEnquiry = async (buyerId, productId, sellerId, message) => {
  return query(
    `
    INSERT INTO enquiries (buyer_id, product_id, seller_id, message)
    VALUES ($1, $2, $3, $4)
    `,
    [buyerId, productId, sellerId, message],
  );
};

const addProductView = async (userId, productId) => {
  return query(
    `
    INSERT INTO product_views (user_id, product_id, viewed_at)
    VALUES ($1, $2, NOW())
    ON CONFLICT (user_id, product_id)
    DO UPDATE SET viewed_at = EXCLUDED.viewed_at
    RETURNING *;
    `,
    [userId, productId],
  );
};

const addSearchLog = async (userId, queryText) => {
  return query(
    `
    INSERT INTO search_logs (user_id, search_query, created_at, search_count)
    VALUES ($1, $2, NOW(), 1)
    ON CONFLICT (user_id, search_query)
    DO UPDATE 
      SET created_at = NOW(),
          search_count = search_logs.search_count + 1;
    `,
    [userId, queryText.toLowerCase().trim()],
  );
};

module.exports = {
  getDashboardStats,
  getEnquiryTrend,
  getCategoryInterest,
  getRecentViews,
  getRecommendedProducts,
  getTrendingProducts,
  createEnquiry,
  addProductView,
  addSearchLog,
};
