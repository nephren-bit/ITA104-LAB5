--BAI1.1
SELECT 
    oi.order_id,
    p.product_name,
    oi.quantity,
    p.price
FROM order_details oi
INNER JOIN products p
ON oi.product_id = p.product_id;
--1.2
SELECT 
    c.full_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
--Bai2.1
SELECT 
    p.product_name,
    oi.order_id
FROM order_details oi
RIGHT JOIN products p
ON oi.product_id = p.product_id;
--2.2
SELECT 
    full_name AS ContactName,
    phone_number AS PhoneNumber
FROM customers

UNION

SELECT 
    supplier_name AS ContactName,
    contact_phone AS PhoneNumber
FROM suppliers;
--Bai3.1
SELECT 
    product_name,
    price
FROM products
WHERE supplier_id IN (
    SELECT supplier_id
    FROM suppliers
    WHERE supplier_name = 'Công ty Sữa Việt Nam'
);
--3.2
SELECT 
    product_name,
    price,
    (SELECT AVG(price) FROM products) AS average_price
FROM products;
--Bai4.1
SELECT *
FROM (
    SELECT 
        order_id,
        SUM(quantity * price) AS total_value
    FROM order_items
    GROUP BY order_id
) AS order_totals
WHERE total_value > 50000;
--4.2
SELECT supplier_name
FROM suppliers s
WHERE EXISTS (
    SELECT 1
    FROM products p
    WHERE p.supplier_id = s.supplier_id
);
