import express from "express";
import bannersController from "../controllers/banners.js";

let bannersRouter = express.Router();

bannersRouter.get("/:id", bannersController.getOne);
bannersRouter.get("/", bannersController.getAll);

export default bannersRouter;
