--Retrieving all pizza data
select * from pizza_sales

--TOTAL REVENUE
select sum(total_price) as Total_Revenue from pizza_sales

--AVERAGE ORDER VALUE
select sum(total_price)/count(distinct order_id) as AVG_Order_Value
from pizza_sales

--TOTAL PIZZAS SOLD the sum of quantities of all pizzas sold
select count(distinct order_id) as 'Total Pizzas Sold'
from pizza_sales

--AVERAGE PIZZAS PER ORDER ( Used 'cast' function to reduce decimal values)
select 
cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
from pizza_sales

--__________________________CHARTS_____________________________
--     DAILY PIZZA SALES
SELECT datename(dw,order_date) as 'Day',count(distinct order_id) as Total_Orders FROM PIZZA_SALES
group by datename(dw,order_date);

--        MONTHLY PIZZA SALES
SELECT datename(month,order_date) as Month,count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(month,order_date)

--PERCENTAGE OF SALES
SELECT 
pizza_category,
cast(sum(total_price) as decimal(10,2)) as Total_Price,
concat(cast(sum(total_price)*100/(select  sum(total_price) from pizza_sales) as decimal(10,2)),'%') as Percentage
from pizza_sales
group by pizza_category;

--Pecentage of pizza size
select 
pizza_size ,cast(sum(total_price) as decimal(10,2)) as Total_price,
cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2))as Percentage
from pizza_sales
group by pizza_size
order by Percentage desc;

--Total pizzas sold by pizza Category
select pizza_category,sum(quantity) as Total_pizzas
from pizza_sales
group by pizza_category
order by Total_pizzas desc;

--Top 5 Sellers by Total Pizzas Sold
select top 5 pizza_name ,sum(total_price) as Total_Price 
from pizza_sales
group by pizza_name
order by Total_Price desc;

--Bottom 5 Sellers by Total pizzas sold
select top 5 pizza_name,sum(total_price) as Total_Price
from pizza_sales
group by pizza_name
order by Total_Price asc

select * from pizza_sales
