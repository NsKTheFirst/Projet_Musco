const annonceModel = function annonceModel (connection) {
    // Requête de création
    const create = function createAnnonce (clbk, data) {
        const sql = "INSERT INTO annonces (annonce, id_annonce_owner, date) VALUES (?, ?, ?)";
        const payload = [data.annonce, data.id_annonce_owner, data.date];
        connection.query(sql, payload, (err, res) => {
            if (err) return clbk(err, null);
            return clbk(null, res);
        });
    };

    // Requête de suppression
    const remove = function removeAnnonce (clbk, id_annonce) {
        const sql = "DELETE FROM annonces WHERE id_annonce IN (?)";
        console.log(sql + " " + id_annonce);
        connection.query(sql, id_annonce, function (err, res) {
            if (err) return clbk(err, null);
            return clbk(null, res);
        });
    };

    // Requête de mise à jour
    const update = function updateAnnonce (clbk, annonces) {
        const sql = "UPDATE annonces SET annonce = ?, id_annonce_owner = ?, date = ? WHERE id_annonce IN (?)";
        const payload = [annonces.annonce, annonces.id_annonce_owner, annonces.date, annonces.id_annonce];
        connection.query(sql, payload, function (err, res) {
            if (err) return clbk(err, null);
            return clbk(null, res);
        });
    };

    // Requêtes de récupération
    const getOne = function getOneAnnonce(clbk, id_annonce) {
        const sql = "SELECT a.id_annonce, a.annonce, a.id_annonce_owner AS 'annonce_owner', a.date , u.avatar AS 'avatar', u.pseudo, u.localisation, s.categorie, s.skill FROM annonces AS a INNER JOIN users AS u ON a.id_annonce_owner = u.id_user INNER JOIN annonce_needs_skills AS ans ON a.id_annonce = ans.id_annonce_skill INNER JOIN skills AS s ON ans.id_annonce_skill = s.id_skill WHERE a.id_annonce IN (?)";
        connection.query(sql, [id_annonce], (error, results) => {
            if (error) return clbk(error, null);
            return clbk(null, results);
        });
    };

    const getAll = function getAllAnnonce(clbk) {
        const sql = "SELECT a.id_annonce, a.annonce, a.id_annonce_owner AS 'annonce_owner', a.date , u.avatar AS 'avatar', u.pseudo,u.localisation, s.categorie, s.skill FROM annonces AS a INNER JOIN users AS u ON a.id_annonce_owner = u.id_user INNER JOIN annonce_needs_skills AS ans ON a.id_annonce = ans.id_annonce_skill INNER JOIN skills AS s ON ans.id_skills_needed = s.id_skill ORDER BY a.id_annonce DESC";
        connection.query(sql, (error, results) => {
            if (error) return clbk(error);
            return clbk(results);
        });
    };

    //     let sql;
    //     if (id_annonce && !isNaN(id_annonce)) {
    //       sql = "SELECT a.id_annonce, a.annonce, a.id_annonce_owner AS 'annonce_owner', a.date , u.avatar AS 'avatar', u.pseudo, u.localisation, s.categorie, s.skill FROM annonces AS a INNER JOIN users AS u ON a.id_annonce_owner = u.id_user INNER JOIN annonce_needs_skills AS ans ON a.id_annonce = ans.id_annonce_skill INNER JOIN skills AS s ON ans.id_annonce_skill = s.id_skill WHERE a.id_annonce IN (?)";
    //     } else {
    //       sql = "SELECT a.id_annonce, a.annonce, a.id_annonce_owner AS 'annonce_owner', a.date , u.avatar AS 'avatar', u.pseudo,u.localisation, s.categorie, s.skill FROM annonces AS a INNER JOIN users AS u ON a.id_annonce_owner = u.id_user INNER JOIN annonce_needs_skills AS ans ON a.id_annonce = ans.id_annonce_skill INNER JOIN skills AS s ON ans.id_skills_needed = s.id_skill ORDER BY a.id_annonce DESC";
    //     }
    //     connection.query(sql, [id_annonce], (error, results) => {
    //       // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
    //       if (error) return clbk(error, null);
    //       return clbk(null, results);
    //     });
    //   };

      const getLast = function getLastAnnonce(clbk) {
          console.log("yoyoyoyoy");
          const sql = "SELECT a.id_annonce, a.annonce, a.id_annonce_owner AS 'annonce_owner', a.date , u.avatar AS 'avatar', u.pseudo,u.localisation, s.categorie, s.skill FROM annonces AS a INNER JOIN users AS u ON a.id_annonce_owner = u.id_user INNER JOIN annonce_needs_skills AS ans ON a.id_annonce = ans.id_annonce_skill INNER JOIN skills AS s ON ans.id_skills_needed = s.id_skill ORDER BY a.id_annonce DESC LIMIT 0, 2";
          connection.query(sql, (error, results) => {
              console.log(results);
              if (error) return clbk(error);
              return clbk(results);
          });
      };

    return {
        create,
        remove,
        update,
        getAll,
        getOne,
        getLast
    };
};

module.exports = annonceModel;