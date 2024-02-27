ALTER TABLE locations
ALTER COLUMN level TYPE TEXT;

UPDATE locations
SET level = CONCAT('Level ', level);

