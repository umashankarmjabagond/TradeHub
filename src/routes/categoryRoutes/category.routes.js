const express = require("express");
const {
  fetchMainCategories,
  fetchCategoryTreeBySlug,
  fetchAllCategoriesAndSubData,
  fetchLandingCategoriesFlattened,
} = require("../../controllers/category/category.controller.js");

const router = express.Router();

router.get("/main", fetchMainCategories);
router.get("/tree/:slug", fetchCategoryTreeBySlug);
router.get("/landing/categories", fetchAllCategoriesAndSubData);
router.get("/landing/flattened", fetchLandingCategoriesFlattened);

module.exports = router;
