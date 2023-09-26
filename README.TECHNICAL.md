# **Data Modeling and SQL Queries for Employee Database**

----

### **Installation:**

----

The SQL scripts require the installation of PostgreSQL and pdAdmin to run. 

If you have not installed them, here are the instructions:

* In your browser, Mac users should go to [Mac Download PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads), and Windows users should go to [Windows Download PostgreSQL](https://www.pgadmin.org/download/pgadmin-4-macos/).

* Select the download option for your operating system and for the latest version 14.x of PostgreSQL.

* After downloading PostgreSQL 14.x, double click on the .dmg file.

* Go through the Setup Wizard and install PostgreSQL.  For MacOS users, keep the default location /Library/PostgreSQL/14; for MS Windows, keep the default location C:\Program Files\PostgreSQL\14.

* Select the components to be installed. Be sure to un-check Stack Builder.

* Add your data directory. For Mac users, keep the default location /Library/PostgreSQL/14/data; for MS Windows, keep the default location C:\Program Files\PostgreSQL\14\data.

* Enter postgres as the password. Be sure to record this password for future use.

* Keep the default port as 5432. In the Advanced Options, set the locale as [Default locale].

* The final screen will be the Pre Installation Summary.

* To confirm the installation, start pgAdmin (it will open in a new browser window). Connect to the default server by clicking on it and entering the password if prompted.

----

### **Usage:**

----

The administrative and development tool, pgAdmin4, uses the CSV files in the Resources folder for populating the database tables.  Also, with pgAdmin4, the two SQL scripts create the database tables and run the queries.

TableSchemata.sql

EmployeeQueries.sql

DepartmentIDPerEmployee.csv

DepartmentManagers.csv

Departments.csv

EmployeeJobTitles.csv

Employees.csv

EmployeeSalaries.csv

----

### **Resource Summary:**

----

#### Source code

n/a

#### Input files

DepartmentIDPerEmployee.csv, DepartmentManagers.csv, Departments.csv, EmployeeJobTitles.csv, Employees.csv, EmployeeSalaries.csv

#### Output files

n/a

#### SQL script

TableSchemata.sql, EmployeeQueries.sql

#### Software

pgAdmin4, Postgres

![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

----

### **GitHub Repository Branches:**

----

#### main branch 

|&rarr; [./EmployeeQueries.sql](./EmployeeQueries.sql)

|&rarr; [./README.TECHNICAL.md](./README.TECHNICAL.md)

|&rarr; [./README.md](./README.md)

|&rarr; [./TableSchemata.sql](./TableSchemata.sql)

|&rarr; [./Images/](./Images/)

  &emsp; |&rarr; [./Images/Query1.png](./Images/Query1.png)
  
  &emsp; |&rarr; [./Images/Query2.png](./Images/Query2.png)
  
  &emsp; |&rarr; [./Images/Query3.png](./Images/Query3.png)
  
  &emsp; |&rarr; [./Images/Query4.png](./Images/Query4.png)
  
  &emsp; |&rarr; [./Images/Query5.png](./Images/Query5.png)
  
  &emsp; |&rarr; [./Images/Query6.png](./Images/Query6.png)
  
  &emsp; |&rarr; [./Images/Query7.png](./Images/Query7.png)
  
  &emsp; |&rarr; [./Images/Query8.png](./Images/Query8.png)

  &emsp; |&rarr; [./Images/QuickDBD-PewlettHackardSQLChallenge.png](./Images/QuickDBD-PewlettHackardSQLChallenge.png)
  
  &emsp; |&rarr; [./Images/README.md](./Images/README.md)

|&rarr; [./Resources/](./Resources/)

  &emsp; |&rarr; [./Resources/DepartmentIDPerEmployee.csv](./Resources/DepartmentIDPerEmployee.csv)

  &emsp; |&rarr; [./Resources/DepartmentManagers.csv](./Resources/DepartmentManagers.csv)

  &emsp; |&rarr; [./Resources/Departments.csv](./Resources/Departments.csv)

  &emsp; |&rarr; [./Resources/EmployeeJobTitles.csv](./Resources/EmployeeJobTitles.csv)

  &emsp; |&rarr; [./Resources/Employees.csv](./Resources/Employees.csv)

  &emsp; |&rarr; [./Resources/EmployeeSalaries.csv](./Resources/EmployeeSalaries.csv)

  &emsp; |&rarr; [./Resources/README.md](./Resources/README.md)

----

### **References:**

----

[PgAdmin Documentation](https://www.postgresql.org/docs/) \

[Postgres Documentation](https://www.pgadmin.org/docs/) \

[PostgresSQL Documentation](https://www.postgresql.org/docs/) \

----

### **Authors and Acknowledgment:**

----

### Copyright

N. James George © 2023. All Rights Reserved.
