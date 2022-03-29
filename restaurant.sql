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