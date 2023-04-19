USE furama;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES =0;
DELETE nv . * FROM nhan_vien nv 
WHERE
    nv.ma_nhan_vien NOT IN (SELECT 
        hd.ma_nhan_vien
    FROM
        hop_dong hd
    
    WHERE
        YEAR(hd.ngay_lam_hop_dong) IN (2019 , 2020, 2021)
    GROUP BY nv.ma_nhan_vien);
SET SQL_SAFE_UPDATES =1;
SELECT 
    *
FROM
    nhan_vien;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
CREATE VIEW w_khach_hang AS
    SELECT 
        hd.ma_khach_hang,
        kh.ho_ten,
        lk.ma_loai_khach,
        lk.ten_loai_khach,
        hd.ngay_lam_hop_dong,
        dv.chi_phi_thue + SUM(IFNULL(hdct.so_luong, 0) * IFNULL(dvdk.gia, 0)) AS tien_thanh_toan,
        YEAR(hd.ngay_lam_hop_dong) AS nam_lam_hop_dong
    FROM
        hop_dong hd
            LEFT JOIN
        hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
            LEFT JOIN
        dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
            JOIN
        dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
            JOIN
        khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
            JOIN
        loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
    GROUP BY hd.ma_hop_dong;
SELECT 
    *
FROM
    w_khach_hang
ORDER BY ma_khach_hang;

UPDATE khach_hang 
SET 
    ma_loai_khach = (SELECT 
            ma_loai_khach
        FROM
            loai_khach
        WHERE
            ten_loai_khach = 'Diamond')
WHERE
    ma_khach_hang = (SELECT 
            ma_khach_hang
        FROM
            w_khach_hang
        WHERE
            nam_lam_hop_dong = 2021
                AND ten_loai_khach = 'Platinium'
        GROUP BY nam_lam_hop_dong , ma_khach_hang
        HAVING SUM(tien_thanh_toan) > 10000000);
DROP VIEW w_khach_hang;
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET SQL_SAFE_UPDATES=0;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        hd.ma_khach_hang
    FROM
        hop_dong hd
    
    WHERE
        YEAR(hd.ngay_lam_hop_dong) < 2021);
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES=1;
SELECT 
    *
FROM
    khach_hang;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
CREATE VIEW w_dich_vu_di_kem AS
    SELECT 
        hdct.ma_dich_vu_di_kem
    FROM
        hop_dong_chi_tiet hdct
            INNER JOIN
        hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
            INNER JOIN
        dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    WHERE
        YEAR(hd.ngay_lam_hop_dong) = 2020
    GROUP BY dvdk.ma_dich_vu_di_kem , YEAR(hd.ngay_lam_hop_dong)
    HAVING SUM(hdct.so_luong) > 10;
SET SQL_SAFE_UPDATES=0;						
 UPDATE dich_vu_di_kem SET gia=gia*2 
 WHERE ma_dich_vu_di_kem IN (SELECT ma_dich_vu_di_kem FROM w_dich_vu_di_kem);
 SET SQL_SAFE_UPDATES=1;
 DROP VIEW w_dich_vu_di_kem;
 -- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
 SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    nv.email,
    nv.so_dien_thoai,
    nv.ngay_sinh,
    nv.dia_chi
FROM
    nhan_vien nv 
UNION SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    kh.email,
    kh.so_dien_thoai,
    kh.ngay_sinh,
    kh.dia_chi
FROM
    khach_hang kh;