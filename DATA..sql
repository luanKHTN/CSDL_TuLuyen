-- MSSV: 20880268
-- Họ tên: Nguyễn Triển Phát
/*
	Ngày thi: 28/08/2021
	Môn Thi : CSDL
	Đề Thi : 02	
*/

-- Tạo CSDL Quản lý đề án

-- 1/ Tạo CSDL
Create Database QLCBay;

Go

Use QLCBay;

Go;

-- 2/ Tạo 2 tables + PK
Create Table NHANVIEN (
	MANV varchar(5),
	TEN nvarchar(15),	
	DCHI nvarchar(30),
	DTHOAI nvarchar(10),
	LUONG Float,
	LOAINV varchar(3),
	Primary key(MaNV),
);

Create Table LOAIMB (
	HANGSX varchar(10),
	MALOAI nvarchar(5),
	Primary key(MALOAI),
);

Create Table KHANANG (
	MANV varchar(5),
	MALOAI nvarchar(5),
	Primary key(MaNV, MALOAI),
	foreign key (MANV) references NHANVIEN(MaNV)
);
Alter Table KHANANG
	add constraint fk_KHANANG_LOAIMB
	foreign key(MALOAI) references LOAIMB(MALOAI)

Create Table MAYBAY (
	SOHIEU varchar(2),
	MALOAI nvarchar(5),
	Primary key(SOHIEU, MALOAI),
	foreign key(MALOAI) references LOAIMB(MALOAI)
);
Alter Table MAYBAY
	add constraint fk_MAYBAY_LOAIMB
	foreign key(MALOAI) references LOAIMB(MALOAI)

Go;
Create Table PHANCONG (
	MANV varchar(5),
	NGAYDI DATE,
	MACB varchar(3),
	Primary key(MANV, NGAYDI, MACB),
	foreign key(MANV) references NHANVIEN(MANV),
);
Go;

Create Table LICHBAY (
	NGAYDI DATE,
	MACB varchar(3),
	SOHIEU varchar(2),
	MALOAI nvarchar(5),
	Primary key(NGAYDI, MACB),
);

Alter Table LICHBAY
	add constraint fk_LICHBAY_CHUYENBAY
	foreign key(MACB) references CHUYENBAY(MACB)

Alter Table LICHBAY
	add constraint fk_LICHBAY_MAYBAY
	foreign key(SOHIEU, MALOAI) references MAYBAY(SOHIEU, MALOAI)
Go;

Alter Table PHANCONG
	add constraint fk_PHANCONG_LICHBAY
	foreign key(NGAYDI, MACB) references LICHBAY(NGAYDI, MACB)
Go;

Create Table DATCHO (
	MAKH varchar(5),
	NGAYDI DATE,
	MACB varchar(3),
	Primary key(MAKH, NGAYDI, MACB),
);
Go;

Alter Table DATCHO
	add constraint fk_DATCHO_KHACHHANG
	foreign key(MAKH) references KHACHHANG(MAKH)

Alter Table DATCHO
	add constraint fk_DATCHO_LICHBAY
	foreign key(NGAYDI, MACB) references LICHBAY(NGAYDI, MACB)
Go;

Create Table KHACHHANG (
	MAKH varchar(5),
	TEN nvarchar(15),	
	DCHI nvarchar(30),
	DTHOAI nvarchar(10),
	Primary key(MAKH),
);
Go;

Create Table CHUYENBAY (
	MACB varchar(3),
	SBDI varchar(3),	
	SBDEN varchar(3),	
	GIODI TIME,
	GIODEN TIME,
	Primary key(MACB),
);

Go

-- 4/ Nhập Data
-- Table Tinh
insert into NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) 
values ('1006', 'Chi', '12/6 Nguyen Kiem', '8120012', '150000', '0');
insert into NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) 
values ('1005', 'Giao', '65 Nguyen Thai Son', '8324467', '500000', '0');
insert into NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) 
values ('1001', 'Huong', '8 Dien Bien Phu', '8330733', '500000', '1');
insert into NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) 
values ('1002', 'Phong', '1 Ly Thuong Kiet', '8308117', '450000', '1');
insert into NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) 
values ('1004', 'Phuong', '351 Lac Long Quan', '8308155', '250000', '0');
insert into NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) 
values ('1003', 'Quang', '78 Truong Dinh', '8324461', '350000', '1');
insert into NHANVIEN (MANV, TEN, DCHI, DTHOAI, LUONG, LOAINV) 
values ('1007', 'Tam', '36 Nguyen Van Cu', '8458188', '500000', '0');
Go;

insert into LOAIMB(HANGSX, MALOAI) values ('Airbus', 'A310');
insert into LOAIMB(HANGSX, MALOAI) values ('Airbus', 'A320');
insert into LOAIMB(HANGSX, MALOAI) values ('Airbus', 'A330');
insert into LOAIMB(HANGSX, MALOAI) values ('Airbus', 'A340');
insert into LOAIMB(HANGSX, MALOAI) values ('Boeing', 'B727');
insert into LOAIMB(HANGSX, MALOAI) values ('Boeing', 'B747');
insert into LOAIMB(HANGSX, MALOAI) values ('Boeing', 'B757');
insert into LOAIMB(HANGSX, MALOAI) values ('MD', 'DC10');
insert into LOAIMB(HANGSX, MALOAI) values ('MD', 'DC9');
Go;

insert into KHANANG(MANV, MALOAI) values ('1001', 'B727');
insert into KHANANG(MANV, MALOAI) values ('1001', 'B747');
insert into KHANANG(MANV, MALOAI) values ('1001', 'DC10');
insert into KHANANG(MANV, MALOAI) values ('1002', 'A320');
insert into KHANANG(MANV, MALOAI) values ('1002', 'A340');
insert into KHANANG(MANV, MALOAI) values ('1002', 'B757');
insert into KHANANG(MANV, MALOAI) values ('1002', 'DC9');
insert into KHANANG(MANV, MALOAI) values ('1003', 'A310');
insert into KHANANG(MANV, MALOAI) values ('1003', 'DC9');
Go;

insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0009', 'Nga', '223 Nguyen Trai', '8932320');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0101', 'Anh', '567 Tran Phu', '8826729');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0045', 'Thu', '285 Le Loi', '8932203');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0012', 'Ha', '435 Quang Trung', '8933232');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0238', 'Hung', '456 Pasteur', '9812101');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0397', 'Thanh', '234 Le Van Si', '8952943');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0582', 'Mai', '789 Nguyen Du', null);
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0934', 'Minh', '678 Le Lai', null);
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0091', 'Hai', '345 Hung Vuong', '8893223');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0314', 'Phuong', '395 Vo Van Tan', '8232320');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0613', 'Vu', '348 CMT8', '8343232');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0586', 'Son', '123 Bach Dang', '8556223');
insert into KHACHHANG(MAKH, TEN, DCHI, DTHOAI) 
values ('0422', 'Tien', '75 Nguyen Thong', '8332222');
Go;

insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('100', 'SLC', 'BOS', '08:00', '17:50');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('112', 'DCA', 'DEN', '14:00', '18:07');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('121', 'STL', 'SLC', '07:00', '09:13');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('122', 'STL', 'YYV', '08:30', '10:19');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('206', 'DFW', 'STL', '09:00', '11:40');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('330', 'JFK', 'YYV', '16:00', '18:53');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('334', 'ORD', 'MIA', '12:00', '14:14');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('335', 'MIA', 'ORD', '15:00', '17:14');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('336', 'ORD', 'MIA', '18:00', '20:14');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('337', 'MIA', 'ORD', '20:30', '23:53');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('394', 'DFW', 'MIA', '19:00', '21:30');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('395', 'MIA', 'DFW', '21:00', '23:43');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('449', 'CDG', 'DEN', '10:00', '19:29');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('930', 'YYV', 'DCA', '13:00', '16:10');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('931', 'DCA', 'YYV', '17:00', '18:10');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('932', 'DCA', 'YYV', '18:00', '19:10');
insert into CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN) 
values ('991', 'BOS', 'ORD', '17:00', '18:22');
GO;

insert into MAYBAY(SOHIEU, MALOAI) values ('10', 'B747');
insert into MAYBAY(SOHIEU, MALOAI) values ('11', 'B727');
insert into MAYBAY(SOHIEU, MALOAI) values ('13', 'B727');
insert into MAYBAY(SOHIEU, MALOAI) values ('13', 'B747');
insert into MAYBAY(SOHIEU, MALOAI) values ('21', 'DC10');
insert into MAYBAY(SOHIEU, MALOAI) values ('21', 'DC9');
insert into MAYBAY(SOHIEU, MALOAI) values ('22', 'B757');
insert into MAYBAY(SOHIEU, MALOAI) values ('22', 'DC9');
insert into MAYBAY(SOHIEU, MALOAI) values ('23', 'DC9');
insert into MAYBAY(SOHIEU, MALOAI) values ('24', 'DC9');
insert into MAYBAY(SOHIEU, MALOAI) values ('70', 'A310');
insert into MAYBAY(SOHIEU, MALOAI) values ('80', 'A310');
insert into MAYBAY(SOHIEU, MALOAI) values ('93', 'B757');
GO;

insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('11/01/2000', '100', '80', 'A310');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('11/01/2000', '112', '21', 'DC10');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('11/01/2000', '206', '22', 'DC9');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('11/01/2000', '334', '10', 'B747');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('11/01/2000', '395', '23', 'DC9');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('11/01/2000', '991', '22', 'B757');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('11/01/2000', '337', '10', 'B747');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('10/31/2000', '100', '11', 'B727');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('10/31/2000', '112', '11', 'B727');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('10/31/2000', '206', '13', 'B727');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('10/31/2000', '334', '10', 'B747');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('10/31/2000', '335', '10', 'B747');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('10/31/2000', '337', '24', 'DC9');
insert into LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI) 
values ('10/31/2000', '449', '70', 'A310');
GO;

insert into PHANCONG(MANV, NGAYDI, MACB) values ('1001','11/01/2000', '100');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1001','10/31/2000', '100');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1002','11/01/2000', '100');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1002','10/31/2000', '100');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1003','10/31/2000', '100');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1003','10/31/2000', '337');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1004','10/31/2000', '100');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1004','10/31/2000', '337');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1005','10/31/2000', '337');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1006','11/01/2000', '991');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1006','10/31/2000', '337');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1007','11/01/2000', '112');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1007','11/01/2000', '991');
insert into PHANCONG(MANV, NGAYDI, MACB) values ('1007','10/31/2000', '206');
GO;

insert into DATCHO(MAKH, NGAYDI, MACB) values ('0009','11/01/2000', '100');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0009','10/31/2000', '449');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0045','11/01/2000', '991');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0012','10/31/2000', '206');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0238','10/31/2000', '334');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0582','11/01/2000', '991');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0091','11/01/2000', '100');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0314','10/31/2000', '449');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0613','11/01/2000', '100');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0586','11/01/2000', '991');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0586','10/31/2000', '100');
insert into DATCHO(MAKH, NGAYDI, MACB) values ('0422','10/31/2000', '449');

/*
Use master;
drop database QLCBay;
*/

Select * from NHANVIEN;
select * from LOAIMB;
SELECT * FROM KHANANG;
SELECT * FROM KHACHHANG;
SELECT * FROM CHUYENBAY;
SELECT * FROM MAYBAY;
SELECT * FROM LICHBAY;
SELECT * FROM PHANCONG;


--1Cho Biết mã loại và số hiệu máy bay đã từng xuất phát tại Mia.
--Các dòng dữ liệu xuất ra không bị trùng lặp
Select distinct lb.MALOAI, lb.SOHIEU
from MAYBAY mb join LICHBAY lb on (mb.MALOAI = lb.MALOAI) join CHUYENBAY cb on (lb.MACB = cb.MACB)
Where cb.SBDI = 'MIA';

--2Cho biết mã chuyến bay, ngày đi , cùng với tên, dchi, dt của tất cả nhân viên
--đã được phân công trong truyến bay đó, sắp xếp theo tăng dần của chuyến bay và ngày đi giảm dần.
Select distinct pc.MACB, lb.NGAYDI, nv.TEN, nv.DCHI, nv.DTHOAI
From NHANVIEN nv left join PHANCONG pc on (nv.MANV = pc.MANV) join LICHBAY lb on (pc.MACB = lb.MACB)
Order by PC.MACB ASC , lb.NGAYDI DESC ;

--3Cho biết mã chuyến bay, ngày đi , cùng với tên, dchi, dt của tất cả khách hàng
--đã được phân công trong truyến bay đó, sắp xếp theo tăng dần của chuyến bay và ngày đi giảm dần.
Select distinct KH.TEN as [TEN KH],lb.MACB, lb.NGAYDI, kh.DCHI, kh.DTHOAI
From KHACHHANG kh left join DATCHO dc on (kh.MAKH = dc.MAKH) join LICHBAY lb on (dc.MACB = lb.MACB and dc.NGAYDI = lb.NGAYDI)
Order by lb.MACB ASC , lb.NGAYDI DESC ;

--4 Cho biết mã CB, mã NV, TenNV được phancong vào chuyến bay 
--ngày 10/31/2000 tại SB MIA vào lúc 20:30
Select distinct cb.MACB, nv.MANV, nv.TEN
from NHANVIEN nv join PHANCONG pc on (nv.MANV = pc.MANV) join LICHBAY lb on (pc.NGAYDI = lb.NGAYDI and pc.MACB = lb.MACB) 
     right join CHUYENBAY cb on(lb.MACB = cb.MACB)
Where lb.NGAYDI = '10/31/2000' and cb.SBDI = 'MIA' and cb.GIODI = '20:30';

--5 Cho biết TT về CB (MACB, SH, ML, HXS) mà phi công Quang đã lái.
Select pc.MACB, mb.SOHIEU, mb.MALOAI, lmb.HANGSX
from NHANVIEN nv join PHANCONG pc on (nv.MANV = pc.MANV) join LICHBAY lb on (pc.MACB = lb.MACB)
     join MAYBAY mb on (lb.SOHIEU = mb.SOHIEU) join LOAIMB lmb on (mb.MALOAI = lmb.MALOAI)
where nv.TEN = 'Quang'
order by MACB;