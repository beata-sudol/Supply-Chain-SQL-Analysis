-- ==========================================================
-- TIME ANALYSIS
-- ==========================================================
-- Analyze sales performance over time and identify trends


-- ----------------------------------------------------------
-- MONTH-OVER-MONTH SALES GROWTH
-- ----------------------------------------------------------
-- Analyze monthly sales changes over time.

WITH monthly_sales AS(
	SELECT
		EXTRACT(YEAR FROM o.order_date) AS order_year,
		EXTRACT(MONTH FROM o.order_date) AS order_month,
		SUM(oi.sales) AS total_sales
	FROM order_items oi
	INNER JOIN orders o ON o.order_id = oi.order_id
	GROUP BY 
		EXTRACT(YEAR FROM o.order_date), 
		EXTRACT(MONTH FROM o.order_date)
),

monthly_sales_with_lag AS(
	SELECT
		ms.order_year,
		ms.order_month,
		ms.total_sales,
		LAG(ms.total_sales) OVER(
			ORDER BY ms.order_year, ms.order_month
		) AS previous_month_sales
	FROM monthly_sales ms
),

growth_analysis AS(
	SELECT
		ml.order_year,
		ml.order_month,
		ml.total_sales,
		ml.previous_month_sales,
		ml.total_sales - ml.previous_month_sales AS sales_diffrence,
		 ROUND(
            (ml.total_sales - ml.previous_month_sales) 
            / NULLIF(ml.previous_month_sales, 0) * 100, 2)
		AS sales_growth_percent
	FROM monthly_sales_with_lag ml
)

SELECT 
	order_year,
	order_month,
	total_sales,
	previous_month_sales,
	sales_diffrence, 
	sales_growth_percent
FROM growth_analysis
ORDER BY 
	order_year,
	order_month;

	
-- ----------------------------------------------------------
-- SEASONAL SALES ANALYSIS
-- ----------------------------------------------------------
-- Identify seasonal patterns in sales performance.

SELECT
	EXTRACT(QUARTER FROM o.order_date) AS order_quarter,
	EXTRACT(YEAR FROM o.order_date) AS order_year,
	SUM(oi.sales) AS total_sales
FROM order_items oi
INNER JOIN orders o ON o.order_id = oi.order_id
GROUP BY 
	EXTRACT(QUARTER FROM o.order_date), 
	EXTRACT(YEAR FROM o.order_date)
ORDER BY 
	order_year DESC,
	order_quarter DESC;