-- Basic Joins


-- full join
SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers as c
FULL JOIN orders as o
on c.id = o.customer_id;

/*
-- right join - opposite of left join
SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers as c
RIGHT JOIN orders as o
ON c.id = o.customer_id;

select * from orders;


-- left join - return all row from left and only matching from right
SELECT
	c.id,
	first_name,
	o.order_id,
	o.sales
FROM customers as c
LEFT JOIN orders as o
ON c.id = o.customer_id;



-- inner join 
SELECT
	cus.id,
	first_name,
	country,
	cus.score,
	order_id,
	order_date,
	ord.sales
FROM customers as cus
INNER JOIN orders as ord
on cus.id = ord.customer_id;


-- no join
SELECT
	*
FROM customers;

SELECT
	*
FROM orders;
*/