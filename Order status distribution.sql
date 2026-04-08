-- Order status distribution
SELECT
    status,
    COUNT(order_id)   AS order_count,
    SUM(total_amount) AS total_value
FROM orders
GROUP BY status
ORDER BY order_count DESC;