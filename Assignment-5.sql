USE ALEKHYA

-----Lab 5-1

/* Create a function in your own database that takes two
 parameters:
1) A year parameter
2) A month parameter
 The function then calculates and returns the total sale
 for the requested year and month. If there was no sale
 for the requested period, returns 0.
 Hints: a) Use the TotalDue column of the
 Sales.SalesOrderHeader table in an
 AdventureWorks database for
 calculating the total sale.
 b) The year and month parameters should use
 the INT data type.
 c) Make sure the function returns 0 if there
 was no sale in the database for the requested
 period. */
 ------------------------------------------------------------------------------------------------

 CREATE FUNCTION TotalSales_Function
 (@YEAR INT, @MONTH INT)
 RETURNS MONEY
 AS 
 BEGIN 
 DECLARE @TotalDue MONEY;
 SELECT @TotalDue = SUM(TotalDue) 
 FROM AdventureWorks2008R2.Sales.SalesOrderHeader
 WHERE DATEPART(yy,OrderDate)=@YEAR AND DATEPART(MM,OrderDate)=@MONTH
 IF @TotalDue IS NULL
 BEGIN
 SET @TotalDue=0
 END
 RETURN @TotalDue;
 END;

-------------------------------------------------------------------------------------------------

 ----Lab 5-2

/* With three tables as defined below: */

CREATE TABLE Customer
(CustomerID INT PRIMARY KEY,
CustomerLName VARCHAR(30),
CustomerFName VARCHAR(30));
CREATE TABLE SaleOrder
(OrderID INT IDENTITY PRIMARY KEY,
CustomerID INT REFERENCES Customer(CustomerID),
OrderDate DATE,
LastModified datetime);
CREATE TABLE SaleOrderDetail
(OrderID INT REFERENCES SaleOrder(OrderID),
ProductID INT,
Quantity INT,
UnitPrice INT,
PRIMARY KEY (OrderID, ProductID));

/* Write a trigger to put the change date and time in the LastModified column
 of the Order table whenever an order item in SaleOrderDetail is changed. */
 ---------------------------------------------------------------------------------------------
CREATE TRIGGER dbo.utrLastModified
ON dbo.SaleOrderDetail 
AFTER INSERT, UPDATE, DELETE
AS  BEGIN
    DECLARE @oid INT;
	SET @oid = ISNULL((SELECT OrderID FROM Inserted), (SELECT OrderID FROM Deleted));
    UPDATE dbo.SaleOrder SET LastModified = GETDATE()
	WHERE OrderID = @oid
	END

CREATE TRIGGER ORDER_UPDATE 
ON SaleOrderDetail
AFTER INSERT,UPDATE,DELETE
AS
IF EXISTS(SELECT * FROM INSERTED)
BEGIN
SET NOCOUNT ON;
UPDATE SaleOrder
SET LastModified = GETDATE()
WHERE OrderID = (SELECT I.OrderID FROM Inserted I);
END
IF EXISTS(SELECT * FROM DELETED) and NOT EXISTS (SELECT * FROM INSERTED)
BEGIN
SET NOCOUNT ON;
UPDATE SaleOrder
SET LastModified = GETDATE()
WHERE OrderID = (SELECT D.OrderID FROM deleted D);
END; 
	
