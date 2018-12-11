const userModel = function userModel(connection) {

    // Requête de création
    const create = function createUser(clbk, data) {
      const q = "INSERT INTO users (nom, prenom, pseudo, mdp, mail, avatar, soundcloud, youtube, facebook, localisation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      const payload = [data.nom, data.prenom, data.pseudo, data.mdp, data.mail, data.avatar, data.soundcloud, data.youtube, data.facebook, data.localisation];
  
      connection.query(q, payload, (err, res) => {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(err, null);
        return clbk(null, res);
      });
    };
  
    // Requête de suppression
    const remove = function deleteUser(clbk, id_user) {
      // la clause SQL IN permet de chercher une valeur dans un tableau
      const q = "DELETE FROM users WHERE id_user IN (?)";
      console.log(q + " " + id_user);

  
      connection.query(q, id_user, function (err, res) {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(res, null);
        return clbk(null, res);
      });
    };
  
    // Requête de mise à jour
    const update = function editUser(clbk, users) {
      const q = "UPDATE users SET nom = ?, prenom = ?,pseudo = ?, mdp = ?, mail = ?, avatar = ?, soundcloud = ?, youtube = ?, facebook = ?, localisation = ? WHERE id_user IN (?)";
      const payload = [users.nom, users.prenom,users.pseudo, users.mdp, users.mail, users.avatar, users.soundcloud, users.youtube, users.facebook, users.localisation, users.id_user];
      connection.query(q, payload, function (err, res, fields) {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(err, null);
        return clbk(null, res);
      });
    };
  
    // Requête de récupération
    const get = function getFullUser(clbk, id_user) {
      let sql;
      if (id_user && !isNaN(id_user)) {
        sql = "SELECT *, m.date AS 'date', m.sujet, m.message, m.id_emetteur, a.annonce, a.date as 'a_date', ufu.id_user_followed FROM users AS u INNER JOIN messages AS m ON u.id_user = m.id_receveur INNER JOIN annonces AS a ON u.id_user = a.id_annonce_owner INNER JOIN user_follows_user AS ufu ON u.id_user = ufu.id_user_followed WHERE u.id_user IN (?)";
      } else {
        sql = "SELECT * FROM users";
      }
      connection.query(sql, [id_user], (error, results) => {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (error) return clbk(error, null);
        return clbk(null, results);
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