-- 1-Find the employee(s) who earn the highest salary in each job type. Sort in descending salary order.
SELECT JOB, ENAME, SAL 
FROM EMP 
WHERE SAL IN (
	SELECT MAX(SAL) 
	FROM EMP 
	GROUP BY JOB) 
ORDER BY SAL DESC;

-- 2-Find the employees who earn the minimum salary for their job.
-- Display the result in ascending order of salary.
SELECT ENAME, JOB, SAL 
FROM EMP 
WHERE SAL IN (
	SELECT MIN(SAL) 
	FROM EMP 
	GROUP BY JOB) 
ORDER BY SAL;

-- 3-Find the most recently hired employees in each department. 
-- Sort on hiredate
SELECT	DEPTNO, ENAME, HIREDATE
FROM	EMP
WHERE	(HIREDATE, DEPTNO) IN
		(SELECT	MAX(HIREDATE),DEPTNO
		FROM EMP
		GROUP BY DEPTNO)
ORDER BY HIREDATE;

-- 4-Correlated subquery 
-- Show the following details for any employee who earns a 
-- salary greater than the average for their department.
-- Sort in department number order.
SELECT ENAME, SAL SALARY, DEPTNO
FROM EMP E
WHERE SAL >	(SELECT	AVG(SAL)
		FROM EMP
		WHERE DEPTNO = E. DEPTNO)
ORDER BY DEPTNO;

-- 5-List all the departments where there are no employees.
-- Use a subquery!
SELECT DEPTNO, DNAME
FROM DEPT
WHERE DEPTNO NOT IN	
		(SELECT DEPTNO
			FROM EMP);
