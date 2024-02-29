CREATE TABLE newsletter (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    active BOOLEAN NOT NULL DEFAULT true
);


INSERT INTO newsletter (name, email, active)
VALUES
    ('Visitor #1', 'visitor1@test.fi', true),
    ('Visitor #2', 'visitor2@test.fi', false),
    ('Visitor #3', 'visitor3@test.fi', true);