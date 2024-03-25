import { pool } from "../database/database.js";

const feedbackController = {
    submitFeedback: async (req, res) => {
      const { feedbackType, selectedShop, feedbackText, name, email, reply, feedbackCategories } = req.body;
      let companyId = feedbackType === "specific" ? selectedShop : null;
      try {
        await pool.query(
          `INSERT INTO feedbacks (name, email, feedback_type, is_general, company_id, feedback, want_reply) VALUES ($1, $2, ARRAY[$3::feedback_types], $4, $5, $6, $7)`,
          [name, email, feedbackCategories, feedbackType === "general", companyId, feedbackText, reply]
        );
        res.status(201).send({ message: "Feedback submitted successfully" });
      } catch (error) {
        console.error(error);
        res.status(500).send({ message: "Error submitting feedback", error: error.message });
      }
    }
  };
  

export default feedbackController;