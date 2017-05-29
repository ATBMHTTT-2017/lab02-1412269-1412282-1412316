--Store procedure xem va cap nhat bang CHITIEU
Create or Replace Procedure View_UpdateCHITIEU
(Manv char(9 char),MaCT char(9 char) TenCT nvarchar2(80), Sotien float) Is
Begin
If Exists (Select*
		   From DUAN D
		   Where Manv = D.truongDA)
then
Begin
Select CT.maChiTieu, CT.tenChiTieu, CT.soTien, CT.duAn 
From DUAN D, CHITIEU CT
Where Manv = D.truongDA and D.maDA = CT.maDA
End;
Begin
If Exists (Select*
		   From CHITIEU CT
		   Where MaCT = CT.maChiTieu)
then Dbms_Output.Put_Line('Ma chi tieu da bi trung');
else then

Update CHITIEU CT
Set CT.maChiTieu = MaCT, CT.tenChiTieu = TenCT, CT.soTien = Sotien
Where Exists (Select*
			  From DUAN D
			  Where Manv = D.truongDA and D.maDA = CT.maDA)
End if;
else then return;
End;
End;
--Gan quyen thuc thi cho truong du an
grant execute on View_UpdateCHITIEU to TruongDA;