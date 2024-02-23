import { pool } from "../database/database.js";

const bannersController = {
  getAll: async (req, res) => {
    try {
      let today = new Date().toISOString();
      let data = await pool.query(
        `SELECT * FROM banners WHERE start_date <= '${today}' AND end_date >= '${today}'`
      );
      res.json(data.rows);
    } catch (e) {
      console.log(e);
    }
  },

  getOne: async (req, res) => {
    try {
      let id = req.params.id;
      console.log(id);
      let data = await pool.query(`SELECT * FROM banners WHERE id=${id}`);
      res.json(data.rows[0]);
    } catch (e) {
      console.log(e);
    }
  },
};

export default bannersController;
