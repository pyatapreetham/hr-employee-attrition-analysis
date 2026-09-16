-- =====================================================
-- 06 - INCOME ANALYSIS
-- =====================================================


-- 1. Average Income Overall

SELECT
    ROUND(AVG(MonthlyIncome), 2) AS average_income
FROM cleaned;


-- 2. Average Income by Department

SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS average_income
FROM cleaned
GROUP BY Department
ORDER BY average_income DESC;


-- 3. Average Income by Job Role

SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS average_income
FROM cleaned
GROUP BY JobRole
ORDER BY average_income DESC;


-- 4. Attrition by Income Range

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN '3000-5999'
        WHEN MonthlyIncome BETWEEN 6000 AND 9999 THEN '6000-9999'
        WHEN MonthlyIncome BETWEEN 10000 AND 14999 THEN '10000-14999'
        ELSE '15000+'
    END AS income_range,
    Attrition,
    COUNT(*) AS employee_count
FROM  cleaned
GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN '3000-5999'
        WHEN MonthlyIncome BETWEEN 6000 AND 9999 THEN '6000-9999'
        WHEN MonthlyIncome BETWEEN 10000 AND 14999 THEN '10000-14999'
        ELSE '15000+'
    END,
    Attrition
ORDER BY income_range, Attrition;


-- 5. Attrition Rate by Income Range

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


-- 6. High-Risk Income Ranges
-- High-risk = Income ranges with attrition rate
-- above the overall company attrition rate

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