const express = require("express");
const {
  updateCompanyInfo,
  getCompanyDetails,
} = require("../../controllers/user/company.controller");
const {
  updateBankDetails,
  getBankDetails,
} = require("../../controllers/user/bank.controller");
const {
  editProfile,
  getProfile,
} = require("../../controllers/user/user.controller");

const router = express.Router();

router.put("/edit-profile", editProfile);
router.put("/edit-company", updateCompanyInfo);
router.put("/edit-bank", updateBankDetails);
router.post("/get-profile", getProfile);
router.post("/get-companies", getCompanyDetails);
router.post("/get-banks", getBankDetails);

module.exports = router;
