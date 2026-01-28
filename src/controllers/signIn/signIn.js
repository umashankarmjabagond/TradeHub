const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
// import { findUserByEmail } from "../../queries/auth.queries.js";

const findUserByEmail =
  require("../../queries/auth.queries.js").findUserByEmail;

const signIn = async (req, res) => {
  try {
    const { email, password } = req.body;

    console.log("Sign-in attempt for email:", email, password);

    // 1. Validation
    if (!email || !password) {
      return res
        .status(400)
        .json({ message: "Email and password are required" });
    }

    // 2. Find user
    const result = await findUserByEmail(email);
    const user = result.rows[0];

    console.log("User found:", user);

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // 3. Compare password
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ message: "Invalid password" });
    }

    // 4. Generate JWT
    const token = jwt.sign(
      {
        id: user.id,
        email: user.email,
        role: user.role,
      },
      process.env.JWT_SECRET,
      { expiresIn: "1h" },
    );

    // 5. Response
    res.status(200).json({
      message: "Login successful",
      token,
      user: {
        id: user.id,
        email: user.email,
        name: user.name,
        role: user.role,
        contact: user.contact,
      },
    });
  } catch (error) {
    console.error("Sign-in error:", error);
    res.status(500).json({ message: "Server error" });
  }
};

module.exports = { signIn };
