CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" Date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


--Select all Employees (Number,last Name, First Name, Gender, Salary)
Select e.emp_no,e.first_name,e.last_name,e.gender,s.salary
from "employees" as e
inner join salaries as s
on e.emp_no=s.emp_no
order by emp_no;

-- List all employees who were hired in 1986
Select * 
from "employees"
where extract(year from hire_date) = 1986
order by emp_no;

-- List the Manager of each department
Select d.dept_no, d.dept_name,dm.emp_no,e.last_name,e.first_name,e.hire_date,dm.from_date
from "departments" as d
inner join dept_manager as dm
on d.dept_no= dm.dept_no
inner join "employees" as e
on dm.emp_no=e.emp_no
order by emp_no;

-- List the department of each Employee
Select e.emp_no, e.last_name,e.first_name,d.dept_name
from "employees" as e
inner join "dept_emp" as de
on e.emp_no= de.emp_no
inner join "departments" as d
on d.dept_no= de.dept_no
order by emp_no;

-- List all employees with the name Herculues and last name starts with B
select * from "employees"
where first_name= 'Hercules' and last_name like 'B%'

-- List All employees in sales department
Select e.emp_no, e.last_name, e.first_name, d.dept_name from "employees" as e
join "dept_emp" as de
on e.emp_no=de.emp_no
join "departments" as d
on d.dept_no= de.dept_no
where d.dept_name = 'Sales'
order by e.emp_no;

-- List all employees in Sales and Development
Select e.emp_no, e.last_name, e.first_name, d.dept_name from "employees" as e
join "dept_emp" as de
on e.emp_no=de.emp_no
join "departments" as d
on d.dept_no= de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by e.emp_no;

-- List the frequency count of employee last names
select count(last_name),last_name
from "employees" as e
group by last_name
order by count(last_name) desc;


