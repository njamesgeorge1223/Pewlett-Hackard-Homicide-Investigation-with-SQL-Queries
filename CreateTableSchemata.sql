--******************************************************************************************
--
--  File Name:  TableSchemata.sql
--
--  File Description:
--      This file contains the SQL script for creating the database tables 
--      for the Pewlett Hackard Homicide Investigation.
--
--
--  Date               Description                              Programmer
--  ---------------    ------------------------------------     ------------------
--  09/05/2023         Initial Development                      N. James George
--
--******************************************************************************************/

-- These statements drop any existing tables in the database.
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS DepartmentIDPerEmployee;

DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS DepartmentManagers;

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS Departments;

DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS EmployeeSalaries;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS Employees;

DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS EmployeeJobTitles;


-- These statements create the database tables for employee information.

CREATE TABLE 
	EmployeeJobTitles
	    (employeeTitleID VARCHAR(10),
	     jobTitle VARCHAR(40) NOT NULL,
            PRIMARY KEY (employeeTitleID));

CREATE TABLE 
    Employees 
        (employeeIDNumber INT,
	     employeeTitleID VARCHAR(10) NOT NULL,
	     birthDate DATE NOT NULL,
         firstName VARCHAR(40) NOT NULL,
	     lastName VARCHAR(40) NOT NULL,
	     sex VARCHAR(1) NOT NULL,
	     hireDate DATE NOT NULL,
            PRIMARY KEY (employeeIDNumber),
            FOREIGN KEY (employeeTitleID) 
                REFERENCES EmployeeJobTitles (employeeTitleID));

CREATE TABLE 
    EmployeeSalaries
        (employeeIDNumber INT,
	     employeeSalary INT NOT NULL,
            PRIMARY KEY (employeeIDNumber),
	        FOREIGN KEY (employeeIDNumber)
                REFERENCES Employees (employeeIDNumber));


-- These statements create the database tables for department information.

CREATE TABLE 
    Departments 
        (departmentID VARCHAR(10),
	     departmentName VARCHAR(40) NOT NULL,
	        PRIMARY KEY (departmentID));

CREATE TABLE 
    DepartmentManagers
	    (departmentID VARCHAR(10),
	     employeeIDNumber INT,
	        PRIMARY KEY (departmentID, employeeIDNumber),
            FOREIGN KEY (departmentID) 
                REFERENCES Departments (departmentID),
	        FOREIGN KEY (employeeIDNumber) 
                REFERENCES Employees (employeeIDNumber));

CREATE TABLE 
    DepartmentIDPerEmployee 
        (employeeIDNumber INT,
	     departmentID VARCHAR(10),
	        PRIMARY KEY (employeeIDNumber, departmentID),
	        FOREIGN KEY (employeeIDNumber) 
                REFERENCES Employees (employeeIDNumber),
	        FOREIGN KEY (departmentID) 
                REFERENCES Departments (departmentID));