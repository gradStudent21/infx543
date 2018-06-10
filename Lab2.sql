
Use [AdventureWorks2008R2]
/* 2-1
Select product id, name and selling start date for all products
 that started selling after 05/01/2002. */

 SELECT ProductID, 
        Name, 
		SellStartDate
 FROM Production.Product
 WHERE SellStartDate >='2002-05-01'

 
/*
  2-2 List the oldest and latest order dates for each customer.
 Include only the customer ID, oldest order date, and latest
 order date in the report. Use a column alias to make the
 report more readable. */

 SELECT CustomerID, 
        Min(OrderDate) AS 'Oldest order date',
		Max(OrderDate) AS 'Latest order date'
 FROM Sales.SalesOrderHeader
 GROUP BY CUSTOMERID


/*
   2-3 Write a query to select the product id, name, and list price
 for the product(s) that has the highest list price.
 Hint: You’ll need to use a simple subquery to get the maximum
 list price and use it in the WHERE clause. */


 SELECT  ProductId, 
         Name, 
		 listPrice
 FROM Production.product
 WHERE ListPrice IN ( SELECT MAX(ListPrice) FROM production.Product)
  

/*
    2-4 Provide a unique list of product ids that were ordered
 during May 2008 and sort the list by product id.
 Hint: You’ll need to JOIN Sales.SalesOrderHeader to
 Sales.SalesOrderDetail. */


SELECT DISTINCT orderDetail.ProductID
FROM SALES.SalesOrderHeader orderHearder
JOIN SALES.SalesOrderDetail orderDetail
      ON orderHearder.SalesOrderId = orderDetail.SalesOrderId
WHERE orderDate BETWEEN '2008-05-01' AND '2008-05-31'
ORDER BY orderDetail.ProductID ASC

 