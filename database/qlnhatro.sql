-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 30, 2020 at 06:49 AM
-- Server version: 5.7.28
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlnhatro`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitetdangbai`
--

DROP TABLE IF EXISTS `chitetdangbai`;
CREATE TABLE IF NOT EXISTS `chitetdangbai` (
  `id_CTDANGBAI` int(11) NOT NULL,
  `id_BAIDANG` int(11) NOT NULL,
  `ten_BAIDANG` varchar(25) NOT NULL,
  `ten_TACGIA` varchar(25) NOT NULL,
  `noidung_BAIDANG` varchar(255) NOT NULL,
  `thoigian_DANGBAI` datetime NOT NULL,
  `thoigian_KETTHUC` datetime NOT NULL,
  `tinhTrangBai` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_CTDANGBAI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chitiethopdong`
--

DROP TABLE IF EXISTS `chitiethopdong`;
CREATE TABLE IF NOT EXISTS `chitiethopdong` (
  `id_CTHOPDONG` int(11) NOT NULL,
  `id_PHONGTRO` int(11) NOT NULL,
  `tenCOC` int(11) NOT NULL,
  `THOIGIAN_DATCOC` datetime NOT NULL,
  `NGAY_LAPHOPDONG` datetime NOT NULL,
  `NGAY_KETTHUCHOPDONG` datetime NOT NULL,
  `GHICHU` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_CTHOPDONG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dangbai`
--

DROP TABLE IF EXISTS `dangbai`;
CREATE TABLE IF NOT EXISTS `dangbai` (
  `id_BAIDANG` int(11) NOT NULL,
  `id_CTDANGBAI` int(11) DEFAULT NULL,
  `id_taikhoan` int(11) DEFAULT NULL,
  `thoigian_DANGBAI` datetime NOT NULL,
  `ten_TACGIA` varchar(25) NOT NULL,
  `ghichu_DANGBAI` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_BAIDANG`),
  KEY `FK_DB_CTDB` (`id_CTDANGBAI`),
  KEY `FK_DB_DN` (`id_taikhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dangnhap`
--

DROP TABLE IF EXISTS `dangnhap`;
CREATE TABLE IF NOT EXISTS `dangnhap` (
  `id_taikhoan` int(11) NOT NULL,
  `id_KHACHHANG` int(11) DEFAULT NULL,
  `hoten_KHACHHANG` varchar(25) NOT NULL,
  `DADANGNHAP` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_taikhoan`),
  KEY `FK_DN_KH` (`id_KHACHHANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hopdong`
--

DROP TABLE IF EXISTS `hopdong`;
CREATE TABLE IF NOT EXISTS `hopdong` (
  `id_HOPDONG` int(11) NOT NULL,
  `id_CTHOPDONG` int(11) NOT NULL,
  `id_PHONGTRO` int(11) NOT NULL,
  `TINHTRANG` bit(1) NOT NULL,
  `ghichu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_HOPDONG`),
  KEY `FK_HD_CTHD` (`id_CTHOPDONG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `id_KHACHHANG` int(11) NOT NULL,
  `taikhoan_KHACHHANG` varchar(25) NOT NULL,
  `pass_KHACHHANG` varchar(25) NOT NULL,
  `hoten_KHACHHANG` varchar(25) NOT NULL,
  `namsinh_KHACHHANG` datetime NOT NULL,
  `cmnd_KHACHHANG` int(11) NOT NULL,
  `sdt_KHACHHANG` int(11) NOT NULL,
  `diachi_KHACHHANG` varchar(25) NOT NULL,
  `chutro` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_KHACHHANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loaiphong`
--

DROP TABLE IF EXISTS `loaiphong`;
CREATE TABLE IF NOT EXISTS `loaiphong` (
  `id_LOAIPHONG` int(11) NOT NULL,
  `id_PHONGTRO` int(11) NOT NULL,
  `ten_LOAIPHONG` varchar(25) DEFAULT NULL,
  `giaPhong` int(11) NOT NULL,
  `soLuongNguoi` int(11) NOT NULL,
  `tinhTrangPhong` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_LOAIPHONG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phongtro`
--

DROP TABLE IF EXISTS `phongtro`;
CREATE TABLE IF NOT EXISTS `phongtro` (
  `id_PHONGTRO` int(11) NOT NULL,
  `id_HOPDONG` int(11) DEFAULT NULL,
  `id_TRANGTHIETBI` int(11) DEFAULT NULL,
  `id_LOAIPHONG` int(11) DEFAULT NULL,
  `id_KHACHHANG` int(11) DEFAULT NULL,
  `ten_PHONG` varchar(25) NOT NULL,
  `giaPhong` int(11) NOT NULL,
  `tinhTrangPhong` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_PHONGTRO`),
  KEY `FK_PT_HD` (`id_HOPDONG`),
  KEY `FK_pT_TTB` (`id_TRANGTHIETBI`),
  KEY `FK_PT_LP` (`id_LOAIPHONG`),
  KEY `FK_PT_KH` (`id_KHACHHANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trangthietbi`
--

DROP TABLE IF EXISTS `trangthietbi`;
CREATE TABLE IF NOT EXISTS `trangthietbi` (
  `id_TRANGTHIETBI` int(11) NOT NULL,
  `id_PHONGTRO` int(11) NOT NULL,
  `tenThietBi` varchar(25) NOT NULL,
  `giaThietBi` int(11) NOT NULL,
  `tinhTrangThietBi` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_TRANGTHIETBI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dangbai`
--
ALTER TABLE `dangbai`
  ADD CONSTRAINT `FK_DB_CTDB` FOREIGN KEY (`id_CTDANGBAI`) REFERENCES `chitetdangbai` (`id_CTDANGBAI`),
  ADD CONSTRAINT `FK_DB_DN` FOREIGN KEY (`id_taikhoan`) REFERENCES `dangnhap` (`id_taikhoan`);

--
-- Constraints for table `dangnhap`
--
ALTER TABLE `dangnhap`
  ADD CONSTRAINT `FK_DN_KH` FOREIGN KEY (`id_KHACHHANG`) REFERENCES `khachhang` (`id_KHACHHANG`);

--
-- Constraints for table `hopdong`
--
ALTER TABLE `hopdong`
  ADD CONSTRAINT `FK_HD_CTHD` FOREIGN KEY (`id_CTHOPDONG`) REFERENCES `chitiethopdong` (`id_CTHOPDONG`);

--
-- Constraints for table `phongtro`
--
ALTER TABLE `phongtro`
  ADD CONSTRAINT `FK_PT_HD` FOREIGN KEY (`id_HOPDONG`) REFERENCES `hopdong` (`id_HOPDONG`),
  ADD CONSTRAINT `FK_PT_KH` FOREIGN KEY (`id_KHACHHANG`) REFERENCES `khachhang` (`id_KHACHHANG`),
  ADD CONSTRAINT `FK_PT_LP` FOREIGN KEY (`id_LOAIPHONG`) REFERENCES `loaiphong` (`id_LOAIPHONG`),
  ADD CONSTRAINT `FK_pT_TTB` FOREIGN KEY (`id_TRANGTHIETBI`) REFERENCES `trangthietbi` (`id_TRANGTHIETBI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
