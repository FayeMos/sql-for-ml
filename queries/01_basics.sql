
-- SQL Basics for ML
-- This file covers SELECT, WHERE, and INNER JOIN fundamentals.

-- View all customers
SELECT * FROM customers;

-- Customers in Vancouver
SELECT *
FROM customers
WHERE city = 'Vancouver';

-- View all orders
SELECT * FROM orders;

-- Orders above $100
SELECT *
FROM orders
WHERE amount > 100;

-- Join customers with their orders
SELECT c.name, o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
