-- Orders count and total spend per customer
SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id)       AS total_orders,
    SUM(o.total_amount)    AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spent DESC;