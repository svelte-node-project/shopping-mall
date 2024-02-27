-- Users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL
);

CREATE UNIQUE INDEX ON users(lower(email));

-- User roles
CREATE TABLE user_roles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    roles TEXT [] NOT NULL
);

-- Types of companies (owner / tenant / other)
CREATE TABLE company_types (
    id SERIAL PRIMARY KEY,
    type_name TEXT NOT NULL
);

-- Companies (including owner, tenants and others).
CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    type_id INTEGER NOT NULL REFERENCES company_types(id),
    description TEXT,
    address TEXT,
    phone_numbers TEXT [],
    email TEXT,
    website TEXT
);

-- Categories of services
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Services provided by a company (for all types of companies)
CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    category_id INTEGER NOT NULL REFERENCES categories(id)
);

-- Locations within the shopping mall
CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    -- company_id INTEGER NOT NULL REFERENCES companies(id),
    company_id INTEGER REFERENCES companies(id),
    building TEXT,
    level INTEGER NOT NULL,
    place_number INTEGER NOT NULL
);

-- Offers
CREATE TABLE offers (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    category_id INTEGER NOT NULL REFERENCES categories(id),
    name TEXT NOT NULL,
    description  TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Working hours
CREATE TABLE working_hours (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    week_day TEXT,
    start_time TIME,
    end_time TIME,
    start_date DATE,
    end_date DATE
);

-- News
CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    news_date DATE NOT NULL,
    title TEXT NOT NULL,
    news_text TEXT NOT NULL
);

-- Website settings
CREATE TABLE settings (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    setting_values TEXT []
);
