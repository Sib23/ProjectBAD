--Project Introduction to Database System (LAB)
--BD-11
--Group 3 : 
--2502037795 - Irsyad Nuryatama
--2540125466 - Christopher Bernard
--2502028525 - Hady Naufal Khairy
--2502026570 - Dafa Prakoso Putra Lukman

--4.	Query to simulate the transactions processes.

USE bluejack_jewelry


-- A. Simulate Purchased Transaction Process

--1.
-- Staff are purchasing the jewelry from vendor for stock in the warehouse
-- the first step that staff need to do is know the vendor
-- staff must input the vendor information into the database
-- after that staff can order the jewelry

insert into vendor
Values 
('VE012','Pratama','Mertilang 9 Street','Pratamaa@ve.com','08599i523043')


--2.
--after staff input the data of the vendor
--and order the jewelry
--staff need to input the jewerly type name, jewerly name, price, quantity he/she just bought
-- for this example staff just bought 2 new type of jewelry

insert into JewelryType
values
('JT011','Diamond'),
('JT012','Diamond')

insert into Jewelry
values
('JW011','JT011','stars pink','12','8000000', '8500000','7'),
('JW012','JT011','Moon Black','11','8500000', '9000000','9')


--3.
--then, the staff need to pay for the jewely that staff buy
--staff must input the data of purchasing into database
--for this example staff just bought 2 new type of jewelry

Insert into PurchaseTransactions
values
('PU026','ST002','VE012','JW011','2022-6-13','7'),
('PU027','ST002','VE012','JW012','2022-6-13','9')


--4.
--then, staff need to see the stock in the database to make sure the jewelry is enough 

Select *
from Jewelry


-- B. Simulate Sales Transaction Process

--1
--customers come to the store to see the jewelry sold in the store
--with the specification such as weight, price, stock

SELECT JewelryName, 
JewelryTypeName, 
JewelryWeight, 
JewelrySalesPrice as JewelryPrice, 
JewelryStock
FROM Jewelry j
Join JewelryType jt on j.JewelryTypeID = jt.JewelryTypeID
ORDER BY JewelryPrice DESC


--2
--If the customer is interested in buying the jewelry, 
--the staff will enter customer data such as name, gender, email, address, and phone number
--if the customer isn't interested to buy, they will leave the store

INSERT INTO Customer
VALUES 
('CU011', 'Rizki', 'Male', 'Rizki88@gmail.com', 'Jakarta 5 street', '0812345459632')


--3
--staff will fill the sales transaction data  
--such as : SalesTransactionCode, StaffCode, CustomerCode, JewelryCode, Sales Date, Sales Quantity

INSERT INTO SalesTransactions
VALUES
('SL016', 'ST001', 'CU011', 'JW003', '6/17/2022', '2')

--4
--staff will give customer the bill then the customer pay

SELECT  StaffName, StaffPhone, 
CustomerName, CustomerPhone, 
JewelryTypeName, JewelryTypeName, JewelryWeight, SalesDate, JewelrySalesQuantity, 
[JewelrySalesPrice] as JewelryPrice
FROM Staff s
join SalesTransactions st on s.StaffCode = st.StaffCode
join Customer c on st.customerCode = c.CustomerCode
join Jewelry j on st.JewelryCode = j.JewelryCode
join JewelryType jt on j.JewelryTypeID = jt.JewelryTypeID
WHERE SalesTransactionsCode = 'SL016'


--5 Staff will update the stock on jewelry table
UPDATE Jewelry 
SET JewelryStock = JewelryStock - JewelrySalesQuantity
FROM Jewelry j
join SalesTransactions st on j.JewelryCode = st.JewelryCode
WHERE SalesTransactionsCode = 'SL016'

select * from jewelry	









