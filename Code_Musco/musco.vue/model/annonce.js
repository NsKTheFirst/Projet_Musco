const annonceModel = function annonceModel (connection) {
    const create = function createAnnonce (clbk, data) {
        const sql = "INSERT INTO annonces (annonce, id_annonce_owner, date) VALUES (?, ?, ?)";
        const payload = [data.annonce, data.id_annonce_owner, data.date];
        connection.query(sql, payload, (err, res, cols) => {
            if (err) return clbk(err, null);
            return clbk(null, res);
        });
    };

    const remove = function removeAnnonce (clbk,id_annonce) {
        const sql = "DELETE FROM annonces WHERE id_annonce IN (?)";

        connection.query(sql, id_annonce, function (err, res, fields) {
            if (err) return clbk(err, null);
            return clbk(null, res);
        });
    };

    const update = function updateAnnonce (clbk, annonces) {
        const sql = "UPDATE annonces SET annonce = ?, id_annonce_owner = ?, date = ?";
        const payload = [annonces.annonce, annonces.id_annonce_owner, annonces.date, annonces.id_annonce];
        connection.query(sql, payload, function (err, res, fields) {
            if (err) return clbk(err, null);
            return clbk(null, res);
        });
    };

    return {
        create,
        remove,
        update
    };
};

module.exports = annonceModel;