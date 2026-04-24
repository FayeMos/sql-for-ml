-- SQL Aggregations for ML
-- This file demonstrates LEFT JOIN, GROUP BY, COUNT, SUM, AVG, and COALESCE.

-- Total amount spent per customer (NULLs possible)
SELECT 
  c.name,
  SUM(o.amount) AS total_spent
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.name;


-- Total amount spent per customer (NULL -> 0)
SELECT 
  c.name,
  COALESCE(SUM(o.amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.name;


-- Average order value per customer (NULLs possible)
SELECT 
  c.name,
  AVG(o.amount) AS avg_order_value
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.name;


-- Average order value per customer (NULL -> 0)
SELECT 
  c.name,
  COALESCE(AVG(o.amount), 0) AS avg_order_value
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.name;


-- ML-ready customer-level dataset
SELECT 
  c.customer_id,
  c.city,
  COUNT(o.order_id) AS order_count,
  COALESCE(AVG(o.amount), 0) AS avg_order_value,
  COALESCE(SUM(o.amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.city;

