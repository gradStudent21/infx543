
/* 

2-1 List the oldest and latest order dates for each customer.
 Include only the customer ID, oldest order date, and latest
 order date in the report. Use a column alias to make the
 report more readable. */
 
 SELECT c.CustomerID, 
        Min(s.OrderDate) AS 'Oldest Order Date', 
		Max(s.OrderDate) AS 'Latest Order Date'
 FROM sales.Customer AS  c 
 JOIN sales.SalesOrderHeader s ON c.CustomerID = s.CustomerID
 GROUP BY c.CustomerID 
 
 /* 2-2 Write a query to select the product id, name, and list price
 for the product(s) that has the highest list price.
 Hint: You’ll need to use a simple subquery to get the maximum
 list price and use it in the WHERE clause. */

 SELECT  ProductId, 
         Name, 
		 listPrice
 FROM Production.product
 WHERE ListPrice IN ( SELECT MAX(ListPrice) FROM production.Product)

 
/* 2-3 Provide a unique list of product ids that were ordered
 during May 2008 and sort the list by product id.
 Hint: You’ll need to JOIN Sales.SalesOrderHeader to
 Sales.SalesOrderDetail. */
 
SELECT DISTINCT orderDetail.ProductID
FROM SALES.SalesOrderHeader orderHearder
JOIN SALES.SalesOrderDetail orderDetail
      ON orderHearder.SalesOrderId = orderDetail.SalesOrderId
WHERE orderDate >= '2008-05-01' AND orderDate < '2008-06-01'
ORDER BY orderDetail.ProductID ASC

/* 2-4 Write a query that returns the highest bonus amount received for
 female sales people in North America. */

 SELECT MAX(bonus) AS 'Highest bonus amount'
 FROM SALES.SalesPerson
 WHERE TerritoryID IN (
                        SELECT DISTINCT TerritoryID 
						FROM sales.SalesTerritory 
						WHERE [Group] like 'North America'
					  )
  AND BusinessEntityID IN (
                            SELECT DISTINCT BusinessEntityID 
							FROM HumanResources.Employee 
							WHERE Gender = 'f'
						  )
  

/* 2-5 Write a query that returns the average freight charge for orders
 shipped to France and United States. */

SELECT AVG(Freight) AS 'Average freight charge'
FROM [Sales].[SalesOrderHeader]
WHERE territoryId IN (SELECT TerritoryID FROM [Sales].[SalesTerritory]
                      WHERE CountryRegionCode IN ('US', 'FR'))


/* 2-6
   Write a query that returns the number of orders of sales placed
 in Washington State and Texas (broken out by State) between January
 2005 and June 2007 (inclusive). */

SELECT COUNT(*)
FROM [Sales].[SalesOrderHeader]
WHERE orderdate >= '2005-01-01' AND  OrderDate < '2007-07-1' 
AND TerritoryID in (SELECT TerritoryID FROM [Person].[StateProvince]
                    WHERE StateProvinceCode IN ('WA', 'TX'))

