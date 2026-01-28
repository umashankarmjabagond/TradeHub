const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
// import { findUserByEmail } from "../../queries/auth.queries.js";

const findUserByEmail =
  require("../../queries/auth.queries.js").findUserByEmail;

const signIn = async (req, res) => {
  try {
    console.log("Signin body:", req.body);

    if (!req.body) {
      return res.status(400).json({ message: "Request body missing" });
    }

    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({
        message: "Email and password are required",
      });
    }

    // 1️⃣ Fetch user
    const result = await query(
      "SELECT id, email, password FROM users WHERE email = $1",
      [email],
    );

    if (result.rows.length === 0) {
      return res.status(401).json({
        message: "Invalid credentials",
      });
    }

    const user = result.rows[0];

    // 2️⃣ Compare password
    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      return res.status(401).json({
        message: "Invalid credentials",
      });
    }

    // 3️⃣ Generate token
    if (!process.env.JWT_SECRET) {
      throw new Error("JWT_SECRET is missing");
    }

    const token = jwt.sign(
      { userId: user.id, email: user.email },
      process.env.JWT_SECRET,
      { expiresIn: "1d" },
    );

    return res.status(200).json({
      message: "Signin successful",
      token,
    });
  } catch (err) {
    console.error("Signin error FULL:", err);

    return res.status(500).json({
      message: "Server error",
      error: err.message, // 👈 IMPORTANT
    });
  }
};

module.exports = { signIn };
