-- Show the tables. What are the column names?
SELECT *
FROM trips;

SELECT *
FROM riders;

SELECT *
FROM cars;
-- Answer = trips: id, date, pickup, dropoff, rider_id, car_id, type, cost; riders: id, first, last, username, rating, total_trips, referred; cars: id, model, OS, status, trips_completed

-- What's the primary key of trips, riders and cars?
-- Answer = trips: id, riders: id, cars: id

-- Create a cross join between tables
SELECT riders.first, riders.last, cars.model
FROM riders, cars;

-- Create a trip log with the trips and its users using LEFT JOIN
SELECT trips.date,
  trips.pickup,
  trips.dropoff,
  trips.type,
  trips.cost,
  riders.first,
  riders.last,
  riders.username
FROM trips
LEFT JOIN riders
  ON trips.rider_id = riders.id;
-- Could have used SELECT *, but produces lots of columns

-- Create a trip log with the trips and the cars using INNER JOIN/JOIN
SELECT *
FROM trips
JOIN cars
  ON trips.car_id = cars.id;

-- There are new users stack riders and riders 2 tables
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

-- What is the average cost of a trip?
SELECT ROUND(AVG(cost), 2)
FROM trips;
-- Answer = 31.92 rounded to 2 decimal places

-- Find all the riders who have used Lyft < 500 times
SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;
-- Answer = Sonny Li, Kassa Korley, Eric Vaught, Jilly Beans

-- Calculate the number of cars that are active
SELECT COUNT(*)
FROM cars
WHERE status = 'active';
-- Answer = 3

-- Find the 2 cars that have the highest trips_completed
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;
-- Answer = Turing XL, Ada