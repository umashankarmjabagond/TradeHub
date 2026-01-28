const { query } = require("../config/db");

const findUserByEmail = async (email) => {
  return query("SELECT * FROM users WHERE email = $1", [email]);
};

const createUser = async ({
  name,
  email,
  contact,
  role,
  gstNumber,
  password,
  about,
}) => {
  return query(
    `
    INSERT INTO users (
      name,
      email,
      contact,
      role,
      gst_number,
      password,
      about
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id
    `,
    [name, email, contact, role, gstNumber, password, about],
  );
};

module.exports = {
  findUserByEmail,
  createUser,
};
