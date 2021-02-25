-- 1 Display name and total renumeration for all employees.
SELECT ENAME, SAL*12 "REMUNERATION" 
FROM EMP;
-- 2 ORACLE USERS: Display each employees name and hiredate from dept. 20.
SELECT ENAME, HIREDATE 
FROM EMP 
WHERE DEPTNO = 20;
-- 3 Display each employee name with hiredate, and salary review date.
-- Assume review date is one year after hiredate.
-- Order the output in ascending review date order.
SELECT ENAME, HIREDATE, HIREDATE+365 "REVIEW" 
FROM EMP;
-- 4 (CHALLENGE) Print a list of employees displaying just salary 
-- if more than 1500. If exactly 1500 display 'On target', 
-- if less than 1500 display 'Below 1500'.
-- Hint: Oracle User will need DECODE, SIGN and ORDER BY
SELECT ENAME, DECODE(SIGN(1500- SAL), 1, 'Below 1500', 0, 'On Target ', SAL) SALARY 
FROM EMP 
ORDER BY ENAME;