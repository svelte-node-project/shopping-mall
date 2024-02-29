import { pool } from "../database/database.js";

const locationsController = {
    getAll: async (req, res) => {
        try {
            let data = await pool.query("SELECT * FROM locations");
            res.json(data.rows);
        } catch (e) {
            console.log(e);
        }
    },

    getOne: async (req, res) => {
        try {
            let id = req.params.id;
            console.log(id);
            let data = await pool.query(
                `SELECT * FROM locations WHERE id=${id}`
            );
            res.json(data.rows[0]);
        } catch (e) {
            console.log(e);
        }
    },

    create: async (req, res) => {
        try {
            let { company_id, building, level, place_number } = req.body;
            let data = await pool.query(
                `INSERT INTO locations (company_id, building, level, place_number) VALUES (
                    '${company_id}',
                    '${building ? building : ""}',
                    '${level}',
                    '${place_number}'
                )`
            );
            res.json(data.rows[0]);
        } catch (e) {
            console.log(e);
        }
    },

    remove: async (req, res) => {
        try {
            let id = req.params.id;
            res = await pool.query(`DELETE FROM locations WHERE id =${id}`);
        } catch (e) {
            console.log(e);
        }
    },
};
export default locationsController;
