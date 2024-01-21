-- List out pizza order details
SELECT 
    *
FROM
    product.pizza_sales
    Limit 1000;
    
-- 1.Total Revenue
SELECT 
    SUM(total_price) AS total_revenue
FROM
    product.pizza_sales;
-- 817860.049999993

-- average price per order
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM
    product.pizza_sales;
SELECT 
    SUM(total_price) / COUNT(DISTINCT order_id) AS average_price
FROM
    product.pizza_sales;
-- 38.30

-- Total qunatity
SELECT 
    SUM(quantity) AS total_pizzas
FROM
    product.pizza_sales;
-- 49574

SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM
    product.pizza_sales;
-- 21350

-- Average pizza quantity per order
SELECT 
    CAST(CAST(SUM(quantity) AS DECIMAL (10 , 2 )) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10 , 2 ))
        AS DECIMAL (10 , 2 )) AS average_pizzas
FROM
    product.pizza_sales;
-- 2.32  

SELECT 
    DATENAME(DW, order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders 
FROM
    product.pizza_sales
GROUP BY DATENAME(DW, order_date);

-- monthly trend for total pizza orders
SELECT 
    DATENAME(MONTH, order_date) AS Month_Name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    product.pizza_sales
GROUP BY DATENAME(MONTH, order_date);

-- sales percentage by pizza catagory
USE product;

SELECT 
    pizza_category,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT 
                SUM(total_price)
            FROM
                pizza_sales)
        AS DECIMAL (10 , 2 )) AS PCT
FROM
    product.pizza_sales
GROUP BY pizza_category;

-- sales percentage by pizza size
SELECT 
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT 
                SUM(total_price)
            FROM
                pizza_sales)
        AS DECIMAL (10 , 2 )) AS PCT
FROM
    product.pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- total pizzas sold by catagory
SELECT 
    pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM
    pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- Top 5 pizzas by revenue
SELECT 
    pizza_name, SUM(total_price) AS Total_Revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Bottom 5 pizzas
SELECT 
    pizza_name, SUM(total_price) AS Total_Revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue
LIMIT 5;

-- Top 5 pizzas by quantity
SELECT 
    pizza_name, SUM(quantity) AS Total_Revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Bottom 5 pizzas
SELECT 
    pizza_name, SUM(quantity) AS Total_Revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue
LIMIT 5;

-- Top 5 pizzas where catagory 'classic'
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
WHERE
    pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- Best five pizzas on total orders
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- Least five pizzas
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders
LIMIT 5








