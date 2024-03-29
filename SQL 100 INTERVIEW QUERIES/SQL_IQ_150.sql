
# Q1. Display all the information of the EMP table?
SELECT * FROM EMP_DETAILS;

# Q2. Display unique Jobs from EMP table?                       
SELECT DISTINCT JOB FROM EMP_DETAILS;

# Q3. List the emps in the asc order of their Salaries?
SELECT * FROM EMP_DETAILS ORDER BY SALARY ASC;

# Q4. List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT * FROM EMP_DETAILS ORDER BY DEPT_NO ASC, JOB DESC;

# Q5. Display all the unique job groups in the descending order?
SELECT DISTINCT JOB FROM EMP_DETAILS ORDER BY JOB DESC;

# Q6. Display all the details of all ‘Mgrs’?
SELECT * FROM EMP_DETAILS WHERE EMP_NO IN (SELECT MGR FROM EMP_DETAILS);

# Q7. List the emps who joined before 1981.
SELECT*FROM EMP_DETAILS WHERE HIRE_DATE<"1981-01-01";

# Q8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Ann.sal?
SELECT Emp_No, Emp_Name, Salary, 
ROUND(Salary/30,2) AS Daily_Salary, 
12*Salary AS Annual_Salary 
FROM EMP_DETAILS 
ORDER BY Annual_Salary ASC;

# Q9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs.?
SELECT 
    Emp_No, Emp_Name, Job, Hire_Date, 
    FLOOR(DATEDIFF(CURDATE(), Hire_Date)/365) AS Exp_Years
FROM 
    EMP_DETAILS 
WHERE 
    Emp_No IN (SELECT MGR FROM EMP_DETAILS WHERE MGR IS NOT NULL);

# Q10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7698.?
SELECT 
Emp_No, Emp_Name, Salary,
FLOOR(DATEDIFF(current_date(),Hire_Date)/365) AS Exp_Years
FROM EMP_DETAILS
WHERE MGR= 7698;

# Q11. Display all the details of the emps whose Comm. Is more than their Sal.?
SELECT * FROM EMP_DETAILS 
WHERE COMM>SALARY;

# Q12. List the emps in the asc order of Designations of those joined after the second half of 1981.
SELECT * FROM EMP_DETAILS 
WHERE HIRE_DATE > '1981-07-01' 
ORDER BY JOB ASC;

# Q13. List the emps along with their Exp and Daily Sal is more than Rs.50.?
SELECT 
    Emp_No, Emp_Name, Job, MGR, Hire_Date, Salary, Comm, Dept_No, 
    FLOOR(DATEDIFF(CURRENT_DATE(), Hire_Date)/365) AS Exp_Year, 
    Salary/30 AS Daily_Salary
FROM 
    Emp_Details
WHERE 
    (Salary/30) > 50;
    
# Q14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.?
SELECT * FROM EMP_DETAILS
WHERE JOB = 'CLERK' OR JOB = 'ANALYST'
ORDER BY JOB ASC;

# Q15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.?
SELECT * FROM EMP_DETAILS
WHERE 
HIRE_DATE = '1981-05-01' OR 
HIRE_DATE = '1981-12-03' OR 
HIRE_DATE = '1981-12-17' OR 
HIRE_DATE = '1980-01-19'
ORDER BY HIRE_DATE ASC;

-- OR --
SELECT * FROM EMP_DETAILS
WHERE
HIRE_DATE IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19')
ORDER BY HIRE_DATE ASC;

# Q16. List the emp who are working for the Deptno 10 or 20 ?
SELECT * FROM EMP_DETAILS
WHERE 
DEPT_NO=10 OR DEPT_NO =20;

-- OR --

SELECT * FROM EMP_DETAILS
WHERE 
DEPT_NO IN (10,20);

# Q17. List the emps who are joined in the year 81?
SELECT * FROM EMP_DETAILS
WHERE HIRE_DATE 
BETWEEN '1981-01-01' AND '1981-12-31'
ORDER BY HIRE_DATE;
-- OR --
SELECT * FROM EMP_DETAILS
WHERE
YEAR(HIRE_DATE) = 1981
ORDER BY HIRE_DATE;

# Q18. List the emps who are joined in the month of Sep 1981?
SELECT * FROM EMP_DETAILS
WHERE
MONTH(HIRE_DATE)=9 AND YEAR(HIRE_DATE)=1981
ORDER BY HIRE_DATE;

# Q19. List the emps Who Annual sal ranging from 22000 and 45000 ?
SELECT *, SALARY*12 AS ANNUAL_SALARY FROM EMP_DETAILS
WHERE 
SALARY*12 BETWEEN 22000 AND 45000
ORDER BY SALARY*12;

# Q20. List the Enames those are having five characters in their Names ?
SELECT * FROM EMP_DETAILS
WHERE
LENGTH(EMP_NAME)=5;

# Q21. List the Enames those are starting with ‘S’ and with five characters ?
SELECT * FROM EMP_DETAILS
WHERE 
LENGTH(EMP_NAME)=5 AND
EMP_NAME LIKE 'S%';

# Q22. List the emps those are having four chars and third character must be ‘r’ ?
SELECT * FROM EMP_DETAILS
WHERE 
LENGTH(EMP_NAME)=4 AND
EMP_NAME LIKE '__R%';

# Q23. List the Five character names starting with ‘S’ and ending with ‘H’ ?
SELECT * FROM EMP_DETAILS
WHERE 
LENGTH(EMP_NAME)=5 AND
EMP_NAME LIKE 'S%H';

# Q24. List the emps who joined in January ?
SELECT * FROM EMP_DETAILS
WHERE
MONTH(HIRE_DATE)=1;

# Q25. List the emps who joined in the month of which second character is ‘a’ ?
SELECT * FROM EMP_DETAILS
WHERE
DATE_FORMAT(HIRE_DATE, '%M') LIKE '_a%';
-- OR --

SELECT *
FROM EMP_DETAILS
WHERE MID(DATE_FORMAT(HIRE_DATE, '%M'), 2, 1) = 'a';

# Q26. List the emps whose Sal is four digit number ending with Zero ?
SELECT * FROM EMP_DETAILS
WHERE 
LENGTH(SALARY)=4 AND SALARY LIKE '%0';

# Q27. List the emps whose names having a character set ‘ll’ together ?
SELECT * FROM EMP_DETAILS
WHERE 
EMP_NAME LIKE '%LL%';

# Q28. List the emps those who joined in 80’s ?
SELECT * FROM EMP_DETAILS
WHERE
YEAR(HIRE_DATE)=1980;

# Q29. List the emps who does not belong to Deptno 20 ?
SELECT * FROM EMP_DETAILS WHERE DEPT_NO NOT IN (20);
-- OR --
SELECT * FROM EMP_DETAILS WHERE DEPT_NO != 20;
-- OR --
SELECT * FROM EMP_DETAILS WHERE DEPT_NO <> 20;
-- OR 
SELECT * FROM EMP_DETAILS WHERE DEPT_NO NOT LIKE 20;

# Q30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries ?
SELECT * FROM EMP_DETAILS
WHERE JOB 
NOT IN ('PRESIDENT', 'MANAGER')
ORDER BY SALARY ASC;
-- OR --
SELECT * FROM EMP_DETAILS
WHERE 
JOB NOT LIKE 'PRESIDENT' AND JOB NOT LIKE 'MANAGER'
ORDER BY SALARY;
-- OR --
SELECT * FROM EMP_DETAILS
WHERE
JOB != 'PRESIDENT' AND JOB <> 'MANAGER'
ORDER BY SALARY;

# Q31. List all the emps who joined before or after 1981 ?
SELECT * FROM EMP_DETAILS
WHERE
YEAR(HIRE_DATE) > 1981;

# Q32. List the emps whose Empno not starting with digit78 ?
SELECT * FROM EMP_DETAILS
WHERE 
EMP_NO NOT LIKE '78%';

# Q33. List the emps who are working under ‘MGR’ ?
SELECT * FROM EMP_DETAILS
WHERE MGR IN (
SELECT EMP_NO 
FROM EMP_DETAILS
WHERE JOB='MANAGER');

# Q34. List the emps who joined in any year but not belongs to the month of March?
SELECT * FROM EMP_DETAILS
WHERE
MONTH(HIRE_DATE) != 3;

# Q35. List all the Clerks of Deptno 20 ?
SELECT * FROM EMP_DETAILS
WHERE 
JOB='CLERK' AND DEPT_NO = 20;

# Q36. List the emps of Deptno 30 or 10 joined in the year 1981 ?
SELECT * FROM EMP_DETAILS
WHERE
YEAR(HIRE_DATE)=1981
AND
DEPT_NO IN (10,30);

# Q37. Display the details of SMITH ?
SELECT * FROM EMP_DETAILS
WHERE
EMP_NAME='SMITH';

# Q38. Display the location of SMITH ?
SELECT LOC FROM EMP_DETAILS E, DEPT_TABLE D
WHERE
E.EMP_NAME ='SMITH' AND 
E.DEPT_NO= D.DEPT_NO;

/* Q39. List the total information of EMP table along with DNAME and 
Loc of all the emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc
Deptno ? */
SELECT E.*, D.Dept_Name, D.Loc
FROM EMP_DETAILS E
JOIN DEPT_TABLE D ON E.Dept_No = D.Dept_No
WHERE D.Dept_Name IN ('ACCOUNTING', 'RESEARCH')
ORDER BY E.Dept_No ASC;

/* Q40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’
working in New York, Dallas with an exp more than 7 years without receiving
the Comm asc order of Loc ? */
SELECT E.Emp_No, E.Emp_Name, E.Salary, D.Dept_Name
FROM EMP_DETAILS E
JOIN DEPT_TABLE D ON E.Dept_No = D.Dept_No
WHERE E.Job IN ('MANAGER', 'ANALYST')
AND D.Loc IN ('NEW YORK', 'DALLAS')
AND E.Comm IS NULL
AND FLOOR(DATEDIFF(CURRENT_DATE(), E.Hire_Date) / 365) > 7
ORDER BY D.Loc ASC;

/* Q41. Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps
working at CHICAGO or working for ACCOUNTING dept with Ann Sal>28000, 
but the Sal should not be=3000 or 2800 who doesn’t belongs to the
Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of
Deptno and desc order of job */
SELECT 
    E.Emp_No, E.Emp_Name, E.Salary, D.Dept_Name, D.Loc, E.Dept_No, E.Job
FROM 
    EMP_DETAILS E
JOIN 
    DEPT_TABLE D ON E.Dept_No = D.Dept_No
WHERE 
    (D.Loc = 'CHICAGO' OR (D.Dept_Name = 'ACCOUNTING' AND E.Salary * 12 > 28000))
    AND E.Salary NOT IN (3000, 2800)
    AND E.MGR NOT IN (SELECT Emp_No FROM EMP_DETAILS WHERE Emp_No LIKE '__7%' OR EMP_No LIKE '__8%')
ORDER BY 
    E.Dept_No ASC, 
    E.Job DESC;
    
# Q42. Display the total information of the emps along with Grades in the asc order ?

SELECT 
    E.*, 
    CASE 
        WHEN E.Salary >= 3000 THEN 'A'
        WHEN E.Salary >= 2000 AND E.Salary < 3000 THEN 'B'
        WHEN E.Salary >= 1000 AND E.Salary < 2000 THEN 'C'
        ELSE 'D'
    END AS Grade
FROM 
    EMP_DETAILS E
ORDER BY 
    Grade ASC;
########################################################################    
# ***** Adding Grade column in Emp_Details Table *****
ALTER TABLE EMP_DETAILS
ADD COLUMN GRADE VARCHAR(10);

UPDATE EMP_DETAILS 
SET GRADE = 
CASE
	WHEN Salary >= 3000 THEN 'A'
    WHEN Salary >= 2000 AND Salary < 3000 THEN 'B'
    WHEN Salary >= 1000 AND Salary < 2000 THEN 'C'
    ELSE 'D'
END;
########################################################################
    
# Q43. List all the Grade B and Grade C emps ?
SELECT *
FROM EMP_DETAILS
WHERE Grade IN ('B', 'C')
ORDER BY GRADE ASC;

# Q44. Display all Grade A,B Analyst and Mgr ?
SELECT *
FROM EMP_DETAILS  
WHERE 
GRADE IN ('A','B')
AND 
JOB IN ('ANALYST', 'MANAGER');

# Q45. List the Empno, Ename, Sal, Dname, Grade, Exp, and Ann Sal of emps working for Dept10 or20 ?
SELECT 
    E.Emp_No, 
    E.Emp_Name, 
    E.Salary, 
    D.Dept_Name,
    E.Grade,
    FLOOR(DATEDIFF(CURRENT_DATE(), E.Hire_Date) / 365) AS Exp,
    E.Salary * 12 AS Ann_Sal
FROM 
    EMP_DETAILS E
JOIN 
    DEPT_TABLE D ON E.Dept_No = D.Dept_No
WHERE 
    E.Dept_No IN (10, 20);
    
/* Q46. List all the information of emp with Loc and the Grade of all the emps
belong to the Grade range from B to D working at the Dept those are not starting
with char set ‘OP’ and not ending with ‘S’ with the designation having a char ‘a’
any where joined in the year 1981 but not in the month of Mar or Sep and Sal
not end with ‘00’ in the asc order of Grades */
SELECT 
    E.*, 
    D.Loc
FROM 
    EMP_DETAILS E
JOIN 
    DEPT_TABLE D ON E.Dept_No = D.Dept_No
WHERE 
    E.Grade IN ('B', 'C', 'D')
    AND 
    LEFT(D.Dept_Name, 2) NOT LIKE 'OP%'
    AND 
    RIGHT(D.Dept_Name, 1) != 'S'
    AND 
    E.Job LIKE '%a%'
    AND 
    YEAR(E.Hire_Date) = 1981
    AND 
    MONTH(E.Hire_Date) NOT IN (3, 9)
    AND 
    RIGHT(E.Salary, 2) != '00'
ORDER BY 
    E.Grade ASC;
    
# Q47. List the details of the Depts along with Empno, Ename or without the emps ?
SELECT *
FROM DEPT_TABLE D
LEFT JOIN EMP_DETAILS E ON D.Dept_No = E.Dept_No;

# Q48. List the details of the emps whose Salaries more than the employee BLAKE.
SELECT * FROM EMP_DETAILS
WHERE 
SALARY > 
	   (SELECT SALARY 
		FROM EMP_DETAILS 
        WHERE EMP_NAME = 'BLAKE');
-- OR --
SELECT E.*
FROM EMP_DETAILS E
JOIN EMP_DETAILS BLAKE ON E.Salary > BLAKE.Salary
WHERE BLAKE.Emp_Name = 'BLAKE';

# Q49. List the emps whose Jobs are same as ALLEN ?
SELECT Emp_Name, Job 
FROM Emp_Details
WHERE JOB= (
			SELECT JOB 
            FROM Emp_Details
            WHERE Emp_Name='ALLEN');
            
# Q50. List the emps who are senior to King ?
SELECT Emp_Name, Hire_Date
FROM Emp_Details
WHERE HIRE_DATE < 
				(SELECT Hire_Date
                 FROM Emp_Details
                 WHERE Emp_Name = 'KING');
                 
# Q51. List the Emps who are senior to their own MGRS ?
SELECT E.*
FROM EMP_DETAILS E
JOIN EMP_DETAILS M ON E.MGR = M.Emp_No
WHERE E.Hire_Date < M.Hire_Date;

# Q52. List the Emps of Deptno 20 whose Jobs are same as Deptno10 ?
SELECT E.*
FROM EMP_DETAILS E
JOIN EMP_DETAILS E2 ON E.Job = E2.Job
WHERE E.Dept_No = 20 AND E2.Dept_No = 10;

# Q53. List the Emps whose Sal is same as FORD or SMITH in desc order of Sal ?
SELECT *
FROM EMP_DETAILS
WHERE Salary IN (
    SELECT Salary
    FROM EMP_DETAILS
    WHERE Emp_Name IN ('FORD', 'SMITH')
)
ORDER BY Salary DESC;
-- OR --
SELECT E1.*
FROM EMP_DETAILS E1
JOIN EMP_DETAILS E2 ON E1.Salary = E2.Salary
WHERE E2.Emp_Name IN ('FORD', 'SMITH')
ORDER BY E1.Salary DESC;

# Q54. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
SELECT *
FROM EMP_DETAILS
WHERE Job IN (
    SELECT Job
    FROM EMP_DETAILS
    WHERE Emp_Name = 'MILLER'
)
OR Salary > (
    SELECT Salary
    FROM EMP_DETAILS
    WHERE Emp_Name = 'ALLEN'
);

# Q55. List the Emps whose Sal is > the total remuneration of the SALESMAN ?
SELECT *
FROM EMP_DETAILS
WHERE Salary > (
    SELECT SUM(Salary + Comm)
    FROM EMP_DETAILS
    WHERE Job = 'SALESMAN'
);

SELECT *
FROM EMP_DETAILS
WHERE SALARY > (
    SELECT SUM(CASE 
				WHEN comm IS NOT NULL THEN salary + comm 	
                ELSE salary 
                END)
    FROM emp_details
    WHERE job = 'SALESMAN'
);

# Q56. List the emps who are senior to BLAKE working at CHICAGO & BOSTON ?
SELECT *
FROM (
		SELECT E.Emp_No, E.Emp_Name, E.Hire_Date, D.Loc
		FROM EMP_DETAILS E
		LEFT JOIN DEPT_TABLE D ON E.Dept_No = D.Dept_No
		WHERE D.LOC IN ('CHICAGO','BOSTON')
        ) AS LOC1 
WHERE 
	LOC1.HIRE_DATE < (
						SELECT HIRE_DATE 
						FROM EMP_DETAILS 
						WHERE EMP_NAME = 'BLAKE');

/* Q57. List the Emps of Grade C,D belongs to the dept ACCOUNTING and
RESEARCH whose Sal is more than ALLEN and exp more than SMITH in the
asc order of EXP. */
SELECT *
FROM (
SELECT 
E.EMP_NO, EMP_NAME, E.SALARY,E.Hire_Date,FLOOR(DATEDIFF(CURRENT_DATE(),E.HIRE_DATE)/365) AS Exp_Years,D.Dept_Name,E.Grade
FROM EMP_DETAILS E 
JOIN DEPT_TABLE D ON E.DEPT_NO=D.DEPT_NO) AS Q57
WHERE
Q57.Grade IN ('A','B') AND
Q57.Dept_Name IN ('ACCOUNTING', 'RESEARCH') AND
Q57.SALARY > (SELECT SALARY FROM EMP_DETAILS WHERE EMP_NAME='ALLEN') AND
Q57.Hire_Date < (SELECT Hire_Date FROM EMP_DETAILS WHERE EMP_NAME='SMITH')
ORDER BY Q57.Exp_Years ASC;

# *** NO EMPNAMES WILL BE DISPLAYED, BECAUSE SMITH IS SENIOR TO ALL. SO, NO EMP IS MORE SENIOR THAN SMITH ***

# Q58. List the emps whose jobs same as SMITH or ALLEN ?
SELECT *
FROM EMP_DETAILS
WHERE JOB  IN (
				SELECT JOB 
                FROM EMP_DETAILS 
                WHERE EMP_NAME = 'SMITH' OR EMP_NAME = 'ALLEN');
                
# Q59. Any jobs of deptno 10 those that are not found in deptno 20 ?
SELECT JOB 
FROM EMP_DETAILS
WHERE DEPT_NO =10 AND
JOB NOT IN (
			SELECT JOB 
            FROM EMP_DETAILS
            WHERE DEPT_NO=20);
            
# Q60. Find the highest sal of EMP table ?
SELECT MAX(SALARY) FROM EMP_DETAILS;
                
# Q61. Find details of highest paid employee ?
SELECT *
FROM EMP_DETAILS
WHERE SALARY = (SELECT MAX(SALARY) FROM EMP_DETAILS);
                
# Q62. Find the highest paid employee of sales department ?
SELECT E.*,D.Dept_Name
FROM EMP_DETAILS E
JOIN DEPT_TABLE D ON E.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NAME = 'SALES'
AND E.SALARY = (SELECT MAX(SALARY) FROM EMP_DETAILS WHERE DEPT_NO = D.DEPT_NO);

# Q63. List the most recently hired emp of Grade C belongs to location CHICAGO.
SELECT *
FROM (
	  SELECT 
	  E.EMP_NO, EMP_NAME, E.Hire_Date, D.LOC,E.Grade
	   FROM EMP_DETAILS E 
	   JOIN DEPT_TABLE D ON E.DEPT_NO=D.DEPT_NO) AS Q63
WHERE Q63.LOC = 'CHICAGO'
AND Q63.Grade = 'C'
ORDER BY Q63.Hire_Date DESC
LIMIT 1;

# Q64. List the employees who are senior to most recently hired employee working under king ?
SELECT * 
FROM EMP_DETAILS 
WHERE
MGR = (SELECT EMP_NO FROM EMP_DETAILS WHERE EMP_NAME='KING') AND 
HIRE_DATE < (
			 SELECT HIRE_DATE
             FROM EMP_DETAILS
             WHERE MGR = (
						  SELECT EMP_NO 
                          FROM EMP_DETAILS 
                          WHERE EMP_NAME='KING') 
			 ORDER BY HIRE_DATE DESC
             LIMIT 1);
             
# Q65. List the details of the senior employee belongs to 1981 ?
SELECT * 
FROM EMP_DETAILS
WHERE 
YEAR(HIRE_DATE)=1981
ORDER BY HIRE_DATE ASC
LIMIT 1;

# Q66. List the employees who joined in 1981 with the job same as the most senior person of the year 1981.
SELECT EMP_NAME
FROM EMP_DETAILS
WHERE YEAR(HIRE_DATE) = 1981 AND
JOB = (
		SELECT JOB 
		FROM EMP_DETAILS
		WHERE
		YEAR(HIRE_DATE)=1981
		ORDER BY HIRE_DATE ASC
		LIMIT 1);
        
# Q67. List the most senior empl working under the king and grade is more than C ?
SELECT EMP_NAME
FROM EMP_DETAILS
WHERE MGR = (SELECT EMP_NO FROM EMP_DETAILS WHERE EMP_NAME='KING') 
AND GRADE < 'C'
ORDER BY HIRE_DATE ASC LIMIT 1;

# Q68. Find the total sal given to the MGR ?
SELECT SUM(SALARY) 
FROM EMP_DETAILS 
WHERE EMP_NO IN (SELECT DISTINCT MGR FROM EMP_DETAILS);

# Q69. Find the total annual sal to distribute job wise in the year 1981 ?
SELECT JOB, SUM(SALARY*12) AS Annual_Salary
FROM Emp_Details
WHERE YEAR(HIRE_DATE) = 1981
GROUP BY JOB;

# Q70. Display total sal employee belonging to grade C ?
SELECT SUM(SALARY) 
FROM EMP_DETAILS
WHERE GRADE = 'C';

# Q71. Display the average salaries of all the clerks ?
SELECT AVG(SALARY) 
FROM EMP_DETAILS 
WHERE JOB = 'CLERK';

# Q72. List the employees in dept 20 whose sal is > the average sal 0f dept 10 emps ?
SELECT * 
FROM EMP_DETAILS
WHERE DEPT_NO=20 AND 
SALARY > (SELECT AVG(SALARY) FROM EMP_DETAILS WHERE DEPT_NO = 10);

# Q73. Display the number of employee for each job group deptno wise ?
SELECT DEPT_NO,JOB,COUNT(*) 
FROM EMP_DETAILS
GROUP BY DEPT_NO,JOB
ORDER BY DEPT_NO ASC;

# Q74. List the manage rno and the number of employees working for those mgrs in the ascending Mgrno ?
SELECT W.MGR, COUNT(*) FROM EMP_DETAILS W, EMP_DETAILS M
WHERE W.MGR = M.EMP_NO
GROUP BY W.MGR
ORDER BY W.MGR ASC;

# Q75. List the department,details where at least two emps are working ?
SELECT D.DEPT_NAME, D.DEPT_NO, COUNT(E.EMP_NO) AS EMPLOYEES
FROM DEPT_TABLE D
JOIN EMP_DETAILS E ON D.DEPT_NO = E.DEPT_NO
GROUP BY D.DEPT_NAME, D.DEPT_NO
HAVING COUNT(E.EMP_NO) >= 2;

# Q76. Display the Grade, Number of emps, and max sal of each grade ?
SELECT GRADE, COUNT(EMP_NO) AS EMPLOYEES, MAX(SALARY) AS MAX_SAL
FROM EMP_DETAILS
GROUP BY GRADE
ORDER BY GRADE ASC;

# Q77. Display dname, grade, No. of emps where at least two emps are clerks ?
SELECT D.DEPT_NAME, 
       E.Grade,
       COUNT(*) AS "No. of Emps"
FROM EMP_DETAILS E
JOIN DEPT_TABLE D ON E.DEPT_NO = D.DEPT_NO
WHERE E.Job = 'CLERK'
GROUP BY D.DEPT_NAME, E.GRADE
HAVING COUNT(*) >= 2;
-- No Two Employees, We are having only ONE CLERK with different grade and diffrent Dept.

# Q78. List the details of the department where maximum number of emps are working ?
SELECT D.DEPT_NAME, D.DEPT_NO, COUNT(E.EMP_NO) AS MAX_EMP
FROM DEPT_TABLE D 
JOIN EMP_DETAILS E ON D.DEPT_NO = E.DEPT_NO
GROUP BY D.DEPT_NAME, D.DEPT_NO
ORDER BY MAX_EMP DESC
LIMIT 1;

# Q79. Display the emps whose manager name is jones ?
SELECT EMP_NAME
FROM EMP_DETAILS
WHERE MGR = (SELECT EMP_NO FROM EMP_DETAILS WHERE EMP_NAME = 'JONES');

# Q80. List the employees whose salary is more than 3000 after giving 20% increment ?
SELECT EMP_NAME, SALARY, (0.2*SALARY) AS INC_SAL, (1.2*SALARY) AS TOT_SAL 
FROM EMP_DETAILS
WHERE (1.2*SALARY) > 3000;

# Q81. List the emps with dept names ?
SELECT E.EMP_NO,E.EMP_NAME, D.DEPT_NAME
FROM EMP_DETAILS E 
JOIN DEPT_TABLE D ON E.DEPT_NO=D.DEPT_NO
ORDER BY DEPT_NAME;

# Q82. List the emps who are not working in sales dept ?
SELECT E.EMP_NAME, D.DEPT_NAME
FROM EMP_DETAILS E
JOIN DEPT_TABLE D ON E.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NAME != 'SALES';

# Q83. List the emps name ,dept, sal and comm. For those whose salary is between 2000 and 5000 while loc is Chicago ?
SELECT E.EMP_NAME, D.DEPT_NAME, E.SALARY, E.COMM,D.LOC
FROM EMP_DETAILS E 
JOIN DEPT_TABLE D ON E.DEPT_NO=D.DEPT_NO
WHERE SALARY BETWEEN 2000 AND 5000 AND
D.LOC = 'CHICAGO';

# Q84. List the emps whose sal is greater than his managers salary ?
SELECT E.EMP_NAME, E.SALARY, M.SALARY AS MANAGER_SALARY
FROM EMP_DETAILS E
JOIN EMP_DETAILS M ON E.MGR = M.EMP_NO
WHERE E.SALARY > M.SALARY;

# Q85. Find out how may Managers are their in the company ?
SELECT COUNT(JOB) AS TOTAL_MANAGERS
FROM EMP_DETAILS
WHERE JOB='MANAGER';

# Q86. Find out least 5 earners of the company ?
SELECT EMP_NAME, SALARY
FROM EMP_DETAILS
ORDER BY SALARY ASC
LIMIT 5;

# Q87. List the managers who are not working under the president ?
SELECT * 
FROM EMP_DETAILS
WHERE JOB = 'MANAGER' AND 
MGR != (SELECT EMP_NO FROM EMP_DETAILS WHERE JOB = 'PRESIDENT');
# There are no Managers who are not working under president.\

# Q88. List those Emps whose Salary is odd value ?
SELECT *
FROM EMP_DETAILS
WHERE SALARY % 2 != 0;

# Q89. List the emp’s whose Salary contain 3 digits ?
SELECT * 
FROM EMP_DETAILS
WHERE LENGTH(SALARY)=3;

# Q90. List the emps who joined in the month of DEC ?
SELECT * 
FROM EMP_DETAILS
WHERE
MONTH(HIRE_DATE)=12;

# Q91. List the emps whose names contains ‘A’ ?
SELECT *
FROM EMP_DETAILS 
WHERE EMP_NAME LIKE 'A%';

# Q92. List the emps whose Deptno is available in his Salary ?
SELECT *
FROM EMP_DETAILS
WHERE INSTR(SALARY, Dept_No) > 0;	

# Q93. List the emps those who joined in company before 15th of the month ?
SELECT *
FROM EMP_DETAILS
WHERE DAYOFMONTH(Hire_Date) < 15;

# Q94. List The Name of dept where highest no.of emps are working.
SELECT DEPT_NAME
FROM DEPT_TABLE
WHERE DEPT_NO = (
    SELECT DEPT_NO
    FROM EMP_DETAILS
    GROUP BY DEPT_NO
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

# Q95. List the emps who joined in the company on the same date ?
SELECT *
FROM EMP_DETAILS
WHERE Hire_Date IN (
    SELECT Hire_Date
    FROM EMP_DETAILS
    GROUP BY Hire_Date
    HAVING COUNT(*) > 1
);

# Q96. List the emps with Hire date in format June 4, 1988 ?
SELECT EMP_NO, EMP_NAME, DATE_FORMAT(Hire_Date, '%M %e, %Y') AS Formatted_Hire_Date
FROM EMP_DETAILS;

# Q97. List the details of all the emps who are sub-ordinates to Blake.
SELECT EMP_NAME
FROM EMP_DETAILS
WHERE MGR = (SELECT EMP_NO FROM EMP_DETAILS WHERE EMP_NAME='BLAKE');

# Q98. List the emps who are working as Managers using co-related sub-query ?
SELECT EMP_NO, EMP_NAME
FROM EMP_DETAILS e
WHERE EXISTS (
    SELECT 1
    FROM EMP_DETAILS m
    WHERE m.MGR = e.EMP_NO
);

# Q99. Find out the emps who joined in the company before their Managers ?
SELECT E.EMP_NO, E.EMP_NAME
FROM EMP_DETAILS E
WHERE E.HIRE_DATE < (
    SELECT M.HIRE_DATE
    FROM EMP_DETAILS M
    WHERE M.EMP_NO = E.MGR
);

# Q100. List the emps end with ‘H’ all together 5 chars ?
SELECT EMP_NAME
FROM EMP_DETAILS
WHERE EMP_NAME LIKE '%H' AND
LENGTH(EMP_NAME) = 5;
 










 








