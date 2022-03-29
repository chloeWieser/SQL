--1. created db--

--2. create table

-- CREATE TABLE restaurant (

--     id serial primary key,
--     name varchar,
--     distance integer,
--     stars integer,
--     category varchar,
--     favorite_dish varchar,
--     does_takeout boolean,
--     last_time_you_ate_there date

-- );


--3 run file with psql restaurant -f restaurant.sql

--4. Insert Data
-- Write INSERT statements to enter data into the restaurant table. You can paste the statements into the psql shell.

-- INSERT INTO restaurant VALUES 
-- (DEFAULT, 'bella italia', 5, 3,'Italian', 'pasta', TRUE, '2022-02-07'),
-- (DEFAULT, 'cafe tapas', 4, 2,'spanish', 'tapas', TRUE, '2021-05-07'),
-- (DEFAULT, 'buddys', 5, 2,'American', 'burger', FALSE, '2020-02-07');

-- DELETE FROM restaurant WHERE id = 4;
-- DELETE FROM restaurant WHERE id = 5;
-- DELETE FROM restaurant WHERE id = 6;


-- 5. Writing Queries
-- SELECT * FROM restaurant WHERE stars = 5;
-- SELECT favorite_dish FROM restaurant WHERE stars = 5;
-- SELECT id FROM restaurant WHERE name = 'bella italia';
-- SELECT * FROM restaurant WHERE category = 'BBQ';
-- SELECT * FROM restaurant WHERE does_takeout = TRUE;
-- SELECT * FROM restaurant WHERE does_takeout = TRUE and category = 'BBQ';
-- SELECT * FROM restaurant WHERE distance <= 2;

-- restaurants you haven't ate at in the last week
-- SELECT * FROM restaurant WHERE last_time_you_ate_there was less than 7 days ago/????????????;

-- restaurants you haven't ate at in the last week and has 5 stars
-- ?????

-- 6. Aggregation and Sorting Queries

-- list restaurants by the closest distance.
-- SELECT * FROM restaurant ORDER BY distance ASC;

-- list the top 2 restaurants by distance.
-- SELECT * FROM restaurant ORDER BY distance ASC LIMIT 2;

-- list the top 2 restaurants by stars.
-- SELECT * FROM restaurant ORDER BY stars DESC LIMIT 2;

-- list the top 2 restaurants by stars where the distance is less than 2 miles.
-- SELECT * FROM restaurant WHERE distance < 2 ORDER BY stars DESC LIMIT 2;

-- count the number of restaurants in the db.
-- SELECT COUNT(*) FROM restaurant; 

-- count the number of restaurants by category.
-- SELECT COUNT(*) FROM restaurant WHERE category = 'Italian'; 
-- ??? how do you do it for all categories at once?

-- get the average stars per restaurant by category.
-- SELECT AVG(stars) FROM restaurant;

-- get the max stars of a restaurant by category.
-- SELECT MAX(stars) FROM restaurant;
-- ??? how do you do it for all categories at once?




-- Restaurant DB V2

--1.
--created database in command line like this: postgres@whiteRose:~$ createdb restaurantv2


--2. create tables:

-- CREATE TABLE restaurant (
--     id serial primary key,
--     name varchar,
--     address varchar,
--     category varchar
-- );

-- CREATE TABLE reviewer (
--     id serial primary key,
--     name varchar,
--     email varchar,
--     karma integer CHECK (karma >= 0 and karma < 8)
-- );

-- CREATE TABLE review (
--     id serial primary key,
--     reviewer_id integer REFERENCES reviewer (id),
--     stars integer CHECK (stars > 0 and stars < 6),
--     title varchar,
--     review varchar,
--     restaurant_id integer REFERENCES restaurant (id)
-- );




--3 Insert Data

-- INSERT INTO restaurant VALUES 
-- (DEFAULT, 'Olive Garden', '1234 Almond St Houston TX', 'Italian'),
-- (DEFAULT, 'Torchys', '2341 Peanut St Houston TX', 'Tex-Mex'),
-- (DEFAULT, 'Franks Grill', '3412 Walnut Bend Houston TX', 'American'),
-- (DEFAULT, 'Outback Steakhouse', '4123 Pecan Rd Houston TX',  'American'),
-- (DEFAULT, 'Pappas BBQ', '4123 Beanwi Rd Houston TX', 'BBQ'),
-- (DEFAULT, 'Raising Canes', '3124 Pelbri Rd Houston TX', 'Fried Chicken'),
-- (DEFAULT, 'Garden of Olives', '1231 Groot St Houston TX', 'Italian'),
-- (DEFAULT, 'Flaming Tacos', '2342 Ole St Houston TX', 'Tex-Mex'),
-- (DEFAULT, 'Chucks Grill', '3413 Latrick Bend Houston TX', 'American'),
-- (DEFAULT, 'Salt Grass Steakhouse', '4124 Shuum Rd Houston TX',  'American'),
-- (DEFAULT, 'Hidaway BBQ', '4125 Swantro Rd Houston TX', 'BBQ'),
-- (DEFAULT, 'Chick-fil-a', '3126 Helm Rd Houston TX', 'Fried Chicken');

-- INSERT INTO reviewer VALUES
-- (DEFAULT, 'Karen', 'tookaren@hotmail.com', 2),
-- (DEFAULT, 'Billy', 'billywilly@hotmail.com', 3),
-- (DEFAULT, 'Bobby', 'bobbynewport@hotmail.com', 0),
-- (DEFAULT, 'Samantha', 'sam185@hotmail.com', 7),
-- (DEFAULT, 'Krieg', 'psychokrieg@hotmail.com', 1),
-- (DEFAULT, 'Charles', 'charleschuck@hotmail.com', 4),
-- (DEFAULT, 'Matt', 'magicmatt@hotmail.com', 6),
-- (DEFAULT, 'Rick', 'rick@hotmail.com', 5);

-- INSERT INTO review VALUES
-- (DEFAULT, 1, 1, 'Sooo Rude...', 'The employees were so rude to me.', 1),
-- (DEFAULT, 2, 3.5, 'Great Food', 'Food was good, atmosphere was OK', 2),
-- (DEFAULT, 3, 5, 'It was OK', 'It was OK. Food was not too great', 3),
-- (DEFAULT, 4, 2.5, 'Kinda Rude', 'Food was great. Employees were kinda rude.', 4),
-- (DEFAULT, 5, 4.5, 'Amazing', 'The food was sooo good. I have to go again.', 5),
-- (DEFAULT, 6, 3.5, 'Not my style but good food.', 'Atmosphere was not for me but the food was good.', 6),
-- (DEFAULT, 7, 4, 'Slow service', 'Service was slow but food was good when we got it.', 7),
-- (DEFAULT, 8, 3, 'Great Experience', 'Food was great and employees were so nice.', 8),
-- (DEFAULT, 1, 2.5, 'Would not go again', 'Restaurant was dirty and employees were rude. Food was OK.', 9),
-- (DEFAULT, 2, 2, 'Have to go again.', 'Great food. Wonderfull experience and atmosphere.', 10),
-- (DEFAULT, 3, 5, 'Why???', 'My only complaint is that this restaurant is on the other side of town.', 11),
-- (DEFAULT, 4, 4, 'How much food can you eat', 'Food was great. Portions were big.', 12),
-- (DEFAULT, 5, 3, 'Could not eat another bite', 'I was so full when I left. Gotta go again.', 1),
-- (DEFAULT, 6, 1, 'Not my cup of tea', 'They did not have my kind of tea.', 2),
-- (DEFAULT, 7, 2, 'Very very rude', 'Employee at the cashier yelled at me. Food was OK.', 3),
-- (DEFAULT, 8, 1.5, 'Not very good', 'Food and atmosphere was not very good.', 4);

--4

--List all the reviews for a given restaurant given a specific restaurant ID.
-- SELECT * 
-- FROM review 
-- WHERE restaurant_id = 1;


--List all the reviews for a given restaurant, given a specific restaurant name.
-- SELECT review, restaurant.name
-- FROM review
-- INNER JOIN restaurant ON review.restaurant_id = restaurant.id
-- WHERE name = 'Olive Garden';


--List all the reviews for a given reviewer, given a specific author name.
-- SELECT review, name, title
-- FROM review
-- INNER JOIN reviewer ON review.reviewer_id = reviewer.id   --so far we have: show [whatever columns specified in SELECT]] from review and reviewer tables- synced up by the reviewer ID
-- WHERE name = 'Bobby';


--List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
-- ?DON'T UNDERSTAND THE QUESTION

-- SELECT review, restaurant.name FROM(
--     SELECT *
--     FROM review
--     INNER JOIN restaurant ON review.restaurant_id = restaurant.id
-- ) as restaurantReview;



--Get the average stars by restaurant. The result should have the restaurant name and its average star rating.

-- SELECT AVG(stars), restaurant.name
-- FROM review
-- INNER JOIN restaurant ON review.restaurant_id = restaurant.id
-- GROUP BY restaurant.name;



--Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.

-- SELECT COUNT(review), restaurant.name 
-- FROM review
-- INNER JOIN restaurant ON review.restaurant_id = restaurant.id
-- GROUP BY restaurant.name; 



--List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.

-- SELECT review, restaurant.name as restaurant_name, reviewer.name as reviewer_name
-- FROM review
-- INNER JOIN restaurant ON review.restaurant_id = restaurant.id
-- INNER JOIN reviewer ON review.reviewer_id = reviewer.id;



--Get the average stars given by each reviewer. (reviewer name, average star rating)

-- SELECT AVG(stars) as average_star_rating, reviewer.name as reviewer_name
-- FROM review
-- INNER JOIN reviewer ON review.reviewer_id = reviewer.id
-- GROUP BY reviewer.name;



--Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)