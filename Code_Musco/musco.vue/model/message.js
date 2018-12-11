const messageModel = function messageModel(connection) {

    // Requête de création
    const create = function createMessage(clbk, data) {
      const q = "INSERT INTO messages (date, sujet, message, id_emetteur, id_receveur) VALUES (?, ?, ?, ?, ?)";
      const payload = [data.date, data.sujet, data.message, data.id_emetteur, data.id_receveur];
  
      connection.query(q, payload, (err, res, cols) => {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(err, null);
        return clbk(null, res);
      });
    };
  
    // Requête de suppression
    const remove = function deleteMessage(clbk, id_message) {
      // la clause SQL IN permet de chercher une valeur dans un tableau
      const q = "DELETE FROM messages WHERE id_message IN (?)";
      console.log(q + id_message);

  
      connection.query(q, id_message, function (err, res, fields) {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(res, null);
        return clbk(null, res);
      });
    };
  
    // Requête de mise à jour
    const update = function editMessage(clbk, messages) {
      const q = "UPDATE messages SET date = ?, sujet = ?, message = ?, id_emetteur = ?, id_receveur = ? WHERE id_message IN (?)";
      const payload = [messages.date, messages.sujet, messages.message, messages.id_emetteur, messages.id_receveur, messages.id_message];
      connection.query(q, payload, function (err, res, fields) {
        // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
        if (err) return clbk(err, null);
        return clbk(null, res);
      });
    };
  
    // Requête de récupération
    const get = function getMessage(clbk, id_message) {
      let sql;
      if (id_message && !isNaN(id_message)) {
        sql = "SELECT *, u.pseudo, u.avatar FROM messages AS m INNER JOIN users AS u ON u.id_user = m.id_emetteur WHERE m.id_message IN (?)";
      } else {
        sql = "SELECT * FROM messages";
      }
      connection.query(sql, [id_message], (error, results, fields) => {
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
  
  module.exports = messageModel;