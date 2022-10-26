DROP TABLE retirement_info;
--Create new table for retir-ing employees
SELECT emp_no, first_name, last_name
INTO retirement_info FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- check the table
SELECT * FROM  retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
	m.emp_no,
	m.from_date,
	m.to_date
FROM departments AS d INNER JOIN managers AS m
ON d.dept_no = m.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info  AS ri
LEFT JOIN department_employees AS de
ON ri.emp_no = de.emp_no;

--Current employees
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info AS ri
LEFT JOIN department_employees AS de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');