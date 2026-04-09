// const mongoose = require("mongoose");
// require("dotenv").config();

// const connectDB = async () => {
//   try {
//     await mongoose.connect(process.env.MONGO_URI, {
//       useNewUrlParser: true,
//       useUnifiedTopology: true,
//     });

//     console.log("✅ MongoDB Connected with 3001");
//     const db = mongoose.connection.db;
//     console.log("Connected to DB:", db.databaseName);
//     const collections = await db.listCollections().toArray();
//     console.log(
//       "Collections in DB:",
//       collections.map((c) => c.name)
//     );
//   } catch (err) {
//     console.error("MongoDB connection failed:", err.message);
//     process.exit(1);
//   }
// };

// module.exports = connectDB;

const { Pool } = require("pg");
const dotenv = require("dotenv");

dotenv.config();

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false,
  },
});

const query = (text, params) => pool.query(text, params);

module.exports = {
  query,
};
