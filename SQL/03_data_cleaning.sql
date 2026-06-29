-- Replace empty text values
-- Convert empty text values into NULL values.

SELECT *
	FROM sales_data
	WHERE customer_city = ' '
		OR customer_country = ' '
		OR order_status = ' '
		OR delivery_status = ' '
		OR shipping_mode = ' '
		

-- Remove extra spaces
-- Remove leading and trailling spaces from text columns.

UPDATE sales_data
SET
	transaction_type = TRIM(transaction_type),
	delivery_status = TRIM(delivery_status),
	category_name = TRIM(category_name),
	customer_city = TRIM(customer_city),
	customer_country = TRIM(customer_country),
	customer_segment = TRIM(customer_segment),
	customer_state = TRIM(customer_state),
	department_name = TRIM(department_name),
	market = TRIM(market),
	order_city = TRIM(order_city),
	order_country = TRIM(order_country),
	order_region = TRIM(order_region),
	order_state = TRIM(order_state),
	order_status = TRIM(order_status),
	product_name = TRIM(product_name),
	shipping_mode = TRIM(shipping_mode);


-- Calculate shipping delay
-- Add a new column and calculate the difference between  real and scheduled shipping days.

ALTER TABLE sales_data
ADD COLUMN shipping_delay INTEGER;

UPDATE sales_data
SET shipping_date = days_for_shipping - days_for_shipment


-- Calculate profit margin
-- Add a new column and calculate profit margin for each order item.

ALTER TABLE sales_data
ADD COLUMN profit_margin NUMERIC(10,4)

UPDATE sales_data
SET profit_margin = order_profit_per_order / NULLIF(sales,0);