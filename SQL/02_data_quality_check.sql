-- Check data logic
-- Verify that shipping dates are not earlier than order date.

SELECT *
FROM sales_data
WHERE shipping_date < order_date;


-- Check numeric ranges
-- Verify that numeric values fall within expected ranges.
SELECT
	MIN(sales) as min_sales,
	MAX(sales) as max_sales,
	MIN(product_price) as min_product_price,
	MAX(product_price) as max_product_price,
	MIN(order_item_quantity) as min_quantity,
	MAX(order_item_quantity) as max_quantity,
	MIN(order_profit_per_order) as min_profit,
	MAX(order_profit_per_order) as max_profit
FROM sales_data;


-- Check date range
-- Check the minimum and maximum order and shipping dates.
SELECT
	MIN(order_date) as first_order_date,
	MAX(order_date) as last_order_date,
	MIN(shipping_date) as first_shipping_date,
	MAX(shipping_date) as last_shipping_date
FROM sales_data;


-- Check duplicate order items
-- Identify duplicated order item records.
SELECT
	order_item_id,
	COUNT(*) as duplicate_count
FROM sales_data
GROUP BY order_item_id
HAVING COUNT (*) > 1;


-- Check missing data
-- Check for missing values in key columns.

SELECT
	COUNT(*) AS total_rows,
	COUNT(customer_id) AS customers,
	COUNT(order_id) AS orders,
	COUNT(product_card_id) AS products,
	COUNT(order_date) AS order_dates,
	COUNT(shipping_date) AS shipping_dates
FROM sales_data


-- Check unique statuses and shipping modes
-- Review distinct values in categorical columns.

SELECT DISTINCT order_status
FROM sales_data
ORDER BY order_status;


SELECT DISTINCT delivery_status
FROM sales_data
ORDER BY delivery_status;


SELECT  DISTINCT shipping_mode
FROM sales_data
ORDER BY shipping_mode;


-- Final quality check
-- Summarize key data quality metrics after validation.

SELECT
	COUNT(DISTINCT order_id) AS unique_orders,
	COUNT(DISTINCT order_item_id) AS unique_order_items,
	COUNT(DISTINCT customer_id) AS unique_customers,
	COUNT(DISTINCT product_card_id) AS unique_products
FROM sales_data_final;