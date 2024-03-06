import { pool } from "../database/database.js";

const locationsController = {
    getAll: async (req, res) => {
        try {
            if (req.query.floors_only && req.query.floors_only === "true") {
                let data = await pool.query(`
                    SELECT DISTINCT level FROM locations
                    ORDER BY level
                `);

                res.json(data.rows);
                return;
            }

            let query = `
                SELECT locations.id AS location_id, company_id, building, level, place_number, updated_on
                FROM locations            
            `;

            if (req.query.all && req.query.all === "true") {
                query = `
                    ${query}
                    FULL JOIN company_locations
                    ON
                        company_locations.location_id = locations.id
                    ORDER BY locations.id ASC, updated_on DESC
                `;
            } else {
                // only actual (latest) data
                let condition = "";

                if (req.query.free) {
                    condition = `WHERE company_id IS ${
                        req.query.free === "true" ? "" : "NOT"
                    } NULL`;
                }

                query = `
                    ${query}
                    LEFT JOIN (
                        SELECT * FROM company_locations
                        INNER JOIN (
                            SELECT location_id AS latest_location_id, MAX(updated_on) AS latest_updated_on FROM company_locations
                            GROUP BY location_id
                        ) latest_locations
                        ON
                            company_locations.location_id = latest_locations.latest_location_id
                            AND
                            company_locations.updated_on = latest_locations.latest_updated_on
                    ) latest_company_locations
                    ON
                        locations.id = latest_company_locations.location_id
                    ${condition}
                    ORDER BY locations.id ASC, updated_on DESC
                `;
            }

            let data = await pool.query(query);

            res.json(data.rows);
        } catch (e) {
            console.log(e);
        }
    },

    getOne: async (req, res) => {
        try {
            let id = req.params.id;
            console.log(id);

            let data = await pool.query(`
                SELECT * FROM company_locations
                FULL JOIN locations
                ON
                    company_locations.location_id = locations.id
                WHERE company_id = ${id}
                ORDER BY updated_on DESC
                LIMIT 1
            `);
            res.json(data.rows[0]);
        } catch (e) {
            console.log(e);
        }
    },

    create: async (req, res) => {
        try {
            let { company_id, location_id } = req.body;
            if (
                !location_id ||
                isNaN(parseInt(location_id)) ||
                parseInt(location_id) != location_id
            ) {
                res.status(400).json({
                    error: `Invalid location id (id = ${location_id}).`,
                });
                return;
            }

            let data = await pool.query(`
                SELECT * FROM company_locations
                FULL JOIN locations
                ON
                    company_locations.location_id = locations.id
                WHERE location_id = ${location_id}
                ORDER BY updated_on DESC
                LIMIT 1;
            `);

            if (data.rows.length === 0 || data.rows[0].company_id) {
                res.status(400).json({
                    error: `Location with id = ${location_id} is unavailable.`,
                });
                return;
            }

            data = await pool.query(
                `INSERT INTO company_locations (company_id, location_id, updated_on) VALUES (
                    '${company_id}',
                    '${location_id}',
                    NOW()
                )`
            );
            res.json(data.rows[0]);
        } catch (e) {
            console.log(e);
        }
    },
};
export default locationsController;
