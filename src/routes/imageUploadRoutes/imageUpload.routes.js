const express = require("express");
const {
  uploadProductImages,
  uploadCategoryImage,
  getUploadSignature,
} = require("../../controllers/imageUpload/imageUpload.controller.js");
const { upload } = require("../../middleware/upload.middleware.js");
const { verifyToken } = require("../../middleware/auth.middleware.js");

const router = express.Router();

// single image upload
router.post("/images", upload.array("files", 5), uploadProductImages);
router.post("/category-image", upload.single("file"), uploadCategoryImage);
router.get("/signature", verifyToken, getUploadSignature);

module.exports = router;
