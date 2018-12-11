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

    // Requête de récupération
    const get = function getAnnonce(clbk, id_annonce, last) {
        let sql;
        if (id_annonce && !isNaN(id_annonce)) {
          sql = "SELECT a.id_annonce, a.annonce, a.id_annonce_owner AS 'annonce_owner', a.date , u.avatar AS 'avatar', u.pseudo, s.categorie, s.skill FROM annonces AS a INNER JOIN users AS u ON a.id_annonce_owner = u.id_user INNER JOIN annonce_needs_skills AS ans ON a.id_annonce = ans.id_annonce_skill INNER JOIN skills AS s ON ans.id_annonce_skill = s.id_skill WHERE a.id_annonce IN (?)";
        } else if (last) {
            sql = "SELECT a.id_annonce, a.annonce, a.id_annonce_owner AS 'annonce_owner', a.date , u.avatar AS 'avatar', u.pseudo, s.categorie, s.skill FROM annonces AS a INNER JOIN users AS u ON a.id_annonce_owner = u.id_user INNER JOIN annonce_needs_skills AS ans ON a.id_annonce = ans.id_annonce_skill INNER JOIN skills AS s ON ans.id_skills_needed = s.id_skill LIMIT 0, 2"
        } else {
          sql = "SELECT a.id_annonce, a.annonce, a.id_annonce_owner AS 'annonce_owner', a.date , u.avatar AS 'avatar', u.pseudo, s.categorie, s.skill FROM annonces AS a INNER JOIN users AS u ON a.id_annonce_owner = u.id_user INNER JOIN annonce_needs_skills AS ans ON a.id_annonce = ans.id_annonce_skill INNER JOIN skills AS s ON ans.id_skills_needed = s.id_skill";
        }
        connection.query(sql, [id_annonce], [last], (error, results) => {
          // console.log(this.sql); // affiche la dernière requête SQL, pratique pour deboguer
          if (error) return clbk(error, null);
          return clbk(null, results);
        });
      };

    return {
        create,
        remove,
        update,
        get
    };
};

module.exports = annonceModel;