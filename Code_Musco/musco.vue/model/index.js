const database = function database() {
    const mysql  = require('mysql');
  
    const connection = mysql.createConnection({
      host     : 'localhost',
      user     : 'root',
      password : "", 
      database : "musco" 
    });
  
    const connect = function connect() {
      connection.connect(function(err) {
        if (err) return console.error(err);
        else console.log("db connected");
         // le serveur node est connecté au serveur mysql (BDD)
      });
    };
  
    const end = function end() {
      connection.end(); // on termine la connection à la BDD
    };
  
    const test = function test() {
      // fonction de test pour vérifier la bonne connection
      const sql = 'SELECT 1 + 1 AS solution';
      connection.query(sql, function (error, results) {
        if (error) throw error;
        console.log('The solution is: ', results[0].solution);
      });
    };
  
    connect();
  
    return {
      connection,
      end,
      test
    };
  };
  
  module.exports = database;