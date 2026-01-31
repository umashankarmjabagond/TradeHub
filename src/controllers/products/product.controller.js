const {
  getProducts,
  getLocationIdBySlug,
} = require("../../queries/product.queries.js");

const fetchProducts = async (req, res) => {
  try {
    const { product, category, location } = req.query;

    let locationId = null;

    if (location) {
      locationId = await getLocationIdBySlug(location);
    }

    const { rows } = await getProducts({
      product,
      categorySlug: category,
      locationId,
    });

    return res.status(200).json(rows);
  } catch (error) {
    console.error("Fetch products error:", error);
    return res.status(500).json({
      message: "Failed to fetch products",
    });
  }
};

module.exports = {
  fetchProducts,
};
