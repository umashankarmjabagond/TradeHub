const express = require("express");
const {
  fetchMainCategories,
  fetchCategoryTreeBySlug,
  fetchAllCategoriesAndSubData,
} = require("../../controllers/category/categoryController.js");

const router = express.Router();

router.get("/main", fetchMainCategories);
router.get("/tree/:slug", fetchCategoryTreeBySlug);
router.get("/landing/categories", fetchAllCategoriesAndSubData);

module.exports = router;
