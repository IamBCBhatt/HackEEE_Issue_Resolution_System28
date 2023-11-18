show databases;
use logins;
show tables;
Desc Complaints;
create table Complaints(Complaint_Id BIGINT ,CITY VARCHAR(25),Domain Varchar(15),DESCRIPTION text,file_data MEDIUMBLOB);
Insert into Complaints values(1111111,'DELHI','Water Issue','I have water problems',NULL);
SELECT * FROM Complaints;
create table Complaints(Complaint_Id BIGINT PRIMARY KEY,CITY VARCHAR(25),Domain Varchar(15),DESCRIPTION text,file_data MEDIUMBLOB default NULL);
Insert into Complaints values(1111111,'DELHI','Water Issue','I have water problems',NULL);
ALTER TABLE Complaints add column (status int);
ALTER TABLE Complaints
ADD UNIQUE (Complaint_Id);
SELECT * FROM Complaints;
DELETE FROM Complaints WHERE Complaint_Id = 1111112;
ALTER TABLE Complaints DROP column status;
CREATE TABLE WATER_COMP(Complain_Id BIGINT,CITY VARCHAR(25),DESCRIPTION text,file_data MEDIUMBLOB default NULL,status int,FOREIGN KEY(Complain_ID)references Complaints(Complain_ID),;
ALTER TABLE Complaints add column (status int default 0);
CREATE TABLE WATER_COMP(Complain_Id BIGINT,CITY VARCHAR(25),DESCRIPTION text,file_data MEDIUMBLOB default NULL,status int);
INSERT INTO ROAD_COMP(Complaint_Id,CITY,DESCRIPTION,file_data,status,doi) SELECT Complaint_Id,CITY,DESCRIPTION,file_data,status,doi FROM Complaints where Domain like "Road%"; 
SELECT * FROM Complaints;
ALTER TABLE Complaints add column (doi date);
ALTER TABLE WATER_COMP add column (doi date);
INSERT INTO WATER_COMP(Complain_Id,CITY,DESCRIPTION,file_data,status) SELECT Complaint_Id,CITY,DESCRIPTION,file_data,status FROM Complaints where Domain like "Water%" and ; 
DELETE FROM WATER_COMP;
CREATE TABLE WATER_COMP(Complaint_Id BIGINT,CITY VARCHAR(25),DESCRIPTION text,file_data MEDIUMBLOB default NULL,status int default 0,FOREIGN KEY(Complaint_Id)references Complaints(Complaint_Id)on delete set null on update cascade);
CREATE TABLE TAX_COMP(Complaint_Id BIGINT,CITY VARCHAR(25),DESCRIPTION text,file_data MEDIUMBLOB default NULL,status int default 0,FOREIGN KEY(Complaint_Id)references Complaints(Complaint_Id)on delete set null on update cascade);
CREATE TABLE SEWG_COMP(Complaint_Id BIGINT,CITY VARCHAR(25),DESCRIPTION text,file_data MEDIUMBLOB default NULL,status int default 0,FOREIGN KEY(Complaint_Id)references Complaints(Complaint_Id)on delete set null on update cascade);
CREATE TABLE WASTE_COMP(Complaint_Id BIGINT,CITY VARCHAR(25),DESCRIPTION text,file_data MEDIUMBLOB default NULL,status int default 0,FOREIGN KEY(Complaint_Id)references Complaints(Complaint_Id)on delete set null on update cascade);
CREATE TABLE ROAD_COMP(Complaint_Id BIGINT,CITY VARCHAR(25),DESCRIPTION text,file_data MEDIUMBLOB default NULL,status int default 0,FOREIGN KEY(Complaint_Id)references Complaints(Complaint_Id)on delete set null on update cascade);
CREATE TABLE STRAY_COMP(Complaint_Id BIGINT,CITY VARCHAR(25),DESCRIPTION text,file_data MEDIUMBLOB default NULL,status int default 0,FOREIGN KEY(Complaint_Id)references Complaints(Complaint_Id)on delete set null on update cascade);
ALTER TABLE TAX_COMP add column (doi date);
DESC Complaints;
SELECT * FROM Complaints;
SELECT * FROM ROAD_COMP;
Delete from WATER_COMP ORDER BY Complaint_Id asc LIMIT 2;
UPDATE Complaints set status = 1 WHERE Complaint_Id NOT IN (SELECT Complaint_Id from WATER_COMP) AND Domain Like "Water%";
create table MUNICIPAL_AUTHORITY(AUTHORITY_ID INT NOT NULL,PASSWORD VARCHAR(10),PRIMARY KEY(AUTHORITY_ID));
insert into MUNICIPAL_AUTHORITY VALUES(1,'abcde');
insert into MUNICIPAL_AUTHORITY VALUES(2,'abrde');
insert into MUNICIPAL_AUTHORITY VALUES(3,'erwde');
insert into MUNICIPAL_AUTHORITY VALUES(4,'werre');
insert into MUNICIPAL_AUTHORITY VALUES(5,'fsrwqf');
insert into MUNICIPAL_AUTHORITY VALUES(6,'qergqg');
select * from MUNICIPAL_AUTHORITY;
DROP TABLE COMPLAINER;
create table COMPLAINER(LNAME varchar(20),FNAME varchar(20),COMPLAINER_ID INT,PASSWORD VARCHAR(10),PNO VARCHAR(10), HNO VARCHAR(5),CITY VARCHAR(20),STATE VARCHAR(15),PRIMARY KEY(COMPLAINER_ID));
ALTER TABLE Complaints add column(COMPLAINER_ID INT);
ALTER TABLE COMPLAINER ALTER STATE SET default "Karnataka" ;
ALTER TABLE Complaints add FOREIGN KEY(COMPLAINER_ID) REFERENCES COMPLAINER(COMPLAINER_ID);
INSERT INTO COMPLAINER VALUES('John' , 'Smith', 11111 , 'abcde', '2332213223', '423' , 'Yellapur','Karnataka');
INSERT INTO COMPLAINER VALUES('Martin' , 'Riya', 11112 , 'edrde', '930443223', '34' , 'Gajendragarh','Karnataka');
INSERT INTO COMPLAINER VALUES('Anand' , 'Arjun', 11113 , '33rde', '2393243223', '31' , 'Goribidnur','Karnataka');
INSERT INTO COMPLAINER VALUES('Sardar' , 'Sade', 11114 , '33r55', '2393593853', '64' , 'Chikmagalur','Karnataka');
INSERT INTO COMPLAINER VALUES('Sarath' , 'Nakul', 11116 , 'fdsfd', '3413242431', '332' , 'Chikodi','Karnataka');
SELECT * FROM COMPLAINER;
ALTER TABLE COMPLAINER ADD COLUMN EMAIL varchar(50);
SELECT * FROM WATER_COMP;
SELECT * FROM SEWG_COMP;
DELETE FROM ROAD_COMP WHERE CITY = 'Athni';
SELECT * FROM Complaints WHERE Domain = 'Road department' and CITY = 'Gadag' and COMPLAINER_ID = 11111;
INSERT INTO TAX_COMP(Complaint_Id,CITY,DESCRIPTION,file_data,doi) Select Complaint_Id,CITY,DESCRIPTION,file_data,doi from WATER_COMP ORDER BY Complaint_Id asc LIMIT 1;
UPDATE Complaints SET Domain = 'Tax department' where Complaint_Id = 1111143;
ALTER TABLE Complaints add column (feedback text default null);
ALTER TABLE Complaints add column (rating int default -1);
SELECT Domain, COUNT(*)
FROM Complaints
WHERE status = 1
GROUP BY Domain;
SELECT Domain, COUNT(*)
FROM Complaints
WHERE status = 0
GROUP BY Domain;
ALTER TABLE COMPLAINER DROP COLUMN EMAIL;
ALTER TABLE COMPLAINER ADD COLUMN EMAIL varchar(50);
DELETE FROM Complaints where Complaint_Id = 1111160;
SELECT Domain, 
       SUM(CASE WHEN rating = 5 THEN 1 ELSE 0 END) as rating_5, 
       SUM(CASE WHEN rating = 4 THEN 1 ELSE 0 END) as rating_4,
       SUM(CASE WHEN rating = 3 THEN 1 ELSE 0 END) as rating_3,
       SUM(CASE WHEN rating = 2 THEN 1 ELSE 0 END) as rating_2,
       SUM(CASE WHEN rating = 1 THEN 1 ELSE 0 END) as rating_1,
       SUM(CASE WHEN rating = -1 THEN 1 ELSE 0 END) as not_rated
FROM Complaints
GROUP BY Domain;
Select Domain, Count(*) from Complaints group by Domain;
Select EMAIL from COMPLAINER C, Complaints S where C.COMPLAINER_ID = S.COMPLAINER_ID AND Complaint_Id = 1111164;
SELECT * FROM COMPLAINER;
SELECT * FROM Complaints;
SELECT * FROM MUNICIPAL_AUTHORITY;
