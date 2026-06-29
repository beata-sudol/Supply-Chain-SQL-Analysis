-- ==========================================================
-- DELIVERY ANALYSIS
-- ==========================================================
-- Analyze delivery performance and shipping delays


-- ----------------------------------------------------------
-- DELIVERY PERFORMANCE ANALYSIS
-- ----------------------------------------------------------
-- Analyze delivery status and shipping delays.

SELECT 
	shipping_mode, 
	COUNT(order_id) AS total_orders 
FROM orders 
WHERE shipping_delay > 0 
GROUP BY shipping_mode
ORDER BY total_orders DESC;


-- ----------------------------------------------------------
-- DELAYED ORDERS BY SHIPPING MODE
-- ----------------------------------------------------------
-- Calculate the percentage of delayed orders for each shipping mode.
-- Compare shipping methods based on the share of delayed deliveries.

SELECT
    shipping_mode,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN shipping_delay > 0 THEN 1 ELSE 0 END) AS delayed_orders,
    ROUND(
        SUM(CASE WHEN shipping_delay > 0 THEN 1 ELSE 0 END)::numeric
        * 100
        / COUNT(*),
        2
    ) AS delayed_order_percentage
FROM orders
GROUP BY shipping_mode
ORDER BY delayed_order_percentage DESC;

-- ----------------------------------------------------------
-- AVERAGE SHIPPING DELAY BY SHIPPING MODE
-- ----------------------------------------------------------
-- Calculate the average shipping delay for each shipping mode.
-- Compare shipping methods to identify those with the longest delays.

SELECT
    shipping_mode,
    COUNT(*) AS total_orders,
    ROUND(AVG(shipping_delay), 2) AS average_shipping_delay
FROM orders
GROUP BY shipping_mode
ORDER BY average_shipping_delay DESC;
