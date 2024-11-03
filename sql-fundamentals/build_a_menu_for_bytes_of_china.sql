-- 1. Create restaurant and address tables
-- 2. Add a primary key to both tables and write queries to validate that the primary keys exist for both tables
CREATE TABLE restaurant (
  id integer PRIMARY KEY,
  name varchar(20),
  description varchar(100),
  rating decimal,
  telephone char(10),
  hours varchar(100)
);

CREATE TABLE address (
  id integer PRIMARY KEY,
  street_number varchar(10),
  street_name varchar(20),
  city varchar(20),
  state varchar(15),
  google_map_link varchar(50),
  restaurant_id integer REFERENCES restaurant(id) UNIQUE -- 6. Implement one-to-one relationship with restaurant
);

SELECT
   constraint_name,
   table_name,
   column_name
FROM information_schema.key_column_usage
WHERE table_name = 'restaurant';

SELECT
   constraint_name,
   table_name,
   column_name
FROM information_schema.key_column_usage
WHERE table_name = 'address';

-- 3. Create category table, add primary key and write query to validate that the primary key exists
CREATE TABLE category (
  id char(2) PRIMARY KEY,
  name varchar(20),
  description varchar(200)
);

SELECT
   constraint_name,
   table_name,
   column_name
FROM information_schema.key_column_usage
WHERE table_name = 'category';

-- 4. Create dish table, add primary key and write query to validate that the primary key exists
CREATE TABLE dish (
  id integer PRIMARY KEY,
  name varchar(50),
  description varchar(200),
  hot_and_spicy boolean
);

SELECT
   constraint_name,
   table_name,
   column_name
FROM information_schema.key_column_usage
WHERE table_name = 'dish';

-- 5. Create review table, add primary key and write query to validate that the primary key exists
CREATE TABLE review (
  id integer PRIMARY KEY,
  rating decimal,
  description varchar(100),
  date date,
  restaurant_id integer REFERENCES restaurant(id) -- 7. Implement one-to-many relationship with restaurant
);

SELECT
   constraint_name,
   table_name,
   column_name
FROM information_schema.key_column_usage
WHERE table_name = 'review';

-- 8. Implement many-to-many relationship with category and dish tables by creating a cross-reference table categories_dishes, add primary key, add price (price depends on category) and write query to validate that the primary key exists
CREATE TABLE categories_dishes (
    category_id char(2) REFERENCES category(id),
    dish_id integer REFERENCES dish(id),
    PRIMARY KEY (category_id, dish_id),
    price money
);

SELECT
   constraint_name,
   table_name,
   column_name
FROM information_schema.key_column_usage
WHERE table_name = 'categories_dishes';

-- 9. Insert sample data provided
/* 
 *--------------------------------------------
 Insert values for restaurant
 *--------------------------------------------
 */
INSERT INTO restaurant VALUES (
  1,
  'Bytes of China',
  'Delectable Chinese Cuisine',
  3.9,
  '6175551212',
  'Mon - Fri 9:00 am to 9:00 pm, Weekends 10:00 am to 11:00 pm'
);

/* 
 *--------------------------------------------
 Insert values for address
 *--------------------------------------------
 */
INSERT INTO address VALUES (
  1,
  '2020',
  'Busy Street',
  'Chinatown',
  'MA',
  'http://bit.ly/BytesOfChina',
  1
);

/* 
 *--------------------------------------------
 Insert values for review
 *--------------------------------------------
 */
INSERT INTO review VALUES (
  1,
  5.0,
  'Would love to host another birthday party at Bytes of China!',
  '05-22-2020',
  1
);

INSERT INTO review VALUES (
  2,
  4.5,
  'Other than a small mix-up, I would give it a 5.0!',
  '04-01-2020',
  1
);

INSERT INTO review VALUES (
  3,
  3.9,
  'A reasonable place to eat for lunch, if you are in a rush!',
  '03-15-2020',
  1
);

/* 
 *--------------------------------------------
 Insert values for category
 *--------------------------------------------
 */
INSERT INTO category VALUES (
  'C',
  'Chicken',
  null
);

INSERT INTO category VALUES (
  'LS',
  'Luncheon Specials',
  'Served with Hot and Sour Soup or Egg Drop Soup and Fried or Steamed Rice  between 11:00 am and 3:00 pm from Monday to Friday.'
);

INSERT INTO category VALUES (
  'HS',
  'House Specials',
  null
);

/* 
 *--------------------------------------------
 Insert values for dish
 *--------------------------------------------
 */
INSERT INTO dish VALUES (
  1,
  'Chicken with Broccoli',
  'Diced chicken stir-fried with succulent broccoli florets',
  false
);

INSERT INTO dish VALUES (
  2,
  'Sweet and Sour Chicken',
  'Marinated chicken with tangy sweet and sour sauce together with pineapples and green peppers',
  false
);

INSERT INTO dish VALUES (
  3,
  'Chicken Wings',
  'Finger-licking mouth-watering entree to spice up any lunch or dinner',
  true
);

INSERT INTO dish VALUES (
  4,
  'Beef with Garlic Sauce',
  'Sliced beef steak marinated in garlic sauce for that tangy flavor',
  true
);

INSERT INTO dish VALUES (
  5,
  'Fresh Mushroom with Snow Peapods and Baby Corns',
  'Colorful entree perfect for vegetarians and mushroom lovers',
  false
);

INSERT INTO dish VALUES (
  6,
  'Sesame Chicken',
  'Crispy chunks of chicken flavored with savory sesame sauce',
  false
);

INSERT INTO dish VALUES (
  7,
  'Special Minced Chicken',
  'Marinated chicken breast sauteed with colorful vegetables topped with pine nuts and shredded lettuce.',
  false
);

INSERT INTO dish VALUES (
  8,
  'Hunan Special Half & Half',
  'Shredded beef in Peking sauce and shredded chicken in garlic sauce',
  true
);

/*
 *--------------------------------------------
 Insert values for cross-reference table, categories_dishes
 *--------------------------------------------
 */
INSERT INTO categories_dishes VALUES (
  'C',
  1,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'C',
  3,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  1,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  4,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  5,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  6,
  15.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  7,
  16.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  8,
  17.95
);

-- 10. Display restaurant name, its address (street number and name) and telephone number
SELECT
  r.name AS restaurant_name,
  a.street_number AS house_number,
  a.street_name AS street_name,
  r.telephone AS telephone_no
FROM restaurant AS r
JOIN address AS a
  ON r.id = a.restaurant_id;

-- 11. Find the best rating the restaurant ever received, display it as best_rating
SELECT MAX(rating) AS best_rating
FROM review;

-- 12. Display dish name as dish_name, price and category, sorted by dish name
SELECT
  d.name AS dish_name,
  cd.price AS price,
  c.name AS category
FROM dish AS d
JOIN categories_dishes AS cd
  ON d.id = cd.dish_id
JOIN category AS c
  ON cd.category_id = c.id
ORDER BY d.name;

-- 13. As per question 12 but display as category, dish_name, price, sorted by category
SELECT
  c.name AS category,
  d.name AS dish_name,
  cd.price AS price
FROM category AS c
JOIN categories_dishes AS cd
  ON c.id = cd.category_id
JOIN dish AS d
  ON cd.dish_id = d.id
ORDER BY c.name;

-- 14. Display all the spicy dishes as spicy_dish_name, their category and price
SELECT
  d.name AS spicy_dish_name,
  c.name AS category,
  cd.price AS price
FROM dish AS d
JOIN categories_dishes AS cd
  ON d.id = cd.dish_id
JOIN category AS c
  ON cd.category_id = c.id
WHERE d.hot_and_spicy = true
ORDER BY d.name;

-- 15. Count how many categories each dish is in, display dish_id and COUNT(dish_id) as dish_count
SELECT
  dish_id,
  COUNT(dish_id) AS dish_count
FROM categories_dishes
GROUP BY 1
ORDER BY 2 DESC;

-- 16. As per question 15, but only display dishes that appear more than once
SELECT
  dish_id,
  COUNT(dish_id) AS dish_count
FROM categories_dishes
GROUP BY 1
HAVING COUNT(dish_id) > 1
ORDER BY 2 DESC;

-- 17. As per question 16, but display the dish name as dish_name instead of showing the dish id
SELECT
  d.name AS dish_name,
  COUNT(cd.dish_id) AS dish_count
FROM categories_dishes AS cd
JOIN dish AS d
  ON cd.dish_id = d.id
GROUP BY d.name
HAVING COUNT(cd.dish_id) > 1
ORDER BY dish_count DESC;

-- 18. Improve question 11 (best rating) to display the description as well as the rating
SELECT
  r.name AS restaurant_name,
  rev.rating AS best_rating,
  rev.description
FROM review AS rev
JOIN restaurant AS r
  ON rev.restaurant_id = r.id
ORDER BY rev.rating DESC
LIMIT 1;