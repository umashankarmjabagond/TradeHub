const { query } = require("../config/db");

const findUserByEmail = async (email) => {
  return query("SELECT * FROM users WHERE email = $1", [email]);
};

const createUser = async ({ name, email, mobile, role, password, about }) => {
  return query(
    `
    INSERT INTO users (
      name,
      email,
      mobile,
      role,
      password,
      about
    )
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id
    `,
    [name, email, mobile, role, password, about],
  );
};

module.exports = {
  findUserByEmail,
  createUser,
};
