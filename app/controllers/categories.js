import { pool } from "../database/database.js";

const categoriesController = {
  getAll: async (req, res) => {
    try {
      let data = await pool.query("SELECT * FROM categories");
      res.json(data.rows);
    } catch (e) {
      console.log(e);
    }
  },

  getOne: async (req, res) => {
    try {
      let id = req.params.id;
      console.log(id);
      let data = await pool.query(`SELECT * FROM categories WHERE id=${id}`);
      res.json(data.rows[0]);
    } catch (e) {
      console.log(e);
    }
  },

  create: async (req, res) => {
    try {
      let { name } = req.body;
      console.log(name);
      let data = await pool.query(
        `INSERT INTO categories (name) VALUES ('${name}')`
      );
      res.json(data.rows[0]);
    } catch (e) {
      console.log(e);
    }
  },

  remove: async (req, res) => {
    try {
      let id = req.params.id;
      res = await pool.query(`DELETE FROM categories WHERE id =${id}`);
    } catch (e) {
      console.log(e);
    }
  },
};
export default categoriesController;
