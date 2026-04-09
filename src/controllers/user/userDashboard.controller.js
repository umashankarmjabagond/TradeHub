const { getProductOwner } = require("../../queries/product.queries");
const {
  getDashboardStats,
  getEnquiryTrend,
  getCategoryInterest,
  getRecentViews,
  getRecommendedProducts,
  getTrendingProducts,
  createEnquiry,
  addSearchLog,
  addProductView,
} = require("../../queries/userDashboard.queries");

const getStats = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await getDashboardStats(userId);

    return res.status(200).json(result.rows[0]);
  } catch (error) {
    console.error("Stats error:", error);
    return res.status(500).json({
      message: "Failed to fetch stats",
    });
  }
};

const getTrend = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await getEnquiryTrend(userId);

    return res.status(200).json(result.rows);
  } catch (error) {
    console.error("Trend error:", error);
    return res.status(500).json({
      message: "Failed to fetch enquiry trend",
    });
  }
};

const getCategory = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await getCategoryInterest(userId);

    return res.status(200).json(result.rows);
  } catch (error) {
    console.error("Category error:", error);
    return res.status(500).json({
      message: "Failed to fetch category interest",
    });
  }
};

const getRecent = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await getRecentViews(userId);

    return res.status(200).json(result.rows);
  } catch (error) {
    console.error("Recent views error:", error);
    return res.status(500).json({
      message: "Failed to fetch recent views",
    });
  }
};

const getRecommendations = async (req, res) => {
  try {
    const userId = req.user.id;

    let result = await getRecommendedProducts(userId);

    if (result.rows.length === 0) {
      result = await getTrendingProducts();
    }

    return res.status(200).json(result.rows);
  } catch (error) {
    console.error("Recommendation error:", error);
    return res.status(500).json({
      message: "Failed to fetch recommendations",
    });
  }
};

const addEnquiry = async (req, res) => {
  try {
    const buyerId = req.user.id;
    const { product_id, message } = req.body;

    const productOwner = await getProductOwner(product_id);

    const sellerId = productOwner.rows[0].user_id;

    await createEnquiry(buyerId, product_id, sellerId, message);

    res.status(200).json({ message: "Enquiry sent" });
  } catch (err) {
    res.status(500).json({ message: "Failed" });
  }
};

const trackView = async (req, res) => {
  try {
    const userId = req.user.id;
    const { product_id } = req.body;

    await addProductView(userId, product_id);

    return res.status(200).json({
      message: "View tracked",
    });
  } catch (error) {
    console.error("Track view error:", error);
    return res.status(500).json({
      message: "Failed to track view",
    });
  }
};

const trackSearch = async (req, res) => {
  try {
    const userId = req.user.id;
    let { query: searchQuery } = req.body;

    const normalizedQuery = searchQuery?.trim().toLowerCase();

    if (!normalizedQuery) {
      return res.status(400).json({ message: "Invalid search" });
    }

    await addSearchLog(userId, normalizedQuery);

    return res.status(200).json({ message: "Search tracked" });
  } catch (err) {
    console.error("Track search error:", err);
    return res.status(500).json({
      message: "Failed to track search",
      error: err.message,
    });
  }
};

module.exports = {
  getStats,
  getTrend,
  getCategory,
  getRecent,
  getRecommendations,
  addEnquiry,
  trackView,
  trackSearch,
};
