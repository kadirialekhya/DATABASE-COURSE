--LAB-3

--BY ALEKHYA KADIRI

--3-1

 /*frequency of repeat customers and contains the following values
 based on the number of orders during 2007:
 'No Order' for count = 0
 'One Time' for count = 1
 'Regular' for count range of 2-5
 'Often' for count range of 6-10
 'Loyal' for count greater than 10
 Give the new column an alias to make the report more readable.
*/

SELECT c.CustomerID, c.TerritoryID, COUNT(o.SalesOrderid) [TotalOrders],
case 
when  COUNT(o.SalesOrderid) = 0
then 'No Order'
when COUNT(o.SalesOrderid)= 1 
then 'One Time'
when COUNT(o.SalesOrderid)>= 2 and COUNT(o.SalesOrderid)<= 5
then 'Regular'
when COUNT(o.SalesOrderid)>= 6 and COUNT(o.SalesOrderid)<= 10 
then 'Often'
else 'Loyal'
END AS frequency_of_repeated_customers
FROM Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader o ON c.CustomerID = o.CustomerID 
WHERE DATEPART(year, OrderDate) = 2007
GROUP BY c.TerritoryID, c.CustomerID;

 --3-2

 /* Modify the following query to add a rank without gaps in the
 ranking based on total orders in the descending order. Also
 partition by territory.*/

 SELECT DENSE_RANK() OVER (PARTITION BY C.TERRITORYID ORDER BY COUNT(o.SalesOrderid) DESC ) AS RANK,
 c.CustomerID, c.TerritoryID,
 COUNT(o.SalesOrderid) [Total Orders]
FROM Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader o
 ON c.CustomerID = o.CustomerID
WHERE DATEPART(year, OrderDate) = 2007
GROUP BY c.TerritoryID, c.CustomerID;

--3-3

/* Write a query that returns the female salesperson who received
 the highest bonus amount in North America. Include the salesperson's
 id and bonus amount in the returned data. Your solution must
 retrieve the tie if there is a tie. */

select TOP 1 WITH TIES SP.BusinessEntityID as [Sales_Person_ID],SP.Bonus AS [BONUS_AMOUNT_OF_FEMALE]
FROM Sales.SalesPerson SP
 JOIN SALES.SalesTerritory ST
ON SP.TerritoryID=ST.TerritoryID
 JOIN HumanResources.Employee EMP
ON SP.BusinessEntityID=EMP.BusinessEntityID
WHERE EMP.Gender='F' AND ST.[Group]='North America'
order by SP.Bonus desc;

--3-4

/* Write a query to retrieve the most valuable salesperson of each month
 in 2007. The most valuable salesperson is the salesperson who has
 made most sales for AdventureWorks in the month. Use the monthly sum
 of the TotalDue column of SalesOrderHeader as the monthly total sales
 for each salesperson. If there is a tie for the most valuable salesperson,
 your solution should retrieve it. Exclude the orders which didn't have
 a salesperson specified.
 Include the salesperson id, the bonus the salesperson earned,
 and the most valuable salesperson's total sales for the month
 columns in the report. Sort the returned data by the month. */
 WITH TEMP AS
 (select DATEPART(MM,soh.OrderDate) AS [ORDER_MONTH],
 soh.SalesPersonID as [Sales_Person_ID], sp.Bonus as [Bonus], 
 SUM(soh.TotalDue) AS[MONTHLY_SALE],
 Rank() over (partition by DATEPART(MM,soh.OrderDate)  order by SUM(soh.TotalDue) DESC) AS [SP_RANK]
 from [Sales].[SalesOrderHeader] SOH
 Join 
 Sales.SalesPerson SP
 ON SOH.SalesPersonID=SP.BusinessEntityID
 where SOH.SalesPersonID IS NOT NULL AND DATEPART(YY,soh.OrderDate)=2007
 GROUP BY DATEPART(MM,OrderDate), soh.SalesPersonID, sp.Bonus )
 
 SELECT [Sales_Person_ID],[Bonus],MONTHLY_SALE,ORDER_MONTH FROM TEMP 
 WHERE SP_RANK=1
 ORDER BY [ORDER_MONTH]


--3-5

/* Provide a unique list of customer id’s and account numbers which
 have ordered both the red and yellow products after May 1, 2008.
 Sort the list by customer id. */
 
select SOH.CustomerID,SOH.AccountNumber
from Sales.SalesOrderHeader SOH
INNER JOIN SALES.SalesOrderDetail SOD
ON SOH.SalesOrderID=SOD.SalesOrderID
INNER JOIN Production.Product P
ON SOD.ProductID=P.ProductID
WHERE P.Color='RED' AND soh.OrderDate>'05-01-2008'
INTERSECT
select SOH.CustomerID,SOH.AccountNumber
from Sales.SalesOrderHeader SOH
INNER JOIN SALES.SalesOrderDetail SOD
ON SOH.SalesOrderID=SOD.SalesOrderID
INNER JOIN Production.Product P
ON SOD.ProductID=P.ProductID
WHERE P.Color='YELLOW' AND soh.OrderDate>'05-01-2008'
order by soh.CustomerID



