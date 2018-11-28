// ROUTAGE DE L'API
const api = (function api() {

    const APIVersion = 1; // notre api est en version 1
    const database = require(__dirname + "/../model")({
      password: "", // définition du mot de passe de mySQL
      database: "musco" // base de donnée cible
    });
  
    const routers = []; // on expotera ce tableau une fois rempli de routeurs...
    // IMPORT DES ROUTES DE l'API USER
    const userRouter = require("./user")(database.connection); // module api user
    
  
    // aggrégation des routeurs dans un tableau
    routers.push(userRouter);
  
    return { // définition des propriétés publiques du module @root/api/index.js
      version: APIVersion,
      prefix: `/api/v${APIVersion}`,
      routers: routers
    }; // on récupère ces valeurs dans @root/index.js
  
  }());
  
  module.exports = api;