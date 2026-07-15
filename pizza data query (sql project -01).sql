
use collegeiit ;
select*from pizza_data ;
###Write an SQL query to calculate the total revenue generated from all pizza sales.

SELECT SUM(total_price)AS total_revenue
FROM pizza_data;

###Write an SQL query to find the average order value of all customer orders.

SELECT AVG(order_total) AS average_order_value
FROM
(
    SELECT order_id, SUM(total_price) AS order_total
    FROM pizza_data
    GROUP BY order_id
) ;

###Write an SQL query to calculate the total number of pizzas sold.

SELECT COUNT(quantity)AS total_pizza_sold
FROM pizza_data;

###Write an SQL query to determine the total number of orders placed.

SELECT COUNT(DISTINCT order_id)AS total_orders_placed
FROM pizza_data;

###Write an SQL query to calculate the average number of pizzas sold per order.

SELECT AVG(total_quantity) AS avg_pizza_per_order
FROM (
SELECT order_id,SUM(quantity) AS total_quantity
FROM pizza_data 
GROUP BY (order_id)
)
AS order_quantities;

###Write an SQL query to analyze the daily trend of total orders, showing the number of orders placed each day.

SELECT order_date,COUNT(DISTINCT order_id) AS orders_per_day
FROM pizza_data 
GROUP BY order_date
ORDER BY order_date ASC;

###Write an SQL query to analyze the hourly trend of orders, showing the number of orders placed during each hour of the day.

SELECT HOUR(order_time) AS order_hour ,COUNT(DISTINCT order_id) AS orders_per_hour
FROM pizza_data 
GROUP BY (order_hour);

###Write an SQL query to calculate the percentage contribution of sales by each pizza category.

SELECT pizza_category,
SUM(total_price) AS total_sales,
ROUND(
SUM(total_price)*100/
(SELECT SUM(total_price)FROM pizza_data),2
)AS sales_percentage 
FROM pizza_data
GROUP BY(pizza_category)
ORDER BY sales_percentage DESC; 

###Write an SQL query to find the total number of pizzas sold for each pizza category.

SELECT pizza_category,SUM(quantity)AS Total_sold
FROM pizza_data 
GROUP BY (pizza_category);

###Write an SQL query to identify the Top 5 best-selling pizzas based on total quantity sold.

SELECT pizza_name,SUM(quantity) AS total_sold
FROM pizza_data
GROUP BY (pizza_name)
ORDER BY total_sold DESC
LIMIT 5;

###Write an SQL query to identify the Bottom 5 least-selling pizzas based on total quantity sold.

SELECT pizza_name,
       SUM(quantity) AS total_sold
FROM pizza_data
GROUP BY pizza_name
ORDER BY total_sold ASC
LIMIT 5;

###TOP 3 CLASSIC PIZZA RETRIEVE ON THE BASIS OF SALES 

SELECT pizza_category,
       pizza_name,
       SUM(total_price) AS sales
FROM pizza_data
WHERE pizza_category = 'Classic'
GROUP BY pizza_category, pizza_name
ORDER BY sales DESC
LIMIT 3;



