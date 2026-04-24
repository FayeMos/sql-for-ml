-- Setup script for SQL practice

-- Create tables
CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT,
  city TEXT
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date TEXT,
  amount REAL
);

-- Insert data
INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Sara', 'Vancouver'),
(2, 'Ali', 'Burnaby'),
(3, 'John', 'Vancouver');

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-01', 100.5),
(102, 1, '2024-02-01', 100.0),
(103, 2, '2024-01-15', 200.0);
