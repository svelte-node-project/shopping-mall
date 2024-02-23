import express from "express";
import newsController from "../controllers/news.js";

let newsRouter = express.Router();

newsRouter.get("/:id", newsController.getOne);
newsRouter.get("/", newsController.getAll);

export default newsRouter;
