import express from "express";

import locationsController from "../controllers/locations.js";

let locationsRouter = express.Router();

locationsRouter.get("/:id", locationsController.getOne);
locationsRouter.get("/", locationsController.getAll);
locationsRouter.post("/", locationsController.create);

export default locationsRouter;
