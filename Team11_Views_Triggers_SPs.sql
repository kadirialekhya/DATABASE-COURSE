--------------------------------------------------TRIGGER---------------------------------------------------- 
CREATE TRIGGER PostTravelCovidTest 
ON HealthPostTravel 
AFTER INSERT, UPDATE 
AS 
  BEGIN 
      DECLARE @CovidTestID INT, 
              @CovidResult VARCHAR(50), 
              @PersonID    INT 

      SELECT @CovidTestID = CovidTestID 
      FROM   INSERTED 

      SELECT @CovidResult = CovidResult, 
             @PersonID = PersonID 
      FROM   Covid 
      WHERE  CovidTestID = @CovidTestID 
             AND CovidResult = 'Positive' 

      IF @CovidResult IS NOT NULL 
        BEGIN 
            SELECT 'Positive alert! Execute dbo.CoPassengerList ' 
                   + Cast(@PersonID AS VARCHAR(5)) 
                   + ' to get the list of co-passengers to be notified.' AS 
                   Recommended_Action 
        END 
  END 

GO 

/* 
  DROP TRIGGER PostTravelCovidTest  
  INSERT INTO Covid VALUES (2054,'2020-06-16','Positive','YES', 1027) 
  INSERT INTO HealthPostTravel VALUES(354,2054) 
  SELECT * FROM HealthPostTravel 
  DELETE FROM HealthPostTravel WHERE PostTravelID = 354 
*/ 
CREATE TRIGGER PreTravelCovidTest 
ON HealthPreTravel 
AFTER INSERT, UPDATE 
AS 
  BEGIN 
      DECLARE @CovidTestID INT, 
              @CovidResult VARCHAR(50), 
              @PersonID    INT 

      SELECT @CovidTestID = CovidTestID 
      FROM   INSERTED 

      SELECT @CovidResult = CovidResult, 
             @PersonID = PersonID 
      FROM   Covid 
      WHERE  CovidTestID = @CovidTestID 
             AND CovidResult = 'Positive' 

      IF @CovidResult IS NOT NULL 
        BEGIN 
            SELECT 'Infected Patient found! Stop ' 
                   + Cast(@PersonID AS VARCHAR(5)) 
                   + ' from onboarding.' AS Recommended_Action 
        END 
  END 

GO 

/* 
  DROP TRIGGER PreTravelCovidTest  
  INSERT INTO Covid VALUES (2054,'2020-06-16','Positive','YES', 1027) 
  INSERT INTO HealthPreTravel Values (354,98,'NO',2054) 
  DELETE FROM HealthPreTravel WHERE PreTravelID = 354 
*/ 
-----------------------------------------------STORED PROCEDURE----------------------------- 
CREATE PROCEDURE COPASSENGERLIST @PersonID INT 
AS 
  BEGIN 
      WITH EffectedFlights 
           AS (SELECT F.FlightID     AS FlightID, 
                      F.DateOfTravel AS TravelDate 
               FROM   PassengerOnFlight F 
                      INNER JOIN Passenger P 
                              ON P.PassengerID = F.PassengerID 
               WHERE  P.PersonID = @PersonID) SELECT Per.PersonID, 
             EF.FlightID, 
             EF.TravelDate, 
             Per.FirstName + ' ' + Per.LastName AS FullName, 
             Per.Email, 
             Per.PhoneNumber, 
             addr.Street + ', ' + addr.City + ', ' + addr.State 
             + ', ' + addr.ZipCode              AS PersonAddress 
      FROM   PERSON Per 
             INNER JOIN Passenger Pass 
                     ON Pass.PersonID = Per.PersonID 
             INNER JOIN PassengerOnFlight POF 
                     ON Pass.PassengerID = POF.PassengerID 
             INNER JOIN EffectedFlights EF 
                     ON EF.FlightID = POF.FlightID 
                        AND EF.TravelDate = POF.DateOfTravel 
             INNER JOIN Address addr 
                     ON addr.Addressid = Per.AddressID 
      WHERE  Per.PersonID != @PersonID 
      UNION 
      SELECT Per.PersonID, 
             EF.FlightID, 
             EF.TravelDate, 
             Per.FirstName + ' ' + Per.LastName AS FullName, 
             Per.Email, 
             Per.PhoneNumber, 
             addr.Street + ', ' + addr.City + ', ' + addr.[State] 
             + ', ' + addr.ZipCode              AS PersonAddress 
      FROM   EffectedFlights EF 
             INNER JOIN StaffOnFlight SOF 
                     ON EF.FlightID = SOF.FlightID 
                        AND CONVERT(DATE, EF.TravelDate) = 
                            CONVERT(DATE, SOF.DateOfTravel) 
             INNER JOIN Employee E 
                     ON E.EmployeeID = SOF.EmployeeID 
             INNER JOIN PERSON Per 
                     ON E.PersonID = Per.PersonID 
             INNER JOIN Address addr 
                     ON addr.Addressid = Per.AddressID 
      WHERE  Per.PersonID != @PersonID 
  END 

GO 

EXECUTE dbo.TRACKCOPASSENGERLIST 
  @PersonID=1025; 

GO 

--DROP PROCEDURE TrackCoPassengerList; 
GO 

---------------------------------TABLE-LEVEL CHECK CONSTRAINTS----------------------------------- 
CREATE FUNCTION AGEELIGIBILITYCHECK(@PID INT) 
RETURNS INT 
  BEGIN 
      DECLARE @CKC INT; 
      DECLARE @Age INT 

      SELECT @AGE = Per.Age 
      FROM   Passenger Pass 
             INNER JOIN Person Per 
                     ON Per.PersonID = Pass.PersonID 
      WHERE  Pass.PassengerID = @PID; 

      IF @Age >= 65 
          OR @Age < 10 
        SET @CKC = 1; 
      ELSE 
        SET @CKC = 0; 

      RETURN @CKC; 
  END 

GO 

ALTER TABLE PassengerOnFlight 
  ADD CONSTRAINT ckPassengerAge CHECK (dbo.AGEELIGIBILITYCHECK(PassengerID) = 0) 
; 

GO 

/* 
  UPDATE Person SET DateOfBirth = '1940-09-02' WHERE PersonID = 1001 
  INSERT INTO Passenger VALUES (8001,1001); 
  INSERT INTO PassengerOnFlight values 
  (8001,11,51,501,CONVERT(DATETIME,'18-06-20 10:24:09 PM',5),'A21','YES') 
  DELETE FROM PassengerOnFlight WHERE PassengerID=8001 
  DELETE FROM Passenger WHERE PassengerID=8001 
  UPDATE Person SET DateOfBirth = '1981-09-02' WHERE PersonID = 1001 
*/ 
---------------------------------------VIEWS-------------------------------------------- 
CREATE VIEW VwFlightStatus 
AS 
  SELECT FI.FlightID, 
         FI.Company, 
         Cast(FI.DepartureTime AS DATE) AS DepartureDate, 
         Cast(FI.DepartureTime AS TIME) AS DepartureTime, 
         Cast(FI.ArrivalTime AS DATE)   AS ArrivalDate, 
         Cast(FI.ArrivalTime AS TIME)   AS ArrivalTime, 
         FS.Status                      AS FlightStatus, 
         AIATA.AirportName              AS Source, 
         DIata.AirportName              AS Destination 
  FROM   FlightInformation FI 
         JOIN FlightStatus FS 
           ON FI.FlightStatusID = FS.FlightStatusID 
         JOIN Route R 
           ON FI.RouteID = R.RouteID 
         JOIN Iata AIata 
           ON AIata.IATAcode = R.SourceIata 
         JOIN Iata DIata 
           ON DIata.IATAcode = R.DestinationIata 
  WHERE  Cast(FI.DepartureTime AS DATE) = '2020-06-19' 

GO 

CREATE VIEW VwPassengerStatus 
AS 
  SELECT flightId, 
         pf.PassengerId, 
         FirstName + ' ' + LastName    AS PassengerName, 
         Cast(pf.DateOfTravel AS DATE) AS [Date of Travel], 
         CovidTestDate, 
         CovidResult, 
         CurrentTemp, 
         CriticalHealthIssue, 
         Mask, 
         Gloves, 
         Sanitizer, 
         Shield 
  FROM   PassengerOnFlight pf 
         JOIN Route r 
           ON r.RouteID = Pf.RouteID 
         JOIN IATA i 
           ON r.DestinationIata = i.Iatacode 
         JOIN Passenger P 
           ON p.passengerId = pf.PassengerID 
         JOIN Person pp 
           ON pp.personId = p.personId 
         JOIN Covid c 
           ON pp.personId = c.personId 
         JOIN healthPreTravel hpt 
           ON c.covidtestId = hpt.covidtestId 
         JOIN Precaution pr 
           ON pp.PrecautionID = pr.PrecautionID 
  WHERE  Cast(CovidTestDate AS DATE) < Cast(DateOfTravel AS DATE) 
GO

CREATE VIEW VWCompanyViolations 
AS 
  SELECT FI.Company, 
         CASE 
           WHEN PR.MASK = 'NO' THEN Count(PR.Mask) 
           ELSE 0 
         END AS Masks, 
         CASE 
           WHEN PR.Gloves = 'NO' THEN Count(PR.Gloves) 
           ELSE 0 
         END AS Gloves, 
         CASE 
           WHEN PR.Sanitizer = 'NO' THEN Count(PR.Sanitizer) 
           ELSE 0 
         END AS Sanitizers, 
         CASE 
           WHEN PR.Shield = 'NO' THEN Count(PR.Shield) 
           ELSE 0 
         END AS Shields 
  FROM   FlightInformation FI 
         JOIN StaffOnFlight SF 
           ON SF.[FlightID] = FI.FlightID 
         JOIN Employee E 
           ON SF.EmployeeID = E.EmployeeID 
         JOIN PERSON P 
           ON E.PersonID = P.PersonID 
         JOIN Precaution PR 
           ON P.PrecautionID = PR.PrecautionID 
  WHERE  PR.MASK = 'NO' 
          OR PR.Gloves = 'NO' 
          OR PR.Sanitizer = 'NO' 
          OR PR.Shield = 'NO' 
  GROUP  BY FI.Company, 
            PR.MASK, 
            PR.Gloves, 
            PR.Sanitizer, 
            PR.Shield 
GO

CREATE VIEW VWQURANTINECENTERS 
AS 
  SELECT CenterId, 
		 [Name] AS ContactPerson,
		 PhoneNumber,
         Street, 
         City, 
         [State], 
         ZipCode, 
         CountryName AS [Country] 
  FROM   QurantineCenter qc 
         JOIN [Address] a 
           ON qc.Addressid = a.AddressID 
         JOIN Country c 
           ON a.CountyCode = c.CountryCode
GO