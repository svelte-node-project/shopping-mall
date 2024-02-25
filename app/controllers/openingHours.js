import { pool } from "../database/database.js";

const openingHoursController = {
  getOne: async (req, res) => {
    try {
      let companyId = req.params.companyId;
      console.log(companyId);
      const id = parseInt(companyId);

      if (!id || isNaN(id) || id != companyId) {
        console.error(`Incorrect company id: ${companyId}.`);
      }

      const result = await pool.query(
        `SELECT * FROM working_hours WHERE company_id = ${id}
            AND (
                end_date IS NULL
                OR
                (end_date IS NOT NULL AND NOW() < end_date)
            )`
      );
      res.json(result.rows);
    } catch (e) {
      console.error(e);
    }
  },
};
export default openingHoursController;
