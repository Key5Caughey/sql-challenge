
CREATE VIEW dept_mng_list AS 

SELECT 
    d.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    departments d
    INNER JOIN dept_mng dm ON d.dept_no = dm.dept_no
    INNER JOIN employees e ON dm.emp_no = e.emp_no;
	
SELECT * FROM dept_mng_list;

CREATE VIEW emp_dept_q4 AS 
SELECT 
    de.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    de.dept_no AS department_number,
    d.dept_name AS department_name
FROM
    dept_emp de
    INNER JOIN employees e ON de.emp_no::int = e.emp_no
    INNER JOIN departments d ON de.dept_no = d.dept_no;

SELECT * FROM emp_dept_q4;


CREATE VIEW emp_Hercules AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT * FROM emp_Hercules;

CREATE VIEW employees_hired_1986 AS

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT * FROM employees_hired_1986;

SELECT * FROM employee_salaries;

CREATE VIEW last_names_q8 AS 

SELECT last_name,COUNT(*) AS frequency_count


FROM employees

GROUP BY last_name

ORDER BY frequency_count DESC;

SELECT * FROM last_names_q8 ; 

CREATE VIEW sales_emp_q6 AS

SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    employees e
    JOIN dept_emp de ON e.emp_no = CAST(de.emp_no AS INTEGER)
    JOIN departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';
	
SELECT * FROM sales_emp_q6;

CREATE VIEW sales_dev_q7 AS

SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM
    employees e
    JOIN dept_emp de ON e.emp_no = CAST(de.emp_no AS INTEGER)
    JOIN departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
SELECT * FROM sales_dev_q7;