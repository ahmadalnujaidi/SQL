-- SET OPERATORS

SELECT -- better practice to use columsn not * ever
-- add static to distinguise as well
'Orders' AS SourceTable,
	   [OrderID],
	   [ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT
'OrdersArchive' AS SourceTable,	
	   [OrderID],
	   [ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY orderID;

/*
--INTERSECT - return only common rows between them
SELECT
	firstName,
	lastName
FROM sales.Employees

INTERSECT

SELECT
	firstName,
	lastName
FROM sales.Customers;

--EXCEPT - return distinct rows from first not found in second A - B
--can be used as data engineer to avoid replication of data when
--moving from database to datawarehouse, and can be used to check data completeness
SELECT
	firstName,
	lastName
FROM sales.Customers

EXCEPT

SELECT
	firstName,
	lastName
FROM sales.Employees;


--UNION ALL -  return all results even dups
SELECT
	firstName,
	lastName
FROM Sales.Customers

	UNION ALL

SELECT
	firstName,
	lastName
FROM Sales.Employees


--UNION - no overlap (intersection counted once)
SELECT
	firstName,
	lastName
FROM Sales.Customers
	UNION
SELECT
	firstName,
	lastName
FROM Sales.Employees
ORDER BY firstName desc;
*/