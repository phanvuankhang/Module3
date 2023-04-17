USE furama;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SELECT * FROM nhan_vien nv
WHERE nv.ma_nhan_vien NOT IN( SELECT ma_nhan_vien FROM hop_dong WHERE ngay_lam_hop_dong BETWEEN '2019-01-01' AND '2021-12-31' );
 