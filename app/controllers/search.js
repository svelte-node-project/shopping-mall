import { pool } from "../database/database.js";

const searchController = {
  getAll: async (req, res) => {
    try {
      const searchText = req.query.searchText;
      const companiesQuery = `
        SELECT companies.id, companies.name, companies.description, '/en/stores/' || categories.name || '/' || categories.name_in_url AS link
        FROM companies
	      LEFT JOIN services ON services.company_id = companies.id
	      LEFT JOIN categories ON services.category_id = categories.id
        WHERE (companies.name ILIKE $1
        OR companies.description ILIKE $1)
	      AND services.main_category = true;
    `;
      const offersQuery = `
        SELECT id, name, description, '/offers/' || id AS link
        FROM offers
        WHERE name ILIKE $1
        OR description ILIKE $1;
    `;
      const newsQuery = `
        SELECT id, title AS name, news_text AS description, '/happenings/' || id AS link
        FROM news
        WHERE title ILIKE $1
        OR news_text ILIKE $1;
    `;
      const [companiesResults, offersResult, newsResults] = await Promise.all([
        pool.query(companiesQuery, [`%${searchText}%`]),
        pool.query(offersQuery, [`%${searchText}%`]),
        pool.query(newsQuery, [`%${searchText}%`]),
      ]);

      const combinedResults = [
        ...companiesResults.rows,
        ...offersResult.rows,
        ...newsResults.rows,
      ];
      res.json(combinedResults);
    } catch (e) {
      console.error(e);
    }
  },
};

export default searchController;
