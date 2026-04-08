const bcrypt = require("bcryptjs");
const { findUserByEmail, createUser } = require("../../queries/auth.queries");
const signUp = async (req, res) => {
  const { name, email, mobile, role, gstNumber, password, about } = req.body;

  // 1. Validation
  if (!name || !email || !mobile || !password) {
    return res
      .status(400)
      .json({ message: "All required fields must be filled" });
  }

  try {
    // 2. Check existing user
    const existingUser = await findUserByEmail(email);
    if (existingUser.rowCount > 0) {
      return res.status(409).json({ message: "User already exists" });
    }

    // 3. Hash password
    const hashedPassword = await bcrypt.hash(password, 10);

    // 4. Create user
    const result = await createUser({
      name,
      email,
      mobile,
      role: role || "user",
      password: hashedPassword,
      about: about || "",
    });

    // 5. Response
    res.status(201).json({
      message: "Sign up successful",
      userId: result.rows[0].id,
    });
  } catch (err) {
    console.error("Error in signup:", err);

    if (err.code === "23505") {
      return res.status(409).json({ message: "User already exists" });
    }

    res.status(500).json({
      message: "Server error",
      error: err.message,
    });
  }
};

module.exports = { signUp };
