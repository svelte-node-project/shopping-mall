import cors from "cors";
import express from "express";

import { getCategories } from "./services/categoryService.js";
import { getCompanies, getCompany } from "./services/companyService.js";
import { getWorkingHours } from "./services/workingHoursService.js";

const app = express();

app.use(express.json());
app.use(cors());

app.get("/", async (request, response) => {
    console.log("Categories:");
    let res = await getCategories();
    console.log(res);

    console.log();
    console.log("==================================");
    console.log();

    console.log("Companies (groceries):");
    res = await getCompanies(["tenant"], ["groceries"]);
    console.log(res);

    console.log();
    console.log("==================================");
    console.log();

    console.log("Company (id = 1):");
    res = await getCompany(1, ["name", "type_id"]);
    console.log(res);

    console.log();
    console.log("==================================");
    console.log();

    console.log("Company's working hours (id = 1):");
    res = await getWorkingHours(1);
    console.log(res);

    console.log();
    console.log("==================================");
    console.log();

    res = await getCompanies();
    console.log(res);

    console.log();
    console.log("==================================");
    console.log();

    res = await getCompany(1);
    console.log(res);

    response.send("<h1>Hello World!</h1>");
});

async function getTestData() {
    return [];
}

app.get("/api/todos", async (request, response) => {
    const data = await getTestData();
    response.json(data);
});

const PORT = 3001;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
