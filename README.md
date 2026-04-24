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

This project reflects my transition into applied AI and data science, focusing on building explainable and production-relevant data workflows.
