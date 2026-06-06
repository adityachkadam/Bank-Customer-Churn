create database project_db;
use project_db;
show tables;
select*from bank_churn;
desc bank_churn;
SELECT COUNT(*) FROM bank_churn;
SELECT COUNT(DISTINCT CustomerId) FROM bank_churn;
ALTER TABLE bank_churn
MODIFY CustomerId BIGINT PRIMARY KEY;
DESC bank_churn;
# 1.Overall Churn Rate
select 
count(*) as total_customers,
sum(exited) as churned,
round(sum(exited)*100.0/count(*),2) as churn_rate_pct
from bank_churn;
# 2.Basic Stats
select
round(avg(age),1) as avg_age,
round(avg(creditscore),1) as avg_credit_score,
round(avg(balance),2) as avg_balance,
round(avg(estimatedsalary),2) as avg_salary,
round(avg(tenure),1) as avg_tenure
from bank_churn;
# 3.Check Nulls
select 
sum(isnull(creditscore)) as null_creditscore,
sum(isnull(age)) as null_age,
sum(isnull(balance)) as null_balance,
sum(isnull(geography)) as null_geography,
sum(isnull(gender)) as null_gender
from bank_churn;
# 4.Check Duplicates
select CustomerID,count(*) as cnt
from bank_churn
group by CustomerID
having cnt >1 ; 
# Phase 2
# 1 Churn By Geography
SELECT 
    Geography,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY Geography
ORDER BY churn_rate_pct DESC;
# 2 Churn By Gender
SELECT
COUNT(*) as total,
SUM(Exited) as churned,
ROUND(SUM(Exited)*100.0/COUNT(*),2) as churn_rate_pct
from bank_churn
group by Gender
order by churn_rate_pct DESC;
# 3 Churn By Age Group
select 
case
when Age < 30 then 'Under 30'
when Age between 30 and 40 then '30-40'
when Age between 41 and 50 then '41-50'
when Age between 51 and 60 then '51-60'
else 'Above 60'
end as age_group,
count(*) as total,
sum(Exited) as churned,
round(sum(Exited) * 100.00/count(*) , 2 ) as churn_rate_pct
from bank_churn
group by age_group
order by churn_rate_pct DESC;
# 4 Churn by Number of Products
SELECT
    NumOfProducts,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY NumOfProducts
ORDER BY NumOfProducts;
# Phase 3
# Churn by Active Member Status
SELECT 
	IsActiveMember ,
    COUNT(*) as total,
    SUM(Exited) as churned,
    ROUND(SUM(Exited) * 100.00/COUNT(*) ,2 ) as churn_rate_pct
from bank_churn
group by IsActiveMember;
# 2 churn by credit Score Bucket
SELECT
    CASE
        WHEN CreditScore < 400 THEN 'Poor (<400)'
        WHEN CreditScore BETWEEN 400 AND 579 THEN 'Fair (400-579)'
        WHEN CreditScore BETWEEN 580 AND 669 THEN 'Good (580-669)'
        WHEN CreditScore BETWEEN 670 AND 739 THEN 'Very Good (670-739)'
        ELSE 'Excellent (740+)'
    END AS credit_bucket,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY credit_bucket
ORDER BY churn_rate_pct DESC;
# 3 Churn By Balance Bucket 
SELECT
    CASE
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance < 50000 THEN 'Low (<50k)'
        WHEN Balance BETWEEN 50000 AND 100000 THEN 'Mid (50k-100k)'
        WHEN Balance BETWEEN 100000 AND 150000 THEN 'High (100k-150k)'
        ELSE 'Very High (150k+)'
    END AS balance_bucket,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY balance_bucket
ORDER BY churn_rate_pct DESC;
# High Value Customers at risk
Select COUNT(*) as high_value_at_risk
from bank_churn
where Balance > 100000
and Exited = 1;
# Phase 4 
-- 1. High risk segment (most likely to churn)
SELECT COUNT(*) AS high_risk
FROM bank_churn
WHERE IsActiveMember = 0
AND Age BETWEEN 41 AND 60
AND Geography = 'Germany'
AND Exited = 0;

-- 2. Most loyal segment
SELECT COUNT(*) AS most_loyal
FROM bank_churn
WHERE IsActiveMember = 1
AND Age < 30
AND NumOfProducts = 2
AND Exited = 0; 

-- 3. High value retained customers
SELECT
    Geography,
    Gender,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(EstimatedSalary), 2) AS avg_salary,
    COUNT(*) AS total
FROM bank_churn
WHERE Exited = 0
AND Balance > 100000
GROUP BY Geography, Gender
ORDER BY avg_balance DESC;

-- 4. Summary: churned vs retained comparison
SELECT
    Exited,
    ROUND(AVG(Age), 1) AS avg_age,
    ROUND(AVG(CreditScore), 1) AS avg_creditscore,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(Tenure), 1) AS avg_tenure,
    ROUND(AVG(NumOfProducts), 2) AS avg_products
FROM bank_churn
GROUP BY Exited; 

