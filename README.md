# tata-sales-dataset
MySQL sales management database for a Tata Motors-style dealer network: schema design, sample data, aggregate queries, joins, subqueries, window functions and stored procedures.

**Business Problem:**

A vehicle dealer network needs quick answers from its sales data:

How many customers, products and orders do we have, and how big are the sales?
Which product lines and models bring in the most revenue?
Which customers pay the most, and who are the top accounts?
Which products are well stocked, and what is the price and margin spread?
Are all orders being fulfilled (shipped vs. in process, on hold, cancelled)?
Who reports to whom in the sales team?

**Dataset:**
Sample dataset of Tata Motors models, dealers and orders, following the classic sales-management schema (customers, orders, order lines, payments, sales staff).

8 tables: productlines, products, offices, employees, customers, orders, orderdetails, payments
Size: 7 product lines, 20 products, 10 offices, 20 employees, 20 customers, 25 orders (33 order lines), 20 payments
Period: orders from Jan 2025 to Jun 2025
Key columns: productCode, customerNumber, orderNumber, quantityOrdered, priceEach, buyPrice, MSRP, quantityInStock, amount
Relationships: foreign keys link products to product lines, employees to offices and managers, customers to sales reps, orders to customers, and order lines to orders and products

All amounts are in Indian rupees (₹).

**Tools Used:**
MySQL 8 (MySQL Workbench)
SQL concepts: aggregate functions, GROUP BY, subqueries, all join types, window functions, stored procedures
Key Queries & Insights
Claude for datasets

**Basic aggregates:**

20 customers, 109 units sold across all order lines, with 1 to 10 units per order line.
Average payment received is about ₹63.3 lakh. Total payments come to about ₹12.66 crore.
12 of 20 products have more than 100 units in stock.
Average buy price across the catalogue is ₹19.8 lakh.

**Group by and subqueries:**

Product lines by number of models: SUVs 5, Electric Vehicles 4, Trucks 3, Buses 3, Hatchbacks 2, Pickup Trucks 2, Sedans 1.
The largest single payment is ₹2.94 crore, from Hyderabad Car Zone. That customer's total payments are about ₹3.30 crore, roughly 26% of all payments received.
Every one of the 20 customers has placed at least one order, so the LEFT JOIN check for customers with no orders returns nothing.

**Joins:**

INNER, LEFT, RIGHT and FULL OUTER (built with UNION) joins link customers to orders.
A self join on employees maps every employee to their manager. The National Sales Head has no manager, so appears with NULL.

**Window functions:**

RANK() on MSRP shows the top-priced models are buses: Tata Starbus EV (₹98 lakh), Tata Marcopolo Bus (₹71 lakh), Tata Starbus 12m (₹52 lakh).
DENSE_RANK(), AVG() OVER and LAG() compare prices within each product line and track running order quantities.

**What stands out:**

Total order revenue is about ₹15.25 crore. SUVs lead with roughly 26% of it.
Buses sold only 3 units but still rank third, because a single Starbus EV order brings in ₹2.94 crore.
Hatchbacks and Sedans move decent volume but add little revenue because of their low price points.
Bus models carry the highest margin over buy price (about 14 to 16%).
Order status: 17 of 25 orders are shipped, 5 are in process, 2 are on hold and 1 is cancelled.
