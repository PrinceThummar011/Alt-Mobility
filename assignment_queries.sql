-- Assignment: Order, Customer, and Payment Analysis
-- Author: Prince Thummar

-- Task 1: Order and Sales Analysis

-- 1.1 Count of orders by status
SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM 
    customer_orders
GROUP BY 
    order_status;

-- 1.2 Total revenue from completed orders
SELECT 
    SUM(order_amount) AS total_revenue
FROM 
    customer_orders
WHERE 
    order_status = 'Completed';

-- 1.3 Monthly revenue trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(order_amount) AS monthly_revenue
FROM 
    customer_orders
WHERE 
    order_status = 'Completed'
GROUP BY 
    month
ORDER BY 
    month;


-- Task 2: Customer Analysis

-- 2.1 Repeat customers (customers with multiple orders)
SELECT 
    customer_id,
    COUNT(order_id) AS number_of_orders
FROM 
    customer_orders
GROUP BY 
    customer_id
HAVING 
    COUNT(order_id) > 1;

-- 2.2 Customer segmentation based on total spending
SELECT 
    customer_id,
    SUM(order_amount) AS total_spent,
    CASE
        WHEN SUM(order_amount) > 1000 THEN 'Premium'
        WHEN SUM(order_amount) BETWEEN 500 AND 1000 THEN 'Regular'
        ELSE 'Occasional'
    END AS customer_segment
FROM 
    customer_orders
GROUP BY 
    customer_id;

-- 2.3 New customers trend over time
SELECT 
    DATE_FORMAT(MIN(order_date), '%Y-%m') AS first_order_month,
    COUNT(DISTINCT customer_id) AS new_customers
FROM 
    customer_orders
GROUP BY 
    first_order_month
ORDER BY 
    first_order_month;


-- Task 3: Payment Status Analysis

-- 3.1 Payment success and failure analysis
SELECT 
    payment_status,
    COUNT(*) AS number_of_payments
FROM 
    payments
GROUP BY 
    payment_status;

-- 3.2 Payment method distribution
SELECT 
    payment_method,
    COUNT(*) AS method_count
FROM 
    payments
GROUP BY 
    payment_method;


-- Task 4: Order Details Report

-- 4.1 Comprehensive report: orders + payment details
SELECT 
    co.order_id,
    co.customer_id,
    co.order_date,
    co.order_amount,
    co.shipping_address,
    co.order_status,
    p.payment_id,
    p.payment_date,
    p.payment_amount,
    p.payment_method,
    p.payment_status
FROM 
    customer_orders co
LEFT JOIN 
    payments p
ON 
    co.order_id = p.order_id
ORDER BY 
    co.order_date;
