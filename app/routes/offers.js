import express from "express";
import offersController from "../controllers/offers.js";

let offersRouter = express.Router();

offersRouter.get("/:id", offersController.getOne);
offersRouter.get("/", offersController.getAll);

export default offersRouter;
