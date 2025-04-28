# SQL Assignment: Order, Customer, and Payment Analysis

## Overview
This repository contains the SQL queries designed to analyze order and sales data, customer behavior, payment statuses, and generate detailed reports.

## Files
- `assignment_queries.sql` — Contains all SQL queries grouped by tasks.
- `README.md` — Explains the approach for each task.

## Approach

### Task 1: Order and Sales Analysis
- Calculated the count of orders based on their status.
- Analyzed total revenue generated from completed orders.
- Evaluated monthly revenue trends using `order_date`.

### Task 2: Customer Analysis
- Identified repeat customers by counting multiple orders.
- Segmented customers into Premium, Regular, and Occasional based on total spending.
- Analyzed trends of new customer acquisition over time.

### Task 3: Payment Status Analysis
- Investigated payment success and failure rates.
- Analyzed the distribution of different payment methods.

### Task 4: Order Details Report
- Combined order and payment data into a comprehensive report.
- Provided detailed information for each order including payment details.

## How to Run
- Import the `customer_orders` and `payments` tables into your MySQL database.
- Execute the SQL queries in `assignment_queries.sql` sequentially.
- View and analyze the output for insights.

## Notes
- Assumes the database contains clean and correctly imported `customer_orders` and `payments` data.
- The queries are optimized for MySQL.

---

**Author:** Prince Thummar 
**Date:** 28/04/2025
