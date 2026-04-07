const { query } = require("../config/db.js");

const getUserProfile = async (userId) => {
  return query(
    `
    SELECT 
      id,
      name,
      email,
      mobile,
      alt_email,
      alt_mobile,
      address,
      city,
      state,
      country,
      created_at
    FROM users
    WHERE id = $1
    `,
    [userId],
  );
};

const updateUserProfile = async (userId, data) => {
  const {
    name,
    email,
    mobile,
    alt_email,
    alt_mobile,
    address,
    city,
    state,
    country,
  } = data;

  return query(
    `
    UPDATE users SET
      name = $1,
      email = $2,
      mobile = $3,
      alt_email = $4,
      alt_mobile = $5,
      address = $6,
      city = $7,
      state = $8,
      country = $9,
      updated_at = NOW()
    WHERE id = $10
    RETURNING *
    `,
    [
      name,
      email,
      mobile,
      alt_email,
      alt_mobile,
      address,
      city,
      state,
      country,
      userId,
    ],
  );
};

const getCompany = async (userId) => {
  return query(
    `
    SELECT * FROM company_details
    WHERE user_id = $1
    `,
    [userId],
  );
};

const upsertCompany = async (userId, data) => {
  const {
    company_name,
    website,
    gstin,
    pan,
    facebook,
    instagram,
    google_business,
  } = data;

  return query(
    `
    INSERT INTO company_details 
    (user_id, company_name, website, gstin, pan, facebook, instagram, google_business)
    VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
    ON CONFLICT (user_id)
    DO UPDATE SET
      company_name = EXCLUDED.company_name,
      website = EXCLUDED.website,
      gstin = EXCLUDED.gstin,
      pan = EXCLUDED.pan,
      facebook = EXCLUDED.facebook,
      instagram = EXCLUDED.instagram,
      google_business = EXCLUDED.google_business,
      updated_at = NOW()
    RETURNING *
    `,
    [
      userId,
      company_name,
      website,
      gstin,
      pan,
      facebook,
      instagram,
      google_business,
    ],
  );
};

const getBank = async (userId) => {
  return query(
    `
    SELECT * FROM bank_details
    WHERE user_id = $1
    `,
    [userId],
  );
};

const upsertBank = async (userId, data) => {
  const { ifsc_code, account_number, bank_name, account_holder_name } = data;

  return query(
    `
    INSERT INTO bank_details 
    (user_id, ifsc_code, account_number, bank_name, account_holder_name)
    VALUES ($1,$2,$3,$4,$5)
    ON CONFLICT (user_id)
    DO UPDATE SET
      ifsc_code = EXCLUDED.ifsc_code,
      account_number = EXCLUDED.account_number,
      bank_name = EXCLUDED.bank_name,
      account_holder_name = EXCLUDED.account_holder_name,
      updated_at = NOW()
    RETURNING *
    `,
    [userId, ifsc_code, account_number, bank_name, account_holder_name],
  );
};

module.exports = {
  getUserProfile,
  updateUserProfile,
  getCompany,
  upsertCompany,
  getBank,
  upsertBank,
};
