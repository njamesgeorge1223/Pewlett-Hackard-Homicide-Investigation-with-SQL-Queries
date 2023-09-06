--******************************************************************************************
--
--  File Name:  EmployeeQueries.sql
--
--  File Description:
--      The file contains the SQL script to run queries for the Pewlett Hackard
--      SQL Challenge.
--
--
--  Date               Description                              Programmer
--  ---------------    ------------------------------------     ------------------
--  09/05/2023         Initial Development                      N. James George
--
--******************************************************************************************/

-- This statement lists the employee number, last name, first name, sex, and salary 
-- of each employee.
SELECT 
	Employees.employeeIDNumber, 
	Employees.lastName, 
	Employees.firstName,  
	Employees.sex, 
	EmployeeSalaries.employeeSalary
FROM Employees
	JOIN EmployeeSalaries
		ON Employees.employeeIDNumber = EmployeeSalaries.employeeIDNumber;

-- This statement lists the first name, last name, and hire date for the employees 
-- who were hired in 1986.
SELECT
	Employees.firstName, 
	Employees.lastName, 
	Employees.hireDate 
FROM Employees
	WHERE EXTRACT(YEAR FROM Employees.hireDate) = 1986;

-- This statement lists the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT
	DepartmentManagers.departmentID, 
	Departments.departmentName, 
	Employees.employeeIDNumber, 
	Employees.lastName, 
	Employees.firstName
FROM Employees
	JOIN DepartmentManagers
		ON Employees.employeeIDNumber = DepartmentManagers.employeeIDNumber
	JOIN Departments
		ON DepartmentManagers.departmentID = Departments.departmentID;

-- This statement lists the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
SELECT 
	Departments.departmentID, 
	Employees.employeeIDNumber, 
	Employees.lastName, 
	Employees.firstName,  
	Departments.departmentName
FROM Employees
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = departments.departmentID;

-- This statement lists the first name, last name, and sex of each employee whose first name 
-- is Hercules and whose last name begins with the letter B.
SELECT 
	Employees.firstName, 
	Employees.lastName, 
	Employees.sex 
FROM Employees
	WHERE firstName = 'Hercules' AND lastName like 'B%';

-- This statement lists each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT 
	Employees.employeeIDNumber, 
	Employees.lastName,
	Employees.firstName 
FROM employees
		JOIN DepartmentIDPerEmployee
			ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
		JOIN Departments
			ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
				WHERE departmentName = 'Sales';

-- This statement lists each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT 
	Employees.employeeIDNumber, 
	Employees.lastName,
	Employees.firstName,
	Departments.departmentName
FROM Employees
	join DepartmentIDPerEmployee
		on Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	join Departments
		on DepartmentIDPerEmployee.departmentID = Departments.departmentID
			where departmentName IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names 
-- (id est, how many employees share each last name).
SELECT 
	lastName, 
	COUNT(lastName) 
		AS lastNameFrequencyCount
FROM Employees
	GROUP BY lastName
		ORDER BY lastNameFrequencyCount DESC;