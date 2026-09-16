-- Total employees

SELECT COUNT(*) AS total_employees
FROM cleaned;

-- total No of Employees by department

select department , count(*)as Employees
from cleaned
group by department;

-- Employees by attrition

select attrition,count(*)as employees_count
from cleaned
group by attrition
order by employees_count DESC;


-- Overall attrition rate
SELECT
    COUNT(*) AS total_employees,
   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
       100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
      2
    ) AS attrition_rate
FROM cleaned;

-- Avg salary of attrition employees

select  ROUND(avg(monthlyincome),2)as avg_monthly_salary
from cleaned
where attrition='Yes';




