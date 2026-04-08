-- Products with stock below 60 units
SELECT
    product_id,
    product_name,
    category,
    price,
    stock_qty
FROM products
WHERE stock_qty < 60
ORDER BY stock_qty ASC;