CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);

INSERT INTO friends (id, name, birthday)
VALUES (1, "Ororo Munroe", "1940-05-30");

SELECT *
FROM friends;

INSERT INTO friends (id, name, birthday)
VALUES (2, "Mary", "1975-01-01");

INSERT INTO friends (id, name, birthday)
VALUES (2, "Sarah", "1968-10-25");

UPDATE friends
SET name = "Storm"
WHERE id = 1;

ALTER TABLE friends
ADD COLUMN email TEXT;

UPDATE friends
SET email = "storm@codecademy.com"
WHERE id = 1;

UPDATE friends
SET email = "mary@codecademy.com"
WHERE id = 2;

UPDATE friends
SET email = "sarah@codecademy.com"
WHERE id = 2;

DELETE FROM friends
WHERE id = 1;

SELECT *
FROM friends;