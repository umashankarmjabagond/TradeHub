const express = require("express");
const {
  fetchMainCategories,
  fetchCategoryTreeBySlug,
} = require("../../controllers/category/categoryController.js");

const router = express.Router();

router.get("/main", fetchMainCategories);
router.get("/tree/:slug", fetchCategoryTreeBySlug);

module.exports = router;
