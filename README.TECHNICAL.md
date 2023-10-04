# **Pewlett Hackard Homicide Investigation with SQL Queries**

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

The administrative and development tool, pgAdmin4, uses the CSV files in the Resources folder for populating the database tables.  Also, with pgAdmin4, the three SQL scripts create the database tables and run the queries.

DepartmentIDPerEmployee.csv

DepartmentManagers.csv

Departments.csv

EmployeeJobTitles.csv

Employees.csv

EmployeeSalaries.csv

EmployeeQueries.sql

TableSchemata.sql

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

CreateTableSchemata.sql, DataIntegrityQueries.sql, InvestigationQueries.sql

#### Software

pgAdmin4, Postgres

![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

----

### **GitHub Repository Branches:**

----

#### main branch 

|&rarr; [./CreateTableSchemata.sql](./CreateTableSchemata.sql)

|&rarr; [./DataIntegrityQueries.sql](./DataIntegrityQueries.sql)

|&rarr; [./InvestigationQueries.sql](./InvestigationQueries.sql)

|&rarr; [./README.md](./README.md)

|&rarr; [./README.TECHNICAL.md](./README.TECHNICAL.md)

|&rarr; [./Images/](./Images/)

  &emsp; |&rarr; [./Images/DBIntegrityDepartmentIDPerEmployeeQuery1.png](./Images/DBIntegrityDepartmentIDPerEmployeeQuery1.png)
  
  &emsp; |&rarr; [./Images/DBIntegrityDepartmentIDPerEmployeeQuery2.png](./Images/DBIntegrityDepartmentIDPerEmployeeQuery2.png)
  
  &emsp; |&rarr; [./Images/DBIntegrityDepartmentIDPerEmployeeQuery3.png](./Images/DBIntegrityDepartmentIDPerEmployeeQuery3.png)
  
  &emsp; |&rarr; [./Images/DBIntegrityDepartmentIDPerEmployeeQuery4.png](./Images/DBIntegrityDepartmentIDPerEmployeeQuery4.png)
  
  &emsp; |&rarr; [./Images/DBIntegrityDepartmentIDPerEmployeeQuery5.png](./Images/DBIntegrityDepartmentIDPerEmployeeQuery5.png)
  
  &emsp; |&rarr; [./Images/DBIntegrityDepartmentIDPerEmployeeQuery6.png](./Images/DBIntegrityDepartmentIDPerEmployeeQuery6.png)
  
  &emsp; |&rarr; [./Images/DBIntegrityDepartmentManagersQuery1.png](./Images/DBIntegrityDepartmentManagersQuery1.png)
  
  &emsp; |&rarr; [./Images/DBIntegrityDepartmentManagersQuery2.png](./Images/DBIntegrityDepartmentManagersQuery2.png)

  &emsp; |&rarr; [./Images/DBIntegrityDepartmentManagersQuery3.png](./Images/DBIntegrityDepartmentManagersQuery3.png)

  &emsp; |&rarr; [./Images/DBIntegrityDepartmentManagersQuery4.png](./Images/DBIntegrityDepartmentManagersQuery4.png)

  &emsp; |&rarr; [./Images/DBIntegrityDepartmentManagersQuery5.png](./Images/DBIntegrityDepartmentManagersQuery5.png)

  &emsp; |&rarr; [./Images/DBIntegrityDepartmentsQuery1.png](./Images/DBIntegrityDepartmentsQuery1.png)

  &emsp; |&rarr; [./Images/DBIntegrityDepartmentsQuery2.png](./Images/DBIntegrityDepartmentsQuery2.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeeJobTitlesQuery1.png](./Images/DBIntegrityEmployeeJobTitlesQuery1.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeeJobTitlesQuery2.png](./Images/DBIntegrityEmployeeJobTitlesQuery2.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeeSalariesQuery1.png](./Images/DBIntegrityEmployeeSalariesQuery1.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeeSalariesQuery2.png](./Images/DBIntegrityEmployeeSalariesQuery2.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeeSalariesQuery3.png](./Images/DBIntegrityEmployeeSalariesQuery3.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeeSalariesQuery4.png](./Images/DBIntegrityEmployeeSalariesQuery4.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery1.png](./Images/DBIntegrityEmployeesQuery1.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery2.png](./Images/DBIntegrityEmployeesQuery2.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery3.png](./Images/DBIntegrityEmployeesQuery3.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery4.png](./Images/DBIntegrityEmployeesQuery4.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery5.png](./Images/DBIntegrityEmployeesQuery5.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery6.png](./Images/DBIntegrityEmployeesQuery6.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery7.png](./Images/DBIntegrityEmployeesQuery7.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery8.png](./Images/DBIntegrityEmployeesQuery8.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery9.png](./Images/DBIntegrityEmployeesQuery9.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery10.png](./Images/DBIntegrityEmployeesQuery10.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery11.png](./Images/DBIntegrityEmployeesQuery11.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery12.png](./Images/DBIntegrityEmployeesQuery12.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery13.png](./Images/DBIntegrityEmployeesQuery13.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery14.png](./Images/DBIntegrityEmployeesQuery14.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery15.png](./Images/DBIntegrityEmployeesQuery15.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery16.png](./Images/DBIntegrityEmployeesQuery16.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery17.png](./Images/DBIntegrityEmployeesQuery17.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery18.png](./Images/DBIntegrityEmployeesQuery18.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery19.png](./Images/DBIntegrityEmployeesQuery19.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery20.png](./Images/DBIntegrityEmployeesQuery20.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery21.png](./Images/DBIntegrityEmployeesQuery21.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery22.png](./Images/DBIntegrityEmployeesQuery22.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery23.png](./Images/DBIntegrityEmployeesQuery23.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery24.png](./Images/DBIntegrityEmployeesQuery24.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery25.png](./Images/DBIntegrityEmployeesQuery25.png)

  &emsp; |&rarr; [./Images/DBIntegrityEmployeesQuery26.png](./Images/DBIntegrityEmployeesQuery26.png)

  &emsp; |&rarr; [./Images/HomicideInvestigationEmployeesQuery1.png](./Images/HomicideInvestigationEmployeesQuery1.png)

  &emsp; |&rarr; [./Images/HomicideInvestigationEmployeesQuery2.png](./Images/HomicideInvestigationEmployeesQuery2.png)

  &emsp; |&rarr; [./Images/HomicideInvestigationEmployeesQuery3.png](./Images/HomicideInvestigationEmployeesQuery3.png)

  &emsp; |&rarr; [./Images/HomicideInvestigationEmployeesQuery4.png](./Images/HomicideInvestigationEmployeesQuery4.png)

  &emsp; |&rarr; [./Images/HomicideInvestigationManagersQuery1.png](./Images/HomicideInvestigationManagersQuery1.png)

  &emsp; |&rarr; [./Images/HomicideInvestigationSuspectsQuery1.png](./Images/HomicideInvestigationSuspectsQuery1.png)

  &emsp; |&rarr; [./Images/HomicideInvestigationSuspectsQuery2.png](./Images/HomicideInvestigationSuspectsQuery2.png)

  &emsp; |&rarr; [./Images/HomicideInvestigationSuspectsQuery3.png](./Images/HomicideInvestigationSuspectsQuery3.png)
  
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

[PgAdmin Documentation](https://www.postgresql.org/docs/)

[Postgres Documentation](https://www.pgadmin.org/docs/)

[PostgresSQL Documentation](https://www.postgresql.org/docs/)

----

### **Authors and Acknowledgment:**

----

### Copyright

N. James George © 2023. All Rights Reserved.
