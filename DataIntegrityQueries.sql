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
-- 1: Database Table: DepartmentIDPerEmployee
-- ***********************************************

-- 1.1 Display all the data in the table.
SELECT * FROM DepartmentIDPerEmployee
	ORDER BY DepartmentIDPerEmployee.employeeIDNumber


-- 1.2 Count the number of rows in the table.
SELECT COUNT (*) FROM DepartmentIDPerEmployee


-- 1.3 Count the number of distinct department IDs.
SELECT 
	COUNT (DISTINCT DepartmentIDPerEmployee.departmentID) 
FROM DepartmentIDPerEmployee;


-- 1.4 Count the number of distinct employee IDs.
SELECT 
	COUNT (DISTINCT DepartmentIDPerEmployee.employeeIDNumber) 
FROM DepartmentIDPerEmployee;


-- 1.5 In descending order, display the department count 
-- for each employee record. 
SELECT
    Employees.employeeIDNumber,
	Employees.lastName, 
	Employees.firstName,
	Employees.sex,
	Employees.birthDate,
	EmployeeJobTitles.jobTitle,
	COUNT (DepartmentIDPerEmployee.employeeIDNumber)
		AS departmentIDFrequencyCount
FROM Employees
	JOIN EmployeeJobTitles
		ON Employees.employeeTitleID = EmployeeJobTitles.employeeTitleID
	JOIN DepartmentIDPerEmployee
		ON Employees.employeeIDNumber = DepartmentIDPerEmployee.employeeIDNumber
	GROUP BY Employees.employeeIDNumber, 
			 EmployeeJobTitles.jobTitle
		HAVING COUNT (DepartmentIDPerEmployee.employeeIDNumber) > 1
	ORDER BY (COUNT (DepartmentIDPerEmployee.employeeIDNumber), 
			  Employees.lastName, 
			  Employees.firstName) DESC;


-- 1.6 This statement lists the each department and the number of employees.
SELECT
	Departments.departmentName, 
	COUNT (DepartmentIDPerEmployee.departmentID)
		AS departmentFrequencyCount
FROM DepartmentIDPerEmployee
	JOIN Departments
		ON DepartmentIDPerEmployee.departmentID = Departments.departmentID
	GROUP BY Departments.departmentName, Departments.departmentID
	ORDER BY departmentFrequencyCount DESC;


-- ***********************************************
-- 2: Database Table: DepartmentManagers
-- ***********************************************

-- 2.1 Display all the data in the table.
SELECT * FROM DepartmentManagers
	ORDER BY DepartmentManagers.departmentID


-- 2.2 Count the number of rows in the table.
SELECT COUNT (*) FROM DepartmentManagers


-- 2.3 Count number of distinct department IDs.
SELECT 
	COUNT (DISTINCT DepartmentManagers.departmentID) 
FROM DepartmentManagers;


-- 2.4 Count number of distinct employee ID numbers among Department Managers.
SELECT 
	COUNT (DISTINCT DepartmentManagers.employeeIDNumber) 
FROM DepartmentManagers;


-- 2.5 Display any duplicate employee ID numbers among Department Managers.
SELECT
    DepartmentManagers.employeeIDNumber, 
	COUNT (DepartmentManagers.employeeIDNumber) 
		AS employeeIDFrequencyCount
FROM DepartmentManagers
	GROUP BY DepartmentManagers.employeeIDNumber
		HAVING COUNT (DepartmentManagers.employeeIDNumber) > 1


-- ***********************************************
-- 3: Database Table: Departments
-- ***********************************************

-- 3.1 Display all the data in the table.
SELECT * FROM Departments
	ORDER BY Departments.departmentID


-- 3.2 Count the number of rows in the table.
SELECT COUNT (*) FROM Departments


-- ***********************************************
-- 4: Database Table: EmployeeJobTitles
-- ***********************************************

-- 4.1 Display all the data in the table.
SELECT * FROM EmployeeJobTitles
	ORDER BY EmployeeJobTitles.employeeTitleID


-- 4.2 Count the number of rows in the table.
SELECT COUNT (*) FROM EmployeeJobTitles


-- ***********************************************
-- 5: Database Table: EmployeeSalaries
-- ***********************************************

-- 5.1 Display all the data in the table.
SELECT * FROM EmployeeSalaries
	ORDER BY EmployeeSalaries.employeeIDNumber


-- 5.2 Count the number of rows in the table.
SELECT COUNT(*) FROM EmployeeSalaries


-- 5.3 Count the number of distinct employee IDS.
SELECT 
	COUNT (DISTINCT EmployeeSalaries.employeeIDNumber) 
FROM EmployeeSalaries;


-- 5.4 Display any duplicate employee IDs.
SELECT
    EmployeeSalaries.employeeIDNumber,
	COUNT (EmployeeSalaries.employeeIDNumber)
FROM EmployeeSalaries
	GROUP BY EmployeeSalaries.employeeIDNumber
		HAVING COUNT (EmployeeSalaries.employeeIDNumber) > 1
    ORDER BY EmployeeSalaries.employeeIDNumber


-- ***********************************************
-- 6: Database Table: Employees
-- ***********************************************

-- 6.1 Display all the data in the table.
SELECT * FROM Employees
	ORDER BY Employees.lastName, Employees.firstName


-- 6.2 Count the number of rows in the table.
SELECT COUNT(*) FROM Employees


-- 6.3 Count the number of distinct employee IDS.
SELECT 
	COUNT (DISTINCT Employees.employeeIDNumber) 
FROM Employees;	


-- 6.4 Display any duplicate employee IDs.
SELECT
    Employees.employeeIDNumber, 
	COUNT (Employees.employeeIDNumber)
		AS employeeIDFrequencyCount
FROM Employees
	GROUP BY Employees.employeeIDNumber
		HAVING COUNT (Employees.employeeIDNumber) > 1


-- 6.5 Display number of employees for each job title.
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


-- 6.6 In descending order, display each birth date's frequency count.
SELECT 
	Employees.birthDate,
	COUNT (Employees.birthDate)
		AS birthDateFrequencyCount
FROM Employees
	GROUP BY Employees.birthDate
	ORDER BY birthDateFrequencyCount DESC;


-- 6.7 In ascending order, display each birth date's frequency count.
SELECT 
	Employees.birthDate,
	COUNT (Employees.birthDate)
		AS birthDateFrequencyCount
FROM Employees
	GROUP BY Employees.birthDate
	ORDER BY birthDateFrequencyCount ASC;


-- 6.8 In descending order, display the number of employees for each gender.
SELECT
	Employees.sex,
	COUNT(Employees.sex)
		AS genderFrequencyCount
FROM Employees
	GROUP BY Employees.sex
	ORDER BY Employees.sex DESC;


-- 6.9 In descending order, display the number of employees hired per hire date.
SELECT 
	Employees.hireDate,
	COUNT(Employees.hireDate)
		AS hireDateFrequencyCount
FROM Employees
	GROUP BY Employees.hireDate
	ORDER BY hireDateFrequencyCount DESC;
	
-- 6.10 In ascending order, display the number of employees hired per hire date.
SELECT 
	Employees.hireDate,
	COUNT(Employees.hireDate)
		AS hireDateFrequencyCount
FROM Employees
	GROUP BY Employees.hireDate
	ORDER BY hireDateFrequencyCount ASC;


-- 6.11 Count the number of distinct last names.
SELECT 
	COUNT (DISTINCT Employees.lastName) 
FROM Employees;

-- 6.12 In descending order, list the frequency count of employee last names 
-- (id est, how many employees share each last name).
SELECT 
	Employees.lastName, 
	COUNT (Employees.lastName) 
		AS lastNameFrequencyCount
FROM Employees
	GROUP BY Employees.lastName
		HAVING COUNT (Employees.lastName) > 1
	ORDER BY lastNameFrequencyCount DESC;

-- 6.13 In ascending order, list the frequency count of employee last names 
-- (id est, how many employees share each last name).
SELECT 
	Employees.lastName, 
	COUNT (Employees.lastName) 
		AS lastNameFrequencyCount
FROM Employees
	GROUP BY Employees.lastName
		HAVING COUNT (Employees.lastName) > 1
	ORDER BY lastNameFrequencyCount ASC;


-- 6.14 Count the number of distinct first names.
SELECT 
	COUNT (DISTINCT Employees.firstName) 
FROM Employees;
 
-- 6.15 In descending order, list the frequency count of employee first names
-- (id est, how many employees share each first name).
SELECT 
	Employees.firstName, 
	COUNT (Employees.firstName) 
		AS firstNameFrequencyCount
FROM Employees
	GROUP BY Employees.firstName
		HAVING COUNT (Employees.firstName) > 1
	ORDER BY firstNameFrequencyCount DESC;

-- 6.16 In ascending order, list the frequency count of employee first names
-- (id est, how many employees share each first name).
SELECT 
	Employees.firstName, 
	COUNT (Employees.firstName) 
		AS firstNameFrequencyCount
FROM Employees
	GROUP BY Employees.firstName
		HAVING COUNT (Employees.firstName) > 1
	ORDER BY firstNameFrequencyCount ASC;


-- 6.17 Count the number of distinct first and last names.
SELECT 
	COUNT (DISTINCT (Employees.lastName, Employees.firstName))
FROM Employees;

-- 6.18 In descending order, list the frequency count of employee first
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

-- 6.19 In ascending order, list the frequency count of employee first
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


-- 6.20 List employee records for the most common first and last name,
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
	WHERE Employees.lastName = 'Baalen' 
		AND Employees.firstName = 'Rosalyn';


-- 6.21 This statement retrieves all employee records.
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
	ORDER BY Employees.lastName, 
			 Employees.firstName;


-- 6.22 This statement lists all employee records with department information.
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
	ORDER BY Employees.lastName, 
			 Employees.firstName ASC;


-- 6.23 This statement lists employees with a count of their departments in descending order.
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


-- 6.24 This statement lists employees with a count of their departments and a count 
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


-- 6.25 This statement lists all the department managers 
-- with their number of departments.
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


-- 6.26 This statement lists each year and the number of hires.
SELECT 
	EXTRACT (YEAR FROM Employees.hireDate), 
	COUNT (EXTRACT(YEAR FROM Employees.hireDate)) 
		AS hireYearFrequencyCount
FROM Employees
	GROUP BY EXTRACT (YEAR FROM Employees.hireDate) 
	ORDER BY EXTRACT (YEAR FROM Employees.hireDate) ASC;