const {
  getProducts,
  getLocationIdBySlug,
  getLocationId,
  createProduct,
  updateProduct,
  deleteProduct,
} = require("../../queries/product.queries.js");

const fetchProducts = async (req, res) => {
  try {
    const { product, category, location } = req.query;

    const locationId = location ? await getLocationId(location) : null;
    console.log("locationId:", locationId);

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

// Admin: Create product
const addProduct = async (req, res) => {
  try {
    const {
      name,
      slug,
      price,
      quantity,
      imageUrl,
      categoryId,
      locationId,
      rating,
      description,
    } = req.body;

    // Validate required fields
    if (!name || !price || !categoryId || !locationId) {
      return res.status(400).json({
        message:
          "Required fields: name, price, categoryId, locationId are missing",
      });
    }

    const result = await createProduct({
      name,
      slug: slug || name.toLowerCase().replace(/\s+/g, "-"),
      price,
      quantity: quantity || 0,
      imageUrl: imageUrl || null,
      categoryId,
      locationId,
      rating: rating || 0,
      description: description || "",
      userId: req.user.id,
    });

    return res.status(201).json({
      message: "Product created successfully",
      productId: result.rows[0].id,
      product: result.rows[0],
    });
  } catch (error) {
    console.error("Create product error:", error);
    return res.status(500).json({
      message: "Failed to create product",
      error: error.message,
    });
  }
};

// Admin: Update product
const editProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      name,
      slug,
      price,
      quantity,
      imageUrl,
      categoryId,
      rating,
      description,
    } = req.body;

    const result = await updateProduct({
      id,
      name,
      slug,
      price,
      quantity,
      imageUrl,
      categoryId,
      rating,
      description,
    });

    if (result.rows.length === 0) {
      return res.status(404).json({ message: "Product not found" });
    }

    return res.status(200).json({
      message: "Product updated successfully",
      product: result.rows[0],
    });
  } catch (error) {
    console.error("Update product error:", error);
    return res.status(500).json({
      message: "Failed to update product",
      error: error.message,
    });
  }
};

// Admin: Delete product
const removeProduct = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await deleteProduct(id);

    if (result.rowCount === 0) {
      return res.status(404).json({ message: "Product not found" });
    }

    return res.status(200).json({
      message: "Product deleted successfully",
    });
  } catch (error) {
    console.error("Delete product error:", error);
    return res.status(500).json({
      message: "Failed to delete product",
      error: error.message,
    });
  }
};

module.exports = {
  fetchProducts,
  addProduct,
  editProduct,
  removeProduct,
};
