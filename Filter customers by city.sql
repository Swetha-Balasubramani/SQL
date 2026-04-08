-- Filter customers by city
SELECT
    customer_id,
    name,
    email,
    join_date
FROM customers
WHERE city = 'Bangalore'
ORDER BY join_date;