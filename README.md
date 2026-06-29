# Supply-Chain-SQL-Analysis
End-to-end SQL data analysis project using PostgreSQL and a Supply Chain dataset.
# Supply Chain SQL Analysis

## 📌 Project Overview

This project demonstrates an end-to-end SQL data analysis workflow using PostgreSQL. Starting from a raw transactional dataset, I performed data quality checks, cleaned and transformed the data, built a normalized relational database model, and answered business-oriented questions using SQL.

The goal of this project was not only to practice SQL syntax, but also to simulate a real-world data analysis process—from preparing raw data to generating meaningful business insights.

---

## 🎯 Business Objectives

The analysis was designed to answer several business questions, including:

* Which product categories generate the highest sales?
* Which customer segments contribute the most revenue?
* How do discounts affect sales and profitability?
* Which shipping methods experience the highest delivery delays?
* How do sales change over time?
* Which regions generate the highest revenue?
* What seasonal patterns can be observed in sales performance?

---

## 🛠 Technologies Used

* PostgreSQL
* SQL
* Relational Database Modeling
* Data Cleaning
* Data Quality Assessment
* Common Table Expressions (CTEs)
* Window Functions
* Aggregate Functions
* Git
* GitHub

---

## 🔄 Project Workflow

```text
Raw CSV Dataset
        │
        ▼
Data Quality Check
        │
        ▼
Data Cleaning
        │
        ▼
Data Modeling
        │
        ▼
Business Analysis
        │
        ▼
Business Insights
```

---

## 📂 Repository Structure

```text
sql/
│
├── 01_create_table.sql
├── 02_data_quality_check.sql
├── 03_data_cleaning.sql
├── 04_data_modeling.sql
├── 05_constraints.sql
│
└── business_analysis/
    ├── 01_sales_analysis.sql
    ├── 02_customer_analysis.sql
    ├── 03_product_analysis.sql
    ├── 04_delivery_analysis.sql
    └── 05_advanced_analysis.sql

screenshots/

README.md
```

---

# 🔍 Data Quality Check

Before transforming the dataset, I verified its quality by checking for:

* Missing values
* Empty text values
* Duplicate records
* Invalid date relationships
* Numeric ranges
* Categorical consistency

These checks helped identify potential issues before the cleaning process.

---

# 🧹 Data Cleaning

The dataset was prepared for analysis by:

* Replacing empty text values
* Removing unnecessary spaces using `TRIM()`
* Creating the `shipping_delay` column
* Creating the `profit_margin` column
* Building the final analytical dataset

The cleaned dataset became the foundation for the relational database model.

---

# 🏗 Data Modeling

The analytical table was transformed into a normalized relational database consisting of:

* Customers
* Orders
* Order Items
* Products
* Categories

Primary and foreign keys were added to ensure referential integrity between tables and improve query performance.

---

# 📊 Business Analysis

The project includes several business-oriented analyses grouped into the following categories.

## Sales Analysis

* Sales by Region
* Sales by Category
* Monthly Sales Trend
* Seasonal Sales Analysis
* Month-over-Month Sales Growth

## Customer Analysis

* Customer Segment Performance
* Customer Profitability

## Product Analysis

* Product Performance
* Discount Impact Analysis
* Category Sales Share
* Pareto Analysis

## Delivery Analysis

* Delivery Performance
* Delayed Orders by Shipping Mode
* Average Shipping Delay by Shipping Mode

## Advanced SQL

Examples of more advanced SQL techniques used in the project include:

* Common Table Expressions (CTEs)
* Window Functions
* `LAG()`
* `RANK()`
* Aggregate Functions

---

# 💡 Key Business Insights

The analysis revealed several valuable business insights, including:

* Sales performance varied significantly across regions.
* Customer segments contributed differently to total revenue.
* A relatively small number of product categories generated a large share of total sales.
* Shipping methods differed in delivery performance and average shipping delays.
* Sales exhibited noticeable seasonal trends throughout the year.

---

# 📸 Project Screenshots

The repository also contains screenshots documenting the complete analytical workflow, including:

* Data Quality Checks
* Data Cleaning
* Data Modeling
* Business Analysis
* Advanced SQL Queries

---

# 🚀 Skills Demonstrated

This project demonstrates practical experience with:

* SQL Query Writing
* Data Cleaning & Transformation
* Data Validation
* Relational Database Modeling
* SQL Joins
* Aggregate Functions
* Common Table Expressions (CTEs)
* Window Functions
* Business Analysis
* Git & GitHub

---

# 📝 Conclusion

This project allowed me to practice the complete SQL data analysis workflow—from raw transactional data to business-oriented insights.

It also strengthened my skills in PostgreSQL, relational database design, analytical SQL, and project organization using GitHub.

---

## 👩 About the Author

Hi! I'm **Beata**, an aspiring Data Analyst passionate about transforming raw data into meaningful insights.

I'm continuously developing my skills in SQL, Excel, Power BI, and Python while building practical portfolio projects that reflect real-world analytical workflows.
