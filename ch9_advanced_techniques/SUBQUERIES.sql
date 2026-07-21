-- scalar subquery
select
	avg(sales)
from sales.orders;

--row subquery
select
 customerid
from sales.orders;

-- table subquery
select 
	orderid,
	orderdate
from sales.orders;

-- subquery in FROM clause
-- find products that have a pricer higher than avg price of all products
select -- mainquery
	*
from ( --subquery
	select
		productid,
		price,
		avg(price) over() as avgprice
	from sales.products )
t where t.price > avgprice;

-- ranked customers based on their total amt of sales
select 
	*,
	rank() over( order by totalsales desc)
from (
	select
		customerid,
		sum(sales) totalsales
	from sales.orders
	group by customerid ) t;

-- subquery in select claude -- MUST BE SCALAR
-- show productid product name, price, total # of orders
select 
	productid,
	product,
	price,
	(select count(*) from sales.orders) as totalorders
from sales.products p;


-- subquery in join clause
-- show all customer details and find the total orders of each customer
select 
	*
from sales.customers s
left join 
( 
	select 
		count(*) totalorders,
		customerid
	from sales.orders
	group by customerid
) t on t.customerid = s.customerid;


-- subquery in where clause
-- find products that have a price higher than the avg price of all products
select 
	*
from sales.products p
where p.price > (select avg(price) from sales.products);

-- show details of orders made by customers in germany
select
	*
from sales.orders
where customerid in (select customerid from sales.customers c where c.country = 'Germany');


-- find female employees whose salsaries are greater than salary of any male employee
select 
	*
from sales.employees e
where gender = 'F' and e.salary > ANY(select salary from sales.employees e2 where e2.gender = 'M'



-- corelated subqueries
-- show all customer details and find the total orders of each customer
select
	*,
	(select count(*) from sales.orders o where o.customerid = c.customerid)
from sales.customers c;


-- show details of orders made by custoemrs in germany
select 
	*
from sales.orders o
where exists (select 1 from sales.customers c where c.country = 'Germany' and c.customerid = o.customerid)





