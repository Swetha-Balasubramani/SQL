-- Monthly revenue trend
SELECT
    YEAR(order_date)  AS year,
    MONTH(order_date) AS month,
    COUNT(order_id)   AS total_orders,
    SUM(total_amount) AS monthly_revenue
FROM orders
WHERE status != 'Cancelled'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;