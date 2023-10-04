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

-- ******************************************
-- 1: Managers
-- ******************************************

-- 1.1 This statement lists all the department managers.
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
	ORDER BY Employees.lastName, 
			 Employees.firstName;


-- ******************************************
-- 2: Employees
-- ******************************************

-- 2.1 This statement lists records for all employees hired in 1986 
-- in ascending order.
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


-- 2.2 This statement lists all employees with the first name, Hercules, 
-- and a last name starting with 'B'.
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
	WHERE firstName = 'Hercules' 
		AND lastName like 'B%';


-- 2.3 This statement lists all employees in the Sales Department.
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


-- 2.4 This statement lists all employees in the Sales and Development Departments.
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
-- 3: Suspects
-- ******************************************

-- 3.1 This statement lists employees whose first name is Hercules, whose last name
-- begins with the letter B, and who were hired in 1986.
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
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	WHERE EXTRACT(YEAR FROM Employees.hireDate) = 1986 
		AND firstName = 'Hercules' AND lastName like 'B%'
	ORDER BY Employees.lastName, 
	 		 Employees.firstName;


-- 3.2 This statement lists each employees who were manages in either the Sales 
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
	WHERE Departments.departmentName IN ('Sales', 'Development');


-- 3.3 This statement lists each employees who were hired in 1986 and were a manager 
-- in either the Sales or Development departments.
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
		AND Employees.sex = 'M'
		AND Departments.departmentName IN ('Sales', 'Development');