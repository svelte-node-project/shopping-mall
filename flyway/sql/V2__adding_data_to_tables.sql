-- Delete this file when data is received from the website!!!

TRUNCATE working_hours, locations, services, companies, categories, company_types, offers, news, banners RESTART IDENTITY CASCADE;

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


INSERT INTO categories (name, name_in_url)
VALUES
    ('Cafes and Restaurants', 'cafes-and-restaurants'),
    ('Wellness', 'wellness'),
    ('Home and Sporting Goods', 'home-and-sporting-goods'),
    ('Goods for Children', 'goods-for-children'),
    ('Cosmetics and Pharmacies', 'cosmetics-and-pharmacies'),
    ('Fashion and Accessories', 'fashion-and-accessories'),
    ('Specialty Stores', 'specialty-stores'),
    ('Services and Offices', 'services-and-offices'),
    ('Groceries', 'groceries'),
    ('Leisure', 'leisure');


INSERT INTO companies (name, type_id, description, address, phone_numbers, email, website, name_in_url)
VALUES
    ('Shopping mall', 1, 'This is our shopping mall.', 'Some address, Helsinki', ARRAY ['+358 40 555 5555'], 'contact@shoppingmall.fi', 'shoppingmall.fi', 'shopping-mall'),
    ('Supermarket', 2, 'You can buy food, clothes and other goods here.', NULL, ARRAY ['+358 41 123 4567'], 'contact@supermarket.fi', 'supermarket.fi', 'supermarket'),
    ('Grocery', 2, 'THis is a Grocery. Welcome!', NULL, ARRAY ['+358 40 323 4567'], 'contact@grocery.fi', 'grocery.fi', 'grocery'),
    ('Sporting goods', 2, 'We have a lot of sporting clothes and other sporting goods for you.', 'Some address, Helsinki', ARRAY ['+358 41 133 7777'], 'contact@sport.fi', 'sport.fi', 'sporting-goods'),
    ('Small cafe', 2, 'Welcome to our small cozy cafe!', NULL, ARRAY ['+358 40 557 1234'], 'contact@cafe.fi', 'cafe.fi', 'small-cafe'),
    ('Restaurant', 2, 'Just a restaurant in the shopping mall.', 'Some address, Helsinki', ARRAY ['+358 41 333 4557'], 'contact@restaurant.fi', 'restaurant.fi', 'restaurant'),
    ('Cinema', 2, 'Want to watch a movie? Come to us!', NULL, ARRAY ['+358 41 443 8888'], 'contact@cinema.fi', 'cinema.fi', 'cinema'),
    ('Pharmacy', 2, 'Pharmacy-Pharmacy', NULL, ARRAY ['+358 41 888 8888'], 'contact@pharmacy.fi', 'pharmacy.fi', 'pharmacy'),
    ('Supermarket #2', 2, 'And here is another supermarket where you can buy food, clothes and other goods.', NULL, ARRAY ['+358 41 777 4567'], 'contact@supermarket2.fi', 'supermarket2.fi', 'supermarket-2');


INSERT INTO services (company_id, category_id, main_category)
VALUES
    (1, 8, true),
    (2, 5, false), --supermarket
    (2, 9, true),
    (2, 3, false),
    (2, 4, false),
    (3, 9, true), --grocery
    (4, 3, true), --sporting goods
    (4, 7, false),
    (5, 1, true), --cafe
    (5, 10, false),
    (6, 1, true), --restaurant
    (6, 10, false),
    (7, 10, true), --cinema
    (8, 5, true), --pharmacy
    (9, 9, true); --supermarket


-- INSERT INTO locations (company_id, building, level, place_number)
-- VALUES
--     (NULL, NULL, 'Level 1', 1),
--     (NULL, NULL, 'Level 1', 2),
--     (2, NULL, 'Level 1', 3),
--     (3, NULL, 'Level 1', 4),
--     (4, NULL, 'Level 2', 1),
--     (8, NULL, 'Level 2', 2),
--     (NULL, NULL, 'Level 2', 3),
--     (NULL, NULL, 'Level 2', 4),
--     (6, NULL, 'Level 3', 1),
--     (5, NULL, 'Level 3', 2),
--     (7, NULL, 'Level 3', 3),
--     (NULL, NULL, 'Level 3', 4),
--     (9, NULL, 'Level 1', 1);


INSERT INTO locations (building, level, place_number)
VALUES
    (NULL, 'Level 1', 1),
    (NULL, 'Level 1', 2),
    (NULL, 'Level 1', 3),
    (NULL, 'Level 1', 4),
    (NULL, 'Level 2', 1),
    (NULL, 'Level 2', 2),
    (NULL, 'Level 2', 3),
    (NULL, 'Level 2', 4),
    (NULL, 'Level 3', 1),
    (NULL, 'Level 3', 2),
    (NULL, 'Level 3', 3),
    (NULL, 'Level 3', 4);


INSERT INTO company_locations (company_id, location_id, updated_on)
VALUES
    (2, 3, NOW() - INTERVAL '2 month'),
    (3, 4, NOW() - INTERVAL '2 month'),
    (4, 5, NOW() - INTERVAL '1 month'),
    (8, 6, NOW() - INTERVAL '1 month'),
    (6, 9, NOW() - INTERVAL '1 month'),
    (5, 10, NOW() - INTERVAL '1 month'),
    (7, 11, NOW() - INTERVAL '1 month'),
    (9, 2, NOW() - INTERVAL '1 month'),
    (NULL, 2, NOW()),
    (9, 1, NOW());


INSERT INTO working_hours (company_id, week_day, start_time, end_time, by_appointment, start_date, end_date)
VALUES
    (1, 1, '08:00', '20:00', false, NULL, NULL),
    (1, 2, '08:00', '20:00', false, NULL, NULL),
    (1, 3, '08:00', '20:00', false, NULL, NULL),
    (1, 4, '08:00', '20:00', false, NULL, NULL),
    (1, 5, '08:00', '20:00', false, NULL, NULL),
    (1, 6, '08:00', '20:00', false, NULL, NULL),
    (1, 0, '10:00', '18:00', false, NULL, NULL),
    (1, NULL, NULL, NULL, false, '2024-01-01', '2024-01-01'),
    (3, 1, '08:00', '17:30', false, NULL, NULL),
    (3, 2, '08:00', '17:30', false, NULL, NULL),
    (3, 3, '08:00', '17:30', false, NULL, NULL),
    (3, 4, '08:00', '17:30', false, NULL, NULL),
    (3, 5, '08:00', '17:30', false, NULL, NULL),
    (3, 6, '08:00', '17:00', false, NULL, NULL),
    (1, NULL, NULL, NULL, false, '2024-12-25', '2024-12-25'),
    (3, NULL, NULL, NULL, false, '2024-12-25', '2024-12-25'),
    (8, NULL, NULL, NULL, true, NULL, NULL),
    (3, NULL, '12:00', '16:00', false, '2024-02-29', '2024-03-31'),
    (4, NULL, NULL, NULL, false, '2024-03-04', '2024-03-04'),
    (2, NULL, '05:00', '23:30', false, '2024-03-04', '2024-03-04'),
    (9, 0, '00:00', '24:00', false, NULL, NULL),
    (9, 1, '00:00', '24:00', false, NULL, NULL),
    (9, 2, '00:00', '24:00', false, NULL, NULL),
    (9, 3, '00:00', '24:00', false, NULL, NULL),
    (9, 4, '00:00', '24:00', false, NULL, NULL),
    (9, 5, '00:00', '24:00', false, NULL, NULL),
    (9, 6, '00:00', '24:00', false, NULL, NULL);


INSERT INTO offers (company_id, category_id, name, description, image_link, show_on_homepage, start_date, end_date)
VALUES
    (2, 9, 'Offer #1', 'Some description of the Offer #1.', 'http://link_to_the_offer_1_image', true, '2024-01-01', '2024-01-31'),
    (2, 5, 'Offer #2', 'Some description of the Offer #2.', 'http://link_to_the_offer_2_image', false, '2024-01-01', '2024-07-31'),
    (2, 9, 'Offer #3', 'Some description of the Offer #3.', 'http://link_to_the_offer_3_image', true, '2024-04-01', '2024-12-31'),
    (2, 3, 'Offer #4', 'Some description of the Offer #4.', 'http://link_to_the_offer_4_image', true, '2024-02-23', '2024-02-29'),
    (5, 1, 'Offer #5', 'Some description of the Offer #5.', 'http://link_to_the_offer_5_image', false, '2024-02-01', '2024-03-31'),
    (7, 10, 'Offer #6', 'Some description of the Offer #6.', 'http://link_to_the_offer_6_image', true, '2024-02-15', '2024-03-15');


INSERT INTO news (title, news_text, image_link, show_on_homepage, news_date, news_end_date)
VALUES
    ('News #1! (Now, true)', 'Please read this article for News #1.', 'http://link_to_the_news_1_image', true, '2024-02-15', '2024-03-15'),
    ('News #2! (Now, false)', 'Please read this article for News #2.', 'http://link_to_the_news_2_image', false, '2024-02-15', '2024-03-15'),
    ('News #3! (Past, true)', 'Please read this article for News #3.', 'http://link_to_the_news_3_image', true, '2024-01-01', '2024-01-31'),
    ('News #4! (Past, false)', 'Please read this article for News #4.', 'http://link_to_the_news_4_image', false, '2024-01-01', '2024-01-31'),
    ('News #5! (Future, true)', 'Please read this article for News #5.', 'http://link_to_the_news_5_image', true, '2024-06-01', '2024-12-31'),
    ('News #6! (Future, false)', 'Please read this article for News #6.', 'http://link_to_the_news_6_image', false, '2024-06-01', '2024-12-31');


INSERT INTO banners (name, offer_id, news_id, image_link, navigation_link, start_date, end_date)
VALUES
    ('Banner #1', 3, NULL, 'http://link_to_the_banner_1_image', NULL, '2024-01-01', '2024-01-31'),
    ('Banner #2', NULL, 1, 'http://link_to_the_banner_2_image', NULL, '2024-01-01', '2024-07-31'),
    ('Banner #3', NULL, 2, 'http://link_to_the_banner_3_image', NULL, '2024-04-01', '2024-12-31'),
    ('Banner #4', 4, NULL, 'http://link_to_the_banner_4_image', NULL, '2024-02-23', '2024-02-29'),
    ('Banner #5', 6, NULL, 'http://link_to_the_banner_5_image', NULL, '2024-02-01', '2024-03-31'),
    ('Banner #6', NULL, NULL, 'http://link_to_the_banner_6_image', 'http://navigation_link_for_other_than_offers_or_news', '2024-02-15', '2024-03-15');


INSERT INTO feedbacks (name, email, feedback_type, is_general, company_id, feedback, want_reply)
VALUES
    ('Visitor #11', 'visitor11@test.fi', '{Thanks, Suggestion}', true, 1, 'Positive general feedback with a suggestion.', false),
    ('Visitor #12', 'visitor12@test.fi', '{Complaint}', false, 2, 'Bad quality of service.', true),
    ('Visitor #13', 'visitor13@test.fi', '{Thanks, Other}', false, 5, 'Thanks and a question.', true),
    ('Visitor #14', 'visitor14@test.fi', '{Other}', true, 1, 'Something else (general feedback).', true);


INSERT INTO newsletter (name, email, active)
VALUES
    ('Visitor #1', 'visitor1@test.fi', true),
    ('Visitor #2', 'visitor2@test.fi', false),
    ('Visitor #3', 'visitor3@test.fi', true);