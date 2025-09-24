-- advanced joins

-- multi joins

SELECT
	O.OrderID,
	CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
	P.Product AS ProductName,
	O.Sales,
	P.Price,
	concat(E.FirstName,' ', E.LastName) AS EmployeeName
FROM Sales.Orders as O
LEFT JOIN Sales.Customers as C ON O.CustomerID = C.CustomerID
LEFT JOIN Sales.Products as P ON O.ProductID = P.ProductID
LEFT JOIN Sales.Employees as E ON O.SalesPersonID = E.EmployeeID;

-- SELECT * FROM Sales.Orders;

-- SELECT * FROM Sales.Customers;

-- SELECT * FROM Sales.Products;

-- SELECT * FROM Sales.Employees;

/*
-- cross join - combine every row left with every row right - aka cartesian join - all possible combinations
SELECT
	*
FROM customers
CROSS JOIN orders;



-- full anti join - rows that dont match in either tables
SELECT
	*
FROM customers as C
FULL JOIN orders as O
ON C.id = O.customer_id
WHERE C.id IS NULL
OR
O.customer_id IS NULL;


-- right anti join - just opposite
select
	*
from customers as c
RIGHT JOIN orders as o
ON c.id = o.customer_id
WHERE c.id is NULL;

-- left anti join - return rows from left with NO match in right
select
	*
from customers c
left join orders o
on c.id = o.customer_id
where o.customer_id is null;


-- challenge: dont use inner join - find customers with orders
SELECT
	*
FROM customers as c
LEFT JOIN orders as o
ON c.id = o.customer_id
WHERE o.customer_id is not null;

*/