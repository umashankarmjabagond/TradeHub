const {
  getMainCategories,
  getCategoryBySlug,
  getAllDescendants,
  getAllMarketCategoriesAndSubData,
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

    console.log("Market Categories Rows:", rows);

    // transform flat rows into nested structure
    const result = {};

    rows.forEach((row) => {
      if (!result[row.main_id]) {
        result[row.main_id] = {
          id: row.main_id,
          name: row.main_name,
          slug: row.main_slug,
          subCategories: [],
        };
      }

      if (row.sub_id) {
        result[row.main_id].subCategories.push({
          id: row.sub_id,
          name: row.sub_name,
          slug: row.sub_slug,
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

module.exports = {
  fetchMainCategories,
  fetchCategoryTreeBySlug,
  fetchAllCategoriesAndSubData,
};
