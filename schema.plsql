// this is sample schema
------Script tạo cấu trúc cơ sở dữ liệu------
--Tạo bảng CHINHANH
create table CHINHANH (
       maCN number(10,0) not null,
       tenCN nvarchar2(30),
       truongChiNhanh char(9 char),
       constraint PK_CHINHANH primary key (maCN)
);

--Tạo bảng CHITIEU
create table CHITIEU (
       maChiTieu char(9 char) not null,
       tenChiTieu nvarchar2(80),
       soTien float,
       duAn number(10,0),
       constraint PK_CHITIEU primary key (maChiTieu)
);

--Tạo bảng NHANVIEN
create table NHANVIEN (
       maNhanVien char(9 char) not null,
       hoTen nvarchar2(30),
       diaChi nvarchar2(50),
       dienThoai char(11 char),
       email varchar(30 char),
       maPhong number(10,0),
       chiNhanh number(10,0),
       luong float,
       constraint PK_NHANVIEN primary key (maNhanVien)
);

--Tạo bảng PHANCONG
create table PHANCONG (
       maNhanVien char(9 char) not null,
       duAn number(10,0) not null,
       vaiTro nvarchar2(50),
       phuCap float,
       constraint PK_PHANCONG primary key (maNhanVien, duAn)
);

--Tạo bảng PHONGBAN
create table PHONGBAN (
       maPhong number(10,0) not null,
       tenPhong nvarchar2(30),
       truongPhong char(9 char),
       ngayNhanChuc date,
       soNhanVien int,
       chiNhanh number(10,0),
       constraint PK_PHONGBAN primary key (maPhong)
);

--Tạo bảng DUAN
create table DUAN (
       maDA number(10,0) not null,
       tenDA nvarchar2(80),
       kinhPhi float,
       phongChuTri number(10,0),
       truongDA char(9 char),
       constraint PK_DUAN primary key (maDA)
);

--Tạo khóa ngoại
--Tạo khóa ngoại truongChiNhanh và maNhanVien
alter table CHINHANH
add constraint FK_CHINHANH_NHANVIEN
foreign key (truongChiNhanh)
references NHANVIEN(MANHANVIEN);

--Tạo khóa ngoại chiNhanh và maCN
alter table NHANVIEN
add constraint FK_NHANVIEN_CHINHANH
foreign key (chiNhanh)
references CHINHANH(MACN);

--Tạo khóa ngoại duAn và maDA
alter table CHITIEU
add constraint FK_CHITIEU_DUAN
foreign key (duAn)
references DUAN(MADA);

--Tạo khóa ngoại maPhong và maPhong
alter table NHANVIEN
add constraint FK_NHANVIEN_PHONGBAN
foreign key (maPhong)
references PHONGBAN(MAPHONG);

--Tạo khóa ngoại maNhanVien và maNhanVien
alter table PHANCONG
add constraint FK_PHANCONG_NHANVIEN
foreign key (maNhanVien)
references NHANVIEN(MANHANVIEN);

--Tạo khóa ngoại duAn và maDA
alter table PHANCONG
add constraint FK_PHANCONG_DUAN
foreign key (duAn)
references DUAN(MADA);

--Tạo khóa ngoại chiNhanh và maCN
alter table PHONGBAN
add constraint FK_PHONGBAN_CHINHANH
foreign key (chiNhanh)
references CHINHANH(MACN);

--Tạo khóa ngoại phongChuTri và maPhong
alter table DUAN
add constraint FK_DUAN_PHONGBAN
foreign key (phongChuTri)
references PHONGBAN(MAPHONG);

--Tạo khóa ngoại truongDA và maNhanVien
alter table DUAN
add constraint FK_DUAN_NHANVIEN
foreign key (truongDA)
references NHANVIEN(MANHANVIEN);
