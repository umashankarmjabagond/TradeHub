const {
  getUserProfile,
  updateUserProfile,
  getCompany,
  upsertCompany,
  getBank,
  upsertBank,
} = require("../../queries/user.queries.js");

const getProfile = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await getUserProfile(userId);

    return res.status(200).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Failed to fetch profile" });
  }
};

const editProfile = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await updateUserProfile(userId, req.body);

    res.status(200).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Failed to update profile" });
  }
};

const getCompanyDetails = async (req, res) => {
  const userId = req.user.id;

  const result = await getCompany(userId);

  res.status(200).json(result.rows[0]);
};

const updateCompanyInfo = async (req, res) => {
  const userId = req.user.id;

  const result = await upsertCompany(userId, req.body);

  res.status(200).json(result.rows[0]);
};

const getBankDetails = async (req, res) => {
  const userId = req.user.id;

  const result = await getBank(userId);

  res.status(200).json(result.rows[0]);
};

const updateBankDetails = async (req, res) => {
  const userId = req.user.id;

  const result = await upsertBank(userId, req.body);

  res.status(200).json(result.rows[0]);
};

module.exports = {
  getProfile,
  editProfile,
  getCompanyDetails,
  updateCompanyInfo,
  getBankDetails,
  updateBankDetails,
};
