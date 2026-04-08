-- ============================================
-- RETAIL SALES DATABASE SETUP
-- ============================================

CREATE DATABASE retail_sales;
USE retail_sales;

-- 1. CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id  INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(100) NOT NULL,
    city         VARCHAR(50),
    email        VARCHAR(100),
    join_date    DATE
);

-- 2. PRODUCTS TABLE
CREATE TABLE products (
    product_id   INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category     VARCHAR(50),
    price        DECIMAL(8,2),
    stock_qty    INT
);

-- 3. ORDERS TABLE
CREATE TABLE orders (
    order_id     INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT,
    order_date   DATE,
    status       VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. ORDER ITEMS TABLE
CREATE TABLE order_items (
    item_id    INT PRIMARY KEY AUTO_INCREMENT,
    order_id   INT,
    product_id INT,
    quantity   INT,
    unit_price DECIMAL(8,2),
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================
-- SAMPLE DATA
-- ============================================

INSERT INTO customers (name, city, email, join_date) VALUES
('Aarav Sharma',   'Bangalore', 'aarav@mail.com',   '2023-01-15'),
('Priya Nair',     'Chennai',   'priya@mail.com',   '2023-02-10'),
('Rohan Mehta',    'Mumbai',    'rohan@mail.com',   '2023-03-05'),
('Sneha Reddy',    'Hyderabad', 'sneha@mail.com',   '2023-04-20'),
('Kiran Patel',    'Ahmedabad', 'kiran@mail.com',   '2023-05-01'),
('Divya Singh',    'Delhi',     'divya@mail.com',   '2023-06-12'),
('Arjun Kumar',    'Bangalore', 'arjun@mail.com',   '2023-07-18'),
('Meera Joshi',    'Pune',      'meera@mail.com',   '2023-08-25');

INSERT INTO products (product_name, category, price, stock_qty) VALUES
('Laptop 15"',        'Electronics',  45000.00, 30),
('Wireless Mouse',    'Electronics',   1200.00, 150),
('USB-C Hub',          'Electronics',   2500.00, 80),
('Running Shoes',     'Footwear',       3200.00, 60),
('Casual Sneakers',   'Footwear',       1800.00, 90),
('Cotton T-Shirt',    'Clothing',        599.00, 200),
('Denim Jeans',       'Clothing',       1499.00, 120),
('Yoga Mat',           'Sports',          899.00, 75),
('Water Bottle',      'Sports',          450.00, 180),
('Backpack',           'Clothing',       2200.00, 50);

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2024-01-10', 'Delivered', 46200.00),
(2, '2024-01-15', 'Delivered',  3200.00),
(3, '2024-02-05', 'Delivered',  4099.00),
(1, '2024-02-20', 'Shipped',    2500.00),
(4, '2024-03-01', 'Delivered',  1800.00),
(5, '2024-03-12', 'Cancelled',   599.00),
(6, '2024-03-18', 'Delivered',  3699.00),
(2, '2024-04-02', 'Delivered',  2650.00),
(7, '2024-04-15', 'Shipped',    1499.00),
(8, '2024-05-01', 'Delivered',  5000.00);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 45000.00), (1, 2, 1, 1200.00),
(2, 4, 1, 3200.00),
(3, 6, 2,  599.00), (3, 7, 2, 1499.00), (3, 8, 1,  899.00),
(4, 3, 1, 2500.00),
(5, 5, 1, 1800.00),
(6, 6, 1,  599.00),
(7, 7, 1, 1499.00), (7, 4, 1, 3200.00), (7, 9, 2,  450.00),
(8, 3, 1, 2500.00),
(9, 7, 1, 1499.00),
(10,1, 0, 45000.00),(10,10,1, 2200.00);