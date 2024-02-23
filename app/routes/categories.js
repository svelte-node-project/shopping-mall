import express from "express";
import categoriesController from "../controllers/categories.js";

let categoriesRouter = express.Router();

categoriesRouter.get("/:id", categoriesController.getOne);
categoriesRouter.get("/", categoriesController.getAll);
categoriesRouter.post("/", categoriesController.create);
categoriesRouter.delete("/:id", categoriesController.remove);

export default categoriesRouter;
