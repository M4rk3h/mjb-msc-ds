-- 1. Select all information from the SALGRADE table.
select * from salgrade;
-- 2. Select all information from the EMP table.
select * from emp
-- 3. List all employees who have a salary between 1000 and 2000.
select * from emp where between 1000 and 2000;
-- 4. List the names and jobs of all clerks in department 20.
select ename, job from emp where deptno = 20;
-- 5. Display all employees’ names which have TH or LL in them.
select ename from emp where ename like '%TH%' or ename like '%LL%';
-- 6. Display name, job and salary for all employees who have a manager.
select ename, job, sal from emp where mgr is not null;
-- 7. Display all employees who were hired during 2003.
select * from emp where hiredate like '%03';
--8. List all department numbers and names in department name order.
select deptno, dname from dept order by deptno;