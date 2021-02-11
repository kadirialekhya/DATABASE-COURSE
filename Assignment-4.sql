
----------------------------LAB 4---------------------------------------

-----------BY ALEKHYA KADIRI-------------------------

-----------------------PART A--------------------------------

--NOTE: CONSIDERED THAT ALL THE ATTRIBUTES IN ALL THE 3 TABLES ARE MANDATORY AND SHOULD NOT BE NULL
USE ALEKHYA

CREATE TABLE TargetCustomers
(
TargetID INT NOT NULL PRIMARY KEY,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Address VARCHAR(30) NOT NULL,
City VARCHAR(30) NOT NULL,
State VARCHAR(30) NOT NULL,
ZipCode char(10) NOT NULL
);

CREATE TABLE MailingLists
(
MailingListID INT NOT NULL PRIMARY KEY,
MailingList VARCHAR(30) NOT NULL
);

CREATE TABLE TargetMailingLists
(
TargetID INT NOT NULL
         REFERENCES TargetCustomers(TargetID),
MailingListID INT NOT NULL 
              REFERENCES MailingLists(MailingListID),
CONSTRAINT PKTargetMail_ID Primary Key CLUSTERED
(TargetID,MAILINGLISTID)
);

-------------------------------------PART B--------------------------------------
USE AdventureWorks2008R2

SELECT DISTINCT  C.CUSTOMERID AS [CUSTOMER_ID],
STUFF((SELECT DISTINCT ', '  + RTRIM(CAST(SALESPERSONID AS CHAR) )
       FROM SALES.SALESORDERHEADER S
	   WHERE S.CUSTOMERID=C.CUSTOMERID
	   FOR XML PATH('')),1,2,'') AS [SALES_PERSON_ID]
FROM Sales.SalesOrderHeader C
WHERE C.SalesPersonID IS NOT NULL
GROUP BY C.CustomerID
ORDER BY C.CustomerID DESC;

------------------------------------PART C-------------------------------------
USE AdventureWorks2008R2

SELECT DISTINCT c.SalesOrderID AS [Sales_Order_ID],
STUFF((SELECT  ', ' + RTRIM(CAST(ProductID AS CHAR) )
       FROM SALES.SalesOrderDetail S
	   WHERE S.SalesOrderID=C.SalesOrderID
	   order by s.ProductID
	   FOR XML PATH('')),1,2,'') AS [Prodcut_ID]
FROM Sales.SalesOrderDetail C
GROUP BY C.SalesOrderID
ORDER BY C.SalesOrderID ;