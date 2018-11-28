const express = require('express');
const cors = require('cors');
const app = express();
const port = 8080;
const database = require("./database");

// const frontEndURL = "http://localhost:8080";

app.use(cors());

app.use(express.json({extended : false}));


console.log("@node-server > " + Date.now());

// app.get("/", function(req, res) {
//     res.send(`<a href="${frontEndURL}">node ${frontEndURL}</a>`)
// })

//GET users
app.get('/api/v1/users', (req, res) => {
    database.getUsers( (err, users) => {
      if (err) return res.status(500).send(err);
      return res.status(200).send(users);
    }, null);
});

app.listen(port, () => console.log(`Listening on port ${port}`));