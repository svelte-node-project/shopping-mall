-- Delete this file when data is received from the website!!!

TRUNCATE offers, news, banners RESTART IDENTITY CASCADE;


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

