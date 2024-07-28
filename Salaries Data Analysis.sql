create database data_new

SELECT * FROM data_new.salaries

USE data_new

-- 1	Show all columns and rows in the table.
SELECT * from salaries ;

-- 2	Show only the EmployeeName and JobTitle columns.
SELECT EmployeeName,JobTitle from salaries;

-- 3	Show the number of employees in the table.
SELECT count(*) from salaries;

-- 4	Show the unique job titles in the table.
SELECT distinct JobTitle from salaries;

-- 5	Show the job title and overtime pay for all employees with overtime pay greater than 50000.
SELECT JobTitle,OvertimePay FROM salaries
WHERE OvertimePay > 50000;

-- 6	Show the average base pay for all employees.
SELECT AVG(BasePay) as "Avg BasePay" FROM salaries;

-- 7	Show the top 10 highest paid employees.
SELECT EmployeeName,TotalPay FROM salaries
ORDER BY TotalPay DESC
LIMIT 10;

-- 8	Show the average of BasePay, OvertimePay, and OtherPay for each employee:
SELECT EmployeeName, (BasePay + OvertimePay + OtherPay)/3 AS avg_of_bp_op_otherpay FROM salaries;

-- 9	Show all employees who have the word "Manager" in their job title.
SELECT EmployeeName,JobTitle FROM salaries
WHERE JobTitle LIKE '%Manager%';

-- 10	Show all employees with a job title not equal to "Manager".
SELECT EmployeeName,JobTitle FROM salaries
WHERE JobTitle <>'Manager';

-- 11	Show all employees with a total pay between 50,000 and 75,000.
SELECT * FROM salaries
WHERE TotalPay>=50000 AND TotalPay <=75000
;
SELECT * FROM salaries
WHERE TotalPay BETWEEN 50000 AND 75000;

-- 12	Show all employees with a base pay less than 50,000 or a total pay greater than 100,000.
SELECT * FROM salaries
WHERE BasePay < 50000 OR TotalPay > 100000;

-- 13	Show all employees with a total pay benefits value between 125,000 and 150,000 and a job title containing the word "Director".
SELECT * FROM salaries
WHERE TotalPayBenefits BETWEEN 125000 AND 150000 
AND JobTitle LIKE "%Director%" ;

-- 14	Show all employees ordered by their total pay benefits in descending order.
SELECT * FROM salaries
ORDER BY TotalPayBenefits DESC;

-- 15	Show all job titles with an average base pay of at least 100,000 and order them by the average base pay in descending order.
SELECT JobTitle, AVG(BasePay) AS "avgbasepay" FROM salaries
GROUP  BY  JobTitle
HAVING AVG(BasePay) >=100000
ORDER BY avgbasepay DESC;

-- 16	Delete the column.
SELECT * FROM salaries;
ALTER TABLE salaries
DROP COLUMN Notes;
SELECT * FROM salaries;

-- 17	Update the base pay of all employees with the job title containing "Manager" by increasing it by 10%.
UPDATE salaries
SET BasePay = BasePay * 1.1
WHERE JobTitle Like "%Manager%";
SELECT * FROM salaries;

-- 18	Delete all employees who have no OvertimePay.
SELECT count(*) FROM salaries
WHERE OvertimePay =0;
DELETE FROM salaries
WHERE OvertimePay =0;
SELECT count(*) FROM salaries
WHERE OvertimePay =0;

-- 19 Total Pay and Total Benefits by Job Title:
SELECT JobTitle, SUM(TotalPay) AS TotalPay, SUM(Benefits) AS TotalBenefits
FROM salaries
GROUP BY JobTitle
ORDER BY TotalPay DESC;

-- 20 Total Compensation for each Year:
SELECT Year, SUM(TotalPayBenefits) AS TotalCompensation
FROM salaries
GROUP BY Year
ORDER BY Year;

-- 21 Employees with Base Pay greater than Average Base Pay:
SELECT EmployeeName, BasePay
FROM salaries
WHERE BasePay > (SELECT AVG(BasePay) FROM salaries)
ORDER BY BasePay DESC;

-- 22 Job Titles with the highest average Overtime Pay:
SELECT JobTitle, AVG(OvertimePay) AS AvgOvertimePay
FROM salaries
GROUP BY JobTitle
ORDER BY AvgOvertimePay DESC
LIMIT 10;

-- 23 Top 5 Agencies by Total Pay Benefits:
SELECT Agency, SUM(TotalPayBenefits) AS TotalPayBenefits
FROM salaries
GROUP BY Agency
ORDER BY TotalPayBenefits DESC
LIMIT 5;

-- 24 Average Base Pay by Year:
SELECT Year, AVG(BasePay) AS AvgBasePay
FROM salaries
GROUP BY Year
ORDER BY Year;

-- 25 Count of Employees with Benefits greater than 20,000:
SELECT COUNT(*) AS EmployeeCount
FROM salaries
WHERE Benefits > 20000;

-- 26 Top 5 Job Titles by Total Number of Employees:
SELECT JobTitle, COUNT(*) AS EmployeeCount
FROM salaries
GROUP BY JobTitle
ORDER BY EmployeeCount DESC
LIMIT 5;

-- 27 Employees with the highest Total Pay Benefits in each Year:
SELECT Year, EmployeeName, TotalPayBenefits
FROM (
    SELECT Year, EmployeeName, TotalPayBenefits,
           ROW_NUMBER() OVER (PARTITION BY Year ORDER BY TotalPayBenefits DESC) AS rn
    FROM salaries
) AS ranked
WHERE rn = 1;

-- 28 Average Base Pay, Overtime Pay, and Other Pay by Year:
SELECT Year, AVG(BasePay) AS AvgBasePay, AVG(OvertimePay) AS AvgOvertimePay, AVG(OtherPay) AS AvgOtherPay
FROM salaries
GROUP BY Year
ORDER BY Year;

-- 29 Total Pay and Benefits by Agency:
SELECT Agency, SUM(TotalPay) AS TotalPay, SUM(Benefits) AS TotalBenefits
FROM salaries
GROUP BY Agency
ORDER BY TotalPay DESC;

-- 30 Top 5 Employees with the highest Benefits: 
SELECT EmployeeName, Benefits
FROM salaries
ORDER BY Benefits DESC
LIMIT 5;

-- 31 Job Titles with Total Pay Benefits above the average:
SELECT JobTitle, SUM(TotalPayBenefits) AS TotalPayBenefits
FROM salaries
GROUP BY JobTitle
HAVING SUM(TotalPayBenefits) > (SELECT AVG(TotalPayBenefits) FROM salaries)
ORDER BY TotalPayBenefits DESC;

-- 32 Yearly growth in Total Pay Benefits:
SELECT Year, SUM(TotalPayBenefits) AS TotalPayBenefits,
       LAG(SUM(TotalPayBenefits)) OVER (ORDER BY Year) AS PreviousYearTotalPayBenefits,
       SUM(TotalPayBenefits) - LAG(SUM(TotalPayBenefits)) OVER (ORDER BY Year) AS Growth
FROM salaries
GROUP BY Year
ORDER BY Year;

-- 33 Average Overtime Pay for Employees with Job Titles containing 'Supervisor':
SELECT AVG(OvertimePay) AS AvgOvertimePay
FROM salaries
WHERE JobTitle LIKE '%Supervisor%';

