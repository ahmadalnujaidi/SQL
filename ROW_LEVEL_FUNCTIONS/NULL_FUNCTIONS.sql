-- NULL FUNCTIONS
-- ISNULL (value, replacement_value)
-- coalesce - return first non-null value from list
-- COALESCE(value1, value2, value3, ...)
-- NULLIF(Value1, value2) - return null if they are equal, value1 if not
-- ISNULL return true if null else false

WITH Orders AS (
	SELECT 1 Id, 'A' Category UNION
	SELECT 2, NULL UNION
	SELECT 3, '' UNION
	SELECT 4, '  '
)

SELECT 
	*,
	DATALENGTH(TRIM(Category)) policy1,
	DATALENGTH(Category) categoryLen,
	NULLIF(TRIM(category), '') pol2,
	COALESCE(NULLIF(TRIM(category), ''), 'UNKNOWN') pol3
FROM Orders

/*
-- show list of customers with no orders
SELECT
	c.*,
	o.CustomerID,
	o.OrderID
FROM sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
WHERE o.customerID IS NULL


SELECT
	*
FROM Sales.Customers
WHERE Score IS NULL;

SELECT 
	*
FROM Sales.Customers
WHERE Score IS NOT NULL;

-- find sales price for each order by deviding sales / qty
SELECT
	OrderID,
	Sales,
	Quantity,
	Sales / NULLIF(Quantity, 0) AS Price
FROM Sales.Orders;

-- sort by score - null last
SELECT
	*
FROM sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score;

-- display fullname of custoemrs in single field - add 10 to score
select 
	customerID,
	firstname,
	lastname,
	firstname + ' ' + COALESCE(lastname, 'n/a') as fullname,
	score,
	COALESCE(score, 0) + 10 as scoreWbonus
from sales.customers

-- find avg score of customers
select
	customerID,
	Score,
	AVG(Score) OVER() avgscore,
	COALESCE(Score, 0) as score2,
	AVG(COALESCE(Score, 0)) OVER() avgscore2
from sales.customers
*/