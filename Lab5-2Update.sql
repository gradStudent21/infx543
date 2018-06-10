IF OBJECT_ID (N'dbo.ufn_YearSalesTotal', N'IF') IS NOT NULL
    DROP FUNCTION dbo.ufn_YearSalesTotal;
GO

CREATE FUNCTION dbo.ufn_YearSalesTotal (@year datetime)
RETURNS money
WITH EXECUTE AS CALLER 
AS
BEGIN 
      DECLARE @SalesTotal money;
	 IF 0 = (SELECT COUNT(*) FROM [AdventureWorks2008R2].[Sales].[SalesOrderHeader]
	         WHERE YEAR(OrderDate) = Year(@year))
        BEGIN
	     SET @SalesTotal = 0.00
		END

	  ELSE
	    BEGIN

			SELECT @SalesTotal = SUM(Subtotal)
			FROM [AdventureWorks2008R2].[Sales].[SalesOrderHeader]
			WHERE YEAR(OrderDate) = Year(@year)
		END

	  return @SalesTotal
	   
END;
GO




