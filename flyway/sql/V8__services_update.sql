ALTER TABLE services
    ADD main_category BOOLEAN DEFAULT false;


UPDATE services
SET main_category = true
WHERE id IN (1, 3, 6, 7, 9, 11, 13, 14);
