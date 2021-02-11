---LAB-2

--BY ALEKHYA KADIRI

USE AdventureWorks2008R2

--2-1
/* Write a query to retrieve all orders made after May 1, 2008 and had an total due value greater than $50,000. 
Include the customer id, sales order id, order date and total due columns in the returned data. 
Use the CAST function in the SELECT clause to display the date only for the order date.  
Use ROUND to display only two decimal places for the total due amount.  
Use an alias to give a descriptive column heading if a column heading is missing.  
Sort the returned data first by the customer id, then order date. */

SELECT CustomerID AS [Customer_ID],
SalesOrderID AS[SalesOrder_ID],
CAST(ORDERDATE AS DATE) AS [ORDERDATEONLY],
ROUND(TotalDue,2) AS [TOTALDUE]
FROM Sales.SalesOrderHeader 
WHERE OrderDate>'05-01-2008' AND TotalDue>50000
ORDER BY CustomerID,OrderDate;

--2-2
/* List the latest order date and total number of orders for each customer.  
Include only the customer ID, account number, latest order date and the total number of orders in the report. 
Display date only for the order date. Use column aliases to make the report more presentable. Sort the returned data by the customer id.
Hint: You need to work with the Sales.SalesOrderHeader table. */ 

SELECT CustomerID AS [Customer_ID],
AccountNumber AS [Account_Number],
MAX(CAST(OrderDate AS DATE)) AS [Latest_Order_Date],
COUNT(SalesOrderID) AS [TOTAL_NUMBER_OF_ORDERS]
FROM Sales.SalesOrderHeader 
GROUP BY CustomerID,AccountNumber
ORDER BY CustomerID;

--2-3
/* Write a query to select the product id, name, and list price for the product(s)  
that have a list price greater than the the list price of the product 912.  
Display only two decimal places for the ist price and make sure all columns have a descriptive heading. 
Sort the returned data by the list price in descending. 
--Hint: You’ll need to use a simple subquery to get the list price of the product 912 and use it in a WHERE clause. */

SELECT PRODUCTID AS [Product_ID],
NAME AS [Product_Name],
ROUND(ListPrice,2) AS LISTPRICE 
FROM Production.Product 
WHERE LISTPRICE >(SELECT LISTPRICE FROM Production.Product WHERE ProductID=912)
ORDER BY ListPrice DESC;

--2-4
/* Write a query to retrieve the number of times a product has been sold for each product.  
Note it's the number of times a product has been contained in an order, not the sold quantity.  
Include only the products that have been sold more than 5 times. Use a column alias to make the report more presentable. 
Sort the returned data by the number of times a product has been sold in the descending order first, then the product id in the ascending order. 
Include the product ID, product name and number of times a product has been sold columns in the report.
Hint: Use the Sales.SalesOrderDetail and Production.Product tables. */ 

SELECT PROD.PRODUCTID AS [PRODUCT_ID],
PROD.Name AS [PRODUCTNAME],
COUNT(PROD.ProductID) [NUMBER_OF_TIMES_PRODUCT_SOLD]
FROM Production.Product PROD
INNER JOIN Sales.SalesOrderDetail SOD
ON PROD.ProductID=SOD.ProductID
GROUP BY PROD.PRODUCTID,PROD.Name
HAVING COUNT(SOD.ProductID)>5
ORDER BY [NUMBER_OF_TIMES_PRODUCT_SOLD] DESC,PROD.PRODUCTID ASC;

--2-5  
/* Write a query to generate a unique list of customer ID's and account numbers that have not placed an order after January 1, 2008. 
Sort the list by CustomerID in the ascending order. */ 

SELECT DISTINCT CUSTOMERID AS [CUSTOMER_ID],
ACCOUNTNUMBER AS [ACCOUNT_NUMBER]
FROM Sales.SalesOrderHeader
where CustomerID NOT IN
	  (select CustomerID From Sales.SalesOrderHeader where OrderDate > '2008-01-01')
ORDER BY CustomerID ASC;

--2-6
/* Write a query to create a report containing customer id, first name, last name and email address for all customers. 
Sort the returned data by CustomerID in ascending. */ 

SELECT c.CustomerID AS [Customer_ID],
p.FirstName AS [FirstName],
p.LastName AS [LastName], 
e.emailAddress AS [EmailID]
FROM Sales.Customer c 
LEFT JOIN Person.Person p 
ON c.PersonID= p.BusinessEntityID
LEFT JOIN Person.EmailAddress e
ON c.PersonID = e.BusinessEntityID
ORDER BY c.CustomerID;
