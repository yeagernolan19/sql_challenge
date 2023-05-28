CREATE TABLE Departments (
    "Dept_No" varchar   Primary Key NOT NULL,
    "Dept_Name" varchar   NOT NULL
);

CREATE TABLE Dept_Employees (
    "Emp_No" varchar   NOT NULL,
    "Dept_No" varchar   NOT NULL
);

CREATE TABLE Dept_Manager (
    "Dept_No" varchar   NOT NULL,
    "Emp_No" varchar   NOT NULL
);

CREATE TABLE Employees (
    "Emp_No" varchar   primary key NOT NULL,
    "Emp_title_id" varchar   NOT NULL,
    "Birth_Date" timestamp   NOT NULL,
    "First_Name" varchar   NOT NULL,
    "Last_Name" varchar   NOT NULL,
    "Sex" varchar(1)   NOT NULL,
    "Hire_Date" timestamp   NOT NULL
);

CREATE TABLE Salaries (
    "Emp_No" varchar   NOT NULL,
    "Salary" varchar   NOT NULL
);

CREATE TABLE Titles (
    "Title_Id" varchar primary key  NOT NULL,
    "Title" varchar   NOT NULL
);
select * from employees


SELECT e."Emp_No", e."First_Name", e."Last_Name", e."Sex"
FROM employees as e
JOIN salaries as s ON e."Emp_No" = s."Emp_No";

SELECT e."First_Name", e."Last_Name", e."Hire_Date"
FROM employees AS e
WHERE e."Hire_Date" BETWEEN '1986-01-01' AND '1986-12-31';


SELECT dp."Dept_No", e."First_Name", e."Last_Name"
FROM dept_manager dp
JOIN employees AS e ON dp."Emp_No" = e."Emp_No"
JOIN departments AS d ON dp."Dept_No" = d."Dept_No";


select e."Emp_No", e."First_Name", e."Last_Name", dp."Dept_No", d."Dept_Name"
from employees e
join dept_employees dp on e."Emp_No"=dp."Emp_No"
join departments d on dp."Dept_No"= d."Dept_No"
;

SELECT e."First_Name", e."Last_Name", e."Sex"
FROM employees e
WHERE "First_Name" = 'Hercules' AND "Last_Name" LIKE 'B%';


SELECT e."Emp_No", e."Last_Name", e."First_Name", d."Dept_Name"
FROM employees AS e
JOIN dept_employees AS de ON e."Emp_No" = de."Emp_No"
JOIN departments AS d ON de."Dept_No" = d."Dept_No"
WHERE d."Dept_Name" = 'Sales';

SELECT e."Emp_No", e."Last_Name", e."First_Name", d."Dept_Name"
FROM employees AS e
JOIN dept_employees AS de ON e."Emp_No" = de."Emp_No"
JOIN departments AS d ON de."Dept_No" = d."Dept_No"
WHERE d."Dept_Name" in ('Sales', 'Development') ;

SELECT e."Last_Name", COUNT(*) AS Frequency
FROM employees e
GROUP BY "Last_Name"
ORDER BY Frequency DESC;