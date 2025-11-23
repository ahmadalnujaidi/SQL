-- WINDOW BASICS - FUNCTIONS
-- window = group by (aggregation) but keep details of each row
-- window functions = aggregate func + rank func + value func
-- window syntax:
	-- window function - partition(clause) - order(clause) - frame(clause)
	-- AVG(sales) OVER ( PARTITION BY category ORDER BY OrderDate ROWS UNBOUNDED PRECEDING)
	-- over -> tells sql we are working with window 
	-- parition - divides data set into groups based on column

	-- order by - aggregate (optional) - rank (required) - value (required)
	-- window frame: subset of rows within each window that is relevant to calculation - must have order by - TO SCOPE WITHIN A WINDOW
	-- N following (sliding window) - unbounded following (last row) - between N preceding and current row (N row before)
	-- unbounded preceding (first row)
	-- hidden frame (unbounded preceding and current row)

	-- RULES & LIMITATIONS:
	-- only use in select & orderby - NO nesting - executes window function after where - WF can be used together with group by in same query ONLY if same columns

-- rank customers based on their total sales
select
	customerid,
	sum(sales) totalsales,
	rank() over (order by sum(sales) desc) rankCustomers -- only use something part of group by
from sales.orders
group by customerid;


SELECT
	orderid,
	orderdate,
	orderstatus,
	sales,
	sum(sales) over (partition by orderstatus order by orderdate ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) totalSales
from sales.orders;

-- rank each order based on their sales from high to low
select
	orderid,
	orderdate,
	sales,
	rank() over(order by sales desc) rankSales
from sales.orders;

-- find total sales for each product, + details such order id; order date
select
	orderid,
	orderdate,
	productid,
	sales,
	orderstatus,
	sum(sales) over() totalSales,
	sum(sales) over(partition by productid) totalsalesByProducts,
	sum(sales) over(partition by productid, orderstatus) SalesByProductAndStatus
from sales.orders;

-- find total sales across all orders additionaly provide details such order id & order date
select
	orderdate,
	orderid,
	sum(sales) over()
from sales.orders;

select
	orderid,
	orderdate,
	productid,
	sum(sales) over(partition by productid) totalsales
from sales.orders;


-- select * from sales.orders;