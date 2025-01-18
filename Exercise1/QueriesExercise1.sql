--Exercise1 Queries:

-- 1\ List the Cars Sold After April 15, 2021
SELECT CarSerialNumber 
FROM Sale 
WHERE SaleDate > '2021-04-15';

-- 2\ Identify the Car That Generated the Most Revenue
SELECT TOP 1 CarSerialNumber, MAX(PurchasePrice - Cost) AS Revenue
FROM Sale
JOIN Car ON Sale.CarSerialNumber = Car.SerialNumber
GROUP BY CarSerialNumber
ORDER BY Revenue DESC

-- 3\Identify the Seller Who Granted the Largest Discount
SELECT TOP 1 SellerID, MAX(DisplayedPrice - PurchasePrice) AS MaxDiscount
FROM Sale
JOIN Car ON Sale.CarSerialNumber = Car.SerialNumber
GROUP BY SellerID
ORDER BY MaxDiscount DESC


-- 4\Profits of Each Store for January 2021
SELECT StoreID, SUM(PurchasePrice - Cost) AS Profit
FROM Sale
JOIN Car ON Sale.CarSerialNumber = Car.SerialNumber
JOIN Storage ON Car.SerialNumber = Storage.CarSerialNumber
WHERE MONTH(SaleDate) = 1 AND YEAR(SaleDate) = 2021
GROUP BY StoreID;

-- 5\Identify the Best Customer
SELECT TOP 1 CustomerID, SUM(PurchasePrice) AS TotalSpent
FROM Sale
GROUP BY CustomerID
ORDER BY TotalSpent DESC


-- 6\Identify the Brand with the Most Discounts
SELECT TOP 1 Brand, COUNT(*) AS DiscountCount
FROM Sale
JOIN Car ON Sale.CarSerialNumber = Car.SerialNumber
JOIN CarModel ON Car.ModelID = CarModel.ModelID
WHERE DisplayedPrice > PurchasePrice
GROUP BY Brand
ORDER BY DiscountCount DESC
