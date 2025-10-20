-- CASE STATEMENTS
-- case ...when.then... end
-- else (optional)

-- count times each customer made order with sales > 30
SELECT
	CustomerID,
	SUM(CASE
			WHEN Sales > 30 THEN 1
			ELSE 0
		END) totalOrdersHighSales,
	COUNT(*) totalOrders
FROM Sales.Orders
GROUP BY CustomerID;

/*
-- find avg scores of customers and treat null as 0
SELECT
	CustomerID,
	lastName,
	Score,
	CASE
		WHEN Score IS NULL THEN 0
		ELSE Score
	END AS ScoreClean,
	AVG(Score) OVER() avgCustomer,
	AVG(CASE
			WHEN Score IS NULL THEN 0
			ELSE Score
		END) OVER() avgcustomerClean
FROM Sales.Customers


-- quick format
SELECT
	customerId,
	firstName,
	lastName,
	Country,
	CASE Country
		WHEN 'Germany' THEN 'DE'
		WHEN 'USA' THEN 'US'
		ELSE 'Not Available'
	END AS countryAbbreviation
FROM Sales.Customers;

SELECT
	customerId,
	firstName,
	lastName,
	Country,
	CASE
		WHEN Country = 'Germany' THEN 'DE'
		WHEN Country = 'USA' THEN 'US'
		ELSE 'Not Available'
	END AS countryAbbreviation
FROM Sales.Customers;

SELECT DISTINCT country FROM Sales.Customers;

SELECT
	EmployeeID,
	firstName,
	lastName,
	Gender,
	CASE
		WHEN Gender = 'M' THEN 'Male'
		WHEN Gender = 'F' THEN 'Female'
	END as GenderFullText
FROM Sales.Employees

Select
	Category,
	SUM(Sales) as TotalSales
FROM(
SELECT
	OrderId,
	Sales,
	CASE
		WHEN Sales > 50 THEN 'High'
		WHEN Sales > 20 THEN 'Medium'
		ELSE 'Low'
	END Category
FROM Sales.Orders
)t
GROUP BY Category
ORDER BY TotalSales DESC;
*/
