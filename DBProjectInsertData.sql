--Final Project Introduction to Database
--Group 3 : 
--2502037795 - Irsyad Nuryatama
--2540125466 - Christopher Bernard
--2502028525 - Hady Naufal Khairy
--2502026570 - Dafa Prakoso Putra Lukman

-- 3. INSERT DATA

USE bluejack_jewelry
go
INSERT INTO Staff 
VALUES
('ST001', 'Damian', 'Male','damian@st.com', '12 kenangan','085938585231'),
('ST002', 'Cintia', 'Female','Cintia@st.com', '40 Mawar','081238585241'),
('ST003', 'Daniel', 'Male','Daniel@st.com', '24 Bunga','086538585261'),
('ST004', 'Felicia', 'Female','Felicia@st.com', '13 Seroja','081238594261'),
('ST005', 'Bruce', 'Male','Bruce@st.com', '13 Melawai','081248985261'),
('ST006', 'Violet', 'Female','Violet@st.com', '12 Melawai','081245985262'),
('ST007', 'Boskara', 'Male','Baskara@st.com', '15 Seroja','081248965296'),
('ST008', 'Bilal', 'Male','Bilal@st.com', '10 Kemenangan','081290985361'),
('ST009', 'Farroh', 'Female','Farrah@st.com', '15 Mawar','081348685271'),
('ST010', 'Pamungkas', 'Male','Pamungkas@st.com', '14 Mawar','081248985261')



INSERT INTO vendor
VALUES 
('VE001','Jamal','Kasuari 1 street','Jamal@ve.com','081255527755' ),
('VE002','Budi','Banowati 4 street','Budi@ve.com','081243245345' ),
('VE003','Dafa','Insinyur 5 street','Dafa@ve.com','081255536436' ),
('VE004','Irsyad','Supratman 3 street','Irsyad@ve.com','085645527755' ),
('VE005','Kevin','Soekarno 2 street','Kevin@ve.com','081255537755' ),
('VE006','Judas','Hatta 4 street','Judas@ve.com','081255357755' ),
('VE007','Bernat','Rengasdengklok 8 street','Bernat@ve.com','081254445755' ),
('VE008','Nesta',' Melati 7 street','Nesta@ve.com','081244523355' ),
('VE009','Narto',' Kasturi  5 street','Narto@ve.com','081425527755' ),
('VE010','Nadine',' Pegangsaan 6 street','Nadine@ve.com','081264527755' ),
('VE011','Restu','Teyvat 8 street','Restu@ve.com','081255867755' )



INSERT INTO Customer
VALUES 
('CU001','Probo bagus aji','Male','Probo@gmail.com','Lampung 19 street','081233345563'),
('CU002','Bagus junior ','Male','Bagus@gmail.com','Jaguar 15 street','081255235563'),
('CU003','Dewi permana','Female','Dewi@gmail.com','Delima 6 street','08178955563'),
('CU004','Ariel nagita','Male','Ariel@gmail.com','Lawang 7 street','081283341351'),
('CU005','Luna ale','Female','Luna@gmail.com','Raffles 6 street','081238357123'),
('CU006','Zikri','Male','Zikri@gmail.com','Raya 5 street','081237344211'),
('CU007','Maya citra','Female','Maya@gmail.com','Duri 6 street','081263343112'),
('CU008','Fariz hamzah','Male','Fariz@gmail.com','Lengkuas 15 street','081235344122'),
('CU009','Hilmi nuril','Male','Hilmi@gmail.com','Jambu 23 street','081243349104'),
('CU010','Wiwin eka','Female','Wiwin@gmail.com','Denpasar 3 street','08123333123')


INSERT INTO JewelryType
VALUES
('JT001','Gold'),
('JT002','Diamond'),
('JT003','White Gold'),
('JT004','Silver'),
('JT005','Pearl'),
('JT006','Bronze'),
('JT007','Ruby'),
('JT008','Black Diamond'),
('JT009','Blue Ruby'),
('JT010','Green Ruby')


INSERT INTO Jewelry
VALUES
('JW001','JT008', 'Bold and Bright', '10','2000000', '3000000','10'),
('JW002','JT003','Shining Branches', '20','3500000', '4000000','8'),
('JW003','JT002', 'Diamond in the Rough', '40','2500000', '3500000','7'),
('JW004','JT005', 'Shine Zone', '30','4000000', '5000000','6'),
('JW005','JT001', 'Clear Choice Jewelry', '60','6000000', '7000000','10'),
('JW006','JT006', 'Golden Chain Jewelry', '100','4500000', '5000000','11'),
('JW007','JT010', 'Fantastic Rings', '80','3100000', '4100000','8'),
('JW008','JT004', 'Day Dream Designs', '90','2600000', '3600000','7'),
('JW009','JT007', 'Catchy Crystals', '86','6500000', '7200000','9'),
('JW010','JT009', 'Sparkly Lady', '39','700000', '7500000','5')



INSERT INTO SalesTransactions 
VALUES
('SL001', 'ST001', 'CU001', 'JW001', '1/13/2022', '2'),
('SL002', 'ST001', 'CU002', 'JW001', '2/15/2022', '1'),
('SL003', 'ST002', 'CU003', 'JW002', '3/20/2022', '3'),
('SL004', 'ST002', 'CU004', 'JW002', '4/23/2022', '1'),
('SL005', 'ST003', 'CU004', 'JW003', '5/27/2022', '1'),
('SL006', 'ST004', 'CU005', 'JW004', '6/30/2022', '2'),
('SL007', 'ST005', 'CU006', 'JW005', '7/3/2022', '3'),
('SL008', 'ST005', 'CU007', 'JW005', '8/6/2022', '1'),
('SL009', 'ST005', 'CU008', 'JW006', '9/12/2022', '2'),
('SL010', 'ST006', 'CU008', 'JW006', '10/15/2022', '1'),
('SL011', 'ST006', 'CU009', 'JW007', '11/20/2022', '1'),
('SL012', 'ST007', 'CU009', 'JW007', '12/24/2022', '2'),
('SL013', 'ST008', 'CU010', 'JW008', '8/26/2022', '2'),
('SL014', 'ST009', 'CU010', 'JW009', '9/29/2022', '3'),
('SL015', 'ST010', 'CU010', 'JW010', '10/30/2022', '3')



INSERT INTO SalesTransactionDetail
VALUES
('SL001','JW001'),
('SL001','JW003'),
('SL001','JW005'),
('SL002','JW001'),
('SL002','JW008'),
('SL003','JW002'),
('SL003','JW007'),
('SL003','JW009'),
('SL004','JW002'),
('SL005','JW003'),
('SL005','JW006'),
('SL006','JW004'),
('SL007','JW005'),
('SL007','JW010'),
('SL008','JW005'),
('SL008','JW006'),
('SL008','JW007'),
('SL009','JW006'),
('SL010','JW006'),
('SL011','JW007'),
('SL012','JW007'),
('SL013','JW008'),
('SL014','JW009'),
('SL015','JW009'),
('SL015','JW010')



INSERT INTO PurchaseTransactions
VALUES
('PU001', 'ST001', 'VE001', 'JW001', '1/1/2022', '5'),
('PU002', 'ST001', 'VE001', 'JW001', '2/2/2022', '8'),
('PU003', 'ST002', 'VE002', 'JW002', '3/3/2022', '6'),
('PU004', 'ST002', 'VE002', 'JW002', '4/4/2022', '7'),
('PU005', 'ST003', 'VE003', 'JW003', '5/5/2022', '3'),
('PU006', 'ST004', 'VE004', 'JW004', '6/6/2022', '4'),
('PU007', 'ST005', 'VE005', 'JW005', '7/7/2022', '1'),
('PU008', 'ST005', 'VE001', 'JW006', '8/7/2022', '9'),
('PU009', 'ST006', 'VE007', 'JW007', '9/7/2022', '4'),
('PU010', 'ST007', 'VE006', 'JW007', '10/8/2022', '6'),
('PU011', 'ST007', 'VE006', 'JW008', '11/8/2022', '3'),
('PU012', 'ST008', 'VE009', 'JW008', '12/9/2022', '5'),
('PU013', 'ST008', 'VE009', 'JW009', '2/9/2022', '7'),
('PU014', 'ST009', 'VE008', 'JW010', '7/9/2022', '8'),
('PU015', 'ST010', 'VE010', 'JW010', '4/10/2022', '2')



INSERT INTO PurchaseTransactionsDetail
VALUES
('PU001','JW001'),
('PU001','JW003'),
('PU002','JW001'),
('PU002','JW005'),
('PU003','JW002'),
('PU003','JW008'),
('PU003','JW009'),
('PU004','JW002'),
('PU004','JW006'),
('PU005','JW003'),
('PU005','JW006'),
('PU006','JW004'),
('PU006','JW010'),
('PU007','JW005'),
('PU007','JW008'),
('PU008','JW006'),
('PU008','JW009'),
('PU009','JW007'),
('PU010','JW007'),
('PU011','JW008'),
('PU012','JW008'),
('PU013','JW009'),
('PU014','JW004'),
('PU014','JW010'),
('PU015','JW010')