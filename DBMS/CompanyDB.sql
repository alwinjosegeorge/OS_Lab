Create Table Employee(Emp_Id Int Primary Key,Emp_Name Varchar(20),Department Varchar(20),Salary Int);
Insert Into Employee Values(01,'Febin','HR',5000);
Insert Into Employee Values(02,'Alwin Jose George','MARKETING',9500);
Insert Into Employee Values(03,'Joe','PRODUCTIONS',7500);
Insert Into Employee Values(04,'Joshwin','SALES',10000);
Select * From Employee Where(Salary>7000);

Update Employee set salary=8200 where(Emp_Name='Joshwin');
Select * From Employee;
insert into Employee values(05,'Nikkita','Production',6700);
select * from Employee;
Delete from Employee where (Emp_ID=3);
select * from EMployee;
SELECT * FROM Employee WHERE Emp_Name NOT LIKE 'D%' AND Emp_Name NOT LIKE 'O%';
SELECT Department, SUM(Salary) AS Total_Salary FROM Employee GROUP BY Department;
UPDATE employee SET salary = salary * 1.05 WHERE Department = 'Production';
select * from employee;
Delete from Employee where(salary<7000);
Select * From Employee;
select * from Employee where Emp_Name like 'Nikkita%';
update employee set salary=8200 where department='MARKETING';
select * from Employee;
delete Employee where EMP_ID=2;
select * from Employee;
SELECT * FROM Employee WHERE Emp_Name  LIKE '%it%';
SELECT Reverse(UPPER(department)) AS reversed_department_uppercase FROM EMPLOYEE;
SELECT * FROM Employee WHERE DEPARTMENT LIKE 'M_R%';
Select Initcap(Department) As Togglecased_Department
FROM Employee;
