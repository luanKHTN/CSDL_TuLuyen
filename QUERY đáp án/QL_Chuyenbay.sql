﻿use DATA_ChuyenBay
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
