CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

-- to create the  table 'Worker'
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

-- insert rows into the table 'Worker'
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

-- to create the  table 'Bonus'
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- insert rows into the table 'Bonus'
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

-- to create the  table 'Title'
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- insert rows into the table 'Title'
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

---------------------------------------------------------------

/*Q-1. Write an SQL query to fetch “FIRST_NAME” 
from Worker table using the alias name as <WORKER_NAME>.
*/
-- Ans:
select * from worker;

select FIRST_NAME AS WORKER_NAME 
from Worker;

----------------------------------------------------------------

/*Q-2. Write an SQL query to fetch “FIRST_NAME”
 from Worker table in upper case.
*/
-- Ans:
select upper(FIRST_NAME)
from Worker;

----------------------------------------------------------------

/*Q-3. Write an SQL query to fetch 
unique values of DEPARTMENT from Worker table.
*/
-- Ans:
select DISTINCT DEPARTMENT
from Worker;

----------------------------------------------------------------

/*Q-4. Write an SQL query to print the FIRST_NAME 
and LAST_NAME from Worker table into a single 
column COMPLETE_NAME. A space char should separate them.
*/
-- Ans:
select CONCAT(FIRST_NAME,' ', LAST_NAME) 
As COMPLETE_NAME 
from Worker; 

----------------------------------------------------------------

/*Q-5. Write an SQL query to print all Worker
 details from the Worker table order
 by FIRST_NAME Ascending.
*/
-- Ans:
select * from Worker 
order by FIRST_NAME asc; 

----------------------------------------------------------------

/*Q-6. Write an SQL query to print all Worker 
details from the Worker table order 
by FIRST_NAME Ascending and DEPARTMENT Descending.
*/
-- Ans:
select * from Worker 
order by FIRST_NAME asc ,DEPARTMENT desc; 

----------------------------------------------------------------

/*Q-7. Write an SQL query to print details for
 Workers with the first name as “Vipul” and “Satish” 
 from Worker table.
*/
-- Ans:
select * from Worker
where FIRST_NAME  in ("Vipul","Satish");

---------------------------------------------------------------

/*Q-8. Write an SQL query to print details of
 workers excluding first names, “Vipul” and “Satish” 
 from Worker table.
*/
-- Ans:
select * from Worker
where FIRST_NAME  not in ("Vipul","Satish");

---------------------------------------------------------------

/*Q-9. Write an SQL query to print details of Workers
 with DEPARTMENT name as “Admin”.
*/
-- Ans:
select * from Worker 
where DEPARTMENT = "Admin";

---------------------------------------------------------------

/*Q-10. Write an SQL query to print details of the Workers 
whose FIRST_NAME contains ‘a’.
*/
-- Ans:
select * from Worker 
where first_name LIKE "%a%";

---------------------------------------------------------------

/*Q-11. Write an SQL query to print details of the Workers 
whose FIRST_NAME ends with ‘a’.
*/
-- Ans:
select * from Worker 
where first_name LIKE "%a";

---------------------------------------------------------------

/*Q-12. Write an SQL query to print details of the Workers 
whose FIRST_NAME ends with ‘h’ and contains six alphabets.
*/
-- Ans:
select * from Worker 
where first_name LIKE "_____h";

---------------------------------------------------------------

/*Q-13. Write an SQL query to print details of the Workers
 whose SALARY lies between 100000 and 500000.
*/
-- Ans:
select * from Worker 
where SALARY between 100000 and 500000;

---------------------------------------------------------------

/*Q-14. Write an SQL query to print details of the Workers 
 who have joined in Feb’2014.
*/
-- Ans:
select * from Worker 
where year(joining_date) = 2014 and month(joining_date) = 2;

---------------------------------------------------------------

/*Q-15. Write an SQL query to fetch the count of employees 
working in the department ‘Admin’.
*/
-- Ans:
select count(DEPARTMENT) 
from Worker where DEPARTMENT = "Admin";

---------------------------------------------------------------

/*Q-16. Write an SQL query to fetch worker names 
with salaries >= 50000 and <= 100000.
*/
-- Ans:
select concat(FIRST_NAME,' ',LAST_NAME)
As WORKER_NAME ,SALARY
from Worker 
where SALARY >=100000 and  SALARY <=500000;

---------------------------------------------------------------

/*Q-17. Write an SQL query to fetch the no. of workers 
for each department in the descending order.
*/
-- Ans:
select DEPARTMENT, count(WORKER_ID) No_Of_Workers 
from Worker 
group by  DEPARTMENT 
order by No_Of_Workers desc;

---------------------------------------------------------------

/*Q-18. Write an SQL query to print details of the Workers
 who are also Managers.
*/
-- Ans:
select DISTINCT w.FIRST_NAME, wt.WORKER_TITLE
from Worker w
INNER JOIN Title wt
on w.WORKER_ID = wt.WORKER_REF_ID
and wt.WORKER_TITLE in ("Manager");

---------------------------------------------------------------

/*Q-19. Write an SQL query to fetch duplicate records
 having matching data in some fields of a table.
*/
-- Ans:
select WORKER_TITLE, AFFECTED_FROM, COUNT(*)
from Title
group by WORKER_TITLE, AFFECTED_FROM
having COUNT(*) > 1;

---------------------------------------------------------------

/*Q-20. Write an SQL query to show only odd rows 
from a table.
*/
-- Ans:
select * from Worker 
where mod(WORKER_ID, 2) <> 0;

---------------------------------------------------------------

 /*Q-21. Write an SQL query to show only even rows 
 from a table.
 */
-- Ans:
select * from Worker 
where mod(WORKER_ID, 2) = 0;

---------------------------------------------------------------

/*Q-22. Write an SQL query to show the current date and time.
*/
-- Ans:
select curdate();

---------------------------------------------------------------

/*Q-23. Write an SQL query to show the top n (say 10) 
records of a table.
*/
-- Ans:
select * from Worker 
order by SALARY desc
 LIMIT 10;

---------------------------------------------------------------

/*Q- 24. Write an SQL query to determine the nth (say n=5)
 highest salary from a table.
 */
 -- Ans:
set @input:=4;
select WORKER_ID ,FIRST_NAME , LAST_NAME , SALARY
from Worker W 
where @input =(select COUNT(DISTINCT SALARY) 
from Worker S
where W.Salary<=S.Salary);

 
---------------------------------------------------------------

/*Q-25. Write an SQL query to fetch the list of employees
 with the same salary.
 */
-- Ans:
select DISTINCT W.WORKER_ID, W.FIRST_NAME, W.SALARY 
from Worker W1, Worker W2 
where W1.Salary = W2.Salary 
and W1.WORKER_ID != W2.WORKER_ID;

---------------------------------------------------------------

/*Q-26. Write an SQL query to show the second 
highest salary from a table.
*/
-- Ans:
select max(SALARY) from Worker 
where SALARY not in (select max(SALARY) from Worker);

---------------------------------------------------------------

/*Q-27. Write an SQL query to fetch the first 50% 
records from a table.
*/
-- Ans:
select * from Worker
where WORKER_ID <= (select count(WORKER_ID)/2 from Worker);

---------------------------------------------------------------

/*Q-28. Write an SQL query to fetch the departments
 that have less than five people in it.
*/
-- Ans:
select DEPARTMENT, count(WORKER_ID) As "N0. of Workers" 
from Worker 
group by DEPARTMENT 
having count(WORKER_ID) < 5;

---------------------------------------------------------------

/*Q-29. Write an SQL query to show all departments along 
with the number of people in there.
*/
-- Ans:
select DEPARTMENT, count(DEPARTMENT) As "N0. of Workers" 
from Worker 
group by DEPARTMENT;

 ---------------------------------------------------------------
 
 /*Q-30. Write an SQL query to show the last record 
 from a table.
 */
 -- Ans:
 select * from worker 
 order by WORKER_ID  desc
 LIMIT 1; 
 ---------------------------------------------------------------
 
 /*Q- 31. Write an SQL query to fetch the first
 row of a table.
 */
 -- Ans:
 select * from Worker
 where WORKER_ID = (select min(WORKER_ID) from Worker);
 
 ---------------------------------------------------------------
 
 /*Q-32. Write an SQL query to fetch three
 max salaries from a table.
 */
 -- Ans:
 select distinct Salary
 from Worker a where 3 >= (select count(distinct Salary) 
 from Worker b where a.Salary <= b.Salary) 
 order by a.Salary desc;
 
 ---------------------------------------------------------------
 
 /*Q- 33. Write an SQL query to fetch three 
 min salaries from a table.
 */
 -- Ans:
 select distinct Salary 
 from Worker a WHERE 3 >= (select count(distinct Salary) 
 from Worker b WHERE a.Salary >= b.Salary) 
 order by a.Salary desc;

 ---------------------------------------------------------------
 
/*Q-34. Write an SQL query to fetch departments along 
with the total salaries paid for each of them.
*/
 -- Ans:
  select DEPARTMENT, sum(Salary)
  from Worker
  group by DEPARTMENT;
  
 ---------------------------------------------------------------
 
/*Q-35. Write an SQL query to fetch the names of workers
 who earn the highest salary.
*/
 -- Ans:
 select FIRST_NAME, SALARY 
 from Worker 
 where SALARY=(select max(SALARY) from Worker);
 
---------------------------------------------------------------
  