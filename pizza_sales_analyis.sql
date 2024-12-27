CREATE DATABASE pizza_db;
SELECT COUNT(*)
FROM pizza_sales;
#1)Total revenue
SELECT SUM(total_price) AS total_revenue
 FROM pizza_sales;
 
 #2)Average order value
 SELECT SUM(total_price)/COUNT(DISTINCT order_id)
 FROM  pizza_sales;
 
 #3)Total pizzas sold
 SELECT SUM(quantity) AS Total_pizza_sold 
 FROM pizza_sales;
 
 #4)Total orders placed
 SELECT COUNT(DISTINCT order_id) AS total_orders
 FROM pizza_sales;
 
 #5)Average pizzas per order
 SELECT SUM(quantity)/COUNT(DISTINCT order_id)
 FROM pizza_sales;
 
 #--CHART REQUIREMENTS--
 
 #1)Daily trend for our orders
 SELECT DATE_FORMAT(order_date, '%W') AS day_of_week, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATE_FORMAT(order_date, '%W');

#2)monthly trend of our orders
SELECT monthname(order_date) AS Month_name,COUNT(DISTINCT order_id)
FROM pizza_sales
GROUP BY monthname(order_date);

#3)Percentage of sales by pizza category
SELECT pizza_category,SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales WHERE month(order_date)=1) AS PCT
	FROM pizza_sales
    WHERE MONTH(order_date)=1
    GROUP BY pizza_category;

#4)percentage of sales by pizza size
SELECT pizza_size,SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales WHERE month(order_date)=1) AS PCT
	FROM pizza_sales
    WHERE MONTH(order_date)=1
    GROUP BY pizza_size
    ORDER BY PCT DESC;

#5)top 5 best sellers by revenue
SELECT  pizza_name,SUM(total_price) as total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC limit 5;

#top 5 best sellers by quantity
SELECT  pizza_name,SUM(quantity) as total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC limit 5;

#top 5 best sellers by orders
SELECT  pizza_name,COUNT( DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC limit 5;



 
 