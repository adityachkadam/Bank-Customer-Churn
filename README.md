# 🏦 Bank Customer Churn Analysis

An end-to-end data analysis project exploring customer churn behavior, high-risk customer segments, and retention opportunities for a European retail bank.

---

## 🔍 Project Overview

This project analyzes **10,000 customer records** to identify the key drivers of customer churn and provide actionable retention strategies. The workflow covers SQL-based data exploration, Python-assisted analysis, and an interactive Power BI dashboard.

### Key Findings

* **20.37% churn rate** — approximately 1 in every 5 customers left the bank
* **Germany recorded the highest churn rate (32.44%)**, more than double France and Spain
* Customers aged **51–60 churned at 56.21%**, representing the highest-risk age segment
* Customers holding **3 or more products showed extreme churn rates (82–100%)**
* **1,211 high-value customers** with balances above 100,000 were already lost
* Inactive members churned nearly twice as often as active members

---

## 🛠️ Tools Used

| Tool                        | Purpose                                |
| --------------------------- | -------------------------------------- |
| SQL (MySQL)                 | Data exploration & churn analysis      |
| Jupyter Notebook            | Analysis environment                   |
| Power BI Desktop            | Dashboard & visualization              |
| Claude (Anthropic)          | Analysis guidance & documentation      |

---

## 📓 Analysis Summary

The project covers:

1. **Database setup** — importing and validating customer records
2. **Data quality checks** — null detection, duplicate verification, schema validation
3. **Exploratory analysis** — customer demographics, geography, balances, and engagement metrics
4. **Customer segmentation** — identifying high-risk, loyal, and high-value customer groups
5. **Churn analysis** — evaluating churn by geography, age, gender, activity status, and product count
6. **Retention insights** — uncovering behavioral patterns linked to customer attrition
7. **Dashboard development** — creating executive-level visualizations and KPIs

---

## 📊 Dashboard

The Power BI dashboard includes:

* **KPI Cards** — Total Customers, Churn Rate %, Customers Lost, High-Value Customers Lost
* **Bar Chart** — Churn Rate by Geography
* **Bar Chart** — Churn Rate by Age Group
* **Donut Chart** — Customer Distribution by Gender
* **Column Chart** — Churn by Number of Products
* **Bar Chart** — Churn by Active Member Status
* **Matrix Table** — Churned vs Retained Customer Profile Comparison
* **Slicer** — Credit Score Range Filter

---

## 📄 Documentation

| File                          | Description                                                                        |
| ----------------------------- | ---------------------------------------------------------------------------------- |
| `stakeholder_briefing.md`     | Original project brief and business objectives                                     |
| `Bank_Churn_Reference.pdf`    | Technical reference guide containing SQL queries, DAX measures, and Power BI setup |
| `Bank_Churn_Key_Findings.pdf` | Executive summary of findings, customer segments, and recommendations              |

---

## 🚀 How to Run

1. Clone the repository
2. Import the dataset into MySQL
3. Execute the SQL queries provided in the reference guide
4. Perform exploratory analysis in Jupyter Notebook (optional)
5. Connect Power BI to the processed dataset
6. Open `Bank Customer Churn Analysis.pbix`
7. Refresh the data source and explore the dashboard

---

## 📈 Business Impact

The analysis identified clear retention opportunities, including targeted intervention for high-risk German customers, re-engagement of inactive members, optimization of product bundling strategies, and focused retention programs for customers aged 41–60. These insights can help reduce customer attrition and protect high-value banking relationships.
