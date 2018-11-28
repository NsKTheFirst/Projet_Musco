const userModel = function userModel(connection) {

    const create = function createUser(clbk, data) {
      const q = "INSERT INTO users (nom, prenom, pseudo, mdp, mail, avatar, soundcloud, youtube, facebook, localisation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      const payload = [data.nom, data.prenom, data.pseudo, data.mdp, data.mail, data.avatar, data.soundcloud, data.youtube, data.facebook, data.localisation];
  
      connection.query(q, payload, (err, res, cols) => {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(err, null);
        return clbk(null, res);
      });
    };
  
    const remove = function deleteUser(clbk, ids) {
      // la clause SQL IN permet de chercher une valeur dans un tableau
      const q = "DELETE FROM user WHERE id IN (?)";
  
      connection.query(q, [ids], function (err, res, fields) {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(res, null);
        return clbk(null, res);
      });
    };
  
    const update = function editUser(clbk, user) {
      const q = "UPDATE user SET name = ?, lastname = ?, email = ? WHERE id = ?";
      const payload = [user.name, user.lastname, user.email, user.id];
      connection.query(q, payload, function (err, res, fields) {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(err, null);
        return clbk(null, res);
      });
    };
  
    // const get = function getUser(clbk) {
    //   let sql = "SELECT * FROM users";
    //   connection.query(sql, (error, results, fields) => {
    //     // return console.log(this.sql);
    //     if (error) throw error;
    //     clbk(null, [results]);
    //   });
    // };

    const get = function getFullUser(clbk) {
      let sql = "";
      connection.query(sql, (error, results, fields) => {
        if (error) throw error;
        clbk(null, [results]);
      });
    };
  
    return {
      create,
      remove,
      update,
      get,
    };
  };
  
  module.exports = userModel;