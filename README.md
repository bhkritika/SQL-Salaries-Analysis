# SQL Salaries Analysis

## Project Overview
This project involves performing various SQL queries and analyses on a dataset of employee salaries. The dataset includes information such as employee names, job titles, base pay, overtime pay, total pay, benefits, and more.

## Dataset
The dataset contains the following columns:
- `Id`
- `EmployeeName`
- `JobTitle`
- `BasePay`
- `OvertimePay`
- `OtherPay`
- `Benefits`
- `TotalPay`
- `TotalPayBenefits`
- `Year`
- `Notes`
- `Agency`
- `Status`

## SQL Queries and Analyses
1. **Show all columns and rows in the table**
    ```sql
    SELECT * FROM salaries;
    ```
2. **Show only the EmployeeName and JobTitle columns**
    ```sql
    SELECT EmployeeName, JobTitle FROM salaries;
    ```
3. **Show the number of employees in the table**
    ```sql
    SELECT COUNT(*) FROM salaries;
    ```
4. **Show the unique job titles in the table**
    ```sql
    SELECT DISTINCT JobTitle FROM salaries;
    ```
5. **Show the job title and overtime pay for all employees with overtime pay greater than 50,000**
    ```sql
    SELECT JobTitle, OvertimePay FROM salaries WHERE OvertimePay > 50000;
    ```
    
## Additional Analyses
1. **Total Pay and Total Benefits by Job Title**
    ```sql
    SELECT JobTitle, SUM(TotalPay) AS TotalPay, SUM(Benefits) AS TotalBenefits FROM salaries GROUP BY JobTitle ORDER BY TotalPay DESC;
    ```
2. **Total Compensation for each Year**
    ```sql
    SELECT Year, SUM(TotalPayBenefits) AS TotalCompensation FROM salaries GROUP BY Year ORDER BY Year;
    ```
3. **Employees with Base Pay greater than Average Base Pay**
    ```sql
    SELECT EmployeeName, BasePay FROM salaries WHERE BasePay > (SELECT AVG(BasePay) FROM salaries) ORDER BY BasePay DESC;
    ```
4. **Job Titles with the highest average Overtime Pay**
    ```sql
    SELECT JobTitle, AVG(OvertimePay) AS AvgOvertimePay FROM salaries GROUP BY JobTitle ORDER BY AvgOvertimePay DESC LIMIT 10;
    ```
5. **Top 5 Agencies by Total Pay Benefits**
    ```sql
    SELECT Agency, SUM(TotalPayBenefits) AS TotalPayBenefits FROM salaries GROUP BY Agency ORDER BY TotalPayBenefits DESC LIMIT 5;
    ```

## How to Run the Queries
1. Clone this repository to your local machine.
    ```sh
    git clone https://github.com/yourusername/SQL-Salaries-Analysis.git
    ```
2. Navigate to the `sql` directory.
    ```sh
    cd SQL-Salaries-Analysis/sql
    ```
3. Execute the SQL scripts in your preferred SQL environment.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

 
