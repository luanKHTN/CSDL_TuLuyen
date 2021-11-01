use DATA_ChuyenBay
--1, Cho biết mã số tên phi công, địa chỉ, điện thoại của các phi công đã từng lái máy bay 747
Select NV.MANV, NV.TEN, NV.DCHI
From NHANVIEN NV jOIN KHANANG KN ON NV.MANV = KN.MANV
WHERE KN.MALOAI ='B747'
-- 2, Cho biết mã số và ngày đi của các chuyến bay xuất phát từ sân bay DCA trong khoảng thời gian từ 14h - 18h

Select CB.MACB, LB.NGAYDI
From CHUYENBAY CB lEFT JOIN LICHBAY LB ON CB.MACB =LB.MACB 
WHERE (CB.SBDI ='DCA' AND (CB.GIODI BETWEEN '14:00' AND '18:00'))

-- 3, Cho biết những nhân viên được phân công trên chuyến bay có mã số 100 xuất phát tại sân bay SLC. các dòng chữ xuất ra không được phép
  -- trùng lắp
Select DISTINCT NV.TEN
From CHUYENBAY CB lEFT JOIN PHANCONG PC ON (CB.MACB =PC.MACB )
JOIN LICHBAY LB ON (PC.MACB=LB.MACB AND PC.NGAYDI= LB.NGAYDI)
JOIN NHANVIEN NV ON (NV.MANV = PC.MANV) 
WHERE CB.MACB='100' AND CB.SBDI ='SLC'


-- 4,Cho biết mã loại và số hiệu máy bay đã từng xuất phát tại sân bay MIA. các dòng chữ xuất ra không được trùng lắp
 Select DISTINCT LB.MALOAI, LB.SOHIEU
From CHUYENBAY CB LEFT JOIN LICHBAY LB ON (CB.MACB=LB.MACB)
WHERE CB.SBDI ='MIA'
-- 5, Cho biết mã chuyến bay, ngày đi, cùng với tên, địa chỉ, điện thoại, của tất cả các hành khách đi trên chuyến bay đó, sắp xếp theo thứ
  -- tự tăng dần của mã chuyến bay và giảm dần theo ngày đi

 Select DC.MACB, DC.NGAYDI, KH.TEN, KH.DTHOAI, KH.DCHI
From KHACHHANG KH JOIN DATCHO DC ON ( KH.MAKH=DC.MAKH)
ORDER BY DC.MACB ASC, DC.NGAYDI DESC

--6, Cho biết mã chuyến bay, ngày đi, mã số và tên, địa chỉ điện thoại của tất cả những nhân viên được phân công trên chuyến bay đó.
  --tự tăng dần của mã chuyến bay và giảm dần theo ngày đi

  Select PC.MACB, PC.NGAYDI, NV.MANV , NV.TEN, NV.DCHI, NV.DTHOAI 
From PHANCONG PC JOIN LICHBAY LB ON (PC.MACB=LB.MACB AND PC.NGAYDI= LB.NGAYDI)
JOIN NHANVIEN NV ON (NV.MANV = PC.MANV) 
ORDER BY LB.MACB ASC, PC.NGAYDI DESC 

-- 7, Cho biết mã chuyến bay, ngày đi, mã số và tên của những phi công  được phân vào chuyến bay hạ cánh xuống sân bay ORD
Select PC.MACB, PC.NGAYDI, NV.MANV , NV.TEN
From PHANCONG PC 
JOIN LICHBAY LB ON (PC.MACB=LB.MACB AND PC.NGAYDI= LB.NGAYDI)
JOIN NHANVIEN NV ON (NV.MANV = PC.MANV) 
JOIN CHUYENBAY CB ON (LB.MACB=CB.MACB)
WHERE CB.SBDEN = 'ORD' AND NV.LOAINV = 1
ORDER BY LB.MACB ASC, PC.NGAYDI DESC 

  -- 8, Cho biết các chuyến bay (mã số chuyến bay, ngày đi và tên của phi công) trong đó phi công có mã số 1001 được phân công lái.
 Select PC.MACB, PC.NGAYDI, NV.MANV , NV.TEN
From PHANCONG PC 
JOIN LICHBAY LB ON (PC.MACB=LB.MACB AND PC.NGAYDI= LB.NGAYDI)
JOIN NHANVIEN NV ON (NV.MANV = PC.MANV) 
JOIN CHUYENBAY CB ON (LB.MACB=CB.MACB)
WHERE nv.LOAINV = 1 and nv.MANV ='1001'

-- 9, Cho biết thông tin(mã chuyến bay, sân bay đi, giờ đi, giờ đến, ngày đi) của những chuyến bay hạ cánh xuống DEN. 
--Các chuyến bay được liệt kê theo ngày giảm dần, và sân bay xuất phát tăng dần 
Select CB.MACB, cb.GIODI, cb.GIODEN, cb.SBDI, lb.NGAYDI
From CHUYENBAY cb JOIN LICHBAY lb on (cb.MACB = lb.macb)  
WHERE cb.SBDEN = 'DEN'
order by Lb.NGAYDI desc, cb.SBDI asc

-- 10, Với mỗi phi công, cho biết hãng sản xuất và mã loại máy bay mà phi công này có khả năng lái. 
--Xuất tên phi công, hãng sản xuất và MALOAI
select  nv.TEN, lmb.HANGSX, lmb.MALOAI
From NHANVIEN nv left join KHANANG KN on(nv.MANV = kn.MANV)
left join  LOAIMB lmb on (kn.MALOAI = lmb.MALOAI)
where nv.LOAINV = 1

select  nv.TEN, lmb.HANGSX, lmb.MALOAI
From NHANVIEN nv join KHANANG KN on(nv.MANV = kn.MANV)
join  LOAIMB lmb on (kn.MALOAI = lmb.MALOAI)
where nv.LOAINV = 1

-- 11, Cho biết mã phi công, tên phi công đã lái máy bay trong chuyến bay mã số 100, và ngày 11/1/2000
Select nv.MANV, nv.TEN
From NHANVIEN nv 
join PHANCONG pc on (nv.MANV = pc.MANV)
Join LICHBAY lb on (pc.NGAYDI = lb.NGAYDI and pc.MACB = lb.MACB)
Where Pc.MACB = '100' and pc.NGAYDI = ' 11/1/2000'

--12, Cho biết mã chuyến bay, mã nhân viên, tên nhân viên được phân công  vào chuyến bay xuất phát ngày 10/31/2000. 
--tại sân bay MIA vào lúc 20h30
Select nv.MANV, nv.TEN, pc.MACB
From NHANVIEN nv 
join PHANCONG pc on (nv.MANV = pc.MANV)
Join LICHBAY lb on (pc.NGAYDI = lb.NGAYDI and pc.MACB = lb.MACB)
Join CHUYENBAY cb on ( lb.macb  = cb.MACB)
Where lb.NGAYDI ='10/31/2000' and cb.sbdi= 'MIA' and cb.GIODI = '20:30'
+-- 13, Cho biết thông tin về chuyến bay mà phi công Quang đã lái(mã chuyến bay, số hiệu, mã loại, hãng sản xuất, )
Select LICHBAY.MACB, LICHBAY.SOHIEU, LICHBAY.MALOAI, LOAIMB.HANGSX
From NHANVIEN NV
Join PHANCONG ON (NV.MANV = PHANCONG.MANV)
JOIN LICHBAY ON ( PHANCONG.MACB = LICHBAY.MACB AND PHANCONG.NGAYDI = LICHBAY.NGAYDI)
JOIN LOAIMB ON ( LICHBAY.MALOAI= LOAIMB.MALOAI)
WHERE NV.TEN = 'QUANG' AND NV.LOAINV=1

select PC.MACB, SOHIEU, LMB.MALOAI, LMB.HANGSX
    from NHANVIEN NV, PHANCONG PC, LOAIMB LMB, LICHBAY LB, CHUYENBAY CB
    where NV.MANV = PC.MANV and NV.TEN = 'Quang' and LB.MACB = PC.MACB and LB.MALOAI = LMB.MALOAI and LB.NGAYDI = PC.NGAYDI and LB.MACB = CB.MACB

	-- 14, Cho biết những phi công chưa được phân công chuyến bay nào
SELECT *
FROM NHANVIEN
WHERE (NHANVIEN.MANV NOT IN		(	
								SELECT PHANCONG.MANV 
								FROM PHANCONG
								))

-- 15,Cho biết tên những khách hàng đã đi chuyến bay trên máy bay của hãng BOEING
SELECT DISTINCT KHACHHANG.TEN
FROM KHACHHANG 
JOIN DATCHO ON (KHACHHANG.MAKH = DATCHO.MAKH)
JOIN LICHBAY ON ( DATCHO.MACB = LICHBAY.MACB AND DATCHO.NGAYDI = LICHBAY.NGAYDI)
JOIN LOAIMB ON ( LICHBAY.MALOAI = LOAIMB.MALOAI)
WHERE LOAIMB.HANGSX ='BOEING'
-- 16  Cho biết mã các chuyến bay chỉ bay với số hiệu là 10 và mã loại b747
SELECT LICHBAY.MACB
fROM LICHBAY
WHERE LICHBAY.SOHIEU = 10 AND LICHBAY.MALOAI='b747'


-- cÂU LỆNH GROUP bY
 -- Câu 17: với mỗi sân bay(SBDEN), cho biết số lượng chuyến bay hạ cánh xuống sân bay đó. Kêt quả được sắp xếp theo thứ tự tăng dần của
  -- số chuyến bay đến.
  SELECT CHUYENBAY.SBDEN, COUNT (*) AS 'SOlUONG'
  FROM CHUYENBAY
 GROUP BY CHUYENBAY.SBDEN
 ORDER BY [SOlUONG] ASC

 -- Câu 18: Với mỗi sân bay đi(SBDI), cho biết số lượng sân bay xuất phát từ sân bay đó , sắp xếp theo thứ tự tăng dần của chuyến bay xuất 
  -- phát
  SELECT CHUYENBAY.SBDI, COUNT (*) AS 'SOLUONG'
  FROM CHUYENBAY
 GROUP BY CHUYENBAY.SBDI
 ORDER BY [SOLUONG] ASC

 -- Câu 19: Với mỗi sân bay(SBDI), cho biết số lượng chuyến bay xuất phát theo từng ngày. Xuất ra mã sân bay, ngày và số lượng
 SELECT SBDI, NGAYDI, COUNT(*) AS 'SOLUONG'
 FROM CHUYENBAY 
 JOIN LICHBAY ON ( CHUYENBAY.MACB = LICHBAY.MACB)
	GROUP BY CHUYENBAY.SBDI,LICHBAY.NGAYDI

-- Câu 20: Với mỗi sân bay đến(SBDEN), cho biết số lượng chuyến bay hạ cánh theo từng ngày. Xuất ra mã  sân bay đến, ngày và số lượng.
SELECT SBDEN, NGAYDI, COUNT(*) AS 'SOLUONG'
 FROM CHUYENBAY 
 JOIN LICHBAY ON ( CHUYENBAY.MACB = LICHBAY.MACB)
	GROUP BY SBDEN, NGAYDI
--21 Với mỗi lịch bay,
-- cho biết mã chuyến bay, ngày đi, cùng số lượng nhân viên không phải là phi công của chuyến bay đó
select lb.ngaydi, lb.macb, count (pc.manv) as soluongnhanvienkhongthamgia
from NHANVIEN nv
Join PHANCONG PC on ( nv.MANV = pc.MANV)
Join LICHBAY lb on	( pc.MACB=lb.MACB and pc.NGAYDI = lb.NGAYDI)
where nv.LOAINV=0
group by lb.ngaydi, lb.macb
 -- Câu 22: Số lượng chuyến bay xuất phát từ sân bay MIA vào ngày 11/01/2000
 select count(*) as SOLUONGXUATPHATTAIMIA 
 From CHUYENBAY cb join LICHBAY lb on ( cb.MACB=lb.MACB)
 where cb.SBDI = 'MIA' and lb.NGAYDI ='11/01/2000'
 Group by cb.SBDI 

 SELECT COUNT(*) SOLUONG
  FROM CHUYENBAY CB, LICHBAY LB
  WHERE CB.SBDI = 'MIA' AND LB.NGAYDI = '11/01/2000' AND LB.MACB = CB.MACB
-- Câu 23; Với mỗi chuyến bay cho biết mã chuyến bay, ngày đi, số lượng nhân viên được phân công trên chuyến bay đó, sắp theo thứ tự 
  -- giảm dần số lượng
  -- Giải tương tự câu 21
-- Câu 24: Với mỗi chuyến bay, cho biết mã chuyến bay, ngày đi, cùng với số lượng hành khách đã đặt chỗ của chuyến bay đó, 
-- sắp xếp theo thứ tự giảm dần của số lượng

-- Tương tự những câu trên

-- Câu 25: Với mỗi chuyến bay, cho biết mã chuyến bay, ngày đi, tổng lương của phi hành đoàn. sắp tăng dần tổng lương
Select lb.MACB, lb.NGAYDI, sum(LUONG) as [Tongluong]
From NHANVIEN nv
Join PHANCONG pc on ( nv.MANV = pc.MANV)
Join LICHBAY lb on ( pc.MACB=lb.MACB and pc.NGAYDI = lb.NGAYDI)
Group by lb.MACB, lb.NGAYDI

-- 26: Cho biết lương trung bình của các nhân viên không là phi công
Select AVG(luong) as 'LuongTB'
From NHANVIEN nv
Where nv.LOAINV = 0

 -- 27: Cho biết mức lương trung bình của các phi công
 Select AVG(luong) as 'LuongTBPhiCong'
 From NHANVIEN nv
 Where nv.LOAINV =1
 -- 28: Với mỗi loại máy bay, cho biết số lượng chuyến bay đã bay trên loại máy bay đó hạ cánh xuống sân bay ORD
 --Xuất mã loại máy bay và số lượng chuyến bay.
 Select Lb.MALOAI, count(*) as 'SLChuyenbay'
 From CHUYENBAY cb Join LICHBAY lb On (cb.MACB= lb.MACB)
 Where cb.SBDEN = 'ORD'
 Group by MALOAI

 -- Câu 29: Cho biết sân bay(SBDI) và số lượng chuyến bay có nhiều hơn 2 chuyến bay xuất phát trong khoảng 10h đến 22h
 Select CB.SBDI, count(*) as Soluong 
 From CHUYENBAY CB
 Where cb.GIODI between '10:00' and '22:00'
 Group by cb.GIODI
 having count(*)>2

 -- Câu 30: Cho biết tên phi công đã được phân công vào ít nhất 2 chuyến bay trong cùng một ngày
 Select nv.TEN
 From NHANVIEN nv Join PHANCONG pc On (nv.MANV= pc.MANV)
 Where nv.LOAINV =1
 Group by nv.TEN
 Having count(*)>=2

 -- Câu 31: Cho biết mã chuyến bay và ngày đi của những chuyến bay có ít hơn 3 hành khách đặt chỗ
 Select lb.MACB, dc.NGAYDI
 From DATCHO dc Join LICHBAY lb On (dc.MACB=lb.MACB and dc.NGAYDI=lb.NGAYDI)
 Group by lb.MACB, dc.NGAYDI
 Having count(dc.MAKH) >=3

  -- Câu 32: Cho biết số hiệu máy bay và loại máy bay mà phi công có mã 1001 được phân lái trên 2 lần
 Select lb.SOHIEU,lb.MALOAI
 From PHANCONG pc Join LICHBAY lb On (pc.NGAYDI=lb.NGAYDI and pc.MACB=lb.MACB)
 Where pc.MANV ='1001'
 Group by lb.SOHIEU,lb.MALOAI
 Having count(*)>2
