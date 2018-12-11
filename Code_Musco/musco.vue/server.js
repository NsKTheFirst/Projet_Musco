const express = require('express');
const cors = require('cors');
const app = express();
const port = 5000;
const api = require(__dirname + "/api");


app.use(cors());

app.use(express.json({extended : false}));
app.use(api.prefix, api.routers);

app.listen(port, () => console.log(`Listening on port ${port}`));