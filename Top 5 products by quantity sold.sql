-- Top 5 products by quantity sold
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_qty_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_qty_sold DESC
LIMIT 5;