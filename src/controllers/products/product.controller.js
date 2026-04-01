const {
  getProducts,
  getLocationIdBySlug,
  getLocationId,
  createProduct,
  updateProduct,
  deleteProduct,
  searchProductsFromCategories,
  createProductImage,
} = require("../../queries/product.queries.js");
const { uploadFromBuffer } = require("../../utils/helper.js");

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

const searchProducts = async (req, res) => {
  console.log("searchProducts called with query:", req.query);

  try {
    const { q } = req.query;

    if (!q || typeof q !== "string") {
      return res.status(400).json({
        message: "Search query (q) is required",
      });
    }

    const products = await searchProductsFromCategories(q);

    return res.status(200).json({
      message: "Products fetched successfully",
      data: products,
    });
  } catch (error) {
    console.error("Search products error:", error);
    return res.status(500).json({
      message: "Failed to fetch products",
      error: error.message,
    });
  }
};

// Admin: Create product
const addProduct = async (req, res) => {
  console.log("addProduct called with body:", req.body);
  console.log("FILES:", req.files);

  try {
    const {
      name,
      slug,
      price,
      quantity,
      categoryId: bodyCategoryId,
      locationId,
      rating,
      description,
    } = req.body;

    // ✅ map productId → categoryId
    const categoryId = bodyCategoryId || req.body.productId;

    const files = req.files;

    // ✅ Validation (location removed)
    if (!name || !categoryId) {
      return res.status(400).json({
        message: "name and categoryId are required",
      });
    }

    // ✅ Upload images to Cloudinary
    let uploadedImages = [];

    if (files && files.length > 0) {
      for (let i = 0; i < files.length; i++) {
        const result = await uploadFromBuffer(files[i].buffer);

        uploadedImages.push({
          imageUrl: result.secure_url,
          isPrimary: i === 0,
        });
      }
    }

    // ✅ Primary image
    const primaryImage =
      uploadedImages.find((img) => img.isPrimary)?.imageUrl || null;

    // ✅ Create product
    const result = await createProduct({
      name,
      slug: slug || name.toLowerCase().replace(/\s+/g, "-"),
      price: price || 0,
      quantity: quantity || 0,
      imageUrl: primaryImage,
      categoryId,
      locationId: locationId || null, // ✅ now optional
      rating: rating || 0,
      description: description || "",
      userId: req.user?.id || null,
    });

    const productId = result.rows[0].id;

    // ✅ Save images in DB
    await Promise.all(
      uploadedImages.map((img) =>
        createProductImage({
          productId,
          imageUrl: img.imageUrl,
          isPrimary: img.isPrimary,
        }),
      ),
    );

    return res.status(201).json({
      message: "Product created successfully",
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
  searchProducts,
  addProduct,
  editProduct,
  removeProduct,
};
