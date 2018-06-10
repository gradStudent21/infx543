/*
Modify the following query to add a column that identifies the
frequency of repeat customers and contains the following values based
on the number of orders during 2007:
'No Orders' for count = 0
'One Time' for count = 1
'Regular' for count range of 2-4
'Often' for count range of 5-10
'Very Often' for count greater than 10
*/
SELECT        c.CustomerID, 	   c.TerritoryID,	   COUNT(o.SalesOrderid) [Total Orders], 	   'frequency'=			 CASE 
			   WHEN COUNT(o.SalesOrderid) = 0 THEN 'No Orders'
			   WHEN COUNT(o.SalesOrderid) = 1 THEN 'One Time'
			   WHEN COUNT(o.SalesOrderid) >=2 AND COUNT(o.SalesOrderid) <=4 THEN 'Regular'
			   WHEN COUNT(o.SalesOrderid) >= 5 AND COUNT(o.SalesOrderid) <=10 THEN 'Often'
			   WHEN COUNT(o.SalesOrderid) > 10 THEN 'Very Often'
			 END
  
FROM Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader o
 ON c.CustomerID = o.CustomerID
WHERE DATEPART(year, OrderDate) = 2007
GROUP BY c.TerritoryID, c.CustomerID;/*
Modify the following query to add a rank with gaps in the ranking
based on total orders in descending order. Also partition by
territory.
*/
SELECT 
      c.CustomerID, 
	  c.TerritoryID,
      COUNT(o.SalesOrderid) [Total Orders],
      Rank() OVER (PARTITION BY c.TerritoryID ORDER BY COUNT(o.SalesOrderid) DESC) as [Rank]
FROM Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader o
 ON c.CustomerID = o.CustomerID
WHERE DATEPART(year, OrderDate) = 2007
GROUP BY c.TerritoryID, c.CustomerID;


/* Provide a list of products that have never been ordered.
 Include product id and product name in the list
 and sort the list by the product name.
*/WITH Product_CTE (ProductId)AS(   	SELECT ProductId	FROM [Production].[Product]	EXCEPT	SELECT ProductId	FROM  [Sales].[SalesOrderDetail])SELECT        p.productId, 	   NameFROM [Production].[Product] p JOIN Product_CTE ct   ON ct.ProductId = p.ProductIdORDER BY Name /*
Write a query to generate a list of sales order id, order date, and
number of different products included in each order for orders that
were placed after 7/27/2008. Sort (descending) the list by the number
of different products contained in each order.
Hint: a) You'll need to JOIN Sales.SalesOrderDetail and
 Sales.SalesOrderHeader for this question.
 b) COUNT ProductID for each order to get the number of
 different products included in each order.*/SELECT        sh.SalesOrderID,	   OrderDate,        COUNT(productId) AS [Total Product] FROM [Sales].[SalesOrderHeader] shLEFT OUTER JOIN [Sales].[SalesOrderDetail] sd      ON sh.SalesOrderID = sd.SalesOrderIDWHERE orderDate > '2008-07-27'GROUP BY sh.SalesOrderID, OrderDateORDER BY [Total Product] DESC