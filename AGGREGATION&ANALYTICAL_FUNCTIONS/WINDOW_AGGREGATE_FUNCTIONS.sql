-- Window Aggregate Functions

-- count
SELECT 
	orderid,
	orderdate,
	customerid,
	count(*) over() as TotalOrders,
	count(*) over(partition by customerid) as orderByCustomers
FROM sales.orders;


-- SQL tasks
select	
	*,
	count(*) over(),
	count(score) over() as totalScores
from sales.customers; 

-- check for duplicates
select 
	orderid,
	count(*) over(partition by orderid) checkprimarykey
from sales.orders;

select
	*
from (
	select
		orderid,
		count(*) over(partition by orderid) CheckPK
	from sales.ordersarchive
) t where CheckPK > 1;

-- THE SUM
select
	productid,
	orderid,
	orderdate,
	sales,
	sum(sales) over() totalsales,
	sum(sales) over(partition by productid) salesByProduct 
from sales.orders;


select
	orderid,
	productid,
	sales,
	sum(sales) over() totalSales,
	ROUND((sales::float / sum(sales) over() * 100)::numeric, 2) as PercentageOfTotal
from sales.orders;

-- THE AVERAGE FUNCTION
select
	productid,
	orderid,
	orderdate,
	sales,
	avg(sales) over() avgSales,
	avg(sales) over(partition by productid) avgByProduct
from sales.orders;
	
select
	customerid,
	lastname,
	score,
	avg(score) over() avgScore,
	avg(coalesce(score, 0)) over() avgScoreNullHandled
from sales.customers;
	
select
	*
from (
	select
		orderid,
		productid,
		sales,
		avg(sales) over() avgSales
	from sales.orders
) t where sales > avgSales;
	

-- min and max
select
	productid,
	orderid,
	orderdate,
	sales,
	max(SALES) over () maxSales,
	min(sales) over () minSales,
	max(sales) over (partition by productid) maxProductSales,
	min(sales) over (partition by productid) maxProductSales
from sales.orders;

select * from (
select
	employeeid,
	firstname,
	lastname,
	salary,
	max(salary) over() highestSalary
from sales.employees
) t where salary = highestSalary;


	
select
	orderid,
	orderdate,
	productid,
	sales,
	max(sales) over() highestsale,
	min(sales) over() lowerSale,
	sales - min(sales) over() as deviationFromMin,
	max(sales) over() - sales as deviationFromMax
from sales.orders;

	
	
-- RUNNING TOTAL & ROLLING TOTAL
select
	orderid,
	productid,
	orderdate,
	sales,
	avg(sales) over(partition by productid) as avgProduct,
	avg(sales) over(partition by productid order by orderdate) MovingAvgSalesProduct,
	avg(sales) over(partition by productid order by orderdate rows between current row and 1 following) as rollingAvg
from sales.orders;

	
	
