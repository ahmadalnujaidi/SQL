-- STRING FUNCTIONS

/*
-- STRING FUNCTIONS
-- SUBSTRING
SELECT
	first_name,
	SUBSTRING(TRIM(first_name), 2, len(first_name)) as skip_first
FROM customers;

-- LEFT AND RIGHT
SELECT
	first_name,
	LEFT(TRIM(first_name), 2) as first_two
FROM customers;

SELECT
	first_name,
	RIGHT(TRIM(first_name), 2) as last_two
FROM customers;

SELECT
	CONCAT(LEFT(first_name, 2),LOWER(LEFT(first_name, 2)))
FROM customers;


-- CALCULATIONS
-- LEN - counts characters even numbers and date as python len()
SELECT
	first_name,
	len(first_name) as 'customer_name_length'
FROM customers;


-- REPLACE
SELECT
	'123-456-7890' as phone,
	REPLACE('123-456-7890', '-', '') as clean_phone;

SELECT
	'report.txt' as old_file,
	REPLACE('report.txt', '.txt', '.csv') as new_file;


-- TRIM
SELECT
	*
FROM customers
WHERE trim(first_name) != first_name;


-- UPPER AND LOWER
SELECT
	LOWER(first_name) as first_name,
	UPPER(country) as country_upper
FROM customers;


-- CONCAT
SELECT
	CONCAT(first_name, ' ', country) AS 'Name_Country'
FROM customers;
*/