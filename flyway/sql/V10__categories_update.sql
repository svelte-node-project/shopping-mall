ALTER TABLE categories
    ADD name_in_url TEXT NOT NULL DEFAULT 'default-value';


UPDATE categories
SET name_in_url = 'cafes-and-restaurants'
WHERE id = 1;

UPDATE categories
SET name_in_url = 'wellness'
WHERE id = 2;

UPDATE categories
SET name_in_url = 'home-and-sporting-goods'
WHERE id = 3;

UPDATE categories
SET name_in_url = 'goods-for-children'
WHERE id = 4;

UPDATE categories
SET name_in_url = 'cosmetics-and-pharmacies'
WHERE id = 5;

UPDATE categories
SET name_in_url = 'fashion-and-accessories'
WHERE id = 6;

UPDATE categories
SET name_in_url = 'specialty-stores'
WHERE id = 7;

UPDATE categories
SET name_in_url = 'services-and-offices'
WHERE id = 8;

UPDATE categories
SET name_in_url = 'groceries'
WHERE id = 9;

UPDATE categories
SET name_in_url = 'leisure'
WHERE id = 10;
