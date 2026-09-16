-- Employees by department

select department,count(*)as total_employees
from cleaned
group by department;

-- Attrition by department 

 SELECT
    Department,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM cleaned
GROUP BY Department
ORDER BY employees_left DESC;

-- Attrition Rate by Department

SELECT
   Department,
    COUNT(*) AS total_employees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
   ROUND(
       100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
      / COUNT(*),
       2
   ) AS attrition_rate
FROM cleaned
GROUP BY Department
ORDER BY attrition_rate DESC;

--Average Income by Department

SELECT
    Department,
   ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM cleaned
GROUP BY Department
ORDER BY avg_monthly_income DESC;

-- Average Satisfaction by Department

SELECT
    Department,
    ROUND(AVG(JobSatisfaction), 2) AS avg_job_satisfaction,
    ROUND(AVG(EnvironmentSatisfaction), 2) AS avg_environment_satisfaction,
    ROUND(AVG(RelationshipSatisfaction), 2) AS avg_relationship_satisfaction,
    ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance
FROM cleaned
GROUP BY Department
ORDER BY Department;

-- Department + Overtime + Attrition 

SELECT
  Department,
   OverTime,
   COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
  ) AS attrition_rate
FROM cleaned
GROUP BY Department, OverTime
ORDER BY Department, attrition_rate DESC;

-- Department + Job Role + Attrition

SELECT
    Department,
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
       100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
       / COUNT(*),
       2
   ) AS attrition_rate
FROM cleaned
GROUP BY Department, JobRole
ORDER BY Department,attrition_rate DESC;

