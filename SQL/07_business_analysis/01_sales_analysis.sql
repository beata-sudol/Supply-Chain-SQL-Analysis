=========================================================================================
-- SALES ANALYSIS
=========================================================================================
-- Analyze sales performance across products, catgeories, customer segment, and regions.


-- ----------------------------------------------------------
-- TOP 10 PRODUCTS BY SALES
-- ----------------------------------------------------------
-- Identify the products generating the highest sales revenue.

SELECT
	p.product_name,
	SUM(io.sales) AS total_sales
FROM products p
INNER JOIN order_items io ON io.order_item_cardprod_id = p.product_card_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 10;


-- ----------------------------------------------------------
-- SALES BY CATEGORY
-- ----------------------------------------------------------
-- Compare sales performance across product categories.

SELECT 
	c.category_name,
	p.product_name,
	SUM(io.sales) AS total_sales
FROM order_items io
INNER JOIN products p ON p.product_card_id = io.order_item_cardprod_id
INNER JOIN categories c ON c.category_id = p.category_id
GROUP BY
	c.category_name,
	p.product_name
ORDER BY total_sales DESC;

-- ----------------------------------------------------------
-- SALES BY REGION
-- ----------------------------------------------------------
-- Compare sales performance across different regions.
-- Analyze total sales, number of orders, and average order value.

SELECT
	o.order_region,
	SUM(oi.sales) AS total_sales,
	COUNT(DISTINCT o.order_id) AS total_orders,
	ROUND(SUM(oi.sales) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM order_items oi
INNER JOIN orders o ON o.order_id = oi.order_id
GROUP BY o.order_region
ORDER BY total_sales DESC;


-- ----------------------------------------------------------
-- SALES TREND ANALYSIS
-- ----------------------------------------------------------
-- Analyze sales performance over time.
-- Identify trends and changes in sales across different periods.

SELECT
	EXTRACT(MONTH FROM TO_TIMESTAMP(o.order_date, 'MM/DD/YYYY HH24:MI')),
	sum(oi.sales) AS total_sales
FROM order_items oi
INNER JOIN orders o ON o.order_id = oi.order_id
GROUP BY EXTRACT(MONTH FROM TO_TIMESTAMP(o.order_date, 'MM/DD/YYYY HH24:MI'))
ORDER BY total_sales DESC;