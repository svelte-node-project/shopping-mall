import { pool } from "../database/database.js";

const getWorkingHours = async (companyId) => {
    try {
        const id = parseInt(companyId);

        if (!id || isNaN(id) || id != companyId) {
            console.error(`Incorrect company id: ${companyId}.`);
            return false;
        }

        const result = await pool.query(
            `SELECT * FROM working_hours WHERE company_id = ${id}`
        );
        return result.rows;
    } catch (e) {
        console.error(e);
        return false;
    }
};

export { getWorkingHours };
