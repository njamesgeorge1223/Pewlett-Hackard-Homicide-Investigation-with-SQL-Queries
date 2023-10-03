--******************************************************************************************
--
--  File Name:  EmployeeQueries.sql
--
--  File Description:
--      The file contains the SQL query scripts for checking the integrity
--      of database tables containing legacy employee data for the Pewlett
--      Hackard Homicide Investigation.
--
--
--  Date               Description                              Programmer
--  ---------------    ------------------------------------     ------------------
--  09/05/2023         Initial Development                      N. James George
--
--******************************************************************************************/

-- ***********************************************
-- 1.1: Database Table: DepartmentIDPerEmployee
-- ***********************************************

-- Display all the data in the table.
SELECT * FROM DepartmentIDPerEmployee


-- Count the number of rows in the table.
SELECT COUNT (*) FROM DepartmentIDPerEmployee


-- Count the number of distinct department IDs.
SELECT 
	COUNT (DISTINCT DepartmentIDPerEmployee.departmentID) 
FROM DepartmentIDPerEmployee;


-- Count the number of distinct employee IDs.
SELECT 
	COUNT (DISTINCT DepartmentIDPerEmployee.employeeIDNumber) 
FROM DepartmentIDPerEmployee;


-- In descending order, display the department count 
-- for each employee. 
SELECT
    DepartmentIDPerEmployee.employeeIDNumber, 
	COUNT (DepartmentIDPerEmployee.employeeIDNumber)
		AS departmentIDFrequencyCount
FROM DepartmentIDPerEmployee
	GROUP BY DepartmentIDPerEmployee.employeeIDNumber
		HAVING COUNT (DepartmentIDPerEmployee.employeeIDNumber) > 1
	ORDER BY departmentIDFrequencyCount DESC;


-- ***********************************************
-- 1.2: Database Table: DepartmentManagers
-- ***********************************************

-- Display all the data in the table.
SELECT * FROM DepartmentManagers


-- Count the number of rows in the table.
SELECT COUNT (*) FROM DepartmentManagers


-- Count number of distinct department IDs.
SELECT 
	COUNT (DISTINCT DepartmentManagers.departmentID) 
FROM DepartmentManagers;


-- Count number of distinct employee ID numbers.
SELECT 
	COUNT (DISTINCT DepartmentManagers.employeeIDNumber) 
FROM DepartmentManagers;


-- Display any duplicate employee ID numbers.
SELECT
    DepartmentManagers.employeeIDNumber, 
	COUNT (DepartmentManagers.employeeIDNumber) 
		AS employeeIDFrequencyCount
FROM DepartmentManagers
	GROUP BY DepartmentManagers.employeeIDNumber
		HAVING COUNT (DepartmentManagers.employeeIDNumber) > 1


-- ***********************************************
-- 1.3: Database Table: Departments
-- ***********************************************

-- Display all the data in the table.
SELECT * FROM Departments


-- Count the number of rows in the table.
SELECT COUNT (*) FROM Departments


-- ***********************************************
-- 1.4: Database Table: EmployeeJobTitles
-- ***********************************************

-- Display all the data in the table.
SELECT * FROM EmployeeJobTitles


-- Count the number of rows in the table.
SELECT COUNT (*) FROM EmployeeJobTitles


-- ***********************************************
-- 1.5: Database Table: Employees
-- ***********************************************

-- Display all the data in the table.
SELECT * FROM Employees


-- Count the number of rows in the table.
SELECT COUNT(*) FROM Employees


-- Count the number of distinct employee IDS.
SELECT 
	COUNT (DISTINCT Employees.employeeIDNumber) 
FROM Employees;	


-- Display any duplicate employee IDs.
SELECT
    Employees.employeeIDNumber, 
	COUNT (Employees.employeeIDNumber)
		AS employeeIDFrequencyCount
FROM Employees
	GROUP BY Employees.employeeIDNumber
		HAVING COUNT (Employees.employeeIDNumber) > 1


-- Display number of employees for each job title.
SELECT 
	Employees.employeeTitleID,
	EmployeeJobTitles.jobTitle,
	COUNT(Employees.employeeTitleID)
		AS jobTitleFrequencyCount
FROM Employees
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	GROUP BY Employees.employeeTitleID, 
			 EmployeeJobTitles.jobTitle
	ORDER BY jobTitleFrequencyCount DESC;


-- In descending order, display each birth date's frequency count.
SELECT 
	Employees.birthDate,
	COUNT (Employees.birthDate)
		AS birthDateFrequencyCount
FROM Employees
	GROUP BY Employees.birthDate
	ORDER BY birthDateFrequencyCount DESC;


-- In ascending order, display each birth date's frequency count.
SELECT 
	Employees.birthDate,
	COUNT (Employees.birthDate)
		AS birthDateFrequencyCount
FROM Employees
	GROUP BY Employees.birthDate
	ORDER BY birthDateFrequencyCount ASC;


-- Count the number of distinct last names.
SELECT 
	COUNT (DISTINCT Employees.lastName) 
FROM Employees;

-- In descending order, list the frequency count of employee last names 
-- (id est, how many employees share each last name).
SELECT 
	Employees.lastName, 
	COUNT (Employees.lastName) 
		AS lastNameFrequencyCount
FROM Employees
	GROUP BY Employees.lastName
		HAVING COUNT (Employees.lastName) > 1
	ORDER BY lastNameFrequencyCount DESC;

-- In ascending order, list the frequency count of employee last names 
-- (id est, how many employees share each last name).
SELECT 
	Employees.lastName, 
	COUNT (Employees.lastName) 
		AS lastNameFrequencyCount
FROM Employees
	GROUP BY Employees.lastName
		HAVING COUNT (Employees.lastName) > 1
	ORDER BY lastNameFrequencyCount ASC;


-- Count the number of distinct first names.
SELECT 
	COUNT (DISTINCT Employees.firstName) 
FROM Employees;
 
-- In descending order, list the frequency count of employee first names
-- (id est, how many employees share each first name).
SELECT 
	Employees.firstName, 
	COUNT (Employees.firstName) 
		AS firstNameFrequencyCount
FROM Employees
	GROUP BY Employees.firstName
		HAVING COUNT (Employees.firstName) > 1
	ORDER BY firstNameFrequencyCount DESC;

-- In ascending order, list the frequency count of employee first names
-- (id est, how many employees share each first name).
SELECT 
	Employees.firstName, 
	COUNT (Employees.firstName) 
		AS firstNameFrequencyCount
FROM Employees
	GROUP BY Employees.firstName
		HAVING COUNT (Employees.firstName) > 1
	ORDER BY firstNameFrequencyCount ASC;


-- Count the number of distinct first and last names.
SELECT 
	COUNT ( DISTINCT (Employees.lastName, Employees.firstName) )
FROM Employees;

-- In descending order, list the frequency count of employee first
-- and last names (id est, how many employees share each last name).
SELECT 
	Employees.lastName, 
	Employees.firstName, 
	COUNT ((Employees.lastName, Employees.firstName))
		AS nameFrequencyCount
FROM Employees
	GROUP BY Employees.lastName, 
			 Employees.firstName
		HAVING COUNT ((Employees.lastName, Employees.firstName)) > 1
	ORDER BY nameFrequencyCount DESC;

-- In ascending order, list the frequency count of employee first
-- and last names (id est, how many employees share each last name).
SELECT 
	Employees.lastName, 
	Employees.firstName, 
	COUNT ((Employees.lastName, Employees.firstName))
		AS nameFrequencyCount
FROM Employees
	GROUP BY Employees.lastName, 
			 Employees.firstName
		HAVING COUNT ((Employees.lastName, Employees.firstName)) > 1
	ORDER BY nameFrequencyCount ASC;


-- List employee records for the most common first and last name,
-- Rosalyn Baalen.
SELECT
	Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	EmployeeJobTitles.jobTitle,
	EmployeeSalaries.employeeSalary
FROM Employees
	JOIN EmployeeSalaries
		ON Employees.employeeIDNumber = EmployeeSalaries.employeeIDNumber
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	WHERE Employees.lastName = 'Baalen' AND Employees.firstName = 'Rosalyn';


-- In descending order, display the number of employees for each gender.
SELECT
	Employees.sex,
	COUNT(Employees.sex)
		AS genderFrequencyCount
FROM Employees
	GROUP BY Employees.sex
	ORDER BY Employees.sex DESC;


-- In descending order, display the number of employees hired per hire date.
SELECT 
	Employees.hireDate,
	COUNT(Employees.hireDate)
		AS hireDateFrequencyCount
FROM Employees
	GROUP BY Employees.hireDate
	ORDER BY hireDateFrequencyCount DESC;
	
-- In ascending order, display the number of employees hired per hire date.
SELECT 
	Employees.hireDate,
	COUNT(Employees.hireDate)
		AS hireDateFrequencyCount
FROM Employees
	GROUP BY Employees.hireDate
	ORDER BY hireDateFrequencyCount ASC;


-- ***********************************************
-- 1.6: Database Table: EmployeeSalaries
-- ***********************************************

-- Display all the data in the table.
SELECT * FROM EmployeeSalaries



-- Count the number of rows in the table.
SELECT COUNT(*) FROM EmployeeSalaries


-- Count the number of distinct employee IDS.
SELECT 
	COUNT (DISTINCT EmployeeSalaries.employeeIDNumber) 
FROM EmployeeSalaries;


-- Display any duplicate employee IDs.
SELECT
    EmployeeSalaries.employeeIDNumber,
	COUNT (EmployeeSalaries.employeeIDNumber)
FROM EmployeeSalaries
	GROUP BY EmployeeSalaries.employeeIDNumber
		HAVING COUNT (EmployeeSalaries.employeeIDNumber) > 1
    ORDER BY EmployeeSalaries.employeeIDNumber