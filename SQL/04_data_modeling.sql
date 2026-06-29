-- Create customers table
CREATE TABLE customers as
SELECT DISTINCT
	customer_id,
	customer_city,
	customer_country,
	customer_segment,
	customer_state
FROM sales_data_final;


-- Create products table
CREATE TABLE products as
SELECT DISTINCT
	product_card_id,
	category_id,
	product_name,
	product_price,
	product_status
FROM sales_data_final;


-- Create orders table
CREATE TABLE orders as
SELECT DISTINCT
	order_id,
	customer_id,
	market,
	order_date,
	order_region,
	order_status,
	shipping_date,
	shipping_mode,
	shipping_delay
FROM sales_data_final;


-- Create categories table
CREATE TABLE categories as
SELECT DISTINCT
	order_id,
	category_id,
	category_name,
	department_id,
	department_name
FROM sales_data_final;


-- Create order items table
CREATE TABLE order_items as
SELECT DISTINCT
	order_id,
	order_item_cardprod_id,
	order_item_discount,
	order_item_discount_rate,
	order_item_id,
	order_item_product_price,
	order_item_profit_ratio,
	order_item_quantity,
	order_item_total,
	profit_margin,
	sales
FROM sales_data_final;