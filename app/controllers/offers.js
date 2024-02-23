import { pool } from "../database/database.js";

const offersController = {
  getAll: async (req, res) => {
    try {
      let data = await pool.query("SELECT * FROM offers");
      res.json(data.rows);
    } catch (e) {
      console.log(e);
    }
  },

  getOne: async (req, res) => {
    try {
      let id = req.params.id;
      console.log(id);
      let data = await pool.query(`SELECT * FROM offers WHERE id=${id}`);
      res.json(data.rows[0]);
    } catch (e) {
      console.log(e);
    }
  },
};

export default offersController;
