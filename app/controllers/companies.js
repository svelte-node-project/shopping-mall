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

const getFullDataQuery = (simpleQuery) => {
    return `
        SELECT companies.*, categories, locations, working_hours
        FROM
            (${simpleQuery}) companies

        LEFT JOIN
            (SELECT company_id, JSON_AGG(JSON_BUILD_OBJECT(
                'name', name,
                'name_in_url', name_in_url
            )) AS categories
            FROM services
            LEFT JOIN categories
            ON services.category_id = categories.id
            WHERE main_category = true
            GROUP BY company_id, name_in_url) categories
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
            WHERE by_appointment = true OR (end_date IS NULL OR end_date >= CURRENT_DATE)
            GROUP BY company_id) company_working_hours
        ON companies.id = company_working_hours.company_id

        LEFT JOIN
            (SELECT company_id, JSON_AGG(JSON_BUILD_OBJECT(
                'building', building,
                'level', level,
                'place_number', place_number
            )) AS locations
            FROM (
                SELECT company_id, building, level, place_number
                FROM (
                    SELECT company_locations.company_id, company_locations.location_id FROM company_locations
                    INNER JOIN (
                        SELECT company_id, MAX(updated_on) AS latest_updated_on FROM company_locations
                        GROUP BY company_id
                    ) latest_locations
                    ON
                        company_locations.company_id = latest_locations.company_id
                        AND
                        company_locations.updated_on = latest_locations.latest_updated_on
                ) latest_company_locations
				LEFT JOIN locations
                ON
                    locations.id = latest_company_locations.location_id
            ) latest_locations
            GROUP BY company_id) company_locations
        ON companies.id = company_locations.company_id
    `;
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

            if (req.query.full && req.query.full === "true") {
                companiesQuery = getFullDataQuery(companiesQuery);
            }

            const result =
                req.query.group && req.query.group === "true"
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

            if (!id) {
                console.error(`Incorrect company id: ${id}.`);
                return false;
            }

            const searchCondition = isNaN(parseInt(id))
                ? `name_in_url = '${id}' OR name ILIKE '${id}'`
                : `id = ${id}`;

            let companyQuery = `SELECT * FROM companies WHERE ${searchCondition}`;

            if (req.query.main_category && req.query.main_category === "true") {
                companyQuery = `
                    SELECT companies.*, categories.name AS category_name, categories.name_in_url AS category_name_in_url
                    FROM (${companyQuery}) companies
                    LEFT JOIN services
                    ON services.company_id = companies.id
                    LEFT JOIN categories
                    ON services.category_id = categories.id
                    WHERE main_category = true
                    LIMIT 1
                `;
            } else if (req.query.full && req.query.full === "true") {
                companyQuery = getFullDataQuery(companyQuery);
            }

            const result = await pool.query(companyQuery);

            if (result && result.rows) {
                res.json(result.rows[0]);
            } else {
                console.error(`Incorrect request (id: ${id}).`);
                return false;
            }
        } catch (e) {
            console.error(e);
            return false;
        }
    },
};

export default companiesController;
