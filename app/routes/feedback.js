import express from "express";
import feedbackController from "../controllers/feedback.js";

const feedbackRouter = express.Router();

feedbackRouter.post("/", feedbackController.submitFeedback);

export default feedbackRouter;
