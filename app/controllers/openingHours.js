import { pool } from "../database/database.js";

const openingHoursController = {
    getAll: async (req, res) => {
        try {
            const result = await pool.query(`
                SELECT company_id, week_day, start_time, end_time, by_appointment, start_date, end_date FROM working_hours
                WHERE by_appointment = true OR (end_date IS NULL OR end_date >= CURRENT_DATE)
            `);
            res.json(result.rows);
        } catch (e) {
            console.error(e);
        }
    },
    getOne: async (req, res) => {
        try {
            let companyId = req.params.companyId;
            console.log(companyId);
            const id = parseInt(companyId);

            if (!id || isNaN(id) || id != companyId) {
                console.error(`Incorrect company id: ${companyId}.`);
            }

            const result = await pool.query(`
                SELECT * FROM working_hours
                WHERE company_id = ${id}
                AND (by_appointment = true OR (end_date IS NULL OR end_date >= CURRENT_DATE))
            `);
            res.json(result.rows);
        } catch (e) {
            console.error(e);
        }
    },
};
export default openingHoursController;
