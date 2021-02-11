CREATE DATABASE TEAM11

USE TEAM11



CREATE TABLE Country (
  CountryCode Varchar(4)NOT NULL PRIMARY KEY,
  CountryName Varchar(50) NOT NULL
);
Insert into Country values 
('AUS','Austraila')
,('CAN','Canada')
,('CHE', 'Switzerland')
,('IND','India')
,('IRN','Iran')
,('IRQ','Iraq')
,('NZ', 'New Zeland')
,('SA','South Africa')
,('SWE','Swedan')
,('UAE', 'United Arab Emirates')
,('UK', 'United Kingdom')
,('USA', 'United States Of America')

DROP TABLE
CREATE TABLE Address (
Addressid int primary key
,Street varchar(40)
,city varchar(20)
,state varchar(20)
,zipcode varchar(6)
,countycode varchar(4) NOT NULL FOREIGN KEY REFERENCES Country(CountryCode)
)
SELECT * FROM Address
INSERT into Address Values
/*(101,'2192 Neque Ave','Quesada','Aenean','500062','IND'),
(102,'07 Nec St.','Magadan','Magadan Oblast','547691','UK'),
(103,'#321-5250 Donec Road','Nicoya','Guanacaste','790330','USA'),
(104,'612-6909 Nullam Rd','Dublin','Lovala','618107','AUS'),
(105,'165-1743 Sed Road','Kaduna','Kapiti','188477','IND'),
(106,'219-1843 Ante St.','Arras','Calais','842603','USA'),
(107,'5945 Vitae Street','Barranca','Lima','838256','AUS'),
(108,'8492 Feugiat Street','Chungju','Chungcheong','558169','CAN'),
(109,'2946 Ante. Av.','Cametá','PalaAuto','341495','UK'),
(110,'2886 Arcu. St.','Peñalolén','Metropolina','912516','UAE'),
(111,'#391-9263 Ut, Ave','Russell','Ontar','639201','CAN'),
(112,'371-8089 Justo Rd.','Arrah','Baruka','229914','UAE'),
(113,'509-5995 Non St.','Virton','Luxemburg','544371','IRQ'),
(114,'1290 Amet St.','Aubervilliers','Ioaa','062548','IRN'),
(115,'#571-6757 Metus Rd.','Kotli','Kamirre','376571','NZ'),
(116,'2001 Scelerisque Rd.','North Bay','Orilgn','950037','USA'),
(117,'4194 Cursus St.','Dublin','Valley','528937','NZ'),
(118,'5371 Magna Avenue','Arequipa','Johansanberg','985885','SA'),
(119,'#252-3074 Bibendum Street','Augusta','Galins','126788','CHE'),
(120,'295-9578 Molestie Rd.','Malambo','Atlan','617873','SWE'),
(121,'P.O Box 154, 9547At Av.','Dallas','Texas','916603','UK'),
(122,'#898-8082 Pulvinar St.','Girona','Catalunya','234675','AUS'),
(123,'8014 Tincidunt St.','Gongju','Cheguva','834137','SWE'),
(124,'#736-874 Aenean Ave','Osasco','São Paulo','722786','NZ'),
(125,'8585 Arcu St.','Ribeirão Preto','São Paulo','080267','CAN'),
(126,'1733 Lorem Rd.','Mexico City','Cadam','938062','UAE'),
(127,'7360 Tortor Road','Laino Castello','CapeTown','074310','SA') ,*/
(128,'1733 Lorem Rd.','Mexico City','Cadam','938062','USA'),
(129,'1733 Tortor Rd.','Mexico City','Cadam','938062','AUS'),
(130,'1733 Lorem Rd.','Mexico City','Cadam','938062','UK'),
(131,'1733 Lorem Rd.','Mexico City','Cadam','938062','UK'),
(132,'1733 Tortor Rd.','Mexico City','Cadam','938062','UAE'),
(133,'1733 Lorem Rd.','Mexico City','Cadam','938062','AUS'),
(134,'1733 Lorju Rd.','Mexico City','Cadam','938062','AUS'),
(135,'1733 Lorem Rd.','Mexico City','Cadam','938062','AUS'),
(136,'1733 Tortor Rd.','Mexico City','Cadam','938062','AUS'),
(137,'1733 Molestie Rd.','Mexico City','Cadam','938062','USA'),
(138,'1733 Lorim Rd.','Mexico City','Cadam','938062','USA')

CREATE TABLE Iata (
  Iatacode Varchar(4)NOT NULL PRIMARY KEY,
  AirportName Varchar(50)NOT NULL,
  CountryCode Varchar(4)NOT NULL FOREIGN KEY REFERENCES Country(CountryCode)

);
select * from Iata
insert into iata values
('JFK', 'John F. Kennedy International Airport' ,'USA')
,('EWR', 'Newark International Airport' ,'USA')
,('DEN', 'Denver International Airport','USA')
,('LAX', 'Los Angeles International Airport','USA' )
,('LHR', 'London Heathrow Airport' ,'UK')
,('MAN','Manchester Airport','UK')
,('SOU','Southampton Airport','UK')
,('CWL','Cardiff International Airport','UK')
,('BRS','Bristol Airport','UK')
,('YVR','Vancouver International Airport','CAN')
,('YYZ','Toronto Pearson International Airport','CAN')
,('CBR','Canberra International Airport','AUS')
,('MEL','Melbourne International Airport','AUS')
,('PER','Perth International Airport','AUS')
,('SYD','Sydney Airport' ,'AUS')

CREATE TABLE Precaution (
PrecautionID INT PRIMARY KEY,
Mask VARCHAR(3) NOT NULL CHECK(Mask IN ('YES','NO')),
Gloves VARCHAR(3) NOT NULL CHECK(Gloves IN ('YES','NO')),
Sanitizer VARCHAR(3) NOT NULL CHECK(Sanitizer IN ('YES','NO')),
Shield VARCHAR(3) NOT NULL CHECK(Shield IN ('YES','NO'))
);

insert into Precaution values
(201,'YES','YES','YES','YES'),
(202,'YES','YES','YES','NO'),
(203,'YES','YES','NO','YES'),
(204,'YES','NO','YES','YES'),
(205,'NO','YES','YES','YES'),
(206,'NO','NO','YES','YES'),
(207,'YES','YES','NO','NO'),
(208,'YES','NO','NO','YES'),
(209,'NO','YES','YES','NO'),
(210,'NO','YES','NO','YES'),
(211,'YES','NO','YES','NO'),
(212,'NO','NO','NO','YES'),
(213,'YES','NO','NO','NO'),
(214,'NO','YES','NO','NO'),
(215,'NO','NO','YES','NO')



create table PERSON(
PersonID INT NOT NUll PRIMARY KEY
,FirstName VARCHAR(20)
,LastName varchar(20)
,DateOfBirth date
,Email varchar(30)
,PhoneNumber varchar(15)
,Gender varchar(1)
,AddressID int NOT NULL FOREIGN KEY REFERENCES Address(AddressID)
,PrecautionID int NOT NULL FOREIGN KEY REFERENCES Precaution(PrecautionID) ) 

INSERT INTO Person VALUES 
(1001,'Georgi','Facello','1981-09-02','ipsum@utnulla.com','(690) 223-7222','M',101,201),
(1002,'Bezalel','Simmel','1980-06-02','Praesent.eu@eratvel.com','(495) 786-4676','F',102,202),
(1003,'Parto','Bamford','1986-12-03','nisi@tellusimperdiet.com','(899) 240-6936','M',103,203),
(1004,'Chirstian','Koblick','1994-05-01','ullamcorper@Phasellus.com','(106) 401-5272','M',104,204),
(1005,'Kyoichi','Maliniak','1985-01-21','netus.et@viverra.com','(145) 767-1115','M',105,205),
(1006,'Anneke','Preusig','1993-04-20','arcu@disparturientmontes.com','(902) 330-9208','F',106,206),
(1007,'Tzvetan','Zielinski','1977-05-23','Mauris@tempusnon.com','(462) 830-1039','F',107,207),
(1008,'Saniya','Kalloufi','1989-02-19','ante@semNullainterdum.com','(213) 898-1991','M',108,208),
(1009,'Sumant','Peac','1982-04-19','tincidunt@Quisquetincidunt.com','(123) 802-4957','F',109,209),
(1010,'Duangkaew','Piveteau','1973-06-01','Vivamus@verraDonec.com','(993) 271-3334','F',110,210),
(1011,'Mary','Sluis','1993-11-07','Aliquam@volutpatornare.com','(596) 626-7450','F',111,211),
(1012,'Patricio','Bridgland','1990-10-04','Morbi.non@egestasSed.com','(283) 741-3847','M',112,212),
(1013,'Eberhardt','Terkki','1983-06-07','sed@nullcrats.com','(775) 687-1453','M',113,213),
(1014,'Berni','Genin','1987-03-11','consectetuer@lobortis.com','(916) 723-9952','M',114,214),
(1015,'Guoxiang','Nooteboom','1987-07-02','erat.vel@vitae.com','(465) 221-3837','M',115,215),
(1016,'Kazuhito','Cappelletti','1995-01-27','magna@facilisis.com','(749) 100-9850','M',116,201),
(1017,'Cristinel','Bouloucos','1993-08-03','Sed@ProinultricesDuis.com','(236) 445-5523','F',117,202),
(1018,'Peha','Backhman','1987-04-03','sagittis@luctusut.com','(181) 833-4764','F',118,204),
(1019,'Lillian','Haddadi','1999-04-30','mauris.Morbi@ametdbusid.com','(724) 831-9554','M',119,203),
(1020,'Mayuko','Warwick','1991-01-26','hymenaeos@neque.com','(197) 883-5371','M',120,205),
(1021,'Ramzi','Erde','1988-02-10','arcu@loremipsum.com','(858) 290-8299','M',121,206),
(1022,'Shahaf','Famili','1995-08-22','vulputate@vellectusCum.com','(309) 517-5901','M',122,207),
(1023,'Bojan','Montemayor','1989-12-17','Phasellus.ornare@ipsum.com','(447) 535-6570','F',123,208),
(1024,'Suzette','Pettey','1997-05-19','rutrum@nullaCras.com','(102) 612-1572','F',124,209),
(1025,'Prasadram','Heyers','1987-08-17','hymenaeos@lectus.com','(439) 631-3556','M',125,210),
(1026,'Yongqiao','Berztiss','1995-03-20','quis@pede.com','(810) 518-4977','M',126,211),
(1027,'Divier','Reistad','1989-07-07','placerat@Cumsocic.com','(847) 118-3708','F',127,212);



CREATE TABLE FlightStatus (
FlightStatusID INT NOT NULL PRIMARY KEY
,STATUS VARCHAR(30)  NOT NULL 
);

CREATE TABLE Route (
  RouteID INT NOT NUll PRIMARY KEY
  ,SourceIata varchar(4) NOT NULL FOREIGN KEY REFERENCES Iata(IataCode)
  ,DestinationIata  varchar(4) NOT NULL FOREIGN KEY REFERENCES Iata(IataCode)

);


CREATE TABLE [FlightInformation] (
  [FlightID] INT NOT NULL PRIMARY KEY,
  [RouteID] INT NOT NULL FOREIGN KEY REFERENCES Route(RouteID),
  [Company] VARCHAR(50),
  [DepartureTime] DATETIME,
  [ArrivalTime] DATETIME,
  [FlightStatusID] INT FOREIGN KEY REFERENCES Flightstatus([FlightStatusID]),
  [Capacity] INT,
);
select * from Route
select * from FlightStatus
select * from FlightInformation
INSERT INTO FlightInformation VALUES
(011,51,'AIRINDIA',convert(datetime,'18-06-12 10:34:09 PM',5),convert(datetime,'19-06-12 11:34:09 PM',5),2,100)
,(012,52,'INDIGO',convert(datetime,'28-06-12 10:34:09 PM',5),convert(datetime,'19-06-12 11:34:09 PM',5),4,200)
,(013,53,'AMERICANAIRLINES',convert(datetime,'18-06-12 10:34:09 PM',5),convert(datetime,'19-06-12 11:34:09 PM',5),1,300)
,(014,54,'EMIRATES',convert(datetime,'16-04-12 10:34:09 PM',5),convert(datetime,'19-06-12 01:34:09 PM',5),3,500)
,(015,55,'AIRINDIA',convert(datetime,'28-06-12 11:34:09 PM',5),convert(datetime,'29-06-12 05:34:09 PM',5),2,300)
,(016,56,'EMIRATES',convert(datetime,'19-06-12 11:27:09 PM',5),convert(datetime,'19-06-12 09:34:09 PM',5),2,100)
,(017,57,'AIRINDIA',convert(datetime,'11-07-12 10:34:09 PM',5),convert(datetime,'19-07-12 12:34:09 PM',5),1,400)
,(018,58,'AMERICANAIRLINES',convert(datetime,'15-06-12 11:34:09 PM',5),convert(datetime,'16-06-12 11:34:09 PM',5),4,100)
,(019,59,'EMIRATES',convert(datetime,'10-06-12 10:34:09 PM',5),convert(datetime,'11-06-12 11:34:09 PM',5),3,100)
,(021,60,'AIRINDIA',convert(datetime,'11-06-12 10:34:09 PM',5),convert(datetime,'13-06-12 12:34:09 PM',5),2,200)
,(022,61,'AMERICANAIRLINES',convert(datetime,'16-06-12 10:34:09 PM',5),convert(datetime,'19-06-12 10:34:09 PM',5),1,200)

CREATE TABLE [FlightPrecaution] (
  FlightPrecautionID INT NOT NULL PRIMARY KEY,
  FlightID INT NOT NULL FOREIGN KEY REFERENCES FlightInformation(FlightID),
  PreviousTripDate DATETIME,
  PplAffected INT,
  SanitizationDate DATETIME,
  Medication VARCHAR(30),
 );
 SELECT * FROM FlightPrecaution
 INSERT INTO FlightPrecaution VALUES
 (711,011,convert(datetime,'18-06-12 10:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 30')
  ,(811,012,convert(datetime,'18-06-12 10:34:09 PM',5),21,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 20')
 ,(911,013,convert(datetime,'19-06-12 10:34:09 PM',5),31,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 30')
 ,(111,014,convert(datetime,'12-06-12 10:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 35')
 ,(211,015,convert(datetime,'17-06-12 11:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 20')
 ,(311,016,convert(datetime,'19-06-12 10:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 32')
 ,(411,017,convert(datetime,'18-06-12 12:34:09 PM',5),41,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 30')
 ,(511,018,convert(datetime,'15-06-12 10:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 30')
 ,(611,011,convert(datetime,'28-06-12 10:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 30')
 ,(722,011,convert(datetime,'28-06-12 12:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 30')
 ,(733,011,convert(datetime,'28-06-12 10:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 30')
 ,(821,012,convert(datetime,'18-06-12 11:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 10')
 ,(791,011,convert(datetime,'18-06-12 10:34:09 PM',5),11,convert(datetime,'17-06-12 10:34:09 PM',5),'PROVIDED FOR 30')

CREATE TABLE [FlightFood] (
  [FoodID] int NOT NULL PRIMARY KEY,
  [FoodPreference] VARCHAR(3) NOT NULL CHECK(FoodPreference IN ('YES','NO')),
  [BabyNeed] VARCHAR(3) NOT NULL CHECK(BabyNeed IN ('YES','NO')),
  [Allergies] VARCHAR(3) NOT NULL CHECK(Allergies IN ('YES','NO')),
  [Beverage] VARCHAR(3) NOT NULL CHECK(Beverage IN ('YES','NO'))
);

insert into FlightFood Values
(501,'YES','YES','YES','YES'),
(502,'YES','YES','YES','NO'),
(503,'YES','YES','NO','YES'),
(504,'YES','NO','YES','YES'),
(505,'NO','YES','YES','YES'),
(506,'NO','NO','YES','YES'),
(507,'YES','YES','NO','NO'),
(508,'YES','NO','NO','YES'),
(509,'NO','YES','YES','NO'),
(510,'NO','YES','NO','YES'),
(511,'YES','NO','YES','NO'),
(512,'NO','NO','NO','YES'),
(513,'YES','NO','NO','NO'),
(514,'NO','YES','NO','NO'),
(515,'NO','NO','YES','NO')

CREATE TABLE [FlightOperation] (
  [FlightOperationID] INT NOT NULL PRIMARY KEY,
  [FlightID ] INT  NOT NULL FOREIGN KEY REFERENCES FlightInformation(FlightID),
  [SecurityCheck] VARCHAR(3) NOT NULL CHECK(SecurityCheck IN ('YES','NO')),
  [Customs] VARCHAR(3) NOT NULL CHECK(Customs IN ('YES','NO')),
 );

 SELECT * FROM Precaution
 
 INSERT INTO FlightOperation VALUES 
 (0909,011,'YES','NO')
 , (0809,012,'YES','NO')
 ,(0709,013,'NO','NO')
 ,(0509,014,'YES','NO')
 ,(0609,015,'YES','YES')
 ,(0409,011,'YES','YES')
 ,(0309,016,'YES','NO')
 ,(0209,011,'NO','NO')
 ,(0109,011,'NO','NO')
 ,(0108,013,'YES','NO')
 ,(0904,011,'YES','NO')
 ,(0902,012,'YES','NO')


CREATE TABLE Precaution (
PrecautionID INT PRIMARY KEY,
Mask VARCHAR(3) NOT NULL CHECK(Mask IN ('YES','NO')),
Gloves VARCHAR(3) NOT NULL CHECK(Gloves IN ('YES','NO')),
Sanitizer VARCHAR(3) NOT NULL CHECK(Sanitizer IN ('YES','NO')),
Shield VARCHAR(3) NOT NULL CHECK(Shield IN ('YES','NO'))
);


CREATE TABLE [Passenger] (
  [PassengerID] INT NOT NULL PRIMARY KEY,
  [PersonID] INT NOT NULL FOREIGN KEY REFERENCES Person(PersonID)
);

CREATE TABLE [Employee] (
  [EmployeeID] INT NOT NULL PRIMARY KEY,
  [PersonID] INT NOT NULL FOREIGN KEY REFERENCES Person(PersonID)
);
select * from PERSON
insert into Employee values
(3001,1001),
(3002,1002),
(3003,1003),
(3004,1004),
(3005,1005),
(3006,1006),
(3007,1007),
(3008,1008),
(3009,1009),
(3010,1010),
(3011,1011)




  CREATE TABLE [PassengerTravelHistory] (
  [TravelID] INT  NOT NULL PRIMARY KEY,
  [PassengerID] INT NOT NULL FOREIGN KEY REFERENCES Passenger(PassengerID),
  [DesitinationIata] Varchar(4) NOT NULL FOREIGN KEY REFERENCES Iata(IataCode),
  [DateOfTravel] DATETIME,
  [DateOfReturn] DATETIME,
);


----Person Table

insert into Employee values
(3001,1001),
(3002,1002),
(3003,1003),
(3004,1004),
(3005,1005),
(3006,1006),
(3007,1007),
(3008,1008),
(3009,1009),
(3010,1010),
(3011,1011)
select * from PERSON
select * from Passenger
select * from Employee
insert into Passenger values
(4001,1027),
(4002,1026),
(4003,1025),
(4004,1026),
(4005,1025),
(4006,1024),
(4007,1023),
(4008,1022),
(4009,1021),
(4010,1020),
(4011,1019)




-- iata 
insert into iata values
('JFK', 'John F. Kennedy International Airport' ,'USA')
,('EWR', 'Newark International Airport' ,'USA')
,('DEN', 'Denver International Airport','USA')
,('LAX', 'Los Angeles International Airport','USA' )
,('LHR', 'London Heathrow Airport' ,'UK')
,('MAN','Manchester Airport','UK')
,('SOU','Southampton Airport','UK')
,('CWL','Cardiff International Airport','UK')
,('BRS','Bristol Airport','UK')
,('YVR','Vancouver International Airport','CAN')
,('YYZ','Toronto Pearson International Airport','CAN')
,('CBR','Canberra International Airport','AUS')
,('MEL','Melbourne International Airport','AUS')
,('PER','Perth International Airport','AUS')
,('SYD','Sydney Airport' ,'AUS')

Select * from Route
Insert into Route Values
(51,'EWR','JFK'),
(52,'SYD','EWR'),
(53,'LHR','EWR'),
(54,'SYD','JFK'),
(55,'JFK','EWR'),
(56,'DEN','CBR'),
(57,'LHR','LAX'),
(58,'CWL','SYD'),
(59,'PER','LAX'),
(60,'YYZ','BRS'),
(61,'YVR','DEN'),
(62,'MEL','CBR'),
(63,'DEN','EWR')

---- Countries
Insert into Country values 
('AUS','Austraila')
,('CAN','Canada')
,('CHE', 'Switzerland')
,('IND','India')
,('IRN','Iran')
,('IRQ','Iraq')
,('NZ', 'New Zeland')
,('SA','South Africa')
,('SWE','Swedan')
,('UAE', 'United Arab Emirates')
,('UK', 'United Kingdom')
,('USA', 'United States Of America')


select * from Country

--- Route 

select * from Address
INSERT into Address Values
(101,'2192 Neque Ave','Quesada','Aenean','500062','IND'),
(102,'07 Nec St.','Magadan','Magadan Oblast','547691','UK'),
(103,'#321-5250 Donec Road','Nicoya','Guanacaste','790330','USA'),
(104,'612-6909 Nullam Rd','Dublin','Lovala','618107','AUS'),
(105,'165-1743 Sed Road','Kaduna','Kapiti','188477','IND'),
(106,'219-1843 Ante St.','Arras','Calais','842603','USA'),
(107,'5945 Vitae Street','Barranca','Lima','838256','AUS'),
(108,'8492 Feugiat Street','Chungju','Chungcheong','558169','CAN'),
(109,'2946 Ante. Av.','Cametá','PalaAuto','341495','UK'),
(110,'2886 Arcu. St.','Peñalolén','Metropolina','912516','UAE'),
(111,'#391-9263 Ut, Ave','Russell','Ontar','639201','CAN'),
(112,'371-8089 Justo Rd.','Arrah','Baruka','229914','UAE'),
(113,'509-5995 Non St.','Virton','Luxemburg','544371','IRQ'),
(114,'1290 Amet St.','Aubervilliers','Ioaa','062548','IRN'),
(115,'#571-6757 Metus Rd.','Kotli','Kamirre','376571','NZ'),
(116,'2001 Scelerisque Rd.','North Bay','Orilgn','950037','USA'),
(117,'4194 Cursus St.','Dublin','Valley','528937','NZ'),
(118,'5371 Magna Avenue','Arequipa','Johansanberg','985885','SA'),
(119,'#252-3074 Bibendum Street','Augusta','Galins','126788','CHE'),
(120,'295-9578 Molestie Rd.','Malambo','Atlan','617873','SWE'),
(121,'P.O Box 154, 9547At Av.','Dallas','Texas','916603','UK'),
(122,'#898-8082 Pulvinar St.','Girona','Catalunya','234675','AUS'),
(123,'8014 Tincidunt St.','Gongju','Cheguva','834137','SWE'),
(124,'#736-874 Aenean Ave','Osasco','São Paulo','722786','NZ'),
(125,'8585 Arcu St.','Ribeirão Preto','São Paulo','080267','CAN'),
(126,'1733 Lorem Rd.','Mexico City','Cadam','938062','UAE'),
(127,'7360 Tortor Road','Laino Castello','CapeTown','074310','SA') 

select * from Precaution
insert into Precaution values
(201,'YES','YES','YES','YES'),
(202,'YES','YES','YES','NO'),
(203,'YES','YES','NO','YES'),
(204,'YES','NO','YES','YES'),
(205,'NO','YES','YES','YES'),
(206,'NO','NO','YES','YES'),
(207,'YES','YES','NO','NO'),
(208,'YES','NO','NO','YES'),
(209,'NO','YES','YES','NO'),
(210,'NO','YES','NO','YES'),
(211,'YES','NO','YES','NO'),
(212,'NO','NO','NO','YES'),
(213,'YES','NO','NO','NO'),
(214,'NO','YES','NO','NO'),
(215,'NO','NO','YES','NO')

select * from FlightStatus
insert into FlightStatus Values
(1,'On time'),
(2,'Delayed'),
(3,'Arrived'),
(4,'Scheduled')

DROP TABLE COVID


CREATE TABLE COVID (
CovidTestID INT PRIMARY KEY
,CovidTestDate DATE NOT NULL
,CovidResult VARCHAR(20) NOT NULL
,Symptoms VARCHAR(3) NOT NULL CHECK(Symptoms IN ('YES','NO'))
,PersonID INT NOT NULL FOREIGN KEY REFERENCES Person(PersonID) 
);
SELECT PASSENGERID, EMPLOYEEID,DATEOFTRAVEL, PERSONID FROM [PassengerOnFlight] P JOIN StaffOnFlight S ON P.FLIGHTID=S.[FlightID ]
JOIN PERSON PR ON P.PASSENGERID=PR.PersonID
SELECT EmployeeID FROM StaffOnFlight
SELECT FLIGHT
SELECT PERSONID FROM PERSON
SELECT 
Insert into covid values
(2001,'2012-06-19','Negative','NO', 1015),
(2002,'2012-06-19','Negative','YES', 1023),
(2003,'2012-06-19 ','Positive','NO', 1005),
(2004,'2012-06-19 ','Positive','YES', 1008),
(2005,'2012-06-19 ','Negative','NO', 1006),
(2006,'2012-06-19 ','Positive','NO', 1024),
(2007,'2012-06-18 ','Positive','YES', 1012),
(2008,'2012-06-20 ','Negative','YES', 1009),
(2009,'2012-06-20 ','Negative','NO', 1016),
(2010,'2012-06-20 ','Positive','NO', 1020),
(2011,'2012-06-18 ','Negative','NO', 1019),
(2012,'2012-06-18 ','Positive','YES', 1025),
(2013,'2012-06-18 ','Positive','YES', 1004),
(2014,'2012-06-18 ','Negative','YES', 1022),
(2015,'2012-06-18 ','Negative','YES', 1017),
(2016,'2012-06-18 ','Negative','YES', 1007),
(2017,'2012-06-20 ','Negative','YES', 1011),
(2018,'2012-06-20 ','Negative','YES', 1002),
(2019,'2012-06-20 ','Negative','YES', 1001),
(2020,'2012-06-20','Positive','YES', 1005)



CREATE TABLE [HealthPreTravel] (
  [PreTravelID] INT NOT NULL PRIMARY KEY,
  [CurrentTemp] INT,
  [CriticalHealthIssue] VARCHAR(50),
  [CovidTestID] INT NOT NULL FOREIGN KEY REFERENCES Covid(CovidTestID)
 );

 INSERT

CREATE TABLE [HealthPostTravel] (
  [PostTravelID] INT NOT NULL PRIMARY KEY,
  [CovidTestID] INT NOT NULL FOREIGN KEY REFERENCES Covid(CovidTestID),
);

CREATE TABLE [Qurantine Center] (
  [CenterID] INT NOT NULL PRIMARY KEY,
  [DestinationIata] Varchar(4) NOT NULL FOREIGN KEY REFERENCES Iata(IataCode),
  [Name] VARCHAR(50),
  [AddressID] INT NOT NULL FOREIGN KEY REFERENCES Address(AddressID),
  [PhoneNumber] BIGINT,
  [BedsAvailable] CHAR(3)
);
select * from Route
select *from [Qurantine Center]
INSERT INTO [Qurantine Center] VALUES
(311,'JFK','Peha',101,213456974432,8)
,(411,'CWL','Bezalel',102,613425156432,80)
,(511,'SOU','Berni',103,313498756432,28)
,(611,'MAN','Chirstian',104,213451096432,18)
,(711,'JFK','Georgi',105,11345226432,48)
,(811,'JFK','Mary',106,91349187761432,18)
,(911,'LAX','Saniya',107,2133326432,48)
,(321,'LHR','Duangkaew',108,9876213456432,78)
,(313,'PER','Saniya',109,786213456432,87)
,(319,'YYZ','Anneke',110,0987213456432,82)
,(318,'MEL','Kyoichi',111,123213456432,81)
,(312,'MAN','Parto',112,654213456432,8)
,(391,'DEN','Eberhardt',113,8765213456432,8)



CREATE TABLE [PassengerOnFlight] (
  [PassengerID] INT,
  [FlightID] INT,
  [RouteID] INT,
  [FoodID] INT NOT NULL FOREIGN KEY REFERENCES FlightFood(FoodID),
  [DateOfTravel] DATETIME,
  [SeatNumber] VARCHAR(50),
  [SpecialAssistance] CHAR(3),
 CONSTRAINT PKPassengerOnFlight PRIMARY KEY CLUSTERED([PassengerID], [FlightID], [RouteID])
);
select * from Passenger
select * from FlightInformation
select * from Route
select * from FlightFood
insert into [PassengerOnFlight] values
(4001,11,51,501,convert(datetime,'18-06-12 10:24:09 PM',5),'A21','YES')
,(4002,11,51,502,convert(datetime,'18-06-12 10:24:09 PM',5),'A23','YES')
,(4003,11,51,503,convert(datetime,'18-06-12 10:24:09 PM',5),'A24','NO')
,(4004,11,51,504,convert(datetime,'18-06-12 10:24:09 PM',5),'A25','YES')
,(4005,12,52,505,convert(datetime,'19-06-12 10:04:09 PM',5),'A29','YES')
,(4006,12,52,506,convert(datetime,'19-06-12 10:04:09 PM',5),'A30','NO')
,(4007,12,52,507,convert(datetime,'19-06-12 10:04:09 PM',5),'A34','NO')
,(4008,12,52,508,convert(datetime,'19-06-12 10:04:09 PM',5),'A55','NO')
,(4009,13,53,509,convert(datetime,'20-06-12 10:34:09 PM',5),'A67','NO')
,(4010,13,53,510,convert(datetime,'20-06-12 10:34:09 PM',5),'A12','NO')
,(4011,13,53,511,convert(datetime,'20-06-12 10:34:09 PM',5),'A09','YES')
,(4008,14,58,512,convert(datetime,'21-06-12 11:34:09 PM',5),'A97','YES')
,(4009,14,58,513,convert(datetime,'21-06-12 11:34:09 PM',5),'A37','NO')
,(4008,20,60,514,convert(datetime,'21-06-12 12:34:09 PM',5),'A08','YES')
,(4001,20,60,515,convert(datetime,'21-06-12 12:34:09 PM',5),'A09','NO')


select * from FlightInformation
select * from Employee

CREATE TABLE [StaffOnFlight] (
  [EmployeeID] INT,
  [FlightID ] INT,
 CONSTRAINT PKStaffOnFlight PRIMARY KEY CLUSTERED([EmployeeID], [FlightID ])
);

insert into [StaffOnFlight] values
/*(3001,16)
,(3002,11)
,(3003,11)
,(3004,12)
,(3005,12)
,(3006,13)
,(3007,13)
,(3008,14)
,(3009,14)
,(3010,15)
,(3011,16)
,(3011,15)*/
(3011,20)
,(3004,20)
,(3001,20)

select * from [StaffOnFlight]
SELECT DISTINCT FLIGHTID FROM PassengerOnFlight


