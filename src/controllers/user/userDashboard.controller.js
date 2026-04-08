const {
  getDashboardStats,
  getEnquiryTrend,
  getCategoryInterest,
  getRecentViews,
  getRecommendedProducts,
  getTrendingProducts,
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

module.exports = {
  getStats,
  getTrend,
  getCategory,
  getRecent,
  getRecommendations,
};
