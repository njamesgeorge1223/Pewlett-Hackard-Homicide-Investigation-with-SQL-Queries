--******************************************************************************************
--
--  File Name:  EmployeeQueries.sql
--
--  File Description:
--      The file contains the SQL query scripts for the Pewlett Hackard 
--      Homicide Investigation.
--
--
--  Date               Description                              Programmer
--  ---------------    ------------------------------------     ------------------
--  09/05/2023         Initial Development                      N. James George
--
--******************************************************************************************/

-- ***********************************************
-- 1.1: Employee Count Discrepancy
-- ***********************************************

-- This statement retrieves all employee records.
SELECT
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	EmployeeJobTitles.jobTitle,
	EmployeeSalaries.employeeSalary
FROM Employees
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	JOIN EmployeeSalaries
		ON Employees.employeeIDNumber = EmployeeSalaries.employeeIDNumber
	ORDER BY Employees.lastName, Employees.firstName;


-- This statement lists all employee records with department information.
SELECT 
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	EmployeeJobTitles.jobTitle,
	Departments.departmentName
FROM Employees
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	ORDER BY Employees.lastName, Employees.firstName ASC;


-- This statement lists employees with a count of their departments in descending order.
SELECT 
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	EmployeeJobTitles.jobTitle,
	COUNT (Departments.departmentID)
		AS departmentFrequencyCount
FROM Employees
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	GROUP BY Employees.employeeIDNumber, EmployeeJobTitles.jobTitle
		HAVING COUNT (Departments.departmentID) > 1
	ORDER BY departmentFrequencyCount DESC;


-- This statement lists employees with a count of their departments and a count 
-- of unique job titles in descending order.
SELECT 
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	COUNT (DISTINCT EmployeeJobTitles.jobTitle)
		AS distinctJobTitleFrequencyCount,
	COUNT (Departments.departmentID)
		AS departmentFrequencyCount
FROM Employees
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	GROUP BY Employees.employeeIDNumber
		HAVING COUNT(Departments.departmentID) > 1
	ORDER BY distinctJobTitleFrequencyCount DESC;


-- ******************************************
-- 1.2: Managers
-- ******************************************

-- This statement lists all the department managers.
SELECT
	Employees.employeeIDNumber, 
	Employees.lastName, 
	Employees.firstName,
	Departments.departmentName, 
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate
FROM Employees
	JOIN DepartmentManagers
		ON Employees.employeeIDNumber = DepartmentManagers.employeeIDNumber
	JOIN Departments
		ON DepartmentManagers.departmentID = Departments.departmentID
	ORDER BY Employees.lastName, Employees.firstName;


-- This statement lists all the department managers with their number of departments.
SELECT 
	Employees.employeeIDNumber,
	Employees.lastName,
	Employees.firstName,
	Departments.departmentName, 
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	COUNT (Departments.departmentID)
		AS departmentIDFrequencyCount
FROM Employees
	JOIN DepartmentManagers
		ON Employees.employeeIDNumber = DepartmentManagers.employeeIDNumber
	JOIN Departments
		ON DepartmentManagers.departmentID = Departments.departmentID
	GROUP BY Employees.employeeIDNumber, 
			 Departments.departmentName
	ORDER BY departmentIDFrequencyCount DESC;


-- ******************************************
-- 1.3: Employees
-- ******************************************

-- This statement lists each year and the number of hires.
SELECT 
	EXTRACT (YEAR FROM Employees.hireDate), 
	COUNT (EXTRACT(YEAR FROM Employees.hireDate)) 
		AS hireYearFrequencyCount
FROM Employees
	GROUP BY EXTRACT (YEAR FROM Employees.hireDate) 
	ORDER BY EXTRACT (YEAR FROM Employees.hireDate) ASC;


-- This statement lists records for all employees hired in 1986 in ascending order.
SELECT
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	EmployeeJobTitles.jobTitle
FROM Employees
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	WHERE EXTRACT(YEAR FROM Employees.hireDate) = 1986
		ORDER BY Employees.lastName, Employees.firstName;


-- This statement lists all employees with the first name, Hercules, and a last name 
-- starting with 'B'.
SELECT 
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	EmployeeJobTitles.jobTitle
FROM Employees
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	WHERE firstName = 'Hercules' AND lastName like 'B%';


-- This statement lists the each department and the number of employees.
SELECT
	Departments.departmentName, 
	COUNT (DepartmentIDPerEmployee.departmentID)
		AS departmentFrequencyCount
FROM DepartmentIDPerEmployee
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	GROUP BY Departments.departmentName, Departments.departmentID
	ORDER BY departmentFrequencyCount DESC;



-- This statement lists all employees in the Sales Department.
SELECT 
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	EmployeeJobTitles.jobTitle
FROM employees
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	WHERE Departments.departmentName = 'Sales'
	ORDER BY Employees.lastName, 
	 		 Employees.firstName;


-- This statement lists all employees in the Sales and Development Departments.
SELECT 
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	EmployeeJobTitles.jobTitle
FROM employees
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	WHERE Departments.departmentName IN ('Sales', 'Development')
	ORDER BY Employees.lastName, 
	 		 Employees.firstName;


-- ******************************************
-- 2.4: Suspects
-- ******************************************

-- This statement lists employees whose first name is Hercules, whose last name begins with the letter B, and who
-- were hired in 1986.
SELECT 
	Employees.employeeIDNumber, 
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	Departments.departmentName
FROM Employees
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	WHERE EXTRACT(YEAR FROM Employees.hireDate) = 1986 
		AND firstName = 'Hercules' AND lastName like 'B%'
	ORDER BY Employees.lastName, 
	 		 Employees.firstName;


-- This statement lists each employees who were hired in 1986 and were a manager in either the Sales 
-- or Development departments.
SELECT 
	Employees.employeeIDNumber, 
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	Employees.hireDate,
	Departments.departmentName
FROM Employees
	JOIN DepartmentManagers
		ON Employees.employeeIDNumber = DepartmentManagers.employeeIDNumber
	JOIN Departments
		ON DepartmentManagers.departmentID = Departments.departmentID
	WHERE EXTRACT(YEAR FROM Employees.hireDate) = 1986 
		AND Departments.departmentName IN ('Sales', 'Development') 
	AND Employees.sex = 'M';