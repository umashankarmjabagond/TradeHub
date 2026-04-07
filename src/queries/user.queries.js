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
      profile_pic,
      created_at
    FROM users
    WHERE id = $1
    `,
    [userId],
  );
};

const updateUserProfile = async (userId, data) => {
  return query(
    `
    UPDATE users SET
      name = COALESCE($1, name),
      email = COALESCE($2, email),
      mobile = COALESCE($3, mobile),
      alt_email = COALESCE($4, alt_email),
      alt_mobile = COALESCE($5, alt_mobile),
      address = COALESCE($6, address),
      city = COALESCE($7, city),
      state = COALESCE($8, state),
      country = COALESCE($9, country),
      updated_at = NOW()
    WHERE id = $10
    RETURNING *
    `,
    [
      data.name ?? null,
      data.email ?? null,
      data.mobile ?? null,
      data.alt_email ?? null,
      data.alt_mobile ?? null,
      data.address ?? null,
      data.city ?? null,
      data.state ?? null,
      data.country ?? null,
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
      company_name = COALESCE(EXCLUDED.company_name, company_details.company_name),
      website = COALESCE(EXCLUDED.website, company_details.website),
      gstin = COALESCE(EXCLUDED.gstin, company_details.gstin),
      pan = COALESCE(EXCLUDED.pan, company_details.pan),
      facebook = COALESCE(EXCLUDED.facebook, company_details.facebook),
      instagram = COALESCE(EXCLUDED.instagram, company_details.instagram),
      google_business = COALESCE(EXCLUDED.google_business, company_details.google_business),
      updated_at = NOW()
    WHERE company_details.user_id = $1
    RETURNING *
    `,
    [
      userId,
      company_name ?? null,
      website ?? null,
      gstin ?? null,
      pan ?? null,
      facebook ?? null,
      instagram ?? null,
      google_business ?? null,
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
      ifsc_code = COALESCE(EXCLUDED.ifsc_code, bank_details.ifsc_code),
      account_number = COALESCE(EXCLUDED.account_number, bank_details.account_number),
      bank_name = COALESCE(EXCLUDED.bank_name, bank_details.bank_name),
      account_holder_name = COALESCE(EXCLUDED.account_holder_name, bank_details.account_holder_name),
      updated_at = NOW()
    WHERE bank_details.user_id = $1
    RETURNING *
    `,
    [
      userId,
      ifsc_code ?? null,
      account_number ?? null,
      bank_name ?? null,
      account_holder_name ?? null,
    ],
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
