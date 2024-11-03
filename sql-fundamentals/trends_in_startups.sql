-- Show all data
SELECT *
FROM startups;

-- Calculate the total number of companies
SELECT COUNT(*)
FROM startups;
-- Answer = 70

-- Calculate the total value of all companies
SELECT SUM(valuation)
FROM startups;
-- Answer = $974,455,790,000

-- Show the highest amount raised by a startup
SELECT MAX(raised)
FROM startups;
-- Answer = $11,500,000,000

-- Show the highest amount raised by a startup during 'Seed' stage
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';
-- Answer = $1,800,000

-- Show the year that the oldest company was founded
SELECT MIN(founded)
FROM startups;
-- Answer = 1994

-- Calculate the average valuation
SELECT AVG(valuation)
FROM startups;
-- Answer = $15,974,685,081.9672

-- Calculate the average valuation in each category
SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

-- Calculate the average valuation in each category, round to two decimal places
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

-- Calculate the average valuation in each category, round to two decimal places, order from highest to lowest averages
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;

-- Show the total number of companies in each category
SELECT category, COUNT(*)
FROM startups
GROUP BY category;

-- Show the total number of companies in each category, where there are more than 3 companies in the categories
SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3;

-- Calculate the average size of a startup in each location
SELECT location, AVG(employees)
FROM startups
GROUP BY location;

-- Calculate the average size of a startup in each location, where average sizes are above 500
SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;