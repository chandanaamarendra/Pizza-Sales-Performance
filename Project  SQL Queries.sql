
select *from sales 
order by pizza_id;

//*Toal Revenue*//
select sum(total_price) as total_Rev
from sales;

//*avereage order value*//
select sum(total_price)/count(distinct order_id) as Avg_ord_val
from sales; 

//*total pizzas sold*//
select sum(quantity) as Total_pizzas_sold 
from  sales; 

//*total orders*//
select count(distinct order_id) as Total_orders
from  sales 

//*average pizzas per order*//
select cast(cast(sum(quantity) as decimal (10,2))/
cast(count(distinct order_id) as decimal (10,2)) as decimal (10,2)) as Avg_Pizzas_Per_Order
from  sales 
==============================================================================================================================================

//*daily trend for total orderd*//
select datename(DW, order_date) as Order_day, 
count(distinct order_id) as Total_orders
from  sales 
group by datename(DW, order_date)
order by count(distinct order_id) desc

//*monthly trend for total order*//
select datename(month, order_date) as Month_name,
count(distinct Order_id) as total_orders
from sales
group by  datename(month, order_date)
order by count(distinct Order_id) desc

//*percentage of sales by pizza category*//
select pizza_category,sum(total_price) as Total_Rev,
sum(total_price)*100/
   (select sum(total_price) from sales) as 'Percent'
from sales
group by  pizza_category

//*percentage of sales by pizza size*//
select pizza_size, cast(sum(total_price)*100/ 
(select sum(total_price) from sales)as decimal (10,2)) as 'percent',
cast(sum(total_price)as decimal (10,2)) as Total_rev
from sales
group by pizza_size
order by 'percent'

//*total pizzas sold by category*//
select pizza_category, sum(quantity) as Total_pizzas_sold 
from sales 
group by pizza_category
order by Total_pizzas_sold desc

//*Top 5 best sellers by revenue,total quantity and total orders*//
---by revenue
select top 5 pizza_name,sum(total_price) as Total_Rev
from sales 
group by pizza_name
order by total_rev desc
---by total quantity
select top 5 pizza_name,
sum(quantity) as Total_quantity
from sales
group by pizza_name
order by total_quantity desc
---by total orders
select top 5 pizza_name,
count(distinct order_id) as total_orders
from sales
group by pizza_name
order by total_orders desc

//*Bottom 5 best sellers by revenue,total quantity and total orders*//
---by revenue
select top 5 pizza_name,sum(total_price) as Total_Rev
from sales 
group by pizza_name
order by total_rev 
---by total quantity
select top 5 pizza_name,
sum(quantity) as Total_quantity from sales
group by pizza_name
order by Total_quantity 
---by total orders
select top 5 pizza_name,
count(distinct order_id) as total_orders
from sales
group by pizza_name
order by total_orders
