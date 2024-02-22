-- Delete this file when data is received from the website!!!

TRUNCATE working_hours, locations, services, companies, categories, company_types RESTART IDENTITY CASCADE;

-- -- Users
-- CREATE TABLE users (
--     id SERIAL PRIMARY KEY,
--     email TEXT NOT NULL,
--     password_hash TEXT NOT NULL
-- );

-- CREATE UNIQUE INDEX ON users(lower(email));

-- -- User roles
-- CREATE TABLE user_roles (
--     id SERIAL PRIMARY KEY,
--     user_id INTEGER NOT NULL REFERENCES users(id),
--     roles TEXT [] NOT NULL
-- );

INSERT INTO company_types (type_name)
VALUES
    ('Owner'),
    ('Tenant'),
    ('Other');


INSERT INTO categories (name)
VALUES
    ('Cafes and Restaurants'),
    ('Wellness'),
    ('Home and Sporting Goods'),
    ('Goods for Children'),
    ('Cosmetics and Pharmacies'),
    ('Fashion and Accessories'),
    ('Specialty Stores'),
    ('Services and Offices'),
    ('Groceries'),
    ('Leisure');


INSERT INTO companies (name, type_id, description, address, phone_numbers, email, website)
VALUES
    ('Shopping mall', 1, 'This is our shopping mall.', 'Some address, Helsinki', ARRAY ['+358 40 555 5555'], 'contact@shoppingmall.fi', 'shoppingmall.fi'),
    ('Supermarket', 2, 'You can buy food, clothes and other goods here.', NULL, ARRAY ['+358 41 123 4567'], 'contact@supermarket.fi', 'supermarket.fi'),
    ('Grocery', 2, 'THis is a Grocery. Welcome!', NULL, ARRAY ['+358 40 323 4567'], 'contact@grocery.fi', 'grocery.fi'),
    ('Sporting goods', 2, 'We have a lot of sporting clothes and other sporting goods for you.', 'Some address, Helsinki', ARRAY ['+358 41 133 7777'], 'contact@sport.fi', 'sport.fi'),
    ('Small cafe', 2, 'Welcome to our small cozy cafe!', NULL, ARRAY ['+358 40 557 1234'], 'contact@cafe.fi', 'cafe.fi'),
    ('Restaurant', 2, 'Just a restaurant in the shopping mall.', 'Some address, Helsinki', ARRAY ['+358 41 333 4557'], 'contact@restaurant.fi', 'restaurant.fi'),
    ('Cinema', 2, 'Want to watch a movie? Come to us!', NULL, ARRAY ['+358 41 443 8888'], 'contact@cinema.fi', 'cinema.fi'),
    ('Pharmacy', 2, 'Pharmacy-Pharmacy', NULL, ARRAY ['+358 41 888 8888'], 'contact@pharmacy.fi', 'pharmacy.fi');
 

INSERT INTO services (company_id, category_id)
VALUES
    (1, 8),
    (2, 5), --supermarket
    (2, 9),
    (2, 3),
    (2, 4),
    (3, 9), --grocery
    (4, 3), --sporting goods
    (4, 7),
    (5, 1), --cafe
    (5, 10),
    (6, 1), --restaurant
    (6, 10),
    (7, 10), --cinema
    (8, 5); --pharmacy



INSERT INTO locations (company_id, building, level, place_number)
VALUES
    (NULL, NULL, 1, 1),
    (NULL, NULL, 1, 2),
    (2, NULL, 1, 3),
    (3, NULL, 1, 4),
    (4, NULL, 2, 1),
    (8, NULL, 2, 2),
    (NULL, NULL, 2, 3),
    (NULL, NULL, 2, 4),
    (6, NULL, 3, 1),
    (5, NULL, 3, 2),
    (7, NULL, 3, 3),
    (NULL, NULL, 3, 4);


-- -- Offers
-- CREATE TABLE offers (
--     id SERIAL PRIMARY KEY,
--     company_id INTEGER NOT NULL REFERENCES companies(id),
--     category_id INTEGER NOT NULL REFERENCES categories(id),
--     name TEXT NOT NULL,
--     description  TEXT NOT NULL,
--     start_date DATE,
--     end_date DATE
-- );


INSERT INTO working_hours (company_id, week_day, start_time, end_time, start_date, end_date)
VALUES
    (1, 'Mon.', '08:00', '20:00', NULL, NULL),
    (1, 'Tue.', '08:00', '20:00', NULL, NULL),
    (1, 'Wed.', '08:00', '20:00', NULL, NULL),
    (1, 'Thu.', '08:00', '20:00', NULL, NULL),
    (1, 'Fri.', '08:00', '20:00', NULL, NULL),
    (1, 'Sat.', '08:00', '20:00', NULL, NULL),
    (1, 'Sun.', '10:00', '18:00', NULL, NULL),
    (1, NULL, NULL, NULL, '2024-01-01', '2024-01-01'),
    (3, 'Mon.', '08:00', '17:30', NULL, NULL),
    (3, 'Tue.', '08:00', '17:30', NULL, NULL),
    (3, 'Wed.', '08:00', '17:30', NULL, NULL),
    (3, 'Thu.', '08:00', '17:30', NULL, NULL),
    (3, 'Fri.', '08:00', '17:30', NULL, NULL),
    (3, 'Sat.', '08:00', '17:00', NULL, NULL);


-- -- News
-- CREATE TABLE news (
--     id SERIAL PRIMARY KEY,
--     news_date DATE NOT NULL,
--     title TEXT NOT NULL,
--     news_text TEXT NOT NULL
-- );

-- -- Website settings
-- CREATE TABLE settings (
--     id SERIAL PRIMARY KEY,
--     name TEXT NOT NULL,
--     setting_values TEXT []
-- );





-- -- -- ============================================
-- SELECT * FROM companies
-- WHERE type_id IN (SELECT id FROM company_types WHERE type_name ILIKE 'tenant')
--     AND id IN
--     (
--         SELECT company_id FROM services
--         WHERE category_id IN (
--             SELECT id FROM categories WHERE name ILIKE ANY(array['groceries', 'restaurant'])
--         )
--     );

