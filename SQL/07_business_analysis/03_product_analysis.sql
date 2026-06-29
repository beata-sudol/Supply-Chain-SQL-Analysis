-- ==========================================================
-- PRODUCT ANALYSIS
-- ==========================================================
-- Evaluate product and category performance based on sales,
-- profitability, and discount impact.


-- ----------------------------------------------------------
-- PRODUCT PERFORMANCE ANALYSIS
-- ----------------------------------------------------------
-- Evaluate product performance based on sales and profit.

SELECT
	p.product_name,
	SUM(oi.sales) AS total_sales,
	AVG(oi.order_item_profit_ratio) AS avg_profit_ratio
FROM order_items oi
INNER JOIN products p ON p.product_card_id = oi.order_item_cardprod_id
GROUP BY p.product_name
ORDER BY 	
	total_sales DESC,
	avg_profit_ratio ASC;

-- ----------------------------------------------------------
-- TOP 10 PRODUCTS BY PROFITABILITY
-- ----------------------------------------------------------
-- Identify the products generating the highest profit.

SELECT
	p.product_name,
	ROUND(AVG(io.order_item_profit_ratio)::numeric, 4) AS avg_profit_ratio
FROM order_items io
INNER JOIN products p ON p.product_card_id = io.order_item_cardprod_id
GROUP BY p.product_name
ORDER BY avg_profit_ratio DESC
LIMIT 10;

-- ----------------------------------------------------------
-- DISCOUNT IMPACT ANALYSIS
-- ----------------------------------------------------------
-- Analyze how discounts affect sales and profitability.

SELECT
	CASE
		WHEN order_item_discount_rate <= 0.05 THEN '0-5%'
		WHEN order_item_discount_rate <= 0.10 THEN '5-10%'
		WHEN order_item_discount_rate <= 0.15 THEN '10-15%'
		WHEN order_item_discount_rate <= 0.20 THEN '15-20%'
		WHEN order_item_discount_rate <= 0.25 THEN '20-25%'
		ELSE '25%+'
	END AS discount_group,
	SUM(sales) AS total_sales,
	AVG(sales) AS avg_sales,
	COUNT(order_item_id) AS number_of_items
FROM order_items
GROUP BY 
	CASE
		when order_item_discount_rate <= 0.05 THEN '0-5%'
		when order_item_discount_rate <= 0.10 THEN '5-10%'
		when order_item_discount_rate <= 0.15 THEN '10-15%'
		WHEN order_item_discount_rate <= 0.20 THEN '15-20%'
		WHEN order_item_discount_rate <= 0.25 THEN '20-25%'
		ELSE '25%+'
	END 
ORDER BY total_sales DESC;

-- ----------------------------------------------------------
-- PARETO ANALYSIS
-- ----------------------------------------------------------
-- Identify categories that contribute the most to total sales.

SELECT
	c.category_name,
	SUM(oi.sales) AS total_sales,
	ROUND(
		SUM(SUM(oi.sales)) 
			OVER(
				ORDER BY SUM(oi.sales) DESC)
	/ SUM(SUM(oi.sales)) OVER()* 100, 2
	) AS total_sales_all_categories
FROM order_items oi
INNER JOIN products p ON p.product_card_id = oi.order_item_cardprod_id
INNER JOIN categories c ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY total_sales DESC