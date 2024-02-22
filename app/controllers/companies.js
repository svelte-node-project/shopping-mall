import { pool } from "../database/database.js";

const transformArray = (arr) => {
  return arr.map((el) => `'${el}'`);
};
const companiesController = {
  getAll: async (req, res, next, types = [], categories = []) => {
    try {
      const typesCondition =
        types && types.length > 0
          ? `type_id IN (SELECT id FROM company_types WHERE type_name ILIKE ANY(array[${transformArray(
              types
            )}]))`
          : "";
      const categoriesCondition =
        categories && categories.length > 0
          ? `
                    id IN
                    (
                        SELECT company_id FROM services
                        WHERE category_id IN (
                            SELECT id FROM categories WHERE name ILIKE ANY(array[${transformArray(
                              categories
                            )}])
                        )
                    )
                `
          : "";

      let condition = typesCondition;
      if (condition && categoriesCondition) {
        condition = `${condition} AND ${categoriesCondition}`;
      } else if (!condition && categoriesCondition) {
        condition = categoriesCondition;
      }

      condition = condition ? `WHERE ${condition}` : "";
      const result = await pool.query(`SELECT * FROM companies ${condition}`);
      res.json(result.rows);
    } catch (e) {
      console.error(e);
      return false;
    }
  },

  getOne: async (req, res, next, fields = []) => {
    try {
      let id = req.params.id;
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
        console.error(`Incorrect request (id: ${id}, fileds: ${fields}).`);
        return false;
      }
    } catch (e) {
      console.error(e);
      return false;
    }
  },
};

export default companiesController;
