CREATE DATABASE supplies;
USE supplies; 	
CREATE TABLE vat_tu (
    ma_vat_tu VARCHAR(20) PRIMARY KEY,
	ma_nha_cung_cap VARCHAR(45)
);
CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY,
    ngay_xuat DATE
);
CREATE TABLE chi_tiet_phieu_xuat (
    so_luong_xuat INT,
    don_gia_xuat FLOAT,
    so_phieu_xuat INT,
    ma_vat_tu VARCHAR(20),
    PRIMARY KEY(so_phieu_xuat,ma_vat_tu),
    FOREIGN KEY(so_phieu_xuat) REFERENCES phieu_xuat(so_phieu_xuat),
    FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
);
CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY,
    ngay_nhap DATE
);
CREATE TABLE chi_tiet_phieu_nhap (
    don_gia_nhap FLOAT,
    so_luong_nhap INT,
    ma_vat_tu VARCHAR(20),
    so_phieu_nhap INT,
    PRIMARY KEY (ma_vat_tu , so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)REFERENCES phieu_nhap (so_phieu_nhap)
);
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap VARCHAR(45) PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(45),
    dia_chi VARCHAR(45)
);
CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY,
    ngay_dat_hang DATE,
    ma_nha_cung_cap VARCHAR(20),
    FOREIGN KEY (ma_nha_cung_cap)REFERENCES nha_cung_cap(ma_nha_cung_cap)
);
CREATE TABLE chi_tiet_don_dat_hang (
    ma_vat_tu VARCHAR(20),
    so_don_hang INT,
    PRIMARY KEY (ma_vat_tu , so_don_hang),
    FOREIGN KEY (ma_vat_tu)REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_don_hang) REFERENCES don_dat_hang (so_don_hang)
);CREATE TABLE sdt (
    so_dien_thoai INT(10) PRIMARY KEY,
    ma_nha_cung_cap VARCHAR(45),
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);