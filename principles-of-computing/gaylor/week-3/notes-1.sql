-- 1 List all department numbers and names in department name order.
SELECT DEPTNO, DNAME 
FROM DEPT 
ORDER BY DNAME;
-- 2 Display all the different job types.
SELECT DISTINCT JOB 
FROM EMP 
ORDER BY JOB;
-- 3 List the details of the employees in departments 10 and 20 
-- in alphabetical order of name.
SELECT * 
FROM EMP 
WHERE DEPTNO=10 OR DEPTNO=20 
ORDER BY ENAME;
-- SELECT * FROM EMP WHERE DEPTNO IN (10, 20) ORDER BY ENAME;
-- 4 Display name and total remuneration for all employees.
SELECT ENAME, SAL*12 REMUNERATION 
FROM EMP;
-- SELECT ENAME, SAL*12 + NVL(COMM, 0) REMUNERATION FROM EMP;
-- 5 Display name, annual salary and commission of all salespeople whose
-- monthly salary is greater than their commission. 
-- The output should be ordered by salary, highest first.  
-- If two or more employees have the same salary, 
-- sort by employee name, within the highest salary order.
SELECT ENAME, SAL*12 ANNUAL_SAL, COMM 
FROM EMP 
WHERE SAL > COMM 
ORDER BY SAL DESC;
-- SELECT ENAME, SAL*12 ANNUAL_SAL, COMM FROM EMP WHERE SAL > COMM AND JOB='SALESMAN' ORDER BY SAL DESC;
-- 6 Select data as displayed:
SELECT ENAME || ' HAS HELD THE POSITION OF', JOB, 'IN DEPT ' || DEPTNO, 'SINCE ' || HIREDATE 
FROM EMP;
-- 7 Display all employee information in ascending order of manager number.
SELECT * 
FROM EMP 
ORDER BY MGR DESC;
-- SELECT * FROM EMP ORDER BY NVL(MGR, 9999);