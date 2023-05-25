'use strict';
require('dotenv').config;

const getDB = require('./getDB');

const main = async () => {
  let connection;
  try {
    connection = await getDB();
  } catch (err) {
    console.error(err);
  } finally {
    if (connection) connection.release();
    process.exit();
  }
};

main();
