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


INSERT INTO feedbacks (name, email, feedback_type, is_general, company_id, feedback, want_reply)
VALUES
    ('Visitor #11', 'visitor11@test.fi', '{Thanks, Suggestion}', true, 1, 'Positive general feedback with a suggestion.', false),
    ('Visitor #12', 'visitor12@test.fi', '{Complaint}', false, 2, 'Bad quality of service.', true),
    ('Visitor #13', 'visitor13@test.fi', '{Thanks, Other}', false, 5, 'Thanks and a question.', true),
    ('Visitor #14', 'visitor14@test.fi', '{Other}', true, 1, 'Something else (general feedback).', true);