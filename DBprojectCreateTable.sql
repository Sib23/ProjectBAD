--Project Introduction to Database System (LAB)
--BD-11
--Group 3 : 
--2502037795 - Irsyad Nuryatama
--2540125466 - Christopher Bernard
--2502028525 - Hady Naufal Khairy
--2502026570 - Dafa Prakoso Putra Lukman


-- 2.	Query to create the database system


use master
Drop database bluejack_jewelry
Create database bluejack_jewelry
go
use bluejack_jewelry

Create table Staff (
StaffCode char (5) primary key check (staffCode LIKE 'ST[0-9][0-9][0-9]'),
StaffName varchar (255) not null
Constraint ck_StaffName check (Len(StaffName) >3),
StaffGender Varchar (255) not null
Constraint ck_StaffGender check (StaffGender = 'Male' or staffGender = 'Female') ,
StaffEmail Varchar (255) not null
Constraint ck_StaffEmail check (StaffEmail like '%@st.com') ,
StaffAddress Varchar (255) not null,
StaffPhone varchar (15) not null
Constraint ck_StaffPhone check (Staffphone like'08%')
)

go

Create table vendor (
VendorCode char (5) primary key check (VendorCode like 'VE[0-9][0-9][0-9]'),
VendorName varchar (255) not null
Constraint ck_VendorName check (len (VendorName) >3),
VendorAddress varchar (255) not null
Constraint ck_VendorAddress check (VendorAddress like '% [0-9] street'),
VendorEmail varchar (255) not null 
Constraint ck_VendorEmail check (VendorEmail like '%ve.com'),
VendorPhone varchar (255)not null
Constraint ck_VendorPhone check (Vendorphone like'08%')
)

go

Create table Customer (
CustomerCode char (5) primary key check (CustomerCode like 'CU[0-9][0-9][0-9]'),
CustomerName varchar (255) not null
Constraint ck_CustomerName check (Len(CustomerName) >3),
CustomerGender varchar (255) not null
Constraint ck_CustomerGender check (CustomerGender = 'Male' or Customergender = 'Female') ,
CustomerEmail varchar (255) not null,
CustomerAddress Varchar (255) not null,
CustomerPhone Varchar (255) not null
Constraint ck_CustomerPhone check (Customerphone like'08%')
)

go

Create table JewelryType (
JewelryTypeID char (5) primary key check (JewelryTypeID like 'JT[0-9][0-9][0-9]'),
JewelryTypeName varchar (255) not null
)

go

Create table Jewelry (
JewelryCode char (5) primary key check (jewelryCode like 'JW[0-9][0-9][0-9]'),
JewelrytypeID char (5) foreign key references JewelryType(JewelryTypeID) on update cascade on delete cascade,
JewelryName varchar (255) not null,
JewelryWeight int not null
Constraint ck_JewerlyWeight check (JewelryWeight between 10 and 1000),
JewelryPurchasedPrice int not null,
JewelrySalesPrice int not null,
JewelryStock int not null
)

go

Create table SalesTransactions (
SalesTransactionsCode char(5) primary key check (SalesTransactionsCode like 'SL[0-9][0-9][0-9]'),
StaffCode char(5) foreign key references Staff(StaffCode) on update cascade on delete cascade not null,
CustomerCode char(5) foreign key references Customer(CustomerCode) on update cascade on delete cascade not null ,
JewelryCode Char (5) foreign key references Jewelry(JewelryCode) on update cascade on delete cascade not null,
SalesDate date not null,
JewelrySalesQuantity int not null
Constraint ck2_JewelrySalesQuantity check (JewelrySalesQuantity > 0 )
)

go

Create table SalesTransactionDetail (
SalesTransactionsCode char(5) foreign key references salesTransactions(SalesTransactionsCode),
JewelryCode Char (5) foreign key references Jewelry(JewelryCode) on update cascade on delete cascade not null,
)

go

Create Table PurchaseTransactions (
PurchaseTransactionsCode char(5) primary key check (PurchaseTransactionsCode like 'PU[0-9][0-9][0-9]'),
StaffCode char(5) foreign key references Staff(StaffCode) on update cascade on delete cascade not null,
VendorCode char(5) foreign key references Vendor(VendorCode) on update cascade on delete cascade not null,
JewelryCode char(5) foreign key references Jewelry(JewelryCode)on update cascade on delete cascade not null,
PurchasedDate date not null,
JewelryPurchasedQuantity int 
Constraint ck2_JewelryPurchasedQuantity check (JewelryPurchasedQuantity > 0 )
)

go

Create Table PurchaseTransactionsDetail (
PurchaseTransactionsCode char(5) foreign key references PurchaseTransactions(PurchaseTransactionsCode),
JewelryCode char(5) foreign key references Jewelry(JewelryCode)on update cascade on delete cascade not null,
)