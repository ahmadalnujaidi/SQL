-- AGGREGATE FUNCTIONS

SELECT
	customerid,
	COUNT(*) as "total number of orders",
	SUM(sales) as total_sales,
	AVG(sales) as avg_sales,
	MAX(sales) as highest_sales,
	MIN(sales) as lowest_sales
FROM sales.orders
group by customerid;


SELECT
	country,
	SUM(score) as sums,
	AVG(score) as avgg,
	MAX(score) as maxx,
	MIN(score) as minn
FROM sales.customers
group by country;