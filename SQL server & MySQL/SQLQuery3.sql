-- Tạo cơ sở dữ liệu
CREATE DATABASE QuanLyMyPham;
GO

-- Sử dụng cơ sở dữ liệu
USE QuanLyMyPham;
GO

-- Tạo bảng KhachHang
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY IDENTITY(1,1),
    TenKH NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    SoDienThoai NVARCHAR(15)
);
GO

-- Tạo bảng NhaCungCap
CREATE TABLE NhaCungCap (
    MaNCC INT PRIMARY KEY IDENTITY(1,1),
    TenNCC NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(255),
    DienThoai NVARCHAR(15)
);
GO

-- Tạo bảng DanhMuc
CREATE TABLE DanhMuc (
    MaDM INT PRIMARY KEY IDENTITY(1,1),
    TenDM NVARCHAR(100) NOT NULL
);
GO

-- Tạo bảng SanPham
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY IDENTITY(1,1),
    TenSP NVARCHAR(100) NOT NULL,
    Gia DECIMAL(10, 2) NOT NULL,
    SoLuongTon INT NOT NULL,
    MaNCC INT,
    MaDM INT,
    FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC),
    FOREIGN KEY (MaDM) REFERENCES DanhMuc(MaDM)
);
GO

-- Tạo bảng NhanVien
CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY IDENTITY(1,1),
    TenNV NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    SoDienThoai NVARCHAR(15),
    ChucVu NVARCHAR(100)
);
GO

-- Tạo bảng DonHang
CREATE TABLE DonHang (
    MaDH INT PRIMARY KEY IDENTITY(1,1),
    MaKH INT NOT NULL,
    NgayDat DATETIME NOT NULL,
    TongTien DECIMAL(10, 2) NOT NULL,
    MaNV INT,
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);
GO

-- Tạo bảng ChiTietDonHang
CREATE TABLE ChiTietDonHang (
    MaCTDH INT PRIMARY KEY IDENTITY(1,1),
    MaDH INT NOT NULL,
    MaSP INT NOT NULL,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
    FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH)
);
GO

-- Tạo bảng PhuongThucThanhToan
CREATE TABLE PhuongThucThanhToan (
    MaPTTT INT PRIMARY KEY IDENTITY(1,1),
    TenPTTT NVARCHAR(100) NOT NULL
);
GO

-- Tạo bảng ThanhToan
CREATE TABLE ThanhToan (
    MaTT INT PRIMARY KEY IDENTITY(1,1),
    MaDH INT NOT NULL,
    MaPTTT INT NOT NULL,
    NgayTT DATETIME NOT NULL,
    SoTienThanhToan DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),
    FOREIGN KEY (MaPTTT) REFERENCES PhuongThucThanhToan(MaPTTT)
);
GO

-- Tạo bảng KhuyenMai
CREATE TABLE KhuyenMai (
    MaKM INT PRIMARY KEY IDENTITY(1,1),
    MoTa NVARCHAR(255) NOT NULL,
    NgayBatDau DATETIME NOT NULL,
    NgayKetThuc DATETIME NOT NULL,
    PhanTramGiam INT NOT NULL,
    MaSP INT NOT NULL,
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
GO

-- Nhập dữ liệu cho bảng KhachHang
INSERT INTO KhachHang (TenKH, DiaChi, SoDienThoai) VALUES
(N'Nguyen Van A', N'123 Le Loi, Q1, HCM', N'0123456789'),
(N'Tran Thi B', N'456 Nguyen Hue, Q1, HCM', N'0987654321'),
(N'Le Van C', N'789 Nguyen Trai, Q5, HCM', N'0112233445'),
(N'Pham Thi D', N'321 Phu Nhuan, HCM', N'0123344556'),
(N'Hoang Van E', N'654 Tan Phu, HCM', N'0199888777'),
(N'Nguyen Thi F', N'111 Le Lai, Q3, HCM', N'0166222333'),
(N'Tran Van G', N'222 Nguyen Thi Minh Khai, Q3, HCM', N'0144556677'),
(N'Le Thi H', N'333 Hoang Sa, Q4, HCM', N'0155778899'),
(N'Pham Van I', N'444 Nguyen Van Cu, Q5, HCM', N'0177788999'),
(N'Ho Thi J', N'555 Le Van Sy, Q3, HCM', N'0188899000'),
(N'Nguyen Van K', N'666 Tran Hung Dao, Q1, HCM', N'0199900001'),
(N'Tran Thi L', N'777 Nguyen Dinh Chieu, Q2, HCM', N'0199911112'),
(N'Le Van M', N'888 Le Van Sy, Q3, HCM', N'0199922223');

-- Nhập dữ liệu cho bảng NhaCungCap
INSERT INTO NhaCungCap (TenNCC, DiaChi, DienThoai) VALUES
(N'Cong Ty TNHH A', N'123 Cong Hoa, Q12, HCM', N'0123456789'),
(N'Cong Ty TNHH B', N'456 Hoa Binh, Q5, HCM', N'0987654321'),
(N'Cong Ty TNHH C', N'789 Le Duan, Q1, HCM', N'0112233445'),
(N'Cong Ty TNHH D', N'321 Nguyen Thi Minh Khai, Q3, HCM', N'0123344556'),
(N'Cong Ty TNHH E', N'654 Nguyen Van Cu, Q1, HCM', N'0199888777'),
(N'Cong Ty TNHH F', N'111 Le Lai, Q3, HCM', N'0166222333'),
(N'Cong Ty TNHH G', N'222 Nguyen Hue, Q1, HCM', N'0144556677'),
(N'Cong Ty TNHH H', N'333 Hoang Sa, Q4, HCM', N'0155778899');

-- Nhập dữ liệu cho bảng DanhMuc
INSERT INTO DanhMuc (TenDM) VALUES
(N'Mỹ phẩm'),
(N'Chăm sóc da'),
(N'Trang điểm'),
(N'Nước hoa'),
(N'Chăm sóc tóc'),
(N'Sản phẩm thiên nhiên'),
(N'Dụng cụ trang điểm'),
(N'Sản phẩm làm sạch');

-- Nhập dữ liệu cho bảng SanPham
INSERT INTO SanPham (TenSP, Gia, SoLuongTon, MaNCC, MaDM) VALUES
(N'Kem chống nắng', 200000, 100, 1, 1),
(N'Sữa rửa mặt', 150000, 200, 2, 2),
(N'Son môi', 300000, 50, 3, 3),
(N'Nước hoa', 800000, 30, 4, 4),
(N'Dầu gội đầu', 120000, 20, 5, 5),
(N'Kem dưỡng ẩm', 250000, 150, 1, 1),
(N'Tẩy trang', 180000, 80, 2, 2),
(N'Mặt nạ giấy', 70000, 25, 3, 3),
(N'Kem nền', 350000, 15, 4, 4),
(N'Sản phẩm chăm sóc tóc', 400000, 10, 5, 5),
(N'Nước hoa cao cấp', 1500000, 5, 6, 4),
(N'Son dưỡng môi', 90000, 40, 1, 3),
(N'Mặt nạ ngủ', 250000, 30, 2, 1),
(N'Sữa tắm', 120000, 60, 3, 5);

-- Nhập dữ liệu cho bảng NhanVien
INSERT INTO NhanVien (TenNV, DiaChi, SoDienThoai, ChucVu) VALUES
(N'Nguyen Van A', N'123 Le Loi, Q1, HCM', N'0123456789', N'Nhân viên bán hàng'),
(N'Tran Thi B', N'456 Nguyen Hue, Q1, HCM', N'0987654321', N'Quản lý'),
(N'Le Van C', N'789 Nguyen Trai, Q5, HCM', N'0112233445', N'Nhân viên thu ngân'),
(N'Pham Thi D', N'321 Phu Nhuan, HCM', N'0123344556', N'Nhân viên giao hàng');

-- Nhập dữ liệu cho bảng DonHang
INSERT INTO DonHang (MaKH, NgayDat, TongTien, MaNV) VALUES
(1, '2024-01-01', 500000, 1),
(2, '2024-01-02', 300000, 2),
(1, '2024-01-03', 400000, 1),
(3, '2024-01-04', 600000, 2),
(4, '2024-01-05', 200000, 1);

-- Nhập dữ liệu cho bảng ChiTietDonHang
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia) VALUES
(1, 1, 2, 200000),
(1, 2, 1, 150000),
(2, 1, 1, 200000),
(3, 3, 3, 300000),
(4, 4, 1, 800000),
(5, 5, 2, 240000);

-- Nhập dữ liệu cho bảng PhuongThucThanhToan
INSERT INTO PhuongThucThanhToan (TenPTTT) VALUES
(N'Tiền mặt'),
(N'Chuyển khoản'),
(N'Thẻ tín dụng');

-- Nhập dữ liệu cho bảng ThanhToan
INSERT INTO ThanhToan (MaDH, MaPTTT, NgayTT, SoTienThanhToan) VALUES
(1, 1, '2024-01-01', 500000),
(2, 2, '2024-01-02', 300000),
(3, 1, '2024-01-03', 400000),
(4, 3, '2024-01-04', 600000),
(5, 1, '2024-01-05', 200000);

-- Nhập dữ liệu cho bảng KhuyenMai
INSERT INTO KhuyenMai (MoTa, NgayBatDau, NgayKetThuc, PhanTramGiam, MaSP) VALUES
(N'Khuyến mãi lớn đầu năm', '2024-01-01', '2024-01-31', 10, 1),
(N'Giảm giá mùa hè', '2024-06-01', '2024-06-30', 15, 2),
(N'Giảm giá sản phẩm mùa thu', '2024-09-01', '2024-09-30', 5, 3),
(N'Giảm giá Tết', '2024-01-20', '2024-02-10', 20, 4);

-- Câu lệnh xem nội dung bảng KhachHang
SELECT * FROM KhachHang;

-- Câu lệnh xem nội dung bảng NhaCungCap
SELECT * FROM NhaCungCap;

-- Câu lệnh xem nội dung bảng DanhMuc
SELECT * FROM DanhMuc;

-- Câu lệnh xem nội dung bảng SanPham
SELECT * FROM SanPham;

-- Câu lệnh xem nội dung bảng NhanVien
SELECT * FROM NhanVien;

-- Câu lệnh xem nội dung bảng DonHang
SELECT * FROM DonHang;

-- Câu lệnh xem nội dung bảng ChiTietDonHang
SELECT * FROM ChiTietDonHang;

-- Câu lệnh xem nội dung bảng PhuongThucThanhToan
SELECT * FROM PhuongThucThanhToan;

-- Câu lệnh xem nội dung bảng ThanhToan
SELECT * FROM ThanhToan;

-- Câu lệnh xem nội dung bảng KhuyenMai
SELECT * FROM KhuyenMai;

-- Lấy danh sách sản phẩm với giá lớn hơn 200,000 VNĐ
SELECT * FROM SanPham WHERE Gia > 200000;

-- Lấy thông tin đơn hàng và tên khách hàng tương ứng
SELECT d.MaDH, d.NgayDat, d.TongTien, k.TenKH 
FROM DonHang d 
JOIN KhachHang k ON d.MaKH = k.MaKH;

-- Tính tổng doanh thu từ tất cả đơn hàng
SELECT SUM(TongTien) AS TongDoanhThu FROM DonHang;

-- Lấy danh sách sản phẩm và nhà cung cấp tương ứng
SELECT s.TenSP, n.TenNCC 
FROM SanPham s 
JOIN NhaCungCap n ON s.MaNCC = n.MaNCC;

-- Lấy tất cả thông tin về đơn hàng của khách hàng có tên 'Nguyen Van A'
SELECT d.* 
FROM DonHang d 
JOIN KhachHang k ON d.MaKH = k.MaKH 
WHERE k.TenKH = N'Nguyen Van A';

-- Lấy danh sách sản phẩm cùng với danh mục của chúng
SELECT s.TenSP, dm.TenDM 
FROM SanPham s 
JOIN DanhMuc dm ON s.MaDM = dm.MaDM;

-- Lấy thông tin chi tiết đơn hàng cho đơn hàng có mã 1
SELECT cdh.*, s.TenSP 
FROM ChiTietDonHang cdh 
JOIN SanPham s ON cdh.MaSP = s.MaSP 
WHERE cdh.MaDH = 1;

-- Tìm kiếm tất cả nhân viên có chức vụ là 'Quản lý'
SELECT * FROM NhanVien WHERE ChucVu = N'Quản lý';

-- Lấy số lượng sản phẩm còn lại trong kho cho từng sản phẩm
SELECT TenSP, SoLuongTon FROM SanPham;

-- Lấy danh sách khuyến mãi và sản phẩm tương ứng
SELECT km.MoTa, s.TenSP, km.PhanTramGiam 
FROM KhuyenMai km 
JOIN SanPham s ON km.MaSP = s.MaSP;

-- Lấy thông tin thanh toán cho đơn hàng có mã 1
SELECT t.*, p.TenPTTT 
FROM ThanhToan t 
JOIN PhuongThucThanhToan p ON t.MaPTTT = p.MaPTTT 
WHERE t.MaDH = 1;

-- Tính số lượng sản phẩm đã bán cho mỗi sản phẩm
SELECT s.TenSP, SUM(cdh.SoLuong) AS TongSoLuongDaBan 
FROM ChiTietDonHang cdh 
JOIN SanPham s ON cdh.MaSP = s.MaSP 
GROUP BY s.TenSP;

-- Lấy thông tin khách hàng và tổng số đơn hàng của họ
SELECT k.TenKH, COUNT(d.MaDH) AS TongSoDonHang 
FROM KhachHang k 
LEFT JOIN DonHang d ON k.MaKH = d.MaKH 
GROUP BY k.TenKH;

-- Lấy sản phẩm có khuyến mãi và có giá dưới 300,000 VNĐ
SELECT s.TenSP, km.MoTa 
FROM SanPham s 
JOIN KhuyenMai km ON s.MaSP = km.MaSP 
WHERE s.Gia < 300000;

-- Tạo khung nhìn cho danh sách sản phẩm kèm nhà cung cấp
CREATE VIEW vw_SanPham_NhaCungCap AS
SELECT s.MaSP, s.TenSP, s.Gia, n.TenNCC 
FROM SanPham s 
JOIN NhaCungCap n ON s.MaNCC = n.MaNCC;

SELECT * FROM vw_SanPham_NhaCungCap;


--Khung nhìn cho thông tin đơn hàng kèm khách hàng
CREATE VIEW vw_DonHang_KhachHang AS
SELECT d.MaDH, d.NgayDat, d.TongTien, k.TenKH 
FROM DonHang d 
JOIN KhachHang k ON d.MaKH = k.MaKH;

SELECT * FROM vw_DonHang_KhachHang;


--Khung nhìn cho tổng doanh thu theo tháng
CREATE VIEW vw_DoanhThu_TheoThang AS
SELECT MONTH(NgayDat) AS Thang, YEAR(NgayDat) AS Nam, SUM(TongTien) AS TongDoanhThu 
FROM DonHang 
GROUP BY MONTH(NgayDat), YEAR(NgayDat);

SELECT * FROM vw_DoanhThu_TheoThang;


--Khung nhìn cho danh sách khuyến mãi và sản phẩm
CREATE VIEW vw_KhuyenMai_SanPham AS
SELECT km.MoTa, s.TenSP, km.PhanTramGiam 
FROM KhuyenMai km 
JOIN SanPham s ON km.MaSP = s.MaSP;

SELECT * FROM vw_KhuyenMai_SanPham;


--Khung nhìn cho sản phẩm có khuyến mãi
CREATE VIEW vw_SanPham_KhuyenMai AS
SELECT s.TenSP, km.MoTa, s.Gia, km.PhanTramGiam 
FROM SanPham s 
JOIN KhuyenMai km ON s.MaSP = km.MaSP;

SELECT * FROM vw_SanPham_KhuyenMai;

-- Thêm sản phẩm
CREATE PROCEDURE sp_ThemSanPham 
    @TenSP NVARCHAR(100), 
    @Gia DECIMAL(18, 2), 
    @MaNCC INT,
    @SoLuongTon INT
AS
BEGIN
    INSERT INTO SanPham (TenSP, Gia, MaNCC, SoLuongTon) VALUES (@TenSP, @Gia, @MaNCC, @SoLuongTon);
END;

EXEC sp_ThemSanPham 
    @TenSP = N'Sữa dưỡng thể', 
    @Gia = 150000.00, 
    @MaNCC = 1, 
    @SoLuongTon = 50;

SELECT * FROM SanPham WHERE TenSP = N'Sữa dưỡng thể';

--Sửa sản phẩm
CREATE PROCEDURE sp_SuaSanPham 
    @MaSP INT, 
    @TenSP NVARCHAR(100), 
    @Gia DECIMAL(18, 2), 
    @MaNCC INT,
    @SoLuongTon INT
AS
BEGIN
    UPDATE SanPham SET TenSP = @TenSP, Gia = @Gia, MaNCC = @MaNCC, SoLuongTon = @SoLuongTon WHERE MaSP = @MaSP;
END;

EXEC sp_SuaSanPham 
    @MaSP = 1, 
    @TenSP = N'Sữa dưỡng thể cao cấp', 
    @Gia = 200000.00, 
    @MaNCC = 1, 
    @SoLuongTon = 30;

SELECT * FROM SanPham WHERE MaSP = 1;


--Xóa sản phẩm
CREATE PROCEDURE sp_XoaSanPham 
    @MaSP INT
AS
BEGIN
    DELETE FROM SanPham WHERE MaSP = @MaSP;
END;

EXEC sp_XoaSanPham @MaSP = 1;


-- Hàm tìm kiếm sản phẩm theo tên
CREATE FUNCTION fn_TimKiemSanPham 
    (@TenSP NVARCHAR(100))
RETURNS TABLE 
AS
RETURN 
(
    SELECT * FROM SanPham WHERE TenSP LIKE '%' + @TenSP + '%'
);

SELECT * FROM fn_TimKiemSanPham('Kem');


--Trigger kiểm tra số lượng tồn kho trước khi xóa
CREATE TRIGGER trg_KiemTraTonKho 
ON SanPham 
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS(SELECT * FROM Deleted WHERE SoLuongTon > 0)
        PRINT 'Không thể xóa sản phẩm còn tồn kho.';
    ELSE
        DELETE FROM SanPham WHERE MaSP IN (SELECT MaSP FROM Deleted);
END;

-- Tạo người dùng
CREATE LOGIN User1 WITH PASSWORD = 'password1';
CREATE USER User1 FOR LOGIN User1;

CREATE LOGIN User2 WITH PASSWORD = 'password2';
CREATE USER User2 FOR LOGIN User2;

CREATE LOGIN User3 WITH PASSWORD = 'password3';
CREATE USER User3 FOR LOGIN User3;

-- Phân quyền cho User1: Chỉ cho phép xem dữ liệu
GRANT SELECT ON SanPham TO User1;

-- Phân quyền cho User2: Cho phép xem, thêm và sửa dữ liệu
GRANT SELECT, INSERT, UPDATE ON SanPham TO User2;

-- Phân quyền cho User3: Cho phép xem, thêm, sửa và xóa dữ liệu
GRANT SELECT, INSERT, UPDATE, DELETE ON SanPham TO User3;

-- Kiểm tra quyền của User1
EXECUTE AS USER = 'User1';
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
REVERT;

-- Kiểm tra quyền của User2
EXECUTE AS USER = 'User2';
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
REVERT;

-- Kiểm tra quyền của User3
EXECUTE AS USER = 'User3';
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
REVERT;






