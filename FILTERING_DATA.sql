-- FILTERING DATA

-- LOGICAL

/*
-- LIKE
SELECT
	*
FROM customers
WHERE first_name LIKE '%a%'; -- using _ = 1


-- IN
SELECT
	*
FROM customers
WHERE country in ('USA', 'Germany'); -- NOT IN


-- BETWEEN
SELECT
	*
FROM customers
WHERE score BETWEEN 100 and 500;
-- same as writing score >=100 and score <=500


-- NOT
SELECT
	*
FROM customers
WHERE NOT score < 500;

-- OR
SELECT 
	*
FROM customers
WHERE country = 'USA'
OR
score > 500;

-- AND
SELECT
	*
FROM customers
WHERE country = 'USA'
AND
score > 500;


-- OPERATORS

SELECT
	*
FROM customers
WHERE score <= 500;


SELECT 
	*
FROM customers
WHERE score < 500;


SELECT
	*
FROM customers
WHERE score >= 500;


-- >
SELECT
	*
FROM customers
WHERE score > 500;


-- select customers with country = germany

SELECT 
	*
FROM customers
WHERE country = 'Germany';


-- select not from germany

SELECT
	*
FROM customers
WHERE country != 'Germany'; -- or using <>

*/

