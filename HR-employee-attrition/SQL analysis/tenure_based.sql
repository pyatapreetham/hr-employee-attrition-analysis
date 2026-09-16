-- =====================================================
-- 07 - TENURE ANALYSIS
-- =====================================================


-- 1. Employee Count by Tenure Group

SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END AS tenure_group,
    COUNT(*) AS employee_count
FROM cleaned
GROUP BY
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END
ORDER BY employee_count DESC;


-- 2. Attrition by Tenure Group

SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END AS tenure_group,
    Attrition,
    COUNT(*) AS employee_count
FROM cleaned
GROUP BY
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END,
    Attrition
ORDER BY tenure_group, Attrition;


-- 3. Attrition Rate by Tenure Group

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


-- 4. Average Income by Tenure Group

SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END AS tenure_group,
    ROUND(AVG(MonthlyIncome), 2) AS average_income
FROM cleaned
GROUP BY
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 years'
        WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END
ORDER BY average_income DESC;


-- 5. High-Risk Tenure Groups
-- High-risk = Tenure groups with attrition rate
-- above the overall company attrition rate

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
HAVING
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
    / COUNT(*) >
    (
        SELECT
            SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
            / COUNT(*)
        FROM cleaned
    )
ORDER BY attrition_rate DESC;