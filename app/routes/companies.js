import express from "express";

import companiesController from "../controllers/companies.js";

let companiesRouter = express.Router();

companiesRouter.get("/:id", companiesController.getOne);
companiesRouter.get("/", companiesController.getAll);
// companiesRouter.post("/", categoriesController.create);
// companiesRouter.delete("/:id", categoriesController.remove);

export default companiesRouter;
