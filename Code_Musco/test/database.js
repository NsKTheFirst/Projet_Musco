const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "musco"
});

const getUsers = callback => {
  let sql = "SELECT * FROM users";
  connection.query(sql, (error, results) => {
    if (error) throw error;
    callback(null, results);
  });
};




module.exports = {
  getUsers: getUsers,


};