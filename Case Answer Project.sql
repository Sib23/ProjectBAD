--Project Introduction to Database System (LAB)
--BD-11
--Group 3 : 
--2502037795 - Irsyad Nuryatama
--2540125466 - Christopher Bernard
--2502028525 - Hady Naufal Khairy
--2502026570 - Dafa Prakoso Putra Lukman

--5. 10 Cases Answer 

use bluejack_jewelry

--Nomor 1
SELECT v.VendorCode,VendorName, StaffName,
	[Total Transaction] = COUNT(pt.PurchaseTransactionsCode)
FROM vendor v
JOIN PurchaseTransactions pt on v.VendorCode = pt.VendorCode
join Staff st on pt.StaffCode = st.StaffCode
WHERE 
DATENAME(MONTH, PurchasedDate) = 'July'
AND 
len (VendorName) >1
GROUP BY v.VendorCode, VendorName, StaffName


--Nomor 2
SELECT distinct JewelryTypeName,
		[Total Price] = CAST((CAST(JewelrySalesPrice AS numeric) * JewelrySalesQuantity) AS varchar) + ' USD'
FROM Jewelry j
JOIN JewelryType ON j.JewelrytypeID = j.JewelrytypeID
JOIN SalesTransactions st ON st.SalesTransactionsCode = st.SalesTransactionsCode
WHERE JewelryTypeName LIKE  '%Ruby%' OR JewelryTypeName like '%Diamond%'
AND (JewelrySalesPrice * JewelrySalesQuantity) > 40000


--Nomor 3
Select [Date] = Convert (varchar,SalesDate,107),
		cu.CustomerName,
		[Total Jewelry] = Count (st.JewelryCode),
		[Total Quantity] = SUM (st.JewelrySalesQuantity)
from Customer cu
join salestransactions st on cu.customerCode = st.CustomerCode
where len (CustomerName) > 10 and
datename (MONTH,SalesDate) = 'September'
Group by cu.CustomerName,st.SalesDate


--Nomor 4
Select st.StaffCode,
		st.StaffName,
		je.JewelryName,
		[Total Jewelry] = count (pt.JewelryCode),
		[Total Price] = cast((cast(je.JewelryPurchasedPrice as numeric) *pt.JewelryPurchasedQuantity)as varchar) + ' USD' 
from staff st
join PurchaseTransactions pt on st.StaffCode = pt.StaffCode
join Jewelry je on pt.JewelryCode = je.JewelryCode
join PurchaseTransactionsDetail ptd on je.JewelryCode =  ptd.JewelryCode
where StaffGender = 'male'
group by st.StaffCode,st.StaffName,je.JewelryName,JewelryPurchasedPrice,pt.JewelryPurchasedQuantity
having count (ptd.JewelryCode) >= 2
order by ([Total Price]) desc


--Nomor 5

Select Distinct CustomerName,CustomerEmail,CustomerAddress,JewelryName,
        [JewelryWeight] =  Cast(Cast(JewelryWeight as numeric) as Varchar) + ' gram ' 
From Customer c
Join SalesTransactions st ON c.CustomerCode = st.CustomerCode
Join SalesTransactionDetail std ON st.SalesTransactionsCode =  std.SalesTransactionsCode
Join Jewelry je ON std.JewelryCode = je.JewelryCode,
(
        Select [MaximumPrice] = Max(JewelryWeight)
        From Jewelry
)AsMAXJewelry
Where je.JewelryWeight = AsMAXJewelry.MaximumPrice
And CustomerAddress Like 'l%'
Order By CustomerName ASC


---Nomor 6
Select Distinct VendorName, VendorEmail, VendorPhone, JewelryName, 
        [JewelryPrice] =  CAST(CAST(JewelryPurchasedPrice As Numeric) As Varchar) + ' USD '
From Vendor v
Join PurchaseTransactions pt ON v.VendorCode = pt.VendorCode
Join PurchaseTransactionsDetail ptd on pt.PurchaseTransactionsCode = ptd.PurchaseTransactionsCode
Join Jewelry je ON ptd.JewelryCode = je.JewelryCode,
( 
            Select [MinimumJewelry] = MIN(JewelryPurchasedPrice)
            From Jewelry
) AsMinJewelry
Where JewelryPurchasedPrice = AsMINJewelry.MinimumJewelry
And VendorName Like 'n%'
Order By VendorName DesC


-- Nomor 7.
SELECT REPLACE (s.StaffCode, 'ST', 'Staff ')  AS [Staff ID], 
StaffName,JewelryName, 
[Total Price] = CAST ((CAST (JewelryPurchasedPrice AS Numeric) * pt.JewelryPurchasedQuantity) AS Varchar)
FROM Staff s
JOIN PurchaseTransactions pt on s.StaffCode = pt.StaffCode
JOIN Jewelry j on pt.JewelryCode = j.jewelryCode,
(
	SELECT [AvgQuantity] = avg(JewelryPurchasedQuantity)
	FROM PurchaseTransactions
)AsAvgPurchasedQuantity
WHERE JewelryPurchasedQuantity > AsAvgPurchasedQuantity.AvgQuantity
AND Day (PurchasedDate) %2 = 1
ORDER BY StaffName ASC



-- Nomor 8. 
SELECT s.StaffCode as [Staff ID], 
[Staff Name] = Upper(StaffName),
SalesTransactionsCode,
[Total Price] = CAST ((CAST (JewelrySalesPrice AS Numeric) * st.JewelrySalesQuantity) AS Varchar) + ' USD'
FROM Staff s
JOIN SalesTransactions st ON s.StaffCode = st.StaffCode 
JOIN Jewelry j on st.JewelryCode = j.JewelryCode,
(
	SELECT [Average] = avg(JewelrySalesPrice)
	FROM Jewelry
)AsJewelryPrice
WHERE (JewelrySalesPrice * st.JewelrySalesQuantity) > AsJewelryPrice.Average
AND StaffName LIKE '%o%'
ORDER BY ([Total Price]) DESC


--Nomor 9.
Create view ViewStaffSales
as
select s.StaffCode,
		[StaffName] = LOWER (StaffName),
		s.StaffEmail,
		[Total Jewelry Sold] = count (st.SalesTransactionsCode),
		[Average Quantity] = avg (st.JewelrySalesQuantity)
from Staff s
join SalesTransactions st on s.StaffCode = st.StaffCode
where StaffName not like '% %' 
and len (StaffName)  >5
group by s.staffcode,s.StaffName,s.StaffEmail
Select * from ViewStaffSales


--Nomor 10. 
Create View ViewVendorPurchase
as
SELECT v.VendorCode, 
VendorName, 
VendorEmail, 
VendorAddress, 
[Total Jewelry Purchased] = COUNT(pt.PurchaseTransactionsCode),
[Average Quantity] = AVG(pt.JewelryPurchasedQuantity)
FROM Vendor v
JOIN PurchaseTransactions pt on v.VendorCode = pt.VendorCode
WHERE (VendorAddress like '% [1,3,5,7,9] street')
GROUP BY v.VendorCode,VendorName, VendorEmail, VendorAddress
HAVING COUNT (pt.PurchaseTransactionsCode) >1
Select * from ViewVendorPurchase
