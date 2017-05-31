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
--Update Script thêm dữ liệu
--Thêm dữ liệu cho bảng PHONGBAN
insert into PHONGBAN(maPhong,tenPhong,truongPhong,ngayNhanChuc,soNhanVien,chiNhanh) values
(1,N'Nhân sự',null,to_date('01/02/2001', 'dd/mm/yyyy'),10,null);
insert into PHONGBAN(maPhong,tenPhong,truongPhong,ngayNhanChuc,soNhanVien,chiNhanh) values
(2,N'Kế hoạch',null,to_date('03/02/2002','dd/mm/yyyy'),11,null);
insert into PHONGBAN(maPhong,tenPhong,truongPhong,ngayNhanChuc,soNhanVien,chiNhanh) values
(3,N'Kế toán',null,to_date('02/02/2001','dd/mm/yyyy'),12,null);
insert into PHONGBAN(maPhong,tenPhong,truongPhong,ngayNhanChuc,soNhanVien,chiNhanh) values
(4,N'Hành chính',null,to_date('01/01/2001','dd/mm/yyyy'),10,null);
insert into PHONGBAN(maPhong,tenPhong,truongPhong,ngayNhanChuc,soNhanVien,chiNhanh) values
(5,N'Kĩ thuật',null,to_date('03/03/2001','dd/mm/yyyy'),5,null);
--Thêm dữ liệu cho bảng CHINHANH
insert into CHINHANH (maCN,tenCN,truongChiNhanh) values (1,N'Tp.Hồ Chí Minh',null);
insert into CHINHANH (maCN,tenCN,truongChiNhanh) values (2,N'Đà Nẵng',null);
insert into CHINHANH (maCN,tenCN,truongChiNhanh) values (3,N'Hà Nội',null);
--Thêm dữ liệu cho bảng NHANVIEN

insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV001',N'Nguyễn Văn Nam',N'119 Cống Quỳnh, Tp HCM','090123456','vannam@gmail.com',1,1,600000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV002',N'Nguyễn Hoài Đức',N'222 Nguyễn Văn Cừ, Tp HCM','090223456','hoaiduc@gmail.com',1,1,700000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV003',N'Nguyễn Thị Hoài Thương',N'22 Nguyễn Thị Thập, Tp HCM','090233456','nthoaithuong@gmail.com',1,1,700000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV004',N'Nguyễn Thị Nguyệt',N'332 Nguyễn Thái Học, Tp HCM','090423456','nthinguyet@gmail.com',1,1,750000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV005',N'Nguyễn Thái Sơn',N'291 Hồ Văn Huê, Tp HCM','090523456','nthaison@gmail.com',1,1,850000);

insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV006',N'Nguyễn Thanh Tùng',N'27 Trần Hưng Đạo, Tp HCM','090623456','nthanhtung@gmail.com',2,1,650000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV007',N'Nguyễn Thị Mai',N'32 Cống Quỳnh, Tp HCM','090723456','nthimai@gmail.com',2,1,700000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV008',N'Nguyễn Minh Triết',N'335 Cách Mạng Tháng Tám, Tp HCM','090823456','nminhtriet@gmail.com',2,1,750000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV009',N'Trần Thanh Minh',N'20 Cộng Hòa, Tp HCM','090923456','tthanhminh@gmail.com',2,1,750000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV010',N'Phan Đăng Lưu',N'20 Trường Chinh, Tp HCM','091123456','pdangluu@gmail.com',2,1,850000);

insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV011',N'Lý Văn Kiệt','18 Nguyễn Công Trứ, HaNoi','091223456','lvankiet@gmail.com',3,3,650000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV012',N'Hồ Tùng Lâm',N'10 Phạm Hùng, HaNoi','091323456','hotunglam@gmail.com',3,3,700000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV013',N'Phan Hữu Tín',N'101 Trưng Vương, HaNoi','091423456','phanhuutin@gmail.com',3,3,850000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV014',N'Phạm Công Danh',N'58 Nguyễn Trung Ngạn, HaNoi,','091523456','phamcongdanh@gmail.com',3,3,800000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV015',N'Nguyễn Chí Công',N'200 Phù Đổng, HaNoi','091623456','nchicong@gmail.com',3,3,650000);

insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV016',N'Đinh Thị Quỳnh Giao',N'60 Thành Thái, Tp HCM','091723456','dtquynhgiao@gmail.com',4,1,850000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV017',N'Ngô Kim Nhàn',N'83 An Dương Vương, Tp HCM','091823456','nkimnhan@gmail.com',4,1,750000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV018',N'Đặng Nhật Minh',N'30 Nguyễn Trãi, Tp HCM','091923456','dnhatminh@gmail.com',4,1,650000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV019',N'Nguyễn Thị Hoàng Mai ',N'875 Huỳnh Tấn Phát, Tp HCM','09223456','nthoangmai@gmail.com',4,1,700000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV020',N'Phan Thanh Hậu',N'40 Nguyễn Tât Thành, Tp HCM','092323456','phanthanhhau@gmail.com',4,1,800000);

insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV021',N'Trịnh Ngọc Tiến',N'21 Hai Bà Trưng, Đà Nẵng','092423456','trinhngoctien@gmail.com',5,2,750000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV022',N'Nguyễn Thùy Dung',N'102 Quang Trung, Đà Nẵng','092523456','nguyenthuydung@gmail.com',5,2,600000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV023',N'Lương Xuân Trường',N'70 Võ Văn Kiệt, Đà Nẵng','092623456','luongxuantruong@gmail.com',5,2,800000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV024',N'Võ Khánh Ly',N'15 Trần Qúy Cáp, Đà Nẵng','092723456','vokhanhly@gmail.com',5,2,850000);
insert into NHANVIEN(maNhanVien,hoTen,diaChi,dienThoai,email,maPhong,chiNhanh,luong) values
('NV025',N'Trương Toàn Thắng',N'21 Phạm Văn Nghị, Đà Nẵng','092823456','ttoanthang@gmail.com',5,2,700000);
--Thêm dữ liệu cho bảng DUAN
insert into DUAN (maDA,tenDA,kinhPhi,phongChuTri,truongDA) values (1,N'Phát triển công nghệ sinh học',30000000,5,'024');
insert into DUAN (maDA,tenDA,kinhPhi,phongChuTri,truongDA) values (2,N'Hợp tác phát triển doanh nghiệp',40000000,2,'010');
insert into DUAN (maDA,tenDA,kinhPhi,phongChuTri,truongDA) values (3,N'Xúc tiến đầu tư',35000000,2,'008');
insert into DUAN (maDA,tenDA,kinhPhi,phongChuTri,truongDA) values (4,N'Quản lí hành chính',25000000,4,'020');
insert into DUAN (maDA,tenDA,kinhPhi,phongChuTri,truongDA) values (5,N'Đào tạo nhân sự chuyên môn cao',45000000,1,'003');

--Thêm dữ liệu cho bảng PHANCONG
insert into PHANCONG (maNhanVien,duAn,vaiTro,phuCap) values ('023',1,N'Thiết kế',5000000);
insert into PHANCONG (maNhanVien,duAn,vaiTro,phuCap) values ('009',2,N'Tiếp xúc doanh nghiệp',6000000);
insert into PHANCONG (maNhanVien,duAn,vaiTro,phuCap) values ('007',3,N'Phát triển kế hoạch',5500000);
insert into PHANCONG (maNhanVien,duAn,vaiTro,phuCap) values ('019',4,N'Thống kê',5000000);
insert into PHANCONG (maNhanVien,duAn,vaiTro,phuCap) values ('005',5,N'Đào tạo',6000000);
--Thêm dữ liệu cho bảng CHITIEU
insert into CHITIEU (maChiTieu,tenChiTieu,soTien,duAn) 
values (1,N'Cấp kinh phí phát triển sinh học cho phòng kĩ thuật',30000000,1);
insert into CHITIEU (maChiTieu,tenChiTieu,soTien,duAn) 
values (2,N'Cấp kinh phí hợp tác phát triển doanh nghiệp cho phòng kế hoạch',40000000,2);
insert into CHITIEU (maChiTieu,tenChiTieu,soTien,duAn) 
values (3,N'Cấp kinh phí xúc tiến đầu tư cho phòng kế hoạch',35000000,3);
insert into CHITIEU (maChiTieu,tenChiTieu,soTien,duAn) 
values (4,N'Cấp kinh phí quản lí hành chính cho phòng hành chính',25000000,4);
insert into CHITIEU (maChiTieu,tenChiTieu,soTien,duAn) 
values (5,N'Cấp kinh phí đào tạo nhân sự chuyên môn cao cho phòng nhân sự',45000000,5);
--UPDATE DỮ LIỆU CHO BẢNG PHONGBAN
update PHONGBAN set truongPhong = '001' where maPhong = 1;
update PHONGBAN set truongPhong = '008' where maPhong = 2;
update PHONGBAN set truongPhong = '012' where maPhong = 3;
update PHONGBAN set truongPhong = '017' where maPhong = 4;
update PHONGBAN set truongPhong = '021' where maPhong = 5;
--UPDATE DỮ LIỆU CHO BẢNG CHINHANH
update CHINHANH set truongChiNhanh = '016' where maCN = 1;
update CHINHANH set truongChiNhanh = '022' where maCN = 2;
update CHINHANH set truongChiNhanh = '013' where maCN = 3;
--UPDATE DỮ LIỆU CHO BẢNG PHONGBAN
update PHONGBAN set chiNhanh = 1 where maPhong = 1;
update PHONGBAN set chiNhanh = 1 where maPhong = 2;
update PHONGBAN set chiNhanh = 3 where maPhong = 3;
update PHONGBAN set chiNhanh = 1 where maPhong = 4;
update PHONGBAN set chiNhanh = 2 where maPhong = 5;
