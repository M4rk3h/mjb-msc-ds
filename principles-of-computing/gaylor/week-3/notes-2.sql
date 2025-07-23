-- 1 Find the minimum salary of all employees.
SELECT MIN(SAL) "MIN SALARY" 
FROM EMP;

-- 2 Find the minimum, maximum and average salaries of all employees.
SELECT MIN(SAL) "MIN SALARY", MAX(SAL) "MAX SALARY", AVG(SAL) "AVG SALARY" 
FROM EMP;

-- 3 List the minimum and maximum salary for each job type.
SELECT DISTINCT JOB, MIN(SAL) "MIN SALARY", MAX(SAL) "MAX SALARY" 
FROM EMP 
GROUP BY JOB;

-- 4 Find out how many managers there are without listing them.
SELECT COUNT(*) "NO OF MANAGERS" 
FROM EMP 
WHERE JOB='MANAGER';

-- 5 Find the average salary and average total remuneration for each job type.  
SELECT DISTINCT JOB, AVG(SAL) "AVG SALARY", AVG(SAL*12) "AVG ANNUAL" 
FROM EMP 
GROUP BY JOB 
ORDER BY JOB;

-- 6 Find out the difference between highest and lowest salaries.
SELECT MAX(SAL) - MIN(SAL) "DIFFERENCES"
FROM EMP;

-- 7 Find all departments which have more than 3 employees.
SELECT DEPTNO, COUNT(*) 
FROM EMP 
GROUP BY DEPTNO 
HAVING COUNT(*) > 3 
ORDER BY DEPTNO;

-- 8 Check whether all employee numbers are indeed unique.
--SELECT COUNT(EMPNO) "NO OF EMPLOYEES", COUNT(DISTINCT EMPNO) "NO OF UNIQUE EMPLOYEES" FROM EMP;
SELECT CASE WHEN COUNT(DISTINCT EMPNO)= COUNT(EMPNO) 
THEN 'ALL VALUES ARE UNIQUE' 
ELSE 'COLUMN VALUES ARE NOT UNIQUE' END 
FROM EMP;

-- 9 List lowest paid employees working for each manager. Exclude any groups 
-- where the minimum salary is less than 1000. Sort the output by salary.
SELECT MGR, MIN(SAL) 
FROM EMP 
GROUP BY MGR 
HAVING MIN(SAL) <= 1000 
ORDER BY MIN(SAL); -- WRONG
