SELECT * FROM pizza_sales

--1 KPIs
--Total Revenue
SELECT SUM(total_price) AS 'Total_Revenue'
FROM pizza_sales

--Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS 'Average_Order_Value'
FROM pizza_sales

--Total Pizzas Sold
SELECT SUM(quantity) AS 'Total_Pizzas_Sold'
FROM pizza_sales

--Total Orders
SELECT COUNT (DISTINCT order_id) AS 'Total_Orders'
FROM pizza_sales

--Average Pizzas per Order
SELECT SUM(quantity)/ COUNT(DISTINCT order_id) AS 'Avg_Pizzas_per_Order'
FROM pizza_sales

--2 Daily trend for total order
SELECT DATENAME(WEEKDAY, order_date) AS Order_Weekday, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY Total_Order ASC

--3 Monthly trend for total orders
SELECT DATENAME(MONTH, order_date) AS Order_Month, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders ASC

--4 Percentage of Sales by Pizza Categories
SELECT pizza_category AS Pizza_Category, SUM(total_price) AS 'Sales (Revenue)',
(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)) AS 'Percentage'
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Percentage DESC

--5 Percentage of Sales by Pizza Sizes
SELECT pizza_size, SUM(total_price) AS 'Sales (Revenue)', 
(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)) AS 'Percentage'
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage DESC

--6 Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--7.1 Top 5 pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--7.2 Bottom 5 pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--8.1 Top 5 pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quanity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quanity DESC

--8.2 Bottom 5 pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quanity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quanity ASC

--9.1 Top 5 pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC

--9.2 Bottom 5 pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order ASC

