import { pool } from "../database/database.js";

const getCategories = async () => {
    try {
        return (await pool.query("SELECT * FROM categories")).rows;
    } catch (e) {
        console.error(e);
        return false;
    }
};

export { getCategories };
