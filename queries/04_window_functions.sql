-- Window Functions for ML
-- This file demonstrates ROW_NUMBER and LAG for ranking and temporal features.

-- Rank orders per customer by date
SELECT
  o.order_id,
  o.customer_id,
  o.order_date,
  o.amount,
  ROW_NUMBER() OVER (
    PARTITION BY o.customer_id
    ORDER BY o.order_date
  ) AS order_rank
FROM orders o;

-- Most recent order per customer
SELECT *
FROM (
  SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.amount,
    ROW_NUMBER() OVER (
      PARTITION BY o.customer_id
      ORDER BY o.order_date DESC
    ) AS rn
  FROM orders o
) ranked
WHERE rn = 1;

-- Previous order amount per customer
SELECT
  customer_id,
  order_date,
  amount,
  LAG(amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
  ) AS previous_amount
FROM orders;

-- Change from previous order amount
SELECT
  customer_id,
  order_date,
  amount,
  amount - LAG(amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
  ) AS amount_change
FROM orders;
