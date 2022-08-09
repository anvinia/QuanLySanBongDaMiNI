﻿CREATE DATABASE QUANLYSANBONG
USE QUANLYSANBONG
GO
SET DATEFORMAT DMY
CREATE TABLE NhanVien
(
	MaNhanVien VARCHAR(100) not null, 
	TenNhanVien NVARCHAR(100),
	DiaChiNhanVien NVARCHAR(100),
	GioiTinh NVARCHAR(5),
	SDT CHAR(10),
	PRIMARY KEY (MaNhanVien),  	
)

GO
CREATE TABLE KhachHang
(
	MaKhachHang VARCHAR(100) not null, 
	TenKhachHang NVARCHAR(100),
	DiaChiKhachHang NVARCHAR(150),
	SdtKhachHang VARCHAR(100),
	PRIMARY KEY (MaKhachHang),  	
)
CREATE TABLE DichVu
(
	MaDichVu VARCHAR(100) NOT NULL,
	TenDichVu VARCHAR(100),
	GiaDichVu Int,
	PRIMARY KEY (MaDichVu),
)

CREATE TABLE LoaiSan
(
	LoaiSan VARCHAR(100) Not Null,
	TenLoai NVARCHAR(100) ,	
	GiaLoaiSan FLOAT,
	Primary key (LoaiSan),
)
CREATE TABLE San
(
	MaSan VARCHAR(100) Not Null,
	LoaiSan VARCHAR(100),
	TenSan NVARCHAR(100),
	Primary key (MaSan),
)
CREATE TABLE ThueSan
(
	MaThueSan VARCHAR(100) Not Null,
	MaSan VARCHAR(100),
	MaKhachHang VARCHAR(100),
	ThoiGianBatDau datetime ,
	ThoiGianKetThuc datetime ,
	LoaiThue nvarchar(50),
	DonGia FLOAT ,
	ThanhTien nchar(10),
	PRIMARY KEY (MaThueSan),
)
CREATE TABLE HoaDon
(	
	MaHD VARCHAR(100) Not Null ,	
	MaKhachHang VARCHAR(100),
	MaNhanVien VARCHAR(100),
	MaDichVu VARCHAR(100),
	MaThueSan VARCHAR(100) NOT NULL,	
	NgayLapHD date NOT NULL,
	TongPhutDa INT NOT NULL,
	DonGia FLOAT,
	TongTienHD FLOAT NULL,
	Primary key (MAHD),
)

ALTER TABLE San
add constraint FK_1 FOREIGN KEY (LoaiSan) REFERENCES LoaiSan(LoaiSan)
ALTER TABLE ThueSan
add constraint FK_2 FOREIGN KEY (MaSan) REFERENCES San(MaSan)
ALTER TABLE ThueSan
add constraint FK_3 FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
ALTER TABLE HoaDon
add constraint FK_4 FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)	
ALTER TABLE HoaDon
add constraint FK_6 FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)	
ALTER TABLE HoaDon
add constraint FK_7 FOREIGN KEY (MaDichVu) REFERENCES DichVu(MaDichVu)	
ALTER TABLE HoaDon
add constraint FK_8 FOREIGN KEY (MaThueSan) REFERENCES ThueSan(MaThueSan)
INSERT INTO KhachHang(MaKhachHang,TenKhachHang, DiaChiKhachHang, SdtKhachHang) VALUES
('KH1',N'Lê Văn A', N'Hà Tĩnh', '0689712942'),
('KH2',N'Nguyễn Văn B', N'Bình Dương', '0623452314'),
('KH3',N'Nguyễn Văn C', N'Thanh Hóa', '0786583521'),
('KH4',N'Nguyễn Văn D', N'Đồng Nai', '0987234224'),
('KH5',N'Nguyễn Văn E', N'Tp.HCM', '0978943634'),
('KH6',N'Trần Văn A', N'Đà Nẵng', '0272352342');
GO
INSERT LoaiSan(LoaiSan,TenLoai,GiaLoaiSan) VALUES
('Loai1',N'Sân 6 người',20000),
('Loai2',N'Sân 10 người',40000),
('Loai3',N'Sân 14 người',80000);
GO
INSERT INTO DichVu (MaDichVu,TenDichVu,GiaDichVu) VALUES
('DV1',N'Sting  ',10000),
('DV2',N'KhanGiay ',5000),
('DV3',N'QuanAo', 100000),
('DV4',N'BangKeo', 20000);
GO
INSERT San(MaSan,LoaiSan,TenSan) VALUES
('SAN1','Loai1',N'Sân 1'),
('SAN2','Loai2',N'Sân 2'),
('SAN3','Loai3',N'Sân 3'),
('SAN4','Loai1',N'Sân 4'),
('SAN5','Loai2',N'Sân 5'),
('SAN6','Loai3',N'Sân 6');
GO
INSERT INTO NhanVien(MaNhanVien,TenNhanVien, DiaChiNhanVien,GioiTinh ,SDT) VALUES
('NV1',N'Lê  ', N'Hà Tĩnh','Nam', '0689712942'),
('NV2',N'Nguyễn ', N'Bình Dương','Nam', '0623452314'),
('NV3',N'Văn ', N'Thanh Hóa','Nam', '0786583521'),
('NV4',N'De', N'Đồng Nai','Nu', '0987234224'),
('NV5',N'En', N'Tp.HCM','Nu', '0978943634'),
('NV6',N'An', N'Đà Nẵng','Nu', '0272352342'),
('NV7',N'Nam  ', N'Long An ','Nam', '06891518'),
('NV8',N'Kin  ', N'Gia Lai ','Nam', '03123311'),
('NV9',N'Tan  ', N'Gia Cat ','Nam', '0312331121');
GO
INSERT ThueSan(MaThueSan,MaSan,MaKhachHang,ThoiGianBatDau,ThoiGianKetThuc,LoaiThue,DonGia,ThanhTien) VALUES
('1','SAN1','KH1','23-11-2021 17:00','23-11-2021 18:00', N'Trực tiếp',20000,N'120000'),
('2','SAN2','KH3','24-11-2021 18:00','24-11-2021 19:00', N'Đặt trước',40000,N'240000'),
('3','SAN3','KH4','25-11-2021 19:00','25-11-2021 20:00', N'Đặt trước',80000,N'480000'),
('4','SAN4','KH2','26-11-2021 18:00','26-11-2021 19:00', N'Trực tiếp',20000,N'120000'),
('5','SAN5','KH5','27-11-2021 17:00','27-11-2021 18:00', N'Đặt trước',40000,N'240000'),
('6','SAN6','KH6','28-11-2021 19:00','28-11-2021 20:00', N'Trực tiếp',80000,N'480000'),
('7','SAN6','KH6','29-11-2021 19:00','29-11-2021 20:00', N'Trực tiếp',80000,N'480000');
INSERT ThueSan(MaThueSan,MaSan,MaKhachHang,ThoiGianBatDau,ThoiGianKetThuc,LoaiThue,DonGia,ThanhTien) VALUES
('9','SAN2','KH1','23-11-2021 21:00','23-11-2021 22:00', N'Trực tiếp',40000,N'240000');
INSERT ThueSan(MaThueSan,MaSan,MaKhachHang,ThoiGianBatDau,ThoiGianKetThuc,LoaiThue,DonGia,ThanhTien) VALUES
('8','SAN2','KH1','23-11-2021 19:00','23-11-2021 20:00', N'Trực tiếp',40000,N'240000');
GO
INSERT HoaDon(MaHD,MaKhachHang,MaNhanVien,MaDichVu,MaThueSan,NgayLapHD,TongPhutDa,DonGia,TongTienHD) VALUES
('1','KH1','NV1',NULL,'2','23/11/2021',  60,20000,120000),
('2','KH3','NV3','DV4','1','24/11/2021', 60,40000,240000),
('3','KH4','NV2','DV3','4','25/11/2021', 60,80000,480000),
('4','KH2','NV5','DV4','3','26/11/2021', 60,20000,120000),
('5','KH5','NV6','DV3','6','27/11/2021', 60,40000,240000),
('6','KH6','NV4','DV2','5','28/11/2021', 60,80000,480000);
INSERT HoaDon(MaHD,MaKhachHang,MaNhanVien,MaDichVu,MaThueSan,NgayLapHD,TongPhutDa,DonGia,TongTienHD) VALUES
('7','KH6','NV1',NULL,'5','23/11/2021', 60,40000,240000);
INSERT HoaDon(MaHD,MaKhachHang,MaNhanVien,MaDichVu,MaThueSan,NgayLapHD,TongPhutDa,DonGia,TongTienHD) VALUES
('8','KH1','NV2','DV3','8','30/11/2021', 60,40000,NULL);

SELECT * FROM HoaDon
SELECT * FROM KhachHang
SELECT * FRoM LoaiSan
SELECT * FROM San
SELECT * FROM ThueSan
SELECT * FROM NhanVien
SELECT * FROM DichVu
GO

ALTER TABLE	LOAISAN
ADD CONSTRAINT CHK_GIALOAISAN CHECK (GiaLoaiSan > 0)
UPDATE LoaiSan
SET GiaLoaiSan = -1000
WHERE LoaiSan = 'Loai1'

ALTER TABLE	LOAISAN
ADD CONSTRAINT UNI_TENLOAISAN UNIQUE (TenLoai)
UPDATE LoaiSan
SET TenLoai = N'Sân 6 người'
WHERE LoaiSan = 'Loai2'

ALTER TABLE SAN
ADD CONSTRAINT UNI_TENSAN UNIQUE (TenSan)
UPDATE	San
SET TenSan= N'Sân 1'
WHERE MaSan = 'SAN2'

ALTER TABLE ThueSan 
ADD CONSTRAINT DEF_LOAITHUE DEFAULT 'Chua Dat' For LoaiThue
GO

/* tao Bang View*/
Create View NV_Kh AS
Select TenKhachHang,TenNhanVien
FROM NhanVien,KhachHang,HoaDon
WHERE NhanVien.MaNhanVien = HoaDon.MaNhanVien AND KhachHang.MaKhachHang = HoaDon.MaKhachHang
GO
Create View ThueSan_LoaiSan As
SELECT LoaiSan.LoaiSan,MaThueSan
From ThueSan,LoaiSan,San
Where ThueSan.MaSan = San.MaSan And LoaiSan.LoaiSan = San.LoaiSan

/* cap nhat gia tri */
UPDATE HOADON
SET MaNhanVien = 'NV1'
WHERE MaHD = '1'
UPDATE HOADON
SET MaNhanVien = 'NV2'
WHERE MaHD = '3'
UPDATE HOADON
SET MaNhanVien = 'NV3'
WHERE MaHD = '2'
UPDATE HOADON
SET MaNhanVien = 'NV4'
WHERE MaHD = '6'
UPDATE HOADON
SET MaNhanVien = 'NV5'
WHERE MaHD = '4'
UPDATE HOADON
SET MaNhanVien = 'NV6'
WHERE MaHD = '5'
UPDATE HoaDon
SET MaDichVu = 'NV1'
WHERE MaHD = '1'
UPDATE HoaDon
SET MaDichVu = 'DV2'
WHERE MaHD = '6'
UPDATE HoaDon
SET MaDichVu = 'DV3'
WHERE MaHD = '5'
UPDATE HoaDon
SET MaDichVu = 'DV4'
WHERE MaHD = '4'
UPDATE HoaDon
SET MaDichVu = 'DV3'
WHERE MaHD = '3'
UPDATE HoaDon
SET MaDichVu = 'DV4'
WHERE MaHD = '2'
UPDATE HoaDon
SET TongTienHD = TongPhutDa * DonGia
WHERE MaHD = 10
UPDATE HoaDon
SET TongTienHD = TongPhutDa * DonGia
WHERE MaHD = 11
UPDATE HoaDon
SET TongTienHD = TongPhutDa * DonGia
WHERE MaHD = 9

DELETE NhanVien
WHERE MaNhanVien = 'NV8'
Go 

/* truy van */
/* Tinh Tong Tien   */
SELECT TongTienHD
FROM HoaDon,ThueSan
WHERE HoaDon.MaThueSan = ThueSan.MaThueSan AND TongTienHD = HoaDon.DonGia*TongPhutDa 

/* cho biet THONG TIN NHAN VIEN  que o Thai Binh*/
SELECT * FROM NhanVien
WHERE DiaChiNhanVien = N'Tp.HCM'

/* cho biet LOAI SAN NAO > 40000 */
SELECT * FROM LOAISAN
WHERE GIALOAISAN >= 40000

/* cho biet san nao dang trong tinh trang " dat truoc " trong khung gio nao */
SELECT TenSan ,ThoiGianBatDau ,ThoiGianKetThuc
FROM ThueSan,San
WHERE ThueSan.MaSan = San.MaSan AND LoaiThue = N'Đặt trước'

/* cho biet NHANVIEN nao  lap bang hoa don cho KHACHHANG nao  */
SELECT TenNhanVien,TenKhachHang
FROM NhanVien,KhachHang,HoaDon
WHERE NhanVien.MaNhanVien = HoaDon.MaNhanVien and KhachHang.MaKhachHang = HoaDon.MaKhachHang

/* cho biet SAN 3 khach hang nao dat san  */
SELECT KhachHang.TenKhachHang
FROM KhachHang,ThueSan
WHERE KhachHang.MaKhachHang = ThueSan.MaKhachHang AND ThueSan.MaSan = 'SAN3'

/* cho biet san nao mac nhat  */
SELECT MAX(GiaLoaiSan) AS ' Loai san MAC nhat'
FROM LOAISAN 

/* cho biet san nao re  nhat  */
SELECT MIN(GiaLoaiSan) AS ' Loai san RE nhat'
FROM LOAISAN 

/* cho biet tong so nhan vien */
SELECT COUNT (MaNhanVien) AS ' TONG SO NHAN VIEN '
FROM NhanVien

/* cho biet so Tien trung binh trong ngay 23/11 cua KHANG HANG 6 */
SELECT AVG(TongTienHD) AS 'SO TIEN TRUNG BINH'
FROM HoaDon
WHERE MaKhachHang = 'KH6'

/* cho biet KHACH HANG nao ho Le */
SELECT *
FROM KhachHang
WHERE TenKhachHang LIKE N'Lê%'

SELECT *
FROM KhachHang
WHERE TenKhachHang LIKE N'Nguyễn%'

/* cho biet NHAN VIEN nao co So dien thoai 4 so dau la 0272 */
SELECT *
FROM NhanVien
WHERE SDT LIKE N'0272%'

/* cho biet NHAN VIEN nao co So dien thoai 4 so cuoi la 2314 */
SELECT *
FROM NhanVien
WHERE SDT LIKE N'%2314'

/* Sap Xep Bang Hoa Don Tu So Tien Nho -> So Tien Lon */
SELECT MaHD,MaKhachHang,MaNhanVien,TongTienHD
FROM HOADON 
ORDER BY TongTienHD ASC

/* Cho biet NHANVIEN nao tiep khach hang co trong HOADON san */
SELECT MaNhanVien FROM NhanVien
EXCEPT
SELECT MaNhanVien FROM HoaDon

/* tinh tong tien cua KH1 do NV2 tiep nhan */
UPDATE HoaDon
SET TongTienHD = DonGia*TongPhutDa
WHERE MaKhachHang = 'KH1' And MaNhanVien = 'NV2'

/* tao rang buoc gio da khong duoc la so am  */
CREATE trigger kt_gioda on HOADON
FOR INSERT 
AS 
	IF(SELECT TONGPHUTDA FROM inserted ) > 0 
		COMMIT TRAN
ELSE 
	BEGIN 
		PRINT ' THOI GIAN DA KHONG DUOC AM '
		ROLLBACK TRAN 
	END

INSERT HoaDon(MaHD,MaKhachHang,MaNhanVien,MaDichVu,MaThueSan,NgayLapHD,TongPhutDa,DonGia,TongTienHD) VALUES
('12','KH1','NV1','DV3','8','30/11/2021', -120,40000,NULL);


INSERT HoaDon(MaHD,MaKhachHang,MaNhanVien,MaDichVu,MaThueSan,NgayLapHD,TongPhutDa,DonGia,TongTienHD) VALUES
('10','KH5','NV5','DV3','8','30/11/2021', 120,40000,NULL);


/* tao rang buoc gio BAT DAU khong duoc Lon hon gio KET THUC  */
CREATE trigger kt_time on THUESAN
FOR INSERT,UPDATE
AS 
	IF(SELECT ThoiGianBatDau FROM inserted ) <  (SELECT ThoiGianKetThuc FROM inserted )
		COMMIT TRAN
ELSE 
	BEGIN 
		PRINT ' THOI GIAN BAT DAU KHONG DUOC LON HON THOI GIAN KET THUC '
		ROLLBACK TRAN 
	END

INSERT ThueSan(MaThueSan,MaSan,MaKhachHang,ThoiGianBatDau,ThoiGianKetThuc,LoaiThue,DonGia,ThanhTien) VALUES
('10','SAN6','KH5','2-1-2022 19:00','1-1-2021 20:00', N'Trực tiếp',80000,N'480000');

SELECT * FROM ThueSan




