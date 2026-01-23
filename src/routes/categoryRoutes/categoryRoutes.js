const express = require("express");
const {
  fetchMainCategories,
  fetchCategoryTreeBySlug,
} = require("../../controllers/category/categoryController");
const router = express.Router();

router.post("/main", fetchMainCategories);
router.get("/tree/:slug", fetchCategoryTreeBySlug);

module.exports = router;
