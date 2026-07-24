CREATE DATABASE hr_analytics;
USE hr_analytics;
SHOW TABLES;
SHOW CREATE TABLE staging_hr;

TRUNCATE TABLE staging_hr;

SELECT COUNT(*) FROM staging_hr;

ALTER TABLE staging_hr
RENAME COLUMN ï»¿Age TO Age;

DESCRIBE staging_hr;

SELECT EmployeeNumber, COUNT(*) AS duplicate_count
FROM staging_hr
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS Total_Employees
FROM staging_hr;

SELECT Attrition,Department
FROM staging_hr
WHERE Attrition ='Yes';

SELECT Department,
COUNT(*) AS Attrition_Count
FROM staging_hr
WHERE Attrition ='Yes'
GROUP BY Department;

SELECT Department,
COUNT(*) AS Attrition_Count
FROM staging_hr
WHERE Attrition ='NO'   
GROUP BY Department;

SELECT 
SUM(Age IS NULL) AS Age_Nulls,
SUM(Attrition IS NULL) AS Attrition_Nulls,
SUM(Department IS NULL) AS Department_Nulls,
SUM(JobRole IS NULL) AS Jobrole_Nulls,
SUM(Gender IS NULL) AS Gender_Nulls,
SUM(MaritalStatus IS NULL) AS MaritalStatus_Nulls
FROM staging_hr;

SELECT *
FROM staging_hr
WHERE Department =' '
OR Attrition =' '
OR JobRole =' '
OR Gender =' '
OR MaritalStatus=' ';

SELECT DISTINCT Attrition
FROM staging_hr;

SELECT DISTINCT Gender
FROM staging_hr;

SELECT DISTINCT Department
FROM staging_hr;

SELECT *
FROM staging_hr
WHERE Department <> TRIM(Department)
OR JobRole <> TRIM(JobRole)
OR Gender <> TRIM(Gender)
OR Attrition <> TRIM(Attrition);

SELECT 
MIN(Age) AS MinAge,
MAX(Age) AS MaxAge
FROM staging_hr;

SELECT DISTINCT Over18
FROM staging_hr;

SELECT 
MIN(MonthlyIncome) AS MinIncome,
MAX(MonthlyIncome) AS MaxIncome
FROM staging_hr;

SELECT MIN(YearsAtCompany) AS MinYears,
MAX(YearsAtCompany) AS MaxYears
FROM staging_hr;

SELECT
MIN(DistanceFromHome),
MAX(DistanceFromHome)
FROM staging_hr;

SELECT COUNT(*) AS EmployeeCount
FROM staging_hr
WHERE Age < 18
OR Age > 50;

SELECT *
FROM staging_hr
WHERE MonthlyIncome <=0;

SELECT EmployeeNumber,
COUNT(*) AS DuplicateCount
FROM staging_hr
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS Employeebelow30
FROM staging_hr
WHERE Age >= 18
AND Age <=20;

SELECT COUNT(*) AS TotalEmployees
FROM staging_hr;

SELECT COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition='Yes';

SELECT COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition='No';

SELECT
ROUND(COUNT(CASE WHEN Attrition ='Yes' THEN 1 END)*100.0/COUNT(*),2)AS AttritionRate
FROM staging_hr;

SELECT CONCAT(
ROUND(COUNT(CASE WHEN Attrition ='Yes' THEN 1 END)*100.0/COUNT(*),2), '%')AS AttritionRate
FROM staging_hr;

SELECT Department,
COUNT(*) AS Employees
FROM staging_hr
GROUP BY Department
ORDER BY Employees DESC;

SELECT Gender,
COUNT(*) AS Employees
FROM staging_hr
GROUP BY Gender;

SELECT MaritalStatus,
COUNT(*) AS Employees
FROM staging_hr
GROUP BY MaritalStatus
ORDER BY Employees DESC;

SELECT JobRole,
COUNT(*) AS Employees,(SELECT COUNT(*) FROM staging_hr) AS TotalEmployees
FROM staging_hr
GROUP BY JobRole
ORDER BY Employees DESC;

SELECT Gender,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition = 'YES'
GROUP BY Gender;

SELECT MaritalStatus,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition ='Yes'
GROUP BY MaritalStatus;

SELECT JobRole,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY AttritionCount DESC;

SELECT EducationField, COUNT(*) As AttritionCount
FROM staging_hr
WHERE Attrition = 'Yes'
GROUP BY EducationField
order by AttritionCount DESC;

SELECT BusinessTravel,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition='Yes'
GROUP BY BusinessTravel;

SELECT OverTime,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition='Yes'
GROUP BY OverTime;

SELECT
CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
WHEN Age BETWEEN 46 AND 55 THEN '46-55'
ELSE '56-60'
END AS AgeGroup,

COUNT(*) AS Employees

FROM staging_hr
GROUP BY AgeGroup;

SELECT
CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
WHEN Age BETWEEN 46 AND 55 THEN '46-55'
ELSE '56-60'
END AS AgeGroup,

COUNT(*) AS AttritionCount

FROM staging_hr

WHERE Attrition='Yes'

GROUP BY AgeGroup;

SELECT ROUND(AVG(Age),2) AS AverageAge
from staging_hr;

SELECT Department,
ROUND(AVG(MonthlyIncome),2) AS AvgSalary
FROM staging_hr
GROUP BY Department;

SELECT JobRole,
ROUND(AVG(MonthlyIncome),2) AS AvgJobrolesalary
FROM staging_hr
GROUP BY JobRole;

SELECT ROUND(AVG(YearsAtCompany),2) AS Avgyears
FROM staging_hr;

SELECT Department,
ROUND(AVG(YearsAtCompany),2) AS Avgyears
FROM staging_hr
GROUP BY Department;

SELECT JobSatisfaction,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition ='Yes'
group by JobSatisfaction
ORDER BY JobSatisfaction ASC;

SELECT WorkLifeBalance,
COUNT(*) AS Attritioncount
FROM staging_hr
where Attrition ='Yes' AND Attrition >2
group by WorkLifeBalance;

SELECT DISTINCT BusinessTravel
FROM staging_hr;

SELECT
CASE
WHEN BusinessTravel ='Travel_Frequently' THEN 'frequently'
WHEN BusinessTravel ='Travel_Rarely' THEN 'rarely'
WHEN BusinessTravel ='Non-Travel' THEN 'no travel'
END AS TravelType,
COUNT(*) AS TravelAttrition
FROM staging_hr
WHERE Attrition = 'Yes' 
GROUP BY TravelType;

SELECT distinct YearsSinceLastPromotion
from staging_hr;

SELECT YearsSinceLastPromotion,
count(*) AS Nopromotion
From staging_hr
WHERE Attrition = 'Yes'
GROUP BY YearsSinceLastPromotion
order by YearsSinceLastPromotion;

SELECT YearsSinceLastPromotion,
count(*) AS Nopromotion
From staging_hr
WHERE Attrition = 'No'
GROUP BY YearsSinceLastPromotion
order by YearsSinceLastPromotion;

SELECT distinct PerformanceRating
from staging_hr;

SELECT PerformanceRating,
count(*) AS PerformanceAttrition
from staging_hr
where Attrition = 'Yes' AND PerformanceRating >=3
group by PerformanceRating;

select distinct PercentSalaryHike
from staging_hr;

select PercentSalaryHike,
count(*) as salaryAttrition
from staging_hr
WHERE PercentSalaryHike <=15
group by PercentSalaryHike
order by PercentSalaryHike;

select PercentSalaryHike,count(*) as totalemployees,
SUM(CASE WHEN Attrition ='Yes' then 1 else 0 end) as Attritioncount,
round(sum(case when Attrition ='Yes' then 1 else 0 end)* 100.0/count(*),2)as Attritionrate
from staging_hr
group by PercentSalaryHike
order by PercentSalaryHike;

SELECT Attrition,
ROUND(AVG(MonthlyIncome),2) AS AverageSalary
FROM staging_hr
GROUP BY Attrition;

select distinct DistanceFromHome
from staging_hr
order by DistanceFromHome;

select
case
when DistanceFromHome <=5 then '0-5 km'
when DistanceFromHome <=10 then '6-10 km'
when DistanceFromHome <=15 then '11-15 km'
when DistanceFromHome <=20 then '16-20 km'
else '25+ km'
end as distancegroup,
count(*) as Employees,
sum(case when Attrition ='Yes' then 1 else 0 end) as Attritioncount
from staging_hr
group by Distancegroup
order by Distancegroup asc;

CREATE DATABASE hr_analytics;
USE hr_analytics;
SHOW TABLES;
SHOW CREATE TABLE staging_hr;

TRUNCATE TABLE staging_hr;

SELECT COUNT(*) FROM staging_hr;

ALTER TABLE staging_hr
RENAME COLUMN ï»¿Age TO Age;

DESCRIBE staging_hr;

SELECT EmployeeNumber, COUNT(*) AS duplicate_count
FROM staging_hr
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS Total_Employees
FROM staging_hr;

SELECT Attrition,Department
FROM staging_hr
WHERE Attrition ='Yes';

SELECT Department,
COUNT(*) AS Attrition_Count
FROM staging_hr
WHERE Attrition ='Yes'
GROUP BY Department;

SELECT Department,
COUNT(*) AS Attrition_Count
FROM staging_hr
WHERE Attrition ='NO'   
GROUP BY Department;

SELECT 
SUM(Age IS NULL) AS Age_Nulls,
SUM(Attrition IS NULL) AS Attrition_Nulls,
SUM(Department IS NULL) AS Department_Nulls,
SUM(JobRole IS NULL) AS Jobrole_Nulls,
SUM(Gender IS NULL) AS Gender_Nulls,
SUM(MaritalStatus IS NULL) AS MaritalStatus_Nulls
FROM staging_hr;

SELECT *
FROM staging_hr
WHERE Department =' '
OR Attrition =' '
OR JobRole =' '
OR Gender =' '
OR MaritalStatus=' ';

SELECT DISTINCT Attrition
FROM staging_hr;

SELECT DISTINCT Gender
FROM staging_hr;

SELECT DISTINCT Department
FROM staging_hr;

SELECT *
FROM staging_hr
WHERE Department <> TRIM(Department)
OR JobRole <> TRIM(JobRole)
OR Gender <> TRIM(Gender)
OR Attrition <> TRIM(Attrition);

SELECT 
MIN(Age) AS MinAge,
MAX(Age) AS MaxAge
FROM staging_hr;

SELECT DISTINCT Over18
FROM staging_hr;

SELECT 
MIN(MonthlyIncome) AS MinIncome,
MAX(MonthlyIncome) AS MaxIncome
FROM staging_hr;

SELECT MIN(YearsAtCompany) AS MinYears,
MAX(YearsAtCompany) AS MaxYears
FROM staging_hr;

SELECT
MIN(DistanceFromHome),
MAX(DistanceFromHome)
FROM staging_hr;

SELECT COUNT(*) AS EmployeeCount
FROM staging_hr
WHERE Age < 18
OR Age > 50;

SELECT *
FROM staging_hr
WHERE MonthlyIncome <=0;

SELECT EmployeeNumber,
COUNT(*) AS DuplicateCount
FROM staging_hr
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS Employeebelow30
FROM staging_hr
WHERE Age >= 18
AND Age <=20;

SELECT COUNT(*) AS TotalEmployees
FROM staging_hr;

SELECT COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition='Yes';

SELECT COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition='No';

SELECT
ROUND(COUNT(CASE WHEN Attrition ='Yes' THEN 1 END)*100.0/COUNT(*),2)AS AttritionRate
FROM staging_hr;

SELECT CONCAT(
ROUND(COUNT(CASE WHEN Attrition ='Yes' THEN 1 END)*100.0/COUNT(*),2), '%')AS AttritionRate
FROM staging_hr;

SELECT Department,
COUNT(*) AS Employees
FROM staging_hr
GROUP BY Department
ORDER BY Employees DESC;

SELECT Gender,
COUNT(*) AS Employees
FROM staging_hr
GROUP BY Gender;

SELECT MaritalStatus,
COUNT(*) AS Employees
FROM staging_hr
GROUP BY MaritalStatus
ORDER BY Employees DESC;

SELECT JobRole,
COUNT(*) AS Employees,(SELECT COUNT(*) FROM staging_hr) AS TotalEmployees
FROM staging_hr
GROUP BY JobRole
ORDER BY Employees DESC;

SELECT Gender,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition = 'YES'
GROUP BY Gender;

SELECT MaritalStatus,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition ='Yes'
GROUP BY MaritalStatus;

SELECT JobRole,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY AttritionCount DESC;

SELECT EducationField, COUNT(*) As AttritionCount
FROM staging_hr
WHERE Attrition = 'Yes'
GROUP BY EducationField
order by AttritionCount DESC;

SELECT BusinessTravel,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition='Yes'
GROUP BY BusinessTravel;

SELECT OverTime,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition='Yes'
GROUP BY OverTime;

SELECT
CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
WHEN Age BETWEEN 46 AND 55 THEN '46-55'
ELSE '56-60'
END AS AgeGroup,

COUNT(*) AS Employees

FROM staging_hr
GROUP BY AgeGroup;

SELECT
CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
WHEN Age BETWEEN 46 AND 55 THEN '46-55'
ELSE '56-60'
END AS AgeGroup,

COUNT(*) AS AttritionCount

FROM staging_hr

WHERE Attrition='Yes'

GROUP BY AgeGroup;

SELECT ROUND(AVG(Age),2) AS AverageAge
from staging_hr;

SELECT Department,
ROUND(AVG(MonthlyIncome),2) AS AvgSalary
FROM staging_hr
GROUP BY Department;

SELECT JobRole,
ROUND(AVG(MonthlyIncome),2) AS AvgJobrolesalary
FROM staging_hr
GROUP BY JobRole;

SELECT ROUND(AVG(YearsAtCompany),2) AS Avgyears
FROM staging_hr;

SELECT Department,
ROUND(AVG(YearsAtCompany),2) AS Avgyears
FROM staging_hr
GROUP BY Department;

SELECT JobSatisfaction,
COUNT(*) AS AttritionCount
FROM staging_hr
WHERE Attrition ='Yes'
group by JobSatisfaction
ORDER BY JobSatisfaction ASC;

SELECT WorkLifeBalance,
COUNT(*) AS Attritioncount
FROM staging_hr
where Attrition ='Yes' AND Attrition >2
group by WorkLifeBalance;

SELECT DISTINCT BusinessTravel
FROM staging_hr;

SELECT
CASE
WHEN BusinessTravel ='Travel_Frequently' THEN 'frequently'
WHEN BusinessTravel ='Travel_Rarely' THEN 'rarely'
WHEN BusinessTravel ='Non-Travel' THEN 'no travel'
END AS TravelType,
COUNT(*) AS TravelAttrition
FROM staging_hr
WHERE Attrition = 'Yes' 
GROUP BY TravelType;

SELECT distinct YearsSinceLastPromotion
from staging_hr;

SELECT YearsSinceLastPromotion,
count(*) AS Nopromotion
From staging_hr
WHERE Attrition = 'Yes'
GROUP BY YearsSinceLastPromotion
order by YearsSinceLastPromotion;

SELECT YearsSinceLastPromotion,
count(*) AS Nopromotion
From staging_hr
WHERE Attrition = 'No'
GROUP BY YearsSinceLastPromotion
order by YearsSinceLastPromotion;

SELECT distinct PerformanceRating
from staging_hr;

SELECT PerformanceRating,
count(*) AS PerformanceAttrition
from staging_hr
where Attrition = 'Yes' AND PerformanceRating >=3
group by PerformanceRating;

select distinct PercentSalaryHike
from staging_hr;

select PercentSalaryHike,
count(*) as salaryAttrition
from staging_hr
WHERE PercentSalaryHike <=15
group by PercentSalaryHike
order by PercentSalaryHike;

select PercentSalaryHike,count(*) as totalemployees,
SUM(CASE WHEN Attrition ='Yes' then 1 else 0 end) as Attritioncount,
round(sum(case when Attrition ='Yes' then 1 else 0 end)* 100.0/count(*),2)as Attritionrate
from staging_hr
group by PercentSalaryHike
order by PercentSalaryHike;

SELECT Attrition,
ROUND(AVG(MonthlyIncome),2) AS AverageSalary
FROM staging_hr
GROUP BY Attrition;

select distinct DistanceFromHome
from staging_hr
order by DistanceFromHome;

select
case
when DistanceFromHome <=5 then '0-5 km'
when DistanceFromHome <=10 then '6-10 km'
when DistanceFromHome <=15 then '11-15 km'
when DistanceFromHome <=20 then '16-20 km'
else '25+ km'
end as distancegroup,
count(*) as Employees,
sum(case when Attrition ='Yes' then 1 else 0 end) as Attritioncount
from staging_hr
group by Distancegroup
order by Distancegroup asc;


 









 







