-- Average order value grouped by customer city
SELECT
    c.city,
    COUNT(o.order_id)          AS total_orders,
    ROUND(AVG(o.total_amount),2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY avg_order_value DESC;