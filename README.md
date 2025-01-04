# AtliQ-SQL-Sales-Analytics 
This repository contains SQL scripts and analysis performed on the sales data of **AtliQ Hardware**, focusing on key sales metrics such as **Pre-invoice Deduction Percentage**, **Post-invoice Deduction Percentage**, and **Net Sales**. Additionally, reports for **Top Markets**, **Top Products**, and **Top Customers by Net Sales** are generated using **views** and **stored procedures**.

The analysis is done on a dataset of **more than 1.5 million records** and is implemented using **MySQL**.

## Project Overview

In this project, I utilized **SQL views** to calculate important metrics and stored them in the database for easy querying. The metrics include:

1. **Pre-invoice Deduction Percentage (Pre_invoice_deduction_pct)**:
   - This metric calculates the percentage of sales value deducted before the invoice is generated, such as discounts or promotions applied before finalizing the invoice.
   - Formula: 
     ```
     Pre_invoice_deduction_pct = (Total Deduction Before Invoice / Total Sales Before Invoice) * 100
     ```

2. **Post-invoice Deduction Percentage (Post_invoice_deduction_pct)**:
   - This metric calculates the percentage of sales value deducted after the invoice is generated, like returns, credits, or adjustments.
   - Formula: 
     ```
     Post_invoice_deduction_pct = (Total Deduction After Invoice / Total Sales After Invoice) * 100
     ```

3. **Net Sales (Net_sales)**:
   - This metric calculates the final sales value after deductions, both pre and post-invoice.
   - Formula: 
     ```
     Net_sales = Total Sales - Pre_invoice_Deductions - Post_invoice_Deductions
     ```

### Reports Generated:

Using the **views** created for the above metrics, I generated the following reports via **stored procedures**:

1. **Top N Markets by Net Sales**: 
   - A report that returns the **top N markets** based on net sales, which can be used to identify the highest-performing markets for AtliQ Hardware.
   
2. **Top N Products by Net Sales**: 
   - A report that returns the **top N products** based on net sales, helping the business identify best-selling products.

3. **Top N Customers by Net Sales**: 
   - A report that returns the **top N customers** based on net sales, enabling the business to focus on high-value customers.

### Attached CSV Files

To facilitate further analysis, I have attached **CSV files** that contain the results of the queries used to generate the following reports:

- **Pre-invoice Deduction Percentage**
- **Post-invoice Deduction Percentage**
- **Net Sales**
- **Top N Markets by Net Sales**
- **Top N Products by Net Sales**
- **Top N Customers by Net Sales**

These CSV files include the output of the queries and can be used for further analysis or visualizations.

## SQL Techniques Used

- **Views**: Created views to calculate the key metrics, such as pre-invoice deductions, post-invoice deductions, and net sales. This ensures that the metrics are readily available for use in further analysis.
- **Stored Procedures**: Designed stored procedures to generate reports for top N markets, products, and customers based on net sales.
- **Complex Queries**: Used complex SQL queries with joins and aggregations to calculate total sales and deductions, and to generate meaningful insights from the data.
- **Aggregate Functions**: Utilized `SUM()`, `GROUP BY`, and `ORDER BY` to calculate total sales and identify the top N items.
- **Subqueries**: Applied subqueries to handle intermediate calculations and join data from multiple tables for more efficient reporting.

## Dataset

The dataset used for this analysis contains over **1.5 million records**, which include:

- **Sales Transactions**: Detailed records of each sale, including product IDs, quantities, sales values, and transaction dates.
- **Invoices**: Information on invoices generated, including invoice IDs, totals, and statuses.
- **Deductions**: Records of any deductions, adjustments, or credits applied to the sales, both before and after the invoice is created.

## Setup & Installation

### Requirements
- **Database Server**: MySQL
- **SQL Client**: MySQL Workbench, phpMyAdmin, or any compatible SQL environment.
