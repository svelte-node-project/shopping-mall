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
            const types = req.body.types ? req.body.types : [];
            const categories = req.body.categories ? req.body.categories : [];
            const name = req.body.name ? req.body.name : "";

            const result = req.body.group
                ? await pool.query(`
                        SELECT UPPER(LEFT(name, 1)) AS letter, JSON_AGG(companies.* ORDER BY name) AS companies_list
                        FROM companies ${getCondition(types, categories, name)}
                        GROUP BY letter
                        ORDER BY letter
                    `)
                : await pool.query(`
                        SELECT *
                        FROM companies ${getCondition(types, categories, name)}
                    `);

            // console.log(result.rows[0].companies_list[0].id);
            // console.log(result.rows[0].companies_list[0].name);
            // console.log(result.rows[0].companies_list[0].description);
            // res.json(result.rows);

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
