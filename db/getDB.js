require('dotenv').config();
const mysql = require('mysql2/promise');
//Destructuring de las variables de entorno necesarias
// const { MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DB } = process.env;
let pool;

const getDB = async () => {
  try {
    if (!pool) {
      pool = mysql.createPool({
        connectionLimit: 10,
        host: 'localhost',
        user: 'root',
        password: 'Verano2020',
        database: 'hospitalDB',
        timezone: 'Z',
      });
    }
    return await pool.getConnection();
  } catch (err) {
    console.error(err);
  }
};

module.exports = getDB;
