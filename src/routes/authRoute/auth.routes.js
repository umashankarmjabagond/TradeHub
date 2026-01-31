const express = require("express");
const { signUp } = require("../../controllers/signUp/signUp.controller");
const { signIn } = require("../../controllers/signIn/signIn.controller");
const router = express.Router();

router.post("/signin", signIn);
router.post("/signup", signUp);

module.exports = router;
