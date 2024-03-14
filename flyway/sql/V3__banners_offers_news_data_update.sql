Delete from banners;

INSERT INTO banners (name, offer_id, news_id, image_link, navigation_link, start_date, end_date)
VALUES
    ('Banner #1', NULL, NULL, NULL, NULL, '2024-01-01', '2024-01-31'),
    ('Banner #2', NULL, NULL, '/images/image1.png', '/shop', '2024-01-01', '2024-07-31'),
    ('Banner #3', NULL, NULL, NULL, NULL, '2024-04-01', '2024-12-31'),
    ('Banner #4', NULL, 1, '/images/image2.png', '/happenings/', '2024-02-01', '2024-03-31');

Delete from offers;

INSERT INTO offers (company_id, category_id, name, description, image_link, show_on_homepage, start_date, end_date)
VALUES (2, 9, 'LUMENE - 20% OFF ALL PRODUCTS| Valid 01.-07.04.2024', 'Members enjoy 20% off all products. Valid 01.-07.04.2024.', '/images/offer1.png', true, '2024-01-01', '2024-12-31'),
(2, 5, 'STARBUCKS - BUY 1 FREE 1| Valid 11.04.2024', 'Enjoy buy 1 free 1 on any handcrafted beverage purchased on Member''s Day. Valid 11.04.2024.', '/images/offer2.png', true, '2024-01-01', '2024-07-31'),
(2, 9, 'TECTOR - START FROM €1399| Valid while stocks last', 'Apple Iphone 15 Pro Max starts from €1399, normal price from €1499. Valid while stocks last.', '/images/offer3.png', true, '2024-01-01', '2024-12-31'),
(2, 3, 'BODY SHOP - OFFER PRICE AT €30| Valid 01.-14.04.2024', 'Give the gift of relaxation with our Sweet Dreams Discovery Kit at €30. A calming balm and essential oil to accompany your bedtime routine. Valid 01.-14.04.2024', '/images/offer4.png', true, '2024-02-23', '2024-12-29'),
(5, 1, 'HALONEN - END OF SEASON SALE| Valid 01.-14.04.2024', 'End of season sale - up to 50% off. The sale is only valid on selected products while stocks last. Valid 01.-14.04.2024', '/images/offer5.png', true, '2024-02-01', '2024-12-31'),
(2, 3, 'LEGO - GET A MY FIRST DUCK| Valid while stocks last', 'Toddlers who love animal toys build and rebuild these colourful, easy-to-handle LEGO DUPLO bricks in many different ways to invent stories in which the cute duck swims, eats and sleeps. Your gift with DUPLO purchases of 40 € or more. Valid while stock lasts.', '/images/offer6.png', false, '2024-02-23', '2024-12-29'),
(5, 1, 'H&M - SALE| Valid 01.-14.04.2024', 'Sale starts now - up to 50% off. In store & online. Download the app now. Valid 01.-14.04.2024', '/images/offer7.png', false, '2024-02-01', '2024-12-31');

delete from news where id != 1;

update news set title = 'MOOMIN POP UP STORE| 06.-07.04.2024, Center Court', news_text = '<center><img src=''/images/event1.png'' style=''width: 60%; height: auto;'' /></center></br><p>Visit Moomin pop-up shop at Aurora from 6 April 2024. As a member of Aurora you will get 25% discount on Moomin products by Finlayson, Muurla and Optodesign sold at the Moomin pop-up shop.</p></br><p>Take part in the Instagram competition by posting a picture from the pop-up with the hashtag #MoominAurora and win a trip to Moomin World in Naantali. The prize includes a trip to Moomin World with VR for one family. The winner will be selected after April 7 and contacted personally.</p></br><p>See you soon at the Moomin pop-up shop at Aurora!</p>', image_link = '/images/happenings1.png', news_end_date = '2024-12-31' where id = 1;

INSERT INTO news (title, news_text, image_link, show_on_homepage, news_date, news_end_date)
VALUES
	('COWORK IS NOW OPEN| CoWork workspace is now open to everyone', '<center><img src=''/images/event2.png'' style=''width: 60%; height: auto;'' /></center></br><p>Remote working is challenging, and it can be hard to find the room to focus. But with CoWork''s professional workspaces, focus is within reach. With socially distanced desk layouts and private offices, a safe and effective working solution is just minutes away from your home.</p></br><p>CoWork is a focused, modern workspace tailored to today''s entrepreneur, small business operator, and freelancer. Our welcoming location and professional presence provide a local space to meet clients, practice your skill, and grow your business.</p></br><p>Book a workspace or give us a call today to begin working where ideas hatch.</p>', '/images/happenings2.png', true, '2024-02-01', '2024-12-31'),
	('BIG DOUGHNUTS GRAND OPENING| Opening Date: 01.04.2024', '<center><img src=''/images/image2.png'' style=''width: 60%; height: auto;'' /></center></br><p>Opening Date: 01.04.2024</p></br><p>Big Doughnuts is opening its fifth shop in Aurora, the first location in Espoo, at 10 a.m. Saturday.</p></br><p>Known for its ''warm, delicious, made to order'' doughnuts ''customized before your eyes,'' Big Doughnuts is family-owned and operated by Donald and Louie.</p></br><p>To celebrate the grand opening, the first 100 guests in line on Saturday will receive ten free doughnuts!</p></br><p>The retail shop hosts the franchise’s iconic beach theme and family-friendly atmosphere with indoor seating. In addition to doughnuts, the store serves Big Doughnuts'' signature coffee blends, espresso beverages, doughnut breakfast sandwiches, doughnut sundaes, frozen beverages, milkshakes, select retail items and more.</p>', '/images/happenings3.png', true, '2024-02-01', '2024-12-31'),
	('POP MART ROBO SHOP IS HERE!| 01.-14.04.2024, Center Court', '<center><img src=''/images/event4.png'' style=''width: 60%; height: auto;'' /></center></br><p>Attention POP MART Fans!</p></br><p>Exciting news! Our new Robo Shop has touched down at Aurora, packed with adorable collectibles waiting just for you.</p></br><p>Don''t miss the chance to experience the amazing decor and join in on the fun! Swing by Aurora First Floor Center Court starting April 1st to explore more!</p>', '/images/happenings4.png', true, '2024-02-01', '2024-12-31'),
	('PRE-LOVED FASHION SWAP| 01.-14.04.2024, Center Court', '<center><img src=''/images/event5.png'' style=''width: 60%; height: auto;'' /></center></br><p>A sustainable fashion initiative that encourages participants to exchange their gently used clothing items instead of buying new ones. The event aims to promote the concept of reduce, reuse, recycle in fashion by giving clothing a new life and reducing waste.</p></br><p>Participants bring their pre-loved items to the event and can swap them for items brought by others, providing a fun and eco-friendly way to refresh their wardrobe. </p></br><p>Date: 01 Apr 2024 to 14 Apr 2024</p></br><p>Venue: Center Court, First Floor</p>', '/images/happenings5.png', false, '2024-02-01', '2024-12-31');