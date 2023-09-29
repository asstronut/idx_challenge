CREATE PROCEDURE summary_order_status @StatusID int AS
BEGIN
	SELECT
		so.OrderID,
		c.CustomerName,
		p.ProductName,
		so.Quantity,
		s.StatusOrder
	FROM FactSalesOrder so JOIN DimCustomer c ON so.CustomerID = c.CustomerID
	JOIN DimProduct p ON so.ProductID = p.ProductID
	JOIN DimStatusOrder s ON so.StatusID = s.StatusID
	WHERE so.StatusID = @StatusID;
END;

GO

EXEC summary_order_status @StatusID=2;
