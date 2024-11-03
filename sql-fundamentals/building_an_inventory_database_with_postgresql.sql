-- 1. Inspect first 10 rows of parts table
SELECT * FROM parts LIMIT 10;

-- 2, Set code column to unique and not empty
ALTER TABLE parts
ADD UNIQUE (code);

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;

-- 3. Change parts table so all rows in description column have values (some are missing)
UPDATE parts
SET description = 'TBA'
WHERE description IS NULL;

-- 4. Add a constraint on parts so that all values in description are filled and non-empty
ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

-- 5. Test constraint by trying to insert a row into parts with below information
--INSERT INTO parts (id, code, manufacturer_id)
--VALUES (54, 'V1-009', 9)
INSERT INTO parts (id, description, code, manufacturer_id)
VALUES (54, 'TBA', 'V1-009', 9);

-- 6. Add constraints so that price_usd and quantity are both not null in reorder_options table
ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL;

ALTER TABLE reorder_options
ALTER COLUMN quantity SET NOT NULL;

-- 7. Add constraint so that price_usd and quantity are both positive
ALTER TABLE reorder_options
ADD CHECK (price_usd > 0 AND quantity > 0);

-- 8. Add a constraint that limits the price per unit between 0.02 USD and 25.00 USD. Assume price per unit is the price divided by qunatity.
ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25.00);

-- 9. Add a constraint to ensure don't have pricing info on parts that aren't tracked in the DB
ALTER TABLE parts
ADD PRIMARY KEY (id);

ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id) REFERENCES parts(id);

-- 10. Add a constraint to the locations table that ensures that each value in qty is greater than 0
ALTER TABLE locations
ADD CHECK (qty > 0);

-- 11. Add a constraint so that only one row for each combination of location and part in locations table
ALTER TABLE locations
ADD UNIQUE (part_id, location);

-- 12. Add a constraint that ensures that a part stored in locations is registered in parts
ALTER TABLE locations
ADD FOREIGN KEY (part_id) REFERENCES parts(id);

-- 13. Add a constraint that ensures that all parts have a valid manufacturer
ALTER TABLE parts
ADD FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id);

-- 14. Assume that 'Pip Industrial' and 'NNC Manufacturing' merge and become 'Pip-NNC Industrial', create a new manufacturer with id = 11
INSERT INTO manufacturers (id, name)
VALUES (11, 'Pip-NNC Industrial');

-- 15. Update the old manufacturers' parts in parts table to reference the new company
UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (1, 2);
-- could use instead: WHERE manufacturer_id = 1 OR manufacturer_id = 2;