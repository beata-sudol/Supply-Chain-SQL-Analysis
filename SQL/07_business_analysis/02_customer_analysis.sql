-- ==========================================================
-- CUSTOMER ANALYSIS
-- ==========================================================
-- Analyze customer purchasing behavior and customer segments.

-- ----------------------------------------------------------
-- CUSTOMER SEGMENT ANALYSIS
-- ----------------------------------------------------------
-- Analyze sales performance by customer segment.

SELECT
	c.customer_segment,
	SUM(oi.sales) AS total_sales
FROM order_items oi
INNER JOIN orders o ON o.order_id = oi.order_id
INNER JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_segment
ORDER BY total_sales DESC;


-- ----------------------------------------------------------
-- CUSTOMER SEGMENT PROFITABILITY
-- ----------------------------------------------------------
-- Compare profitability across customer segments.

SELECT
	c.customer_segment,
	SUM(oi.sales) AS total_sales,
	AVG(oi.order_item_profit_ratio) AS avg_profit_ratio,
	COUNT(DISTINCT(o.order_id)) AS numbers_of_orders
FROM order_items oi
INNER JOIN orders o ON o.order_id = oi.order_id
INNER JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_segment
ORDER BY 
	total_sales DESC, 
	avg_profit_ratio DESC;

	
-- ----------------------------------------------------------
-- CUSTOMER PURCHASE BEHAVIOR
-- ----------------------------------------------------------
-- Analyze customer purchasing patterns and order activity.

SELECT
	c.customer_id,
	COUNT(DISTINCT(o.order_id)) AS total_orders,
	SUM(oi.sales) AS total_sales
FROM order_items oi
INNER JOIN orders o ON o.order_id = oi.order_id
INNER JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY 
	total_orders DESC,
	total_sales 