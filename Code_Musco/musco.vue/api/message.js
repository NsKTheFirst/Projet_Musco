const messageAPi = function messageAPi(connection) {

    const router = require("express").Router();
    const messageModel = require("./../model/message")(connection);
  
    router.post('/messages', (req, res) => {
      messageModel.create((err, dataset) => {
        if (err) res.send(err);
        res.send(dataset);
        console.log("ça poste");
      }, req.body); // post datas ici ...
    });
  
    router.get('/messages/:id_message', (req, res) => {
      messageModel.get((err, dataset) => {
        if (err) res.send(err);
        res.send(dataset);
      }, req.params.id_message);
    });
  
    router.get('/messages', (req, res) => {
      messageModel.get( (err, dataset) => {
        res.send(dataset);
      }, null);
    });
  
    router.delete('/messages', (req, res) => {
      messageModel.remove((err, dataset) => {
        console.log("ça va del ou pas");
        if (err) return res.status(500).send(err);
        return res.status(200).send(dataset);
      }, req.body.id_message); // tableau d'ids ici ...
    });
  
    router.patch('/messages', (req, res) => {
      messageModel.update((err, dataset) => {
        if (err) return res.status(500).send(err);
        else return res.status(200).send(dataset);
      }, req.body); // un tableau d'ids ici ...
    });
  
    return router;
  };
  
  module.exports = messageAPi;