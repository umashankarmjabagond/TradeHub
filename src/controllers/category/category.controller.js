const {
  getMainCategories,
  getCategoryBySlug,
  getAllDescendants,
  getAllMarketCategoriesAndSubData,
  getLandingFlattenedData,
} = require("../../queries/category.queries.js");
/**
 * GET /api/categories/main
 * Sidebar main categories
 */
const fetchMainCategories = async (req, res) => {
  try {
    const result = await getMainCategories();
    res.status(200).json(result.rows);
  } catch (error) {
    console.error("Fetch main categories error:", error);
    res.status(500).json({ message: "Failed to fetch main categories" });
  }
};

/**
 * Convert flat category rows into IndiaMART-style structure
 */
const buildStructuredCategoryResponse = (mainCategory, rows) => {
  const level1Map = {}; // Fruits & Vegetables
  const level2Map = {}; // Fresh Fruits, Dry Fruits

  // Level 1
  rows.forEach((row) => {
    if (row.level === 1) {
      level1Map[row.id] = {
        title: row.name,
        groups: [],
      };
    }
  });

  // Level 2
  rows.forEach((row) => {
    if (row.level === 2) {
      level2Map[row.id] = {
        title: row.name,
        items: [],
      };

      if (level1Map[row.parent_id]) {
        level1Map[row.parent_id].groups.push(level2Map[row.id]);
      }
    }
  });

  // Level 3
  rows.forEach((row) => {
    if (row.level === 3) {
      if (level2Map[row.parent_id]) {
        level2Map[row.parent_id].items.push(row.name);
      }
    }
  });

  return {
    mainCategory: mainCategory.name,
    sections: Object.values(level1Map),
  };
};

/**
 * GET /api/categories/tree/:slug
 * Right panel content (IndiaMART style)
 */
const fetchCategoryTreeBySlug = async (req, res) => {
  try {
    const { slug } = req.params;

    // 1️⃣ Get main category (Farm, Electronics, etc.)
    const categoryResult = await getCategoryBySlug(slug);
    const mainCategory = categoryResult.rows[0];

    if (!mainCategory) {
      return res.status(404).json({ message: "Category not found" });
    }

    // 2️⃣ Fetch all children in ONE query (no recursion)
    const descendantsResult = await getAllDescendants(mainCategory.id);

    // 3️⃣ Transform DB rows → UI-ready JSON
    const structuredData = buildStructuredCategoryResponse(
      mainCategory,
      descendantsResult.rows,
    );

    res.status(200).json(structuredData);
  } catch (error) {
    console.error("Fetch category tree error:", error);
    res.status(500).json({ message: "Failed to fetch category tree" });
  }
};

const fetchAllCategoriesAndSubData = async (req, res) => {
  try {
    const { rows } = await getAllMarketCategoriesAndSubData();

    const result = {};

    rows.forEach((row) => {
      // MAIN CATEGORY
      if (!result[row.main_id]) {
        result[row.main_id] = {
          id: row.main_id,
          name: row.main_name,
          slug: row.main_slug,
          subCategories: [],
        };
      }

      // SUB CATEGORY
      let subCategory = result[row.main_id].subCategories.find(
        (s) => s.id === row.sub_id,
      );

      if (!subCategory && row.sub_id) {
        subCategory = {
          id: row.sub_id,
          name: row.sub_name,
          slug: row.sub_slug,
          previewItems: [],
        };
        result[row.main_id].subCategories.push(subCategory);
      }

      // PREVIEW ITEMS (LEVEL 3)
      if (
        row.item_id &&
        subCategory &&
        subCategory.previewItems.length < 5 // limit chips
      ) {
        subCategory.previewItems.push({
          id: row.item_id,
          name: row.item_name,
          slug: row.item_slug,
        });
      }
    });

    return res.status(200).json({
      success: true,
      data: Object.values(result),
    });
  } catch (error) {
    console.error("fetchMarketCategories error:", error);
    return res.status(500).json({
      success: false,
      message: "Failed to fetch market categories",
    });
  }
};

const fetchLandingCategoriesFlattened = async (req, res) => {
  try {
    const { rows } = await getLandingFlattenedData();

    const result = {};

    rows.forEach((r) => {
      // main
      if (!result[r.main_slug]) {
        result[r.main_slug] = {
          id: r.main_id,
          name: r.main_name,
          slug: r.main_slug,
          groups: {},
        };
      }

      // group
      if (!result[r.main_slug].groups[r.group_slug]) {
        result[r.main_slug].groups[r.group_slug] = {
          id: r.group_id,
          name: r.group_name,
          slug: r.group_slug,
          products: [],
        };
      }

      // product
      if (r.product_name) {
        result[r.main_slug].groups[r.group_slug].products.push(r.product_name);
      }
    });

    // convert groups object → array
    const response = Object.values(result).map((main) => ({
      ...main,
      groups: Object.values(main.groups),
    }));

    return res.json({
      success: true,
      data: response,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({
      success: false,
      message: "Failed to fetch landing data",
    });
  }
};

module.exports = {
  fetchMainCategories,
  fetchCategoryTreeBySlug,
  fetchAllCategoriesAndSubData,
  fetchLandingCategoriesFlattened,
};
