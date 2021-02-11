CREATE DATABASE TEAM11

USE TEAM11

CREATE TABLE Country (
	CountryCode VARCHAR(4)NOT NULL PRIMARY KEY,
	CountryName VARCHAR(50) NOT NULL
);
INSERT INTO Country VALUES 
	('AUS','Austraila'),
	('CAN','Canada'),
	('CHE', 'Switzerland'),
	('IND','India'),
	('IRN','Iran'),
	('IRQ','Iraq'),
	('NZ', 'New Zeland'),
	('SA','South Africa'),
	('SWE','Swedan'),
	('UAE', 'United Arab Emirates'),
	('UK', 'United Kingdom'),
	('USA', 'United States Of America');

CREATE TABLE Address (
	Addressid INT PRIMARY KEY,
	Street VARCHAR(40),
	City VARCHAR(20),
	State varchar(20),
	ZipCode varchar(6),
	CountyCode varchar(4) NOT NULL 
		FOREIGN KEY REFERENCES Country(CountryCode)
);
INSERT INTO Address Values
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
	(127,'7360 Tortor Road','Laino Castello','CapeTown','074310','SA') ,
	(128,'Apt No 1302, onw south market street','San Jose','California','95113','USA'),
	(129,'1275 E University Dr Unit 408', 'Tempe', 'Arizona','85281','USA'),
	(130,'250 Kennedy drive 808 ','Malden','Massachusetts','02148','USA'),
	(131,'360 Huntington Ave', 'Boston', 'Massachusetts' ,'02115','USA'),
	(132,'10240 Launch circle, Apt 104' ,'Manassas', 'Virginia ','20109','USA'),
	(133,'99 Berkeley Rd','STOWTING','TN25', '2JP-UK','UK'),
	(134,'Lower Ground 5, Old Nichol St','London','England','E27HR','UK'),
	(135,'St John"s Wood Rd,St John"s Wood','London','England','NW88QN','UK'),
	(136,'Sir Matt Busby Way, Old Trafford', 'Edinburgh', 'Scotland','M160RA','UK'),
	(137,'London SE1 9RA','London','England','SE19BG','UK'),
	(138,'Driver Ave','Moore Park','New South Wales','2021','AUS'),
	(139,'18 Brown Street','NAREMBURN','New South Wales','2065','AUS'),
	(140,'Brunton Ave', 'Richmond','Victoria','3002','AUS'),
	(141,'333 Victoria Park Dr', 'Port Augusta', 'South Australia','6100','AUS'),
	(142,'Vulture St', 'Adelaide','South Australia','4102','AUS');

CREATE TABLE Iata (
	Iatacode VARCHAR(4)NOT NULL PRIMARY KEY,
	AirportName VARCHAR(50)NOT NULL,
	CountryCode VARCHAR(4)NOT NULL 
		FOREIGN KEY REFERENCES Country(CountryCode)
);
INSERT INTO iata VALUES
	('JFK', 'John F. Kennedy International Airport' ,'USA'),
	('EWR', 'Newark International Airport' ,'USA'),
	('DEN', 'Denver International Airport','USA'),
	('LAX', 'Los Angeles International Airport','USA'),
	('LHR', 'London Heathrow Airport' ,'UK'),
	('MAN','Manchester Airport','UK'),
	('SOU','Southampton Airport','UK'),
	('CWL','Cardiff International Airport','UK'),
	('BRS','Bristol Airport','UK'),
	('YVR','Vancouver International Airport','CAN'),
	('YYZ','Toronto Pearson International Airport','CAN'),
	('CBR','Canberra International Airport','AUS'),
	('MEL','Melbourne International Airport','AUS'),
	('PER','Perth International Airport','AUS'),
	('SYD','Sydney Airport' ,'AUS');

CREATE TABLE Precaution (
	PrecautionID INT PRIMARY KEY,
	Mask VARCHAR(3) NOT NULL CHECK(Mask IN ('YES','NO')),
	Gloves VARCHAR(3) NOT NULL CHECK(Gloves IN ('YES','NO')),
	Sanitizer VARCHAR(3) NOT NULL CHECK(Sanitizer IN ('YES','NO')),
	Shield VARCHAR(3) NOT NULL CHECK(Shield IN ('YES','NO'))
);
INSERT INTO Precaution VALUES
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
	(215,'NO','NO','YES','NO');

CREATE TABLE Person(
	PersonID INT NOT NUll PRIMARY KEY,
	FirstName VARCHAR(20),
	LastName VARCHAR(20),
	DateOfBirth DATE,
	Email VARCHAR(30),
	PhoneNumber VARCHAR(15),
	Gender VARCHAR(1),
	AddressID int NOT NULL 
		FOREIGN KEY REFERENCES Address(AddressID),
	PrecautionID int NOT NULL 
		FOREIGN KEY REFERENCES Precaution(PrecautionID) ,
	Age AS dbo.CalcAge(DateOfBirth)
); 

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
	FlightStatusID INT NOT NULL PRIMARY KEY,
	Status VARCHAR(30)  NOT NULL 
);
INSERT INTO FlightStatus VALUES
	(1,'On time'),
	(2,'Delayed'),
	(3,'Arrived'),
	(4,'Scheduled')
	(5,'Cancelled');

CREATE TABLE Route (
	RouteID INT NOT NUll PRIMARY KEY,
	SourceIata varchar(4) NOT NULL FOREIGN KEY REFERENCES Iata(IataCode),
	DestinationIata  varchar(4) NOT NULL FOREIGN KEY REFERENCES Iata(IataCode)
);
INSERT INTO Route VALUES
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
	(63,'DEN','EWR');

CREATE TABLE FlightInformation (
	FlightID INT NOT NULL PRIMARY KEY,
	RouteID INT NOT NULL 
		FOREIGN KEY REFERENCES Route(RouteID),
	Company VARCHAR(50),
	DepartureTime DATETIME,
	ArrivalTime DATETIME,
	FlightStatusID INT 
		FOREIGN KEY REFERENCES Flightstatus(FlightStatusID),
	Capacity INT,
);
INSERT INTO FlightInformation VALUES
	(011,51,'AIRINDIA',convert(datetime,'18-06-20 10:00:09 PM',5),convert(datetime,'18-06-20 11:34:09 PM',5),2,100),
	(012,52,'EMIRATES',convert(datetime,'19-06-20 04:34:09 AM',5),convert(datetime,'19-06-20 11:34:09 PM',5),4,200),
	(013,53,'AMERICANAIRLINES',convert(datetime,'20-06-20 10:34:09 AM',5),convert(datetime,'20-06-20 02:34:09 PM',5),1,300),
	(014,54,'EMIRATES',convert(datetime,'25-06-20 10:25:09 AM',5),convert(datetime,'25-06-20 01:34:09 PM',5),3,500),
	(015,55,'AIRINDIA',convert(datetime,'28-06-20 11:34:09 PM',5),convert(datetime,'29-06-20 05:34:09 PM',5),2,300),
	(016,56,'EMIRATES',convert(datetime,'19-06-20 11:27:09 PM',5),convert(datetime,'20-06-20 00:59:09 AM',5),2,100),
	(017,57,'AIRINDIA',convert(datetime,'11-07-20 10:34:09 PM',5),convert(datetime,'19-07-20 12:34:09 PM',5),1,400),
	(018,58,'AMERICANAIRLINES',convert(datetime,'21-06-20 09:15:09 AM',5),convert(datetime,'22-06-20 08:20:09 AM',5),4,100),
	(019,59,'EMIRATES',convert(datetime,'10-06-20 10:34:09 PM',5),convert(datetime,'11-06-20 11:34:09 PM',5),3,100),
	(021,60,'AIRINDIA',convert(datetime,'22-06-20 03:45:09 PM',5),convert(datetime,'22-06-20 08:25:09 PM',5),2,200),
	(022,61,'AMERICANAIRLINES',convert(datetime,'16-06-20 10:34:09 PM',5),convert(datetime,'19-06-20 10:34:09 PM',5),1,200);

CREATE TABLE FlightPrecaution (
	FlightPrecautionID INT NOT NULL PRIMARY KEY,
	FlightID INT NOT NULL 
		FOREIGN KEY REFERENCES FlightInformation(FlightID),
	PreviousTripDate DATETIME,
	PplAffected INT,
	SanitizationDate DATETIME,
	Medication VARCHAR(30)
 );
INSERT INTO FlightPrecaution VALUES
	(711,011,convert(datetime,'18-06-20 10:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 6'),
	(811,012,convert(datetime,'18-06-20 10:34:09 PM',5),21,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 20'),
	(911,013,convert(datetime,'09-06-20 10:34:09 PM',5),31,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 15'),
	(111,014,convert(datetime,'12-06-20 10:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 10'),
	(211,015,convert(datetime,'17-06-20 11:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 8'),
	(311,016,convert(datetime,'10-06-20 10:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 32'),
	(411,017,convert(datetime,'18-06-20 12:34:09 PM',5),41,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 30'),
	(511,018,convert(datetime,'15-06-20 10:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 12'),
	(611,011,convert(datetime,'11-06-20 10:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 5'),
	(722,011,convert(datetime,'12-06-20 12:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 12'),
	(733,011,convert(datetime,'13-06-20 10:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 10'),
	(821,012,convert(datetime,'15-06-20 11:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 10'),
	(791,011,convert(datetime,'13-06-20 10:34:09 PM',5),11,convert(datetime,'17-06-20 10:34:09 PM',5),'PROVIDED FOR 7');

CREATE TABLE FlightFood (
	FoodID INT NOT NULL PRIMARY KEY,
	FoodPreference VARCHAR(3) NOT NULL CHECK(FoodPreference IN ('YES','NO')),
	BabyNeed VARCHAR(3) NOT NULL CHECK(BabyNeed IN ('YES','NO')),
	Allergies VARCHAR(3) NOT NULL CHECK(Allergies IN ('YES','NO')),
	Beverage VARCHAR(3) NOT NULL CHECK(Beverage IN ('YES','NO'))
);
INSERT INTO FlightFood VALUES
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
	(515,'NO','NO','YES','NO');

 CREATE TABLE FlightOperation (
	FlightOperationID INT NOT NULL PRIMARY KEY,
	FlightID INT  NOT NULL 
		FOREIGN KEY REFERENCES FlightInformation(FlightID),
	SecurityCheck VARCHAR(3) NOT NULL CHECK(SecurityCheck IN ('YES','NO')),
	Customs VARCHAR(3) NOT NULL CHECK(Customs IN ('YES','NO'))
 );
 INSERT INTO FlightOperation VALUES 
	(0909,011,'YES','NO'),
	(0809,012,'YES','NO'),
	(0709,013,'NO','NO'),
	(0509,014,'YES','NO'),
	(0609,015,'YES','YES'),
	(0409,011,'YES','YES'),
	(0309,016,'YES','NO'),
	(0209,011,'NO','NO'),
	(0109,011,'NO','NO'),
	(0108,013,'YES','NO'),
	(0904,011,'YES','NO'),
	(0902,012,'YES','NO');


CREATE TABLE Passenger (
	PassengerID INT NOT NULL PRIMARY KEY,
	PersonID INT NOT NULL 
		FOREIGN KEY REFERENCES Person(PersonID)
);
INSERT INTO Passenger VALUES 
	(4001,1027),
	(4002,1026),
	(4003,1025),
	(4004,1012),
	(4005,1015),
	(4006,1024),
	(4007,1023),
	(4008,1022),
	(4009,1021),
	(4010,1020),
	(4011,1019);

CREATE TABLE Employee (
	EmployeeID INT NOT NULL PRIMARY KEY,
	PersonID INT NOT NULL 
		FOREIGN KEY REFERENCES Person(PersonID)
);
INSERT INTO Employee VALUES
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
	(3011,1011);

CREATE TABLE PassengerTravelHistory (
	TravelID INT  NOT NULL PRIMARY KEY,
	PassengerID INT NOT NULL 
		FOREIGN KEY REFERENCES Passenger(PassengerID),
	DesitinationIata Varchar(4) NOT NULL 
		FOREIGN KEY REFERENCES Iata(IataCode),
	DateOfTravel DATE,
	DateOfReturn DATE,
);
INSERT INTO PassengerTravelHistory VALUES
	(80,4001,'BRS','2020-05-12','2020-05-17'),
	(81,4002,'CBR','2020-04-15','2020-05-15'),
	(82,4003,'CWL','2020-03-12','2020-04-15'),
	(83,4004,'DEN','2020-04-12','2020-05-01'),
	(84,4005,'EWR','2020-05-11','2020-05-15'),
	(85,4006,'SYD','2020-04-09','2020-04-29'),
	(86,4007,'SOU','2020-05-18','2020-05-22'),
	(87,4008,'MAN','2020-04-20','2020-05-10'),
	(88,4009,'PER','2020-04-29','2020-05-15'),
	(89,4010,'MEL','2020-04-25','2020-05-05'),
	(90,4011,'PER','2020-05-08','2020-05-31');

CREATE TABLE Covid (
	CovidTestID INT PRIMARY KEY,
	CovidTestDate DATE NOT NULL,
	CovidResult VARCHAR(20) NOT NULL,
	Symptoms VARCHAR(3) NOT NULL CHECK(Symptoms IN ('YES','NO')),
	PersonID INT NOT NULL FOREIGN KEY REFERENCES Person(PersonID) 
);
INSERT INTO Covid VALUES
-- Pre Travel
	(2001,'2020-06-16','Negative','NO', 1026),
	(2002,'2020-06-16','Negative','YES', 1025),
	(2003,'2020-06-16','Negative','NO', 1012),
	(2004,'2020-06-16','Positive','YES', 1027),
	(2005,'2020-06-16','Negative','NO', 1002),
	(2006,'2020-06-16','Negative','NO', 1003),
	(2007,'2020-06-18','Negative','YES', 1015),
	(2008,'2020-06-18','Positive','YES', 1024),
	(2009,'2020-06-18','Negative','NO', 1023),
	(2010,'2020-06-18','Negative','NO', 1022),
	(2011,'2020-06-18','Negative','NO', 1004),
	(2012,'2020-06-18','Positive','YES', 1005),
	(2013,'2020-06-19','Negative','NO', 1021),
	(2014,'2020-06-19','Negative','NO', 1020),
	(2015,'2020-06-19','Negative','YES', 1019),
	(2016,'2020-06-19','Negative','YES', 1006),
	(2017,'2020-06-19','Negative','YES', 1007),
	(2018,'2020-06-20','Negative','YES', 1022),
	(2019,'2020-06-20','Negative','NO', 1021),
	(2020,'2020-06-20','Positive','YES', 1008),
	(2021,'2020-06-20','Negative','YES', 1009),
	(2022,'2020-06-21','Negative','NO', 1022),
	(2023,'2020-06-23','Negative','NO', 1027),
	(2024,'2020-06-21','Negative','YES', 1001),
	(2025,'2020-06-21','Negative','NO', 1004),
	(2026,'2020-06-21','Positive','YES', 1011),

-- Passenger's Post Travel
	(2027,'2020-06-24','Positive','NO', 1027),
	(2028,'2020-06-23','Negative','YES', 1026),
	(2029,'2020-06-24','Positive','YES', 1025),
	(2030,'2020-06-24','Positive','YES', 1012),
	(2031,'2020-06-25','Negative','YES', 1015),
	(2032,'2020-06-26','Negative','NO', 1024),
	(2033,'2020-06-24','Positive','YES', 1023),
	(2034,'2020-06-23','Negative','NO', 1022),
	(2035,'2020-06-22','Negative','NO', 1021),
	(2036,'2020-06-22','Positive','YES', 1020),
	(2037,'2020-06-21','Negative','YES', 1019),
-- Employees
	(2038,'2020-06-25','Negative','YES', 1001),
	(2039,'2020-06-24','Positive','NO', 1002),
	(2040,'2020-06-24','Negative','NO', 1003),
	(2041,'2020-06-23','Positive','YES', 1005),
	(2042,'2020-06-24','Negative','YES', 1006);

CREATE TABLE HealthPreTravel (
	PreTravelID INT NOT NULL PRIMARY KEY,
	CurrentTemp INT,
	CriticalHealthIssue VARCHAR(3) NOT NULL CHECK(CriticalHealthIssue IN ('YES','NO')),
	CovidTestID INT NOT NULL
		FOREIGN KEY REFERENCES Covid(CovidTestID)
 );
 INSERT INTO HealthPreTravel VALUES
	(170,98,'NO',2001),
	(171,98,'NO',2002),
	(172,97,'YES',2003),
	(173,102,'NO',2004),
	(174,98,'NO',2005),
	(175,97,'NO',2006),
	(176,98,'YES',2007),
	(177,101,'NO',2008),
	(178,97,'NO',2009),
	(179,98,'NO',2011),
	(180,102,'NO',2012),
	(181,98,'NO',2013),
	(182,98,'YES',2014),
	(183,98,'NO',2015),
	(184,98,'NO',2016),
	(185,97,'NO',2017),
	(186,98,'NO',2018),
	(187,98,'NO',2019),
	(188,102,'NO',2020),
	(189,98,'NO',2021),
	(190,98,'NO',2022),
	(191,98,'NO',2023),
	(192,97,'NO',2024),
	(193,98,'YES',2025),
	(194,103,'NO',2026);


CREATE TABLE HealthPostTravel (
	PostTravelID INT NOT NULL PRIMARY KEY,
	CovidTestID INT NOT NULL 
		FOREIGN KEY REFERENCES Covid(CovidTestID)
);
INSERT INTO HealthPostTravel VALUES
	(331,2027),
	(332,2028),
	(333,2029),
	(334,2030),
	(335,2031),
	(336,2032),
	(337,2033),
	(338,2034),
	(339,2035),
	(340,2036),
	(341,2037),
	(342,2038),
	(343,2039),
	(344,2040),
	(345,2041),
	(346,2042);

CREATE TABLE QurantineCenter (
	CenterID INT IDENTITY(1,1) PRIMARY KEY,
	DestinationIata Varchar(4) NOT NULL 
		FOREIGN KEY REFERENCES Iata(IataCode),
	Name VARCHAR(50),
	AddressID INT NOT NULL 
		FOREIGN KEY REFERENCES Address(AddressID),
	PhoneNumber BIGINT,
	BedsAvailable CHAR(3)
);
INSERT INTO QurantineCenter VALUES
	('JFK','Peha',128,213456974432,8),
	('EWR','Bezalel',129,613425156432,80),
	('LAX','Berni',130,313498756432,28),
	('JFK','Chirstian',131,213451096432,18),
	('JFK','Georgi',132,11345226432,48),
	('SYD','Mary',133,91349187761432,18),
	('PER','Saniya',134,2133326432,48),
	('MEL','Duangkaew',135,9876213456432,78),
	('SYD','Saniya',136,786213456432,87),
	('CBR','Anneke',137,0987213456432,82),
	('MAN','Alex',138,1213456432,22),
	('LHR','Richard',139,90876545256,50),
	('CWL','Hannamen',140,2564789732,38),
	('SOU','Gilfoyle',141,98687643332,65),
	('LHR','Marie',142,76454672963,77);

CREATE TABLE PassengerOnFlight (
	PassengerID INT,
	FlightID INT,
	RouteID INT,
	FoodID INT NOT NULL 
		FOREIGN KEY REFERENCES FlightFood(FoodID),
	DateOfTravel DATETIME,
	SeatNumber VARCHAR(50),
	SpecialAssistance CHAR(3),
	CONSTRAINT PKPassengerOnFlight PRIMARY KEY CLUSTERED(PassengerID, FlightID, RouteID)
);
INSERT INTO PassengerOnFlight VALUES
	(4001,11,51,501,CONVERT(DATETIME,'18-06-20 10:24:09 PM',5),'A21','YES'),
	(4002,11,51,502,CONVERT(DATETIME,'18-06-20 10:24:09 PM',5),'A23','YES'),
	(4003,11,51,503,CONVERT(DATETIME,'18-06-20 10:24:09 PM',5),'A24','NO'),
	(4004,11,51,504,CONVERT(DATETIME,'18-06-20 10:24:09 PM',5),'A25','YES'),
	(4005,12,52,505,CONVERT(DATETIME,'19-06-20 10:04:09 PM',5),'A29','YES'),
	(4006,12,52,506,CONVERT(DATETIME,'19-06-20 10:04:09 PM',5),'A30','NO'),
	(4007,12,52,507,CONVERT(DATETIME,'19-06-20 10:04:09 PM',5),'A34','NO'),
	(4008,12,52,508,CONVERT(DATETIME,'19-06-20 10:04:09 PM',5),'A55','NO'),
	(4009,13,53,509,CONVERT(DATETIME,'20-06-20 10:34:09 PM',5),'A67','NO'),
	(4010,13,53,510,CONVERT(DATETIME,'20-06-20 10:34:09 PM',5),'A12','NO'),
	(4011,13,53,511,CONVERT(DATETIME,'20-06-20 10:34:09 PM',5),'A09','YES'),
	(4008,14,58,512,CONVERT(DATETIME,'21-06-20 11:34:09 PM',5),'A97','YES'),
	(4009,14,58,513,CONVERT(DATETIME,'21-06-20 11:34:09 PM',5),'A37','NO'),
	(4008,20,60,514,CONVERT(DATETIME,'22-06-20 12:34:09 PM',5),'A08','YES'),
	(4001,20,60,515,CONVERT(DATETIME,'22-06-20 12:34:09 PM',5),'A09','NO');

 CREATE TABLE StaffOnFlight (
	EmployeeID INT,
	FlightID INT,
	DateOfTravel DATETIME,
	CONSTRAINT PKStaffOnFlight PRIMARY KEY CLUSTERED(EmployeeID, FlightID)
);

INSERT INTO StaffOnFlight VALUES
	(3001,11,'2020-06-18 22:24:09:00'),
	(3002,11,'2020-06-18 22:24:09:00'),
	(3003,12,'2020-06-19 22:04:09:00'),
	(3004,12,'2020-06-19 22:04:09:00'),
	(3005,13,'2020-06-20 22:34:09:00'),
	(3006,13,'2020-06-20 22:34:09:00'),
	(3007,14,'2020-06-21 23:34:09:00'),
	(3008,14,'2020-06-21 23:34:09:00'),
	(3009,14,'2020-06-21 23:34:09:00'),
	(3010,20,'2020-06-22 12:34:09:00'),
	(3011,20,'2020-06-22 12:34:09:00');


------- Computed Column based on Function

CREATE FUNCTION CalcAge(@DOB DATE)
RETURNS INT
BEGIN
	DECLARE @Age INT
	SELECT @Age = DATEDIFF(year, @DOB, GETDATE())
	RETURN @Age
END
