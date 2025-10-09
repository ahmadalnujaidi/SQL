-- DATE & TIME FUNCTIONS


-- DATE VALIDATION
SELECT
	ISDATE('2025-08-20') dc1,
	ISDATE('123') dc2,
	ISDATE('20-08-2025') dc3,
	ISDATE('2025') dc4,
	ISDATE('08') dc5;

SELECT
	--CAST(OrderDate AS DATE) OrderDate,
	OrderDate,
	ISDATE(OrderDate),
	CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
	ELSE '9999-01-01'
	END NewOrderDate
FROM
(
	SELECT '2025-08-20' AS OrderDate UNION
	SELECT '2025-08-21' UNION
	SELECT '2025-08-23' UNION
	SELECT '2025-08'
)t
--WHERE ISDATE(OrderDate) = 1;

/*
-- CALCULATION
-- DATEDIFF - find difference between 2 dates
-- DATEDIFF(part, start_date, end_date) (day, orderDate, ShipDate)
SELECT
	EmployeeID,
	BirthDate,
	DATEDIFF(year, BirthDate , GETDATE()) as Age
FROM Sales.employees;

SELECT
	DATENAME(month, OrderDate) as orderDate,
	AVG(DATEDIFF(day, orderDate, ShipDate)) as avgShip
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate);

SELECT
	OrderID,
	OrderDate,
	LAG(OrderDate) OVER (ORDER BY OrderDate) prevOrder,
	DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) nrOfDays
FROM Sales.Orders;

--DATEADD - (part, interval, date) (month, -4, orderdate)
SELECT
	OrderID,
	OrderDate,
	DATEADD(year, 2, OrderDate) as twoyearlater,
	DATEADD(month, 3, OrderDate) as threemonthslater,
	DATEADD(day, -10, OrderDate) as tendaysbefore
FROM Sales.Orders;

--FORMAT AND CASTING AND CONVERT
-- CAST
SELECT
	CAST('123' as INT),
	CAST(123 as VARCHAR),
	CAST('2025-08-20' as DATE),
	CAST('2025-08-20' as DATETIME2)
	CreationTime,
	CAST(CreationTime as DATE) [datetime to date]
FROM Sales.Orders;

-- CONVERT
SELECT
	--CONVERT(INT, '123') as [string to int convert],
	--CONVERT(DATE, '2025-08-20') as [string to date],
	CreationTime,
	CONVERT(DATE, CreationTime) as [datetime to date],
	CONVERT(VARCHAR, CreationTime, 32) as [usa standard],
	CONVERT(VARCHAR, CreationTime, 34) as eu
FROM Sales.Orders;


-- FORMAT - change format of date or time
SELECT
	FORMAT(OrderDate, 'MMM') order_date,
	COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM');

SELECT
	OrderID,
	CreationTime,
	FORMAT(CreationTime, 'MM-dd-yyyy') as USA_Format,
	FORMAT(CreationTime, 'dd-MM-yyyy') as EU,
	FORMAT(CreationTime, 'dd'),
	FORMAT(CreationTime, 'ddd'),
	FORMAT(CreationTime, 'dddd'),
	FORMAT(CreationTime, 'MM'),
	FORMAT(CreationTime, 'MMM'),
	FORMAT(CreationTime, 'MMMM')
FROM Sales.Orders;

SELECT
	OrderID,
	CreationTime,
	'Day ' + FORMAT(CreationTime, 'ddd MMM') 
	+ ' Q' + DATENAME(quarter, CreationTime) + 
	FORMAT(CreationTime, ' yyyy HH:mm:ss tt') custom_format
FROM Sales.Orders;


SELECT
	COUNT(*) nrOfOrders,
	YEAR(OrderDate) 'year'
FROM Sales.Orders
GROUP BY YEAR(OrderDate);

SELECT
	COUNT(*) 'nrOfOrders',
	DATENAME(month, OrderDate) 'month'
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate);

SELECT
	*
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2 -- filter by number not string - faster


-- EOMONTH - end of month - sets day to last day of month
SELECT
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) endOfMonth,
	-- if u want first day use truncat
	CAST(DATETRUNC(month, CreationTime) AS DATE) as startOfMonth
FROM Sales.Orders;

-- DATETRUNC - truncate the date to specific part - reset everything after to 0
SELECT
	OrderID,
	CreationTime,
	DATETRUNC(minute, CreationTime) as minute_dt,
	DATETRUNC(day, CreationTime) as 'day trunc',
	DATETRUNC(year, CreationTime) as year_trunc
FROM Sales.Orders;
-- example usage - find order by year
SELECT
	DATETRUNC(month, CreationTime),
	COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(month, CreationTime)


-- DATENAME - returns name of datepart - august - wednesday etc..
SELECT
	OrderID,
	CreationTime,
	DATENAME(month, CreationTime) as 'Month_name',
	DATENAME(weekday, CreationTime) as 'day_name'
FROM Sales.Orders;


-- DATEPART - TO GET WEEK OF YEAR OR QUARTER
SELECT
	OrderID,
	CreationTime,
	DATEPART(hour, CreationTime) as 'hour',
	DATEPART(quarter, CreationTime) as 'QUARTER',
	DATEPART(week, CreationTime) as 'week of year',
	DATEPART(weekday, CreationTime) as 'day of week',


	DATEPART(yy, CreationTime) as 'Year',
	DATEPART(mm, CreationTime) as 'month',
	DATEPART(dd, CreationTime) as 'day'
FROM Sales.Orders;


-- PART EXTRACTION
-- YEAR & MONTH & DAY
SELECT
	OrderID,
	CreationTime,
	YEAR(CreationTime) as 'Year',
	MONTH(CreationTime) as 'Month',
	DAY(CreationTime) as 'Day'
FROM Sales.Orders;


--- GETDATE() - today's date
SELECT
	OrderID,
	CreationTime,
	GETDATE() as 'Today'
FROM Sales.orders;
*/