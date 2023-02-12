--Lists the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);


--Lists the first name, last name, and hire date for the employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';


--Lists the manager of each department along with their department number, department name,
--employee number, last name, and first name
SELECT m.emp_no, m.dept_no, d.dept_name, e.first_name, e.last_name
from departments AS d
JOIN dept_manager AS m
 ON (m.dept_no = d.dept_no)
   JOIN employees AS e
    ON (m.emp_no = e.emp_no);
	

--Lists the department number for each employee along with that employees employee number,
--last name, first name, and department name
SELECT em.emp_no, em.dept_no, d.dept_name, e.first_name, e.last_name
from dept_emp AS em
JOIN departments AS d
 ON (em.dept_no = d.dept_no)
   JOIN employees AS e
    ON (em.emp_no = e.emp_no);
	  

--Lists first name, last name, and sex of each employee whose first name is Hercules,
--and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';


--Lists each employee in the Sales department, including their employee number,
--last name, and first name
SELECT e.first_name, e.last_name, e.emp_no
From employees as e
Where e.emp_no IN
(	Select emp_no
	FROM dept_emp as de
	WHERE de.dept_no IN
 	   (
  		SELECT dept_no
   		 FROM departments as d
  		  WHERE d.dept_name = 'Sales'
 		)
 			);
			

--Lists each employee in the Sales and Development departments, including their
--employee number, last name, first name, and department name
SELECT e.first_name, e.last_name, e.emp_no, d.dept_name
From employees as e
JOIN dept_emp as de
ON (e.emp_no= de.emp_no)
JOIN departments as d
on (de.dept_no= d.dept_no)
WHERE d.dept_name IN
 	 ('Sales', 'Development');


--Lists the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name)
SELECT last_name, COUNT(*)
From employees
GROUP BY last_name
ORDER BY count(last_name) DESC;