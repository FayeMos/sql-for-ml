# SQL for Machine Learning

This repository demonstrates how SQL is used to transform raw relational data into machine learning-ready datasets.

## Key Concepts Covered

### Joins
- **INNER JOIN**: Keeps only matching rows from both tables  
- **LEFT JOIN**: Preserves all entities from the main table, even if no related records exist  

### Aggregations
- GROUP BY with COUNT, SUM, and AVG to create customer-level features  
- COALESCE to handle NULL values and produce numeric features for modeling  

### Feature Engineering
- Creating features such as:
  - order_count  
  - avg_order_value  
  - total_spent  

### Target Creation
- Using CASE WHEN to define churn as a binary variable  

### Window Functions
- **ROW_NUMBER**: Ranking rows within each group  
- **LAG**: Comparing values across time for behavioral analysis  

## Why This Matters

In real-world machine learning systems, SQL is used to:
- prepare clean and structured datasets  
- preserve all entities to avoid bias  
- create meaningful features from raw data  
- define target variables for supervised learning  

## Example Query

```sql
SELECT
  c.customer_id,
  COUNT(o.order_id) AS order_count,
  COALESCE(AVG(o.amount), 0) AS avg_order_value,
  CASE
    WHEN COUNT(o.order_id) = 0 THEN 1
    ELSE 0
  END AS churn
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id;
```

## About This Project

This project demonstrates my ability to build machine learning-ready datasets using SQL, with a focus on feature engineering and data quality.
