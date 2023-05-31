CREATE TABLE departments (
 	dept_no VARCHAR(15) PRIMARY KEY NOT NULL,
 	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
 	emp_no INT PRIMARY KEY NOT NULL,
 	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE titles (
 	emp_no INT NOT NULL,
 	title VARCHAR(255) NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
 	emp_no INT NOT NULL,
 	salary INT NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
 	emp_no INT NOT NULL,
 	dept_no VARCHAR(15) NOT NULL, 
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
 	dept_no VARCHAR(15)NOT NULL, 
	emp_no INT NOT NULL, 
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);