-- =====================================================
-- 09 - BUSINESS QUESTIONS
-- =====================================================


-- 1. Does Overtime Increase Attrition?

SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY OverTime
ORDER BY attrition_rate DESC;


-- 2. Which Department Has the Highest Attrition?

SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY Department
ORDER BY attrition_rate DESC;


-- 3. Which Job Roles Have the Highest Attrition?

SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY JobRole
ORDER BY attrition_rate DESC;


-- 4. Are Younger Employees More Likely to Leave?

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END
ORDER BY attrition_rate DESC;


-- 5. Does Lower Income Relate to Higher Attrition?

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN '3000-5999'
        WHEN MonthlyIncome BETWEEN 6000 AND 9999 THEN '6000-9999'
        WHEN MonthlyIncome BETWEEN 10000 AND 14999 THEN '10000-14999'
        ELSE '15000+'
    END AS income_range,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN '3000-5999'
        WHEN MonthlyIncome BETWEEN 6000 AND 9999 THEN '6000-9999'
        WHEN MonthlyIncome BETWEEN 10000 AND 14999 THEN '10000-14999'
        ELSE '15000+'
    END
ORDER BY attrition_rate DESC;


-- 6. Are New Employees More Likely to Leave?

SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END AS tenure_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END
ORDER BY attrition_rate DESC;


-- 7. Does Job Satisfaction Affect Attrition?

SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- 8. Does Business Travel Affect Attrition?

SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY BusinessTravel
ORDER BY attrition_rate DESC;


-- 9. Does Job Level Affect Attrition?

SELECT
    JobLevel,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY JobLevel
ORDER BY JobLevel;


-- 10. Does Work-Life Balance Affect Attrition?

SELECT
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


-- 11. Does Distance From Home Affect Attrition?

SELECT
    CASE
        WHEN DistanceFromHome <= 5 THEN '0-5 km'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN '11-20 km'
        ELSE '20+ km'
    END AS distance_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY
    CASE
        WHEN DistanceFromHome <= 5 THEN '0-5 km'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN '11-20 km'
        ELSE '20+ km'
    END
ORDER BY attrition_rate DESC;


-- 12. Does Marital Status Affect Attrition?

SELECT
    MaritalStatus,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY MaritalStatus
ORDER BY attrition_rate DESC;