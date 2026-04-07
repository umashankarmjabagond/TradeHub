const streamifier = require("streamifier");
const { cloudinary } = require("../../config/cloudinary");
const crypto = require("crypto");
const { updateUserProfileImage } = require("../../queries/product.queries");

// helper function to upload buffer → cloudinary
const uploadFromBuffer = (buffer, folder = "tradeHub/products") => {
  return new Promise((resolve, reject) => {
    const stream = cloudinary.uploader.upload_stream(
      { folder }, // ✅ dynamic folder
      (error, result) => {
        if (result) resolve(result);
        else reject(error);
      },
    );

    streamifier.createReadStream(buffer).pipe(stream);
  });
};

// ✅ MULTIPLE IMAGE UPLOAD CONTROLLER
const uploadProductImages = async (req, res) => {
  try {
    if (!req.files || req.files.length === 0) {
      return res.status(400).json({
        message: "No files uploaded",
      });
    }

    // upload all images in parallel
    const uploadPromises = req.files.map((file) =>
      uploadFromBuffer(file.buffer),
    );

    const results = await Promise.all(uploadPromises);

    // extract URLs
    const imageUrls = results.map((result) => result.secure_url);

    return res.status(200).json({
      message: "Images uploaded successfully",
      images: imageUrls,
    });
  } catch (error) {
    console.error("Upload images error:", error);
    return res.status(500).json({
      message: "Failed to upload images",
      error: error.message,
    });
  }
};

const uploadCategoryImage = async (req, res) => {
  try {
    const file = req.file;

    if (!file) {
      return res.status(400).json({ message: "No file uploaded" });
    }

    const result = await cloudinary.uploader.upload(
      `data:${file.mimetype};base64,${file.buffer.toString("base64")}`,
      {
        folder: "tradehub/categories",
      },
    );

    return res.status(200).json({
      message: "Category image uploaded",
      imageUrl: result.secure_url,
    });
  } catch (error) {
    return res.status(500).json({
      message: "Upload failed",
      error: error.message,
    });
  }
};

const getUploadSignature = async (req, res) => {
  try {
    const userId = req.user.id;

    const timestamp = Math.round(Date.now() / 1000);

    // ✅ FINAL NAMING STRATEGY
    const public_id = `tradehub/products/${userId}/${crypto.randomUUID()}`;

    const params = {
      timestamp,
      public_id,
    };

    const signature = cloudinary.utils.api_sign_request(
      params,
      process.env.API_SECRET,
    );

    return res.json({
      timestamp,
      signature,
      public_id,
      apiKey: process.env.API_KEY,
      cloudName: process.env.CLOUD_NAME,
    });
  } catch (error) {
    console.error("Signature error:", error);
    res.status(500).json({ message: "Failed to generate signature" });
  }
};

const uploadProfileImage = async (req, res) => {
  try {
    const userId = req.user.id;
    const file = req.file;

    if (!file) {
      return res.status(400).json({
        message: "No file uploaded",
      });
    }

    // upload to cloudinary
    const result = await uploadFromBuffer(
      file.buffer,
      `tradehub/users/${userId}`,
    );

    const imageUrl = result.secure_url;

    // ✅ update DB using query file
    const dbRes = await updateUserProfileImage(userId, imageUrl);

    return res.status(200).json({
      message: "Profile image uploaded successfully",
      profile_pic: dbRes.rows[0].profile_pic,
    });
  } catch (error) {
    console.error("Profile upload error:", error);
    return res.status(500).json({
      message: "Failed to upload profile image",
      error: error.message,
    });
  }
};

module.exports = {
  uploadCategoryImage,
  uploadProductImages,
  getUploadSignature,
  uploadProfileImage,
};
