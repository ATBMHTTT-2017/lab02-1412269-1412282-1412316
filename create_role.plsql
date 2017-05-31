--Tạo role cho vị trí Trưởng dự án
create role TruongDA;

--Gán role TruongDA cho các users Trưởng dự án
grant TruongDA to nv024;
grant TruongDA to nv010;
grant TruongDA to nv008;
grant TruongDA to nv020;
grant TruongDA to nv003;

--Tạo role cho vị trí Trưởng phòng
create role TruongPhong;

--Gán role TruongPhong cho các users Trưởng phòng
grant TruongPhong to nv001;
grant TruongPhong to nv008;
grant TruongPhong to nv012;
grant TruongPhong to nv017;
grant TruongPhong to nv021;

--Tạo role cho vị trí Trưởng chi nhánh
create role TruongCN;

--Gán role TruongCN cho các users Trưởng chi nhánh
grant TruongCN to nv016;
grant TruongCN to nv022;
grant TruongCN to nv013;

--Tạo role cho vị trí Nhân viên
create role NhanVien;

--Gán role NhanVien cho các users Nhân viên
grant NhanVien to nv023;
grant NhanVien to nv009;
grant NhanVien to nv007;
grant NhanVien to nv019;
grant NhanVien to nv005;

--Tạo role cho vị trí Giám đốc
create role GiamDoc;

--Gán role NhanVien cho users Giám đốc
grant GiamDoc to nv002;