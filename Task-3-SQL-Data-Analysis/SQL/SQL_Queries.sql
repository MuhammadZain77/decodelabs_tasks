/*
=============================================================
Decode Labs Data Analytics Internship

Project 3 : SQL Data Analysis

Author    : Muhammad Zain Chawala

Database  : DecodeLabs_Project3

Table     : retail_sales

Description:
This project demonstrates SQL querying,
filtering,
sorting,
aggregation,
grouping,
and business-oriented data analysis
using a retail sales dataset.

=============================================================
*/

/*=========================================================
SECTION 1
Database Setup
=========================================================*/
CREATE DATABASE decode_labs;
USE decode_labs;

/*=========================================================
SECTION 2
Data Exploration
=========================================================*/
SHOW TABLES;
SHOW COLUMNS FROM retail_sales;

SELECT * FROM retail_sales LIMIT 5;

DESCRIBE retail_sales;

SELECT COUNT(*) AS Total_Orders FROM retail_sales;

SELECT DISTINCT CustomerID FROM retail_sales;

SELECT DISTINCT PaymentMethod FROM retail_sales;

SELECT DISTINCT ReferralSource FROM retail_sales;

SELECT DISTINCT OrderStatus FROM retail_sales;

/*=========================================================
SECTION 3
Data Filtering
=========================================================*/
SELECT * FROM retail_sales WHERE OrderStatus='Delivered';

SELECT * FROM retail_sales WHERE PaymentMethod='Cash';

SELECT * FROM retail_sales WHERE TotalPrice>1000;

SELECT * FROM retail_sales WHERE Product='Laptop';

/*=========================================================
SECTION 4
Data Sorting
=========================================================*/
SELECT * FROM retail_sales WHERE TotalPrice>(SELECT AVG(TotalPrice) FROM retail_sales);

SELECT * FROM retail_sales ORDER BY TotalPrice DESC;

SELECT * FROM retail_sales ORDER BY TotalPrice ASC;

SELECT * FROM retail_sales ORDER BY Product;

SELECT CustomerID,TotalPrice FROM retail_sales ORDER BY TotalPrice DESC;

SELECT * FROM retail_sales ORDER BY OrderDate DESC;

/*=========================================================
SECTION 5
Aggregate Functions
=========================================================*/
SELECT SUM(TotalPrice) AS Total_Revenue FROM retail_sales;

SELECT AVG(TotalPrice) AS Average_Order_Value FROM retail_sales;

SELECT MAX(TotalPrice) AS Highest_Order FROM retail_sales;

SELECT MIN(TotalPrice) AS Lowest_Order FROM retail_sales;

SELECT AVG(Quantity) AS Average_Quantity FROM retail_sales;

/*=========================================================
SECTION 6
Grouped Business Analysis
=========================================================*/
SELECT Product,SUM(TotalPrice) AS Revenue FROM retail_sales GROUP BY Product ORDER BY Revenue DESC;

SELECT PaymentMethod, COUNT(*) AS Total_Orders FROM retail_sales GROUP BY PaymentMethod ORDER BY Total_Orders DESC;

SELECT OrderStatus,COUNT(*) AS Total_Orders FROM retail_sales GROUP BY OrderStatus ORDER BY Total_Orders DESC;

SELECT ReferralSource,SUM(TotalPrice) AS Revenue FROM retail_sales GROUP BY ReferralSource ORDER BY Revenue DESC;

SELECT Product,COUNT(*) AS Total_Orders FROM retail_sales GROUP BY Product ORDER BY Total_Orders DESC;

/*=========================================================
SECTION 7
Advanced Business Insights
=========================================================*/
SELECT CustomerID,COUNT(*) AS Orders_Placed FROM retail_sales GROUP BY CustomerID HAVING COUNT(*)>5;

SELECT Product,SUM(TotalPrice) AS Revenue FROM retail_sales GROUP BY Product HAVING SUM(TotalPrice)>100000;

SELECT PaymentMethod, AVG(TotalPrice) AS Average_Revenue FROM retail_sales GROUP BY PaymentMethod ORDER BY Average_Revenue DESC;

SELECT CustomerID,SUM(TotalPrice) AS Total_Spent FROM retail_sales GROUP BY CustomerID ORDER BY Total_Spent DESC;