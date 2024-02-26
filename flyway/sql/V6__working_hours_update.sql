ALTER TABLE working_hours
    ADD by_appointment BOOLEAN DEFAULT false;

UPDATE working_hours
SET week_day = '0'
WHERE week_day = 'Sun.';

UPDATE working_hours
SET week_day = '1'
WHERE week_day = 'Mon.';

UPDATE working_hours
SET week_day = '2'
WHERE week_day = 'Tue.';

UPDATE working_hours
SET week_day = '3'
WHERE week_day = 'Wed.';

UPDATE working_hours
SET week_day = '4'
WHERE week_day = 'Thu.';

UPDATE working_hours
SET week_day = '5'
WHERE week_day = 'Fri.';

UPDATE working_hours
SET week_day = '6'
WHERE week_day = 'Sat.';

ALTER TABLE working_hours
ALTER COLUMN week_day TYPE INTEGER
USING week_day::integer;


INSERT INTO working_hours (company_id, by_appointment)
VALUES
    (8, true);

INSERT INTO working_hours (company_id, week_day, start_time, end_time, start_date, end_date)
VALUES
    (3, NULL, '12:00', '16:00', '2024-02-26', '2024-02-29'),
    (4, NULL, NULL, NULL, '2024-02-26', '2024-02-26');