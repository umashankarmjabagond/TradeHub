const express = require("express");

const {
  editProfile,
  getProfile,
  updateCompanyInfo,
  getCompanyDetails,
  getBankDetails,
  updateBankDetails,
} = require("../../controllers/user/user.controller");

const {
  getStats,
  getTrend,
  getCategory,
  getRecent,
  getRecommendations,
  addEnquiry,
  trackView,
  trackSearch,
} = require("../../controllers/user/userDashboard.controller");

const { verifyToken } = require("../../middleware/auth.middleware");

const router = express.Router();

//user Profile routes

router.put("/edit-profile", verifyToken, editProfile);
router.put("/edit-company", verifyToken, updateCompanyInfo);
router.put("/edit-bank", verifyToken, updateBankDetails);

router.post("/get-profile", verifyToken, getProfile);
router.post("/get-companies", verifyToken, getCompanyDetails);
router.post("/get-banks", verifyToken, getBankDetails);

//userDashboard routes
router.get("/stats", verifyToken, getStats);
router.get("/enquiry-trend", verifyToken, getTrend);
router.get("/category-interest", verifyToken, getCategory);
router.get("/recent-views", verifyToken, getRecent);
router.get("/recommendations", verifyToken, getRecommendations);
router.post("/add-enquiry", verifyToken, addEnquiry);
router.post("/track-view", verifyToken, trackView);
router.post("/track-search", verifyToken, trackSearch);

module.exports = router;
