SELECT A.SalesOrderId, 
CONCAT(EXTRACT(YEAR FROM A.OrderDate),'-',EXTRACT(MONTH FROM A.OrderDate),'-',EXTRACT(DAY FROM A.OrderDate)) AS OrderDate,  
CONCAT(EXTRACT(YEAR FROM A.DueDate),'-',EXTRACT(MONTH FROM A.DueDate),'-',EXTRACT(DAY FROM A.DueDate)) as DueDate,
CONCAT(EXTRACT(YEAR FROM A.ShipDate),'-',EXTRACT(MONTH FROM A.ShipDate),'-',EXTRACT(DAY FROM A.ShipDate)) AS ShipDate,
A.OnlineOrderFlag,
B.Revenue, 
B.OrderQty, 
B.UnitPrice
FROM {{ ref ('stg_sales_header') }} as A 
INNER JOIN {{ ref ('stg_sales_details') }} as B 
ON A.SalesOrderID = B.SalesOrderID
limit 100