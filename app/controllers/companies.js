import { pool } from "../database/database.js";

const transformArray = (arr) => {
    return arr.map((el) => `'${el}'`);
};

const getCondition = (types, categories, name) => {
    const condition = [];
    if (types) {
        types = Array.isArray(types) ? types : [types];
        if (types.length > 0) {
            condition[0] = `
                type_id IN (SELECT id FROM company_types WHERE type_name ILIKE ANY(array[${transformArray(
                    types
                )}]))
            `;
        }
    }

    if (categories) {
        categories = Array.isArray(categories) ? categories : [categories];
        if (categories.length > 0) {
            condition[condition.length] = `
                id IN
                (
                    SELECT company_id FROM services
                    WHERE category_id IN (
                        SELECT id FROM categories WHERE name ILIKE ANY(array[${transformArray(
                            categories
                        )}])
                    )
                )
            `;
        }
    }

    if (name) {
        condition[condition.length] = `name ILIKE '${name}%'`;
    }

    return condition.length > 0 ? `WHERE ${condition.join(" AND ")}` : "";
};

const companiesController = {
    getAll: async (req, res) => {
        try {
            const types = req.query.types ? req.query.types : [];
            const categories = req.query.categories ? req.query.categories : [];
            const name = req.query.name ? req.query.name : "";

            let companiesQuery = `
                SELECT * FROM companies ${getCondition(types, categories, name)}
            `;
            if (req.query.full) {
                companiesQuery = `
                    SELECT companies.*, categories, locations, working_hours
                    FROM
                        (${companiesQuery}) companies

                    LEFT JOIN
                        (SELECT company_id, JSON_AGG(name) AS categories
                        FROM services
                        LEFT JOIN categories
                        ON services.category_id = categories.id
                        GROUP BY company_id) categories
                    ON companies.id = categories.company_id

                    LEFT JOIN
                        (SELECT company_id, JSON_AGG(JSON_BUILD_OBJECT(
                            'week_day', week_day,
                            'start_time', start_time,
                            'end_time', end_time,
                            'start_date', start_date,
                            'end_date', end_date,
                            'by_appointment', by_appointment
                        )) AS working_hours
                        FROM working_hours
                        WHERE by_appointment IS NOT NULL OR ((end_date IS NULL OR end_date >= NOW()))
                        GROUP BY company_id) company_working_hours
                    ON companies.id = company_working_hours.company_id

                    LEFT JOIN
                        (SELECT company_id, JSON_AGG(JSON_BUILD_OBJECT(
                            'building', building,
                            'level', level,
                            'place_number', place_number
                        )) AS locations
                        FROM locations
                        GROUP BY company_id) company_locations
                    ON companies.id = company_locations.company_id
                `;
            }

            const result = req.query.group
                ? await pool.query(`
                        SELECT UPPER(LEFT(name, 1)) AS letter, JSON_AGG(companies_info.* ORDER BY name) AS companies
                        FROM (${companiesQuery}) companies_info
                        GROUP BY letter
                        ORDER BY letter
                    `)
                : await pool.query(`${companiesQuery}`);

            res.json(result.rows);
        } catch (e) {
            console.error(e);
            return false;
        }
    },

    getOne: async (req, res) => {
        try {
            const id = req.params.id;
            const fields = req.query.fields ? req.query.fields : [];

            if (!id || isNaN(parseInt(id))) {
                console.error(`Incorrect company id: ${id}.`);
                return false;
            }

            let fieldsStr = fields.toString();
            fieldsStr = fieldsStr ? fieldsStr : "*";

            const result = await pool.query(
                `SELECT ${fieldsStr} FROM companies WHERE id = ${id}`
            );
            if (result && result.rows) {
                res.json(result.rows[0]);
            } else {
                console.error(
                    `Incorrect request (id: ${id}, fileds: ${fields}).`
                );
                return false;
            }
        } catch (e) {
            console.error(e);
            return false;
        }
    },
};

export default companiesController;
