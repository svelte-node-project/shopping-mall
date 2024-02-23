ALTER TABLE offers
    ADD image_link TEXT,
    ADD show_on_homepage BOOLEAN NOT NULL DEFAULT false;



ALTER TABLE news
    ADD image_link TEXT,
    ADD show_on_homepage BOOLEAN NOT NULL DEFAULT false,
    ADD news_end_date DATE;



CREATE TABLE banners (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    offer_id INTEGER REFERENCES offers(id),
    news_id INTEGER REFERENCES news(id),
    image_link TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
