ALTER TABLE companies
    ADD name_in_url TEXT NOT NULL DEFAULT 'default-value';


UPDATE companies
SET name_in_url = 'shopping-mall'
WHERE id = 1;

UPDATE companies
SET name_in_url = 'supermarket'
WHERE id = 2;

UPDATE companies
SET name_in_url = 'grocery'
WHERE id = 3;

UPDATE companies
SET name_in_url = 'sporting-goods'
WHERE id = 4;

UPDATE companies
SET name_in_url = 'small-cafe'
WHERE id = 5;

UPDATE companies
SET name_in_url = 'restaurant'
WHERE id = 6;

UPDATE companies
SET name_in_url = 'cinema'
WHERE id = 7;

UPDATE companies
SET name_in_url = 'pharmacy'
WHERE id = 8;


INSERT INTO companies (name, type_id, description, address, phone_numbers, email, website, name_in_url)
VALUES
    ('Supermarket #2', 2, 'And here is another supermarket where you can buy food, clothes and other goods.', NULL, ARRAY ['+358 41 777 4567'], 'contact@supermarket2.fi', 'supermarket2.fi', 'supermarket-2');


INSERT INTO locations (company_id, building, level, place_number)
VALUES
    (9, NULL, 'Level 1', 1);


INSERT INTO services (company_id, category_id, main_category)
VALUES
    (9, 9, true);


INSERT INTO working_hours (company_id, week_day, start_time, end_time, start_date, end_date)
VALUES
    (9, 0, '00:00', '24:00', NULL, NULL),
    (9, 1, '00:00', '24:00', NULL, NULL),
    (9, 2, '00:00', '24:00', NULL, NULL),
    (9, 3, '00:00', '24:00', NULL, NULL),
    (9, 4, '00:00', '24:00', NULL, NULL),
    (9, 5, '00:00', '24:00', NULL, NULL),
    (9, 6, '00:00', '24:00', NULL, NULL);