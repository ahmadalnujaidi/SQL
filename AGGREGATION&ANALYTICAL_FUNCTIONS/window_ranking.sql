-- salesdb

-- rank order based on sales from highest to lowest
select 
	orderid,
	productid,
	sales,
	ROW_NUMBER() OVER(order by sales desc) as salesrank_row
from sales.orders;


-- rank function
select 
	orderid,
	productid,
	sales,
	ROW_NUMBER() OVER(order by sales desc) as salesrank_row,
	RANK() OVER(order by sales desc) as salesrank_rank
from sales.orders;

-- dense rank
select 
	orderid,
	productid,
	sales,
	ROW_NUMBER() OVER(order by sales desc) as salesrank_row,
	RANK() OVER(order by sales desc) as salesrank_rank,
	DENSE_RANK() OVER(order by sales desc) as salesrank_dense
from sales.orders;

-- find top highest sales for each product
select * 
from (
select 
	orderid,
	productid,
	sales,
	row_number() OVER(partition by productid order by sales desc) rankbyprod
from sales.orders
) t where t.rankbyprod = 1;

-- bottom-n analysis - find lowest 2 customers based on their total sales
select * 
from (
select
	customerid,
	sum(sales),
	row_number() over(order by sum(sales) asc) rankcustomers
from sales.orders
group by customerid
) t where t.rankcustomers <= 2;

-- assign unique ids to the rows of the 'orders archive' table
select
	row_number() over(order by orderid, orderdate) uniqueid,
	*
from sales.ordersarchive;

-- identify duplicates from archive, reutrn clean result without dups
select *
from (
select
	row_number() over(partition by orderid order by creationtime desc) as rn,
	*
from sales.ordersarchive o
) t where t.rn = 1;

-- ntile
select
	orderid,
	sales,
	ntile(4) over (order by sales desc) bucket4,
	ntile(3) over (order by sales desc) buck3,
	ntile(2) over (order by sales desc) bucket2,
	ntile(1) over (order by sales desc) bucket1
from sales.orders;


-- segment all orders into 3 categories: high med low sales
select 
	*,
	case 
		when buckets = 1 then 'high'
		when buckets = 2 then 'med'
		when buckets = 3 then 'low'
	end salessegmentation
from (
select 
	orderid,
	sales,
	ntile(3) over (order by sales desc) buckets
from sales.orders o
) t;


-- to export data divide the orders into 2 groups
select 
	ntile(2) over (order by orderid) buckets,
	*
from sales.orders o;


-- find products that fall within highest 40%
select *, concat(t.distrank * 100, '%')
from (
select 
	product,
	price,
	cume_dist() over(order by price desc) distrank 
from sales.products
) t where t.distrank <= 0.4;

select *, concat(t.distrank * 100, '%')
from (
select 
	product,
	price,
	percent_rank() over(order by price desc) distrank 
from sales.products
) t where t.distrank <= 0.4;







