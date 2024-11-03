-- Show all data
SELECT *
FROM nomnom;

-- Show distinct neighbourhoods
SELECT DISTINCT neighborhood
FROM nomnom;

-- Show distinct cuisine types
SELECT DISTINCT cuisine
FROM nomnom;

-- Show Chinese restaurants
SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

-- Show all restaurants with reviews of 4 and above
SELECT *
FROM nomnom
WHERE review >= 4;

-- Show Italian restaurants that are '$$$' price
SELECT *
FROM nomnom
WHERE cuisine = 'Italian'
  AND price = '$$$';

-- Show restaurants that have 'meatball' in their name
SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';

-- Show all restaurants that are in the 'Midtown', 'Downtown' or 'Chinatown' neighbourhoods
SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown'
  OR neighborhood = 'Downtown'
  OR neighborhood = 'Chinatown';

-- Show all restaurants that have health grades pending (i.e. empty values)
SELECT *
FROM nomnom
WHERE health IS NULL;

-- Show top 10 restaurants based on reviews
SELECT *
FROM nomnom
ORDER BY review DESC
LIMIT 10;

-- Change the rating system when shown to state 'Extraordinary' if over 4.5, 'Excellent' if over 4, 'Good' if over 3, 'Fair' if over 2, all others to be stated as 'Poor' and rename column
SELECT name,
  CASE
    WHEN review > 4.5 THEN 'Extraordinary'
    WHEN review > 4 THEN 'Excellent'
    WHEN review > 3 THEN 'Good'
    WHEN review > 2 THEN 'Fair'
    ELSE 'Poor'
  END AS 'Review'
FROM nomnom;