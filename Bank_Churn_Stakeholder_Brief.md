# Stakeholder Briefing — Bank Customer Churn Analysis

**From:** Head of Customer Analytics
**To:** Chief Revenue Officer · VP Retail Banking · Head of Customer Success
**Date:** January 2025
**Re:** Customer Churn — Root Cause Investigation & Retention Strategy

---

## Background

Our European retail banking division is recording an alarming **20.37% customer churn rate** across a base of **10,000 customers**. This translates to **2,037 lost customers**, of whom **1,211 held balances exceeding 100,000** — our most profitable segment. We currently lack a data-driven picture of *why* customers are leaving and *when* they tend to churn. This initiative uses SQL-based exploratory analysis and a Power BI dashboard to surface those answers.

---

## Problem Statement

> **We need to understand what is driving customer churn, identify which customer segments are at highest risk, quantify the revenue impact of attrition, and deliver a segmentation framework that enables targeted, data-driven retention action.**

---

## Key Business Questions

### 1. Churn Analysis
- What is the overall churn rate across all 10,000 customers?
- Which geography is experiencing the highest churn — and why?
- How does churn vary across age groups and gender?

### 2. Revenue Impact
- How many high-value customers (balance > 100k) have already been lost?
- What is the average balance and salary profile of churned vs. retained customers?
- Which segments represent the greatest revenue risk going forward?

### 3. Behavioral Drivers
- Does number of products held correlate with churn — and in which direction?
- Are inactive members significantly more likely to leave than active ones?
- Does credit score predict churn behavior across customer segments?

### 4. Retention Segmentation
- Who are the 178 high-risk customers still retained — and how do we keep them?
- Who are the 417 most loyal customers — and how do we grow this segment?
- What combination of factors best predicts a customer likely to churn next?

---

## Recommended Workflow

### Step 1 — MySQL Setup
- Load raw data into MySQL Workbench
- Set `CustomerId` as `PRIMARY KEY`
- Verify schema, null counts, and row count (expected: 10,000 rows, 0 nulls)

### Step 2 — SQL Exploratory Analysis
- Overall churn rate
- Churn by geography, gender, age group, number of products
- Active vs inactive member churn
- Credit score and balance bucket analysis

### Step 3 — SQL Segmentation
- High-risk segment: inactive + age 41–60 + Germany (not yet churned)
- Loyal segment: active + under 30 + 2 products
- High-value retained customers by geography and gender
- Churned vs retained average profile comparison

### Step 4 — Power BI Dashboard
- Connect Power BI directly to MySQL (`localhost` · `bank_churn`)
- Add DAX calculated columns: `Age Group`, `Credit Bucket`, `Balance Bucket`
- Build dark-theme dashboard with KPI cards and churn breakdowns

---

## Power BI Dashboard — Planned Visuals

| Visual | Description | Insight Answers |
|--------|-------------|-----------------|
| KPI Cards | Total customers, churn %, active %, high-value lost | Executive snapshot |
| Bar Chart | Churn rate by Geography | Germany vs France vs Spain |
| Bar Chart | Churn rate by Age Group | 51–60 danger zone |
| Donut Chart | Churn split by Gender | Male vs Female |
| Column Chart | Churn by Number of Products | Product paradox (3–4 products) |
| Table / Matrix | Churned vs Retained avg profile | Age, balance, tenure differences |

---

## Key Findings (from SQL Analysis)

| Finding | Detail |
|---------|--------|
| Germany Crisis | 32.44% churn vs 16% in France & Spain — 2x the rate |
| Age Risk Zone | 51–60 age group churns at 56.21%; under 30s at just 7.56% |
| Gender Gap | Females churn at 25.07% vs 16.46% for males |
| Product Paradox | 3-product customers churn at 82.71%; 4-product at 100% |
| Engagement Deficit | Inactive members churn at 26.85% vs 14.27% for active |
| Losing Best Customers | Churned avg balance 91,108 vs retained avg 72,745 |

---

## Deliverables Expected

1. **SQL Analysis Scripts** — Fully documented `.sql` file with inline commentary covering all EDA and segmentation queries
2. **Power BI Dashboard** — Dark-theme dashboard with minimum 5 visuals, slicers by geography and gender, DAX measures
3. **Customer Risk Segments** — Three defined segments: High Risk (178), Most Loyal (417), High Value Retained
4. **Business Insights Summary** — Key findings in plain language, included as project README
5. **GitHub Repository** — Organised repo with README, SQL files, dashboard screenshots, and project brief

---

## Notes & Assumptions

- `CustomerId` is unique across all 10,000 records — confirmed via `COUNT(DISTINCT)`.
- No null values detected in any column — dataset is clean.
- `HasCrCard` and `IsActiveMember` are binary flags (0/1) — treated as categorical.
- `Exited = 1` indicates a churned customer; `Exited = 0` indicates retained.
- All balance figures are in the local currency of the customer's geography.

---

*Any questions or blockers? Flag them early so we can align before final delivery.*
