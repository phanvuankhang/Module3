USE furama;
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_nhan_vien AS
    SELECT 
        nv.*
    FROM
        nhan_vien nv
            INNER JOIN
        hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
    WHERE
        dia_chi LIKE '%Hải Châu%'
            AND hd.ma_hop_dong IN (SELECT 
                hd.ma_hop_dong
            FROM
                hop_dong hd
            WHERE
                hd.ngay_lam_hop_dong = '2019-12-12');
SELECT 
    *
FROM
    v_nhan_vien;
DROP VIEW v_nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
SET SQL_SAFE_UPDATES =0;
UPDATE v_nhan_vien SET dia_chi='Liên Chiểu';
SET SQL_SAFE_UPDATES =1;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.