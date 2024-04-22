import express from "express";

import searchController from "../controllers/search.js";

let searchRouter = express.Router();

searchRouter.get("/", searchController.getAll);

export default searchRouter;
