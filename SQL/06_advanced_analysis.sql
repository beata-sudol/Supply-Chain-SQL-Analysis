-- ==========================================================
-- ADVANCED SQL ANALYSIS
-- ==========================================================
-- Use CTEs and window functions to generate deeper insights.

-- ----------------------------------------------------------
-- Advanced CTE Analysis
-- ----------------------------------------------------------
-- Which categories are in Top 10 by sales but not in Top 10 by profitability?

WITH category_metrics AS (
    SELECT
        c.category_name,
        SUM(oi.sales) AS total_sales,
        AVG(oi.order_item_profit_ratio) AS avg_profit_ratio,
        COUNT(oi.order_item_id) AS total_items
    FROM order_items oi
    INNER JOIN products p 
        ON p.product_card_id = oi.order_item_cardprod_id
    INNER JOIN categories c 
        ON c.category_id = p.category_id
    GROUP BY c.category_name
),

category_ranking AS (
    SELECT
        cm.category_name,
        cm.total_sales,
        cm.avg_profit_ratio,
        cm.total_items,
        RANK() OVER(ORDER BY cm.total_sales DESC) AS sales_rank,
        RANK() OVER(ORDER BY cm.avg_profit_ratio DESC) AS profit_rank
    FROM category_metrics cm
)

SELECT *
FROM category_ranking
WHERE sales_rank <= 10
  AND profit_rank > 10
ORDER BY sales_rank;


-- ----------------------------------------------------------
-- TOP 10 PRODUCTS BY SALES RANKING
-- ----------------------------------------------------------
-- Identify the top 10 products by total sales using a ranking function.

WITH product_sales AS (
    SELECT
        p.product_name,
        SUM(oi.order_item_total) AS total_sales
    FROM order_items oi
    JOIN products p
        ON oi.order_item_cardprod_id = p.product_card_id
    GROUP BY
        p.product_name
)
SELECT
    product_name,
    total_sales,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM product_sales
ORDER BY
    sales_rank
LIMIT 10;
