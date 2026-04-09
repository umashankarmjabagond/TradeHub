const {
  getProducts,
  getLocationId,
  createProduct,
  updateProduct,
  deleteProduct,
  searchProductsFromCategories,
  createProductImage,
  deleteProductImage,
  getProductImages,
  resetPrimaryImages,
  updateProductPrimaryImage,
  getProductDetails,
  addProductView,
  addSearchLog,
} = require("../../queries/product.queries.js");

const { uploadFromBuffer } = require("../../utils/helper.js");

// FETCH PRODUCTS

const fetchProducts = async (req, res) => {
  try {
    const { product, category, location } = req.query;

    const locationId = location ? await getLocationId(location) : null;

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

// SEARCH

const searchProducts = async (req, res) => {
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

// ADD PRODUCT

const addProduct = async (req, res) => {
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

    const categoryId = bodyCategoryId || req.body.productId;
    const files = req.files;

    if (!name || !categoryId) {
      return res.status(400).json({
        message: "name and categoryId are required",
      });
    }

    if (!files || files.length === 0) {
      return res.status(400).json({
        message: "At least one product image is required",
      });
    }

    let uploadedImages = [];

    for (let i = 0; i < files.length; i++) {
      const result = await uploadFromBuffer(files[i].buffer);

      uploadedImages.push({
        imageUrl: result.secure_url,
        isPrimary: false,
      });
    }

    uploadedImages[0].isPrimary = true;

    const primaryImage = uploadedImages[0].imageUrl;

    const result = await createProduct({
      name,
      slug: slug || name.toLowerCase().replace(/\s+/g, "-") + "-" + Date.now(),
      price: price || 0,
      quantity: quantity || 0,
      imageUrl: primaryImage,
      categoryId,
      locationId: locationId || null,
      rating: rating || 0,
      description: description || "",
      userId: req.user?.id || null,
    });

    const productId = result.rows[0].id;

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

// EDIT PRODUCT

const editProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, slug, price, quantity, categoryId, rating, description } =
      req.body;

    const files = req.files;

    let primaryImage;

    // If new images uploaded

    if (files && files.length > 0) {
      let uploadedImages = [];

      for (let i = 0; i < files.length; i++) {
        const result = await uploadFromBuffer(files[i].buffer);

        uploadedImages.push({
          imageUrl: result.secure_url,
          isPrimary: false,
        });
      }

      uploadedImages[0].isPrimary = true;
      primaryImage = uploadedImages[0].imageUrl;

      //  1. Get existing images
      const { rows: existingImages } = await getProductImages(id);

      //  2. Delete all old images
      for (const img of existingImages) {
        await deleteProductImage(img.id);
      }

      //  3. Insert new images
      await Promise.all(
        uploadedImages.map((img) =>
          createProductImage({
            productId: id,
            imageUrl: img.imageUrl,
            isPrimary: img.isPrimary,
          }),
        ),
      );

      //  4. Sync product table
      await updateProductPrimaryImage(id, primaryImage);
    }

    // Update product

    const result = await updateProduct({
      id,
      name,
      slug:
        slug ||
        (name
          ? name.toLowerCase().replace(/\s+/g, "-") + "-" + Date.now()
          : undefined),
      price,
      quantity,
      imageUrl: primaryImage,
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

// DELETE PRODUCT

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

const fetchProductDetails = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await getProductDetails(id);

    if (result.rows.length === 0) {
      return res.status(404).json({
        message: "Product not found",
      });
    }

    return res.status(200).json(result.rows[0]);
  } catch (error) {
    console.error("Fetch product details error:", error);
    return res.status(500).json({
      message: "Failed to fetch product details",
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
  fetchProductDetails,
};
