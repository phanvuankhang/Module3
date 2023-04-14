USE furama;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT hd.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
LEFT JOIN hop_dong hd ON hd.ma_dich_vu=dv.ma_dich_vu
LEFT JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu  NOT IN (SELECT  hd.ma_dich_vu FROM hop_dong hd WHERE (YEAR (hd.ngay_lam_hop_dong) =2021 AND QUARTER(hd.ngay_lam_hop_dong)=1));