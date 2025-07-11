# 📊 Company Performance Analysis with SQL

This project analyzes company performance using SQL queries on the **Northwind** database to provide actionable insights for multiple departments, including Product, HR, Logistics, and Sales. By answering specific business questions, the project supports data-driven decision-making and operational improvements.

## 🧭 Overview

As organizations grow, so does the complexity of their data. This project is designed to assist various teams within a simulated company by extracting meaningful insights from the Northwind dataset. The analysis helps optimize pricing strategies, evaluate sales metrics, improve logistics, and assess employee performance using SQL-based reporting.

## 🎯 Objectives

- Generate department-specific insights using SQL.
- Improve business strategies through data analysis.
- Build a set of SQL queries to answer real-world business questions.
- Evaluate key performance indicators (KPIs) across teams.

## 👥 Stakeholders and Requirements

Each department had its own analytical needs:

- **Product Team**: Identify products in specific price ranges to review pricing strategies.
- **HR Team**: Measure employee performance using KPIs.
- **Sales Team**: Analyze performance by category and employee.
- **Logistics Team**: Understand regional supply stock and shipping patterns.

## 🗄️ Dataset Information

- **Source**: [Northwind Database](https://github.com/pthom/northwind_psql)  
- **Tables**: 14, including `Orders`, `Products`, `Employees`, `Order Details`, and `Categories`.
- **Limitations**: Due to the age and structure of the dataset, some insights may not generalize to modern environments.

## 📌 Key Variables

- **Products**: `product_id`, `unit_price`, `units_in_stock`
- **Orders**: `order_id`, `order_date`, `shipped_date`
- **Order Details**: `order_id`, `unit_price`, `quantity`, `discount`
- **Categories**: `category_id`, `category_name`
- **Employees**: `employee_id`, `hire_date`, `region`

## 🛠️ Setup Instructions

1. Download and install [DBeaver](https://dbeaver.io/) or your preferred SQL client.
2. Connect to PostgreSQL:
   - New Database Connection → Select PostgreSQL → Enter server details.
3. Create and load the Northwind schema.
4. Run SQL queries from the `/queries` folder to generate insights.

## 📈 Key Insights & Results

- **Employee Performance**: Margaret led with the highest total sales; Steven had the lowest, suggesting room for growth.
- **Pricing**: Products priced between $20–$50 are most popular. Discounts and price revisions are recommended for items over $50.
- **Logistics**: Beverages and condiments need higher stock in Europe and Asia-Pacific due to reorder rates.
- **Global Performance**: March and April 1998 were peak months. Sweden had the longest shipping delays.

## ✅ Project Outcomes

- Delivered SQL-based insights aligned with each department’s goals.
- Supported decisions on pricing, staffing, and logistics.
- Demonstrated how structured data analysis can drive performance.

## 💡 Recommendations

- Use updated, real-time data for future strategies.
- Integrate customer feedback data for richer insights.
- Explore machine learning to predict sales trends.

## 📁 Files Included

- dsp_at1_25589351 – Main project report document or submission file.
- csv/ – Folder containing all query results exported as CSV files.
- queries/ – Folder containing all SQL query scripts used in the analysis.


