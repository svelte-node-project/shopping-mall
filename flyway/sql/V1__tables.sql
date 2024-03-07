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
    website TEXT,
    name_in_url TEXT NOT NULL
);

-- Categories of services
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    name_in_url TEXT NOT NULL
);

-- Services provided by a company (for all types of companies)
CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    category_id INTEGER NOT NULL REFERENCES categories(id),
    main_category BOOLEAN NOT NULL
);

-- -- Locations within the shopping mall
-- CREATE TABLE locations (
--     id SERIAL PRIMARY KEY,
--     -- company_id INTEGER NOT NULL REFERENCES companies(id),
--     company_id INTEGER REFERENCES companies(id),
--     building TEXT,
--     level TEXT NOT NULL,
--     place_number INTEGER NOT NULL
-- );

-- Locations within the shopping mall
CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    building TEXT,
    level TEXT NOT NULL,
    place_number INTEGER NOT NULL
);

-- Locations occupied by companies
CREATE TABLE company_locations (
    id SERIAL PRIMARY KEY,
    company_id INTEGER REFERENCES companies(id),
    location_id INTEGER NOT NULL REFERENCES locations(id),
    updated_on TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Offers
CREATE TABLE offers (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    category_id INTEGER NOT NULL REFERENCES categories(id),
    name TEXT NOT NULL,
    description  TEXT NOT NULL,
    image_link TEXT,
    show_on_homepage BOOLEAN NOT NULL DEFAULT false,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Working hours
CREATE TABLE working_hours (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    week_day INTEGER,
    start_time TIME,
    end_time TIME,
    by_appointment BOOLEAN NOT NULL DEFAULT false,
    start_date DATE,
    end_date DATE
);

-- News
CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    news_date DATE NOT NULL,
    title TEXT NOT NULL,
    news_text TEXT NOT NULL,
    image_link TEXT,
    show_on_homepage BOOLEAN NOT NULL DEFAULT false,
    news_end_date DATE NOT NULL
);

-- Website settings
CREATE TABLE settings (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    setting_values TEXT []
);

-- Banners
CREATE TABLE banners (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    offer_id INTEGER REFERENCES offers(id),
    news_id INTEGER REFERENCES news(id),
    image_link TEXT,
    navigation_link TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TYPE feedback_types AS ENUM ('Thanks', 'Suggestion', 'Complaint', 'Other');

CREATE TABLE feedbacks (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    feedback_type feedback_types [] NOT NULL,
    is_general BOOLEAN NOT NULL DEFAULT true, 
    company_id INTEGER NOT NULL REFERENCES companies(id), -- If is_general=true then select the Owner in this field
    feedback TEXT NOT NULL,
    want_reply BOOLEAN NOT NULL
);

CREATE TABLE newsletter (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    active BOOLEAN NOT NULL DEFAULT true
);