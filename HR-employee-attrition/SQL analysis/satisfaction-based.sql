-- =====================================================
-- 08 - SATISFACTION ANALYSIS
-- =====================================================


-- 1. Employee Count by Job Satisfaction

SELECT
    JobSatisfaction,
    COUNT(*) AS employee_count
FROM cleaned
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- 2. Attrition by Job Satisfaction

SELECT
    JobSatisfaction,
    Attrition,
    COUNT(*) AS employee_count
FROM cleaned
GROUP BY JobSatisfaction, Attrition
ORDER BY JobSatisfaction, Attrition;


-- 3. Attrition Rate by Job Satisfaction

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
ORDER BY attrition_rate DESC;


-- 4. Average Income by Job Satisfaction

SELECT
    JobSatisfaction,
    ROUND(AVG(MonthlyIncome), 2) AS average_income
FROM cleaned
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- 5. High-Risk Satisfaction Levels
-- High-risk = satisfaction levels with attrition
-- above the overall company attrition rate

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