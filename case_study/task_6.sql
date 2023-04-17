USE furama;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT
	dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem
FROM
	khach_hang kh INNER JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
    INNER JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
    INNER JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
    INNER JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
WHERE
	lk.ten_loai_khach = 'Diamond'
    AND
    (kh.dia_chi LIKE '% Vinh' OR kh.dia_chi LIKE '% Quảng Ngãi');
    
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT
	hd.ma_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.so_dien_thoai,
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    sum(ifnull(hdct.so_luong,0)) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM
	hop_dong hd INNER JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
    INNER JOIN nhan_vien nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
    INNER JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
    LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
WHERE
	hd.ngay_lam_hop_dong BETWEEN '2020-10-01' AND '2020-12-31'
    AND
    hd.ma_dich_vu NOT IN (
		SELECT ma_dich_vu 
		FROM hop_dong 
		WHERE ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-06-31'
		)
GROUP BY hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT
	hdct.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    sum(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
	hop_dong_chi_tiet hdct INNer JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY
	hdct.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
HAVING
	sum(hdct.so_luong) >= ALL (
		SELECT 
			sum(hop_dong_chi_tiet.so_luong) 
        FROM 
			hop_dong_chi_tiet
        GROUP BY 
			hop_dong_chi_tiet.ma_dich_vu_di_kem
		);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem)
SELECT 
	hd.ma_hop_dong,
    ldv.ten_loai_dich,
    dvdk.ten_dich_vu_di_kem,
    count(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
	hop_dong hd INNER JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
    INNER JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
    INNER JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
    INNER JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY
	hdct.ma_dich_vu_di_kem
HAVING
	count(hdct.ma_dich_vu_di_kem) = 1;

-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT
	nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
FROM
	nhan_vien nv INNER JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
    INNER JOIN trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
    INNER JOIN bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
GROUP BY
	hd.ma_nhan_vien
HAVING
	count(hd.ma_nhan_vien) <= 3;