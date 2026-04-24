-- CASE WHEN and Churn Labeling
-- This file shows how to define business logic and create a binary target for ML.

-- Label customers as “active” or “inactive” based on number of orders
SELECT
	c.customer_id,
	COUNT(o.order_id) as order_count,
	CASE
		WHEN COUNT(o.order_id) > 0 then 'active'
		ELSE 'inactive'
	END AS activity_status
FROM customers c
LEFT JOIN orders o
	on c.customer_id = o.customer_id
GROUP BY c.customer_id;


-- Define churn (binary target)
-- A customer is churned if they made zero orders in the last period
SELECT 
  c.customer_id,
  COUNT(o.order_id) AS order_count,
  CASE
    WHEN COUNT(o.order_id) = 0 THEN 1
    ELSE 0
  END AS churn
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id;


-- Combine features + target (ML labeling)
SELECT
c.customer_id,
c.city,
COUNT(o.order_id) as order_count,
COALESCE(AVG(o.amount), 0) as average_order_value,
COALESCE(SUM(o.amount), 0) AS total_spent,
CASE
	WHEN COUNT(o.order_id) = 0 THEN 1
    ELSE 0
END AS churn
FROM customers c
left JOIN orders o
	on c.customer_id = o.customer_id
GROUP BY c.customer_id, c.city;
