CREATE TABLE students (
    roll NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    physics NUMBER(2) CHECK (physics <= 25),
    chemistry NUMBER(2) CHECK (chemistry <= 25),
    mathematics NUMBER(2) CHECK (mathematics <= 50)
);
Insert Into Students Values (1,'Alwin',20,18,40);
Insert Into Students Values (2,'Joe',15,12,30);
Insert Into Students Values (3,'Febin',10,14,20);
Insert Into Students Values (4,'Joshwin',22,20,45);
Insert Into Students Values (5,'Nikhil',18,16,35);
Insert Into Students Values (6,'Angel',25,21,48);
Insert Into Students Values (7,'Nikkita',8,10,22);
Insert Into Students Values (8,'Diya',19,23,41);
Insert Into Students Values (9,'Alex',24,22,49);
Insert Into Students Values (10,'Leya',17,11,28);
Select Avg(Physics) As Class_Avg_Physics From Students;
Select Max(Mathematics) As Highest_Marks_Maths From Students;
SELECT MIN(chemistry) AS lowest_marks_chemistry FROM students;
Select Count(*) As Pass_Physics
FROM students
WHERE physics >= 12;
Select *
FROM students
WHERE physics >=12
AND chemistry >=12
AND mathematics >=25;
SELECT roll, name,
       (Physics + Chemistry + Mathematics) As Totalmark
FROM students;
Select Avg(Physics + Chemistry + Mathematics) As Class_Average
FROM students;
Select Count(*) As Total_Pass_Students
FROM students
WHERE physics >=12
And Chemistry >=12
AND mathematics >=25;
