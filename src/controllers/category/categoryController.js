import {
  getMainCategories,
  getCategoryBySlug,
  getChildCategories,
} from "../../queries/category.queries.js";

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
 * Recursive function to build category tree
 */
const buildCategoryTree = async (category) => {
  const childrenResult = await getChildCategories(category.id);
  const children = childrenResult.rows;

  if (children.length === 0) {
    return { ...category, children: [] };
  }

  const treeChildren = [];
  for (const child of children) {
    const subtree = await buildCategoryTree(child);
    treeChildren.push(subtree);
  }

  return { ...category, children: treeChildren };
};

/**
 * GET /api/categories/tree/:slug
 * Right panel content
 */
const fetchCategoryTreeBySlug = async (req, res) => {
  try {
    const { slug } = req.params;

    const categoryResult = await getCategoryBySlug(slug);
    const category = categoryResult.rows[0];

    if (!category) {
      return res.status(404).json({ message: "Category not found" });
    }

    const tree = await buildCategoryTree(category);
    res.status(200).json(tree);
  } catch (error) {
    console.error("Fetch category tree error:", error);
    res.status(500).json({ message: "Failed to fetch category tree" });
  }
};

export { fetchMainCategories, fetchCategoryTreeBySlug };
