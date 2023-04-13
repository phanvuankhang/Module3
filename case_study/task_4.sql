USE furama;
-- câu 2
SELECT * FROM nhan_vien
WHERE ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%'
AND LENGTH(ho_ten) <= 15;
-- câu 3
SELECT * FROM khach_hang WHERE (round(datediff(curdate(), ngay_sinh) / 365, 0)) BETWEEN 18 AND 50
AND(dia_chi LIKE"%Đà Năng%"OR dia_chi LIKE"%Quảng Trị%");
-- câu 4
SELECT kh.*, COUNT(kh.ho_ten) AS so_lan_dat_phong
FROM khach_hang AS kh
INNER JOIN hop_dong AS hd ON kh.ma_khach_hang = hd.ma_khach_hang
INNER JOIN loai_khach AS lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = "Diamond"
GROUP BY hd.ma_khach_hang
ORDER BY so_lan_dat_phong;