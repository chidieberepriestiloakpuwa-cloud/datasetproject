# Select the UniTech database to work with
USE unitech;

# CLASS PROJECT: RETAIL STORE SALES ANALYSIS
# BUSINESS CASE:
# A retail store has been selling different kinds of products through both online and retail channels. The business also has both new and returning customers.
# The management team wants to better understand how the business is performing by analyzing its sales data. They want to discover important patterns, customer behavior, top performing products, and areas where the business can improve.

# VIEW FIVE RECORDS
# Display the first five records from the furniture table.
SELECT*
FROM furniture
LIMIT 5;

# VIEW THE TABLE STRUCTURE
# Display the column names, data types, and other properties of the furniture table.
DESCRIBE furniture;

# CHECK FOR DUPLICATE RECORDS
# NOTE: This query identifies records that share the same values across the listed columns.
SELECT*,
count(*) AS Duplicate_Value
FROM furniture
GROUP BY Product, Sales_rep, Region, Customer, Date, Unit_price, Quantity, Total_sales
HAVING count(*)>1;

# BUSINESS CASE 1: OVERVIEW OF BUSINESS METRICS
# BUSINESS QUESTION: What are the key business metrics saying?
# NOTE: Total_sales is treated as the Revenue field.
SELECT format(sum(Total_sales),2) AS Revenue
FROM furniture;

# Overview of Quantity Sold
SELECT format(sum(Quantity),0) AS Quantity_Sold
FROM furniture;

# BUSINESS CASE 2: PRODUCT PERFORMANCE
# BUSINESS QUESTION: Which product category has the highest quantity sold?
SELECT Product,
format(sum(Quantity),0) AS Quantity_Sold
FROM furniture
GROUP BY Product
ORDER BY Quantity_Sold DESC;

# BUSINESS CASE 3: PROFIT FROM NEW AND RETURNING CUSTOMERS
# BUSINESS QUESTION: How much profit comes from new and returning customers
# The current dataset does not contain the required profit fields

# BUSINESS CASE 4: MONTHLY CUSTOMER PATRONAGE
# BUSINESS QUESTION: Can we see our revenue for the last 3 years?
SELECT year(date) AS year,
format(sum(Total_sales), 2) AS Revenue
FROM furniture
GROUP BY year(date)
ORDER BY Revenue DESC;

# BUSINESS CASE 5: 
# BUSINESS QUESTION: Which year do we have the highest patronage?
SELECT year(date) AS year,
count(customer) AS Customer
FROM furniture
GROUP BY year(date)
ORDER BY customer DESC;

# BUSINESS CASE 6: REGIONAL MARKET PERFORMANCE
# BUSINESS QUESTION: Which region dominates the market in terms of profit?
SELECT region,
format(sum(Quantity),0) AS Quantity_Sold
FROM furniture
GROUP BY region
ORDER BY Quantity_Sold DESC;

# BUSINESS CASE 7: SALES CHANNEL PREFERENCE
# BUSINESS QUESTION: Do customers prefer online or physical retail sales?
# A Sales_Channel column containing values such as 'Online' and 'Retail' is required for this analysis

# BUSINESS CASE 8: SALES REPRESENTATIVE PERFORMANCE
# BUSINESS QUESTION: Which sales representative sells the most products?
SELECT Sales_rep,
SUM(Quantity) AS Quantity_Sold
FROM furniture
GROUP BY Sales_rep
ORDER BY Quantity_sold DESC

# BUSINESS CASE 9: PAYMENT METHOD ANALYSIS
# BUSINESS QUESTION: Which payment method is used the most?
# The current furniture table does not contain a Payment_Method field.

# DATA LIMITATIONS
#======================================================
# The current dataset has limitations that prevent us from answering every business question in the case study.
# Missing or insufficient field such as Payment_method, Sales_channnel, Profit, etc
# PAYMENT_METHOD: is required to identify the most frequently used payment option. 
# SALES_CHANNEL: is required to compare online and physical retail sales.
# PROFIT: is required to calculate total profit and profit percentage.
