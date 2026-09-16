-- 1. Employee Count by Job Role

SELECT
    JobRole,
    COUNT(*) AS employee_count
FROM cleaned
GROUP BY JobRole
ORDER BY employee_count DESC;


-- 2. Attrition by Job Role

SELECT
    JobRole,
    Attrition,
    COUNT(*) AS employee_count
FROM cleaned
GROUP BY JobRole, Attrition
ORDER BY JobRole, Attrition;


-- 3. Attrition Rate by Job Role

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


-- 4. Average Income by Job Role

SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS average_income
FROM cleaned
GROUP BY JobRole
ORDER BY average_income DESC;


-- 5. High-Risk Job Roles
-- High-risk = Job roles with attrition rate above overall company attrition rate

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