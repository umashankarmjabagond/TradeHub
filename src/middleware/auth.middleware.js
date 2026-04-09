const jwt = require("jsonwebtoken");

// Verify JWT token
const verifyToken = (req, res, next) => {
  const token = req.headers.authorization?.split(" ")[1];

  if (!token) {
    return res.status(401).json({ message: "No token provided" });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (error) {
    return res.status(403).json({ message: "Invalid or expired token" });
  }
};

// Check if user is admin
const isAdmin = (req, res, next) => {
  verifyToken(req, res, () => {
    if (req.user.role !== "admin") {
      return res
        .status(403)
        .json({ message: "Access denied. Admin role required." });
    }
    next();
  });
};

// Check if user is admin or vendor
const isAdminOrVendor = (req, res, next) => {
  verifyToken(req, res, () => {
    if (req.user.role !== "admin" && req.user.role !== "vendor") {
      return res.status(403).json({
        message: "Access denied. Admin or Vendor role required.",
      });
    }
    next();
  });
};

module.exports = {
  verifyToken,
  isAdmin,
  isAdminOrVendor,
};
