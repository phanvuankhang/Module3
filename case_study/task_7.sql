USE furama;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES =0;
DELETE nv.* FROM nhan_vien nv
WHERE nv.ma_nhan_vien NOT IN (SELECT hd.ma_nhan_vien FROM hop_dong hd WHERE year(hd.ngay_lam_hop_dong) IN (2019,2020,2021)
GROUP BY nv.ma_nhan_vien);
SET SQL_SAFE_UPDATES =1;
SELECT * FROM nhan_vien;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
UPDATE loai_khach SET ten_loai_khach='Diamond'
WHERE (
SELECT kh.ma_khach_hang FROM khach_hang kh
INNER JOIN hop_dong hd ON hd.ma_khach_hang=kh.ma_khach_hang
INNER JOIN dich_vu dv ON dv.ma_dich_vu=hd.ma_dich_vu
INNER JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong=hd.ma_hop_dong
INNER JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
WHERE year(hd.ngay_lam_hop_dong)=2021 AND (hdct.so_luong*dvdk.gia+dv.chi_phi_thue) >10000000
GROUP BY kh.ma_khach_hang);
SELECT kh.ma_khach_hang, kh.ho_ten, kh.ma_loai_khach FROM khach_hang kh;
