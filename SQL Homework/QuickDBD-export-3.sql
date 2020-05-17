-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Department_Number" Varchar   NOT NULL,
    "Department_Name" Varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_Number"
     )
);

CREATE TABLE "Department_employes" (
    "Employee_Number" int   NOT NULL,
    "Department_number" Varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "Department_Number" Varchar   NOT NULL,
    "Employee_Number" int   NOT NULL,
    "from_date" Varchar   NOT NULL,
    "to_date" Varchar   NOT NULL
);

CREATE TABLE "Employees" (
    "employee_number" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "First_Name" Varchar   NOT NULL,
    "Last_Name" Varchar   NOT NULL,
    "gender" Varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "Salaries" (
    "employee_number" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Titles" (
    "Employee_Number" int   NOT NULL,
    "title" Varchar   NOT NULL,
    "from_date" Varchar   NOT NULL,
    "to_date" Varchar   NOT NULL
);

ALTER TABLE "Department_employes" ADD CONSTRAINT "fk_Department_employes_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Department_employes" ADD CONSTRAINT "fk_Department_employes_Department_number" FOREIGN KEY("Department_number")
REFERENCES "Departments" ("Department_Number");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_Department_Number" FOREIGN KEY("Department_Number")
REFERENCES "Departments" ("Department_Number");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("employee_number");

