import express from "express";
import openingHoursController from "../controllers/openingHours.js";

let openingHoursRouter = express.Router();
openingHoursRouter.get("/:companyId", openingHoursController.getOne);

export default openingHoursRouter;
