-- ### Data Analysis

-- List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no --linking the employee number on both DB
;

-- List employees who were hired in 1986.

SELECT employees.emp_no,
	employees.last_name,
    employees.first_name,
	employees.hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986 --conditional to only show employees who here hired only in 1986
;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT departments.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
    employees.first_name,
	dept_manager.from_date,
	dept_manager.to_date
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no --linking the employee number on both DB
JOIN departments ON departments.dept_no = dept_manager.dept_no  --linking the department number on both DB
;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no --linking the employee number on both DB
JOIN departments ON departments.dept_no = dept_emp.dept_no --linking the department number on both DB
;

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name,
	employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%' --LIKE is a command that searched the chararter on all the DB
; 

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no --linking the employee number on both DB
JOIN departments ON departments.dept_no = dept_emp.dept_no --linking the department number on both DB
WHERE departments.dept_name = 'Sales'
;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development' --boolean, to show employees under sales or development
;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, count (last_name) as name_count
FROM employees
GROUP BY last_name
ORDER BY name_count desc
;