-- =====================================================
-- 10 - ROOT CAUSE ANALYSIS
-- =====================================================


-- 1. Overtime + Job Satisfaction + Attrition

SELECT
    OverTime,
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY OverTime, JobSatisfaction
ORDER BY attrition_rate DESC;


-- 2. Overtime + Job Role + Attrition

SELECT
    OverTime,
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY OverTime, JobRole
ORDER BY attrition_rate DESC;


-- 3. Job Level + Monthly Income + Attrition

SELECT
    JobLevel,
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY
    JobLevel,
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN 'Medium Income'
        ELSE 'High Income'
    END
ORDER BY attrition_rate DESC;


-- 4. Years at Company + Job Satisfaction + Attrition

SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END AS tenure_group,
    JobSatisfaction,
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
    END,
    JobSatisfaction
ORDER BY attrition_rate DESC;


-- 5. Business Travel + Overtime + Attrition

SELECT
    BusinessTravel,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY BusinessTravel, OverTime
ORDER BY attrition_rate DESC;


-- 6. Age Group + Overtime + Attrition

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    OverTime,
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
    END,
    OverTime
ORDER BY attrition_rate DESC;


-- 7. Job Satisfaction + Work-Life Balance + Attrition

SELECT
    JobSatisfaction,
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY JobSatisfaction, WorkLifeBalance
ORDER BY attrition_rate DESC;


-- 8. Distance From Home + Overtime + Attrition

SELECT
    CASE
        WHEN DistanceFromHome <= 5 THEN '0-5 km'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN '11-20 km'
        ELSE '20+ km'
    END AS distance_group,
    OverTime,
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
    END,
    OverTime
ORDER BY attrition_rate DESC;


-- 9. Low Income + Overtime + Attrition

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        ELSE 'Higher Income'
    END AS income_group,
    OverTime,
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
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        ELSE 'Higher Income'
    END,
    OverTime
ORDER BY attrition_rate DESC;


-- 10. Overall High-Risk Employee Profile
-- Overtime + Low Satisfaction + Short Tenure + Low Income

SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
WHERE
    OverTime = 'Yes'
    AND JobSatisfaction <= 2
    AND YearsAtCompany < 5
    AND MonthlyIncome < 3000;
    
    
    
    
SELECT * FROM CLEANED;