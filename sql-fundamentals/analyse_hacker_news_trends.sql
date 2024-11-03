-- Show the top 5 news stories with the highest scores
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;
-- Answer = Penny Arcade - Surface Pro 3 update, Hacking The Status Game, Postgres CLI with autocompletion and syntax highlighting, Stephen Fry hits out at 'infantile' culture of trigger words and safe spaces, Reversal: Australian Govt picks ODF doc standard over Microsoft

-- Is a small percentage of Hacker News submitters taking the majority of the points score?
-- Calculate the total score of all the stories
SELECT SUM(score)
FROM hacker_news;
-- Answer = 6,366

-- Find the individual users that have gotten combined scores of more than 200 and their combined scores
SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;
-- Answer = vxNsr: 517, amirkhella: 309, dmmalam: 304, metafunctor:282

-- Calculate percentage of top individual users
SELECT (517 + 309 + 304 + 282) / 6366.0;
-- Answer = 0.22... so 22% of total score by 4 users

-- How many times has each user posted an inappropriate link
SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;
-- Answer: sonnynomnom: 2, scorpiosister: 1

-- Which of the following sites feed Hacker News the most: GitHub, Medium or New York Times?
-- Categorise each story based on its source
SELECT CASE
  WHEN url LIKE '%github%' THEN 'GitHub'
  WHEN url LIKE '%medium%' THEN 'Medium'
  WHEN url LIKE '%nytimes%' THEN 'New York Times'
  ELSE 'Other'
  END AS 'Source'
FROM hacker_news;

-- Add a column for the number of stories from each URL
SELECT CASE
  WHEN url LIKE '%github%' THEN 'GitHub'
  WHEN url LIKE '%medium%' THEN 'Medium'
  WHEN url LIKE '%nytimes%' THEN 'New York Times'
  ELSE 'Other'
  END AS 'Source', 
  COUNT(*)
FROM hacker_news
GROUP BY 1;
-- Answer = GitHub: 27, Medium: 20, New York Times: 13, Other: 3940

-- What's the best time of day to post a story on Hacker News?
-- Show the timestamp column
SELECT timestamp
FROM hacker_news
LIMIT 10;
-- DATETIME format = YYYY-MM-DD T HH:MM:SS Z where T is just a separator between the date and the time and Z stands for Zero timezone.

-- Test out the strftime function by selecting the hour from the timestamp
SELECT timestamp, strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

-- Return 3 columns: The hours of the timestamp, the average score for each hour, the count of stories for each hour
SELECT strftime('%H', timestamp), AVG(score), COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 2 DESC;

-- From the previous query round the average scores, rename the columns to make it more readable, add a clause to filter out the NULL values in timestamp. What are the best hours to post a story on Hacker News?
SELECT strftime('%H', timestamp) AS 'Hour',
  ROUND(AVG(score), 1) AS 'Average Score', 
  COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
-- Answer = around 7am and between 6pm - 8pm