CREATE TABLE bank (
bankname VARCHAR2(50),
headoffice VARCHAR2(50),
branch VARCHAR2(50),
branchcode NUMBER PRIMARY KEY
);
Select *From Bank;
Insert Into Bank Values ('AJG Bank','Kottayam','Poonjar',101);
INSERT INTO bank VALUES ('Pazhamporiumbeefum Bank','Kottayam','Kaatakada',102);
Commit;
INSERT INTO bank VALUES ('KG bank','Palai','Erattupeta',103);
SAVEPOINT point1;
Insert Into Bank Values ('Federal Bank','Aluva','Perumbavoor',104);
INSERT INTO bank VALUES ('South Indian Bank','Thrissur','Angamaly',105);
ROLLBACK TO point1;
SELECT * FROM bank;
GRANT SELECT, INSERT ON bank TO system;
REVOKE INSERT ON bank FROM system
