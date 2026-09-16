-- 1. Overtime Distribution

SELECT
    OverTime,
    COUNT(*) AS employee_count
FROM cleaned
GROUP BY OverTime
ORDER BY employee_count DESC;


-- 2. Attrition by Overtime

SELECT
    OverTime,
    Attrition,
    COUNT(*) AS employee_count
FROM cleaned
GROUP BY OverTime, Attrition
ORDER BY OverTime, Attrition;


-- 3. Attrition Rate by Overtime

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


-- 4. Overtime + Department

SELECT
    Department,
    OverTime,
    COUNT(*) AS employee_count,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY Department, OverTime
ORDER BY Department, OverTime;


-- 5. Overtime + Job Role

SELECT
    JobRole,
    OverTime,
    COUNT(*) AS employee_count,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM cleaned
GROUP BY JobRole, OverTime
ORDER BY JobRole, OverTime;