SELECT CustomerId, RegistrationDateTime
FROM Customers
WHERE CustomerId IN 
(
SELECT DISTINCT CustomerId 
FROM Purchases 
WHERE ProductName = 'молоко'
AND CustomerId NOT IN
(
SELECT CustomerId 
FROM Purchases 
WHERE ProductName = 'сметана' AND PurchaseDatetime >= DATEADD(MONTH, -1, GETDATE())
)
)
