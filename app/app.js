import cors from "cors";
import express from "express";

import categoriesRouter from "./routes/categories.js";
import companiesRouter from "./routes/companies.js";
import openingHoursRouter from "./routes/openingHours.js";
import offersRouter from "./routes/offers.js";
import bannersRouter from "./routes/banners.js";
import newsRouter from "./routes/news.js";

const app = express();

app.use(express.json());
app.use(cors());

app.use("/companies", companiesRouter);
app.use("/categories", categoriesRouter);
app.use("/openingHours", openingHoursRouter);
app.use("/offers", offersRouter);
app.use("/news", newsRouter);
app.use("/banners", bannersRouter);

const PORT = 3001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
