-- 1-Display all employee names and their department name, in department name order.
SELECT ENAME, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY DNAME ;

-- 2-Display all employee names, department number and name.
SELECT ENAME, DNAME, E.DEPTNO
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO ;

-- 3-Display the department that has no employees. Same question as last week where you used a subquery. This week use an Outer Join (+).
SELECT D.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO (+) = D.DEPTNO
AND	E.EMPNO IS NULL ;

-- 4-Display the name, location and department of employees whose salary is more than 1500 a month.
SELECT ENAME, LOC LOCATION,  DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND SAL > 1500 ;

-- 5-Produce a list showing employees salary grades.
SELECT ENAME, JOB, SAL, GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL ;

-- 6-Show only employees on grade 3.
SELECT ENAME, JOB, SAL, GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL 
AND GRADE = 3 ;

--7-Show all employees in Dallas.
SELECT ENAME, SAL, LOC LOCATION
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND LOC = 'DALLAS' ;

--8-List the employee name, job, salary, grade and department name for everyone in the company except clerks. Sort on descending salary.
SELECT ENAME, JOB, SAL, GRADE, DNAME
FROM EMP, SALGRADE, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND SAL BETWEEN LOSAL AND HISAL
AND	JOB <> 'CLERK'
ORDER BY SAL DESC ;

--9-(Harder).  
--List the following details for employees who earn 36000 a year or who are clerks.
SELECT ENAME, JOB, SAL*12 + NVL(COMM, 0) ANNUAL_SAL, D. DEPTNO, DNAME, GRADE 
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO
AND SAL BETWEEN LOSAL AND HISAL
AND	(SAL*12 + NVL(COMM, 0) = 36000
OR E. JOB = ' CLERK' )
ORDER BY E.JOB ;