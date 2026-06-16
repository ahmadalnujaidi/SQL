-- salesdb

-- analyze month-over-month performance by finding percentage change in sales between current & prev months
select *,
currentmonsales - prevmonsales as MoM_performance,
concat(round(cast((currentmonsales - prevmonsales) as float)::numeric / prevmonsales * 100, 1), '%') as percentage_mom
from (
	select 
		date_part('month', orderdate) ordermonth,
		sum(sales) currentmonsales,
		lag(sum(sales)) over (order by date_part('month', orderdate)) prevmonsales
	from sales.orders
	group by ordermonth
) t;


-- analyze customer loyalty, rank customers based on average days between orders
select customerid,
avg(datediff) avgdays,
rank() over (order by coalesce(avg(datediff), 999)) as rankavg
from (
select
	orderid,
	customerid,
	orderdate as currentorder,
	lead(orderdate) over(partition by customerid order by orderdate) nextorder,
	lead(orderdate) over(partition by customerid order by orderdate) - orderdate as datediff
from sales.orders
order by customerid, orderdate
) t
group by customerid;


--find lowest and highest sale for each product
-- find diff between currenet and lowest sales
select
	orderid,
	productid,
	sales,
	FIRST_VALUE(sales) OVER (partition by productid order by sales asc) lowestsales,
	last_value(sales) over (partition by productid order by sales asc rows between current row and unbounded following) highestsales,
	FIRST_VALUE(sales) OVER (partition by productid order by sales desc) highestsalesdescfirstvalue,
	min(sales) over (partition by productid),
	max(sales) over (partition by productid),
	sales - FIRST_VALUE(sales) OVER (partition by productid order by sales asc) diff
from sales.orders;





