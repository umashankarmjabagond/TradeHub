const express = require("express");

const {
  editProfile,
  getProfile,
  updateCompanyInfo,
  getCompanyDetails,
  getBankDetails,
  updateBankDetails,
} = require("../../controllers/user/user.controller");
const { verifyToken } = require("../../middleware/auth.middleware");

const router = express.Router();

router.put("/edit-profile", verifyToken, editProfile);
router.put("/edit-company", verifyToken, updateCompanyInfo);
router.put("/edit-bank", verifyToken, updateBankDetails);

router.post("/get-profile", verifyToken, getProfile);
router.post("/get-companies", verifyToken, getCompanyDetails);
router.post("/get-banks", verifyToken, getBankDetails);

module.exports = router;
