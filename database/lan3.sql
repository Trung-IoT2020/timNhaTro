create table KHACHHANG
(
	id_KHACHHANG int primary key , 
	taikhoan_KHACHHANG VARCHAR(25) NOT NULL ,
	pass_KHACHHANG VARCHAR(25)NOT NULL,
	hoten_KHACHHANG VARCHAR(25)NOT NULL,
	namsinh_KHACHHANG DATETIME NOT NULL,
	cmnd_KHACHHANG int NOT NULL,
	sdt_KHACHHANG int NOT NULL ,
	diachi_KHACHHANG VARCHAR(25) NOT NULL,
	chutro bit NULL
)

create table DANGNHAP
(
	id_taikhoan int primary key,
	id_KHACHHANG int FOREIGN KEY REFERENCES KHACHHANG(id_KHACHHANG) ,
	hoten_KHACHHANG VARCHAR(25) NOT NULL,
	DADANGNHAP BIT NULL
)

create table trangthietbi
(
	id_TRANGTHIETBI int primary key,
	id_PHONGTRO int not null,
	tenThietBi varchar(25)not null,
	giaThietBi int not null,
	tinhTrangThietBi bit null
)
create table loaiphong
(
	id_LOAIPHONG int primary key,
	id_PHONGTRO int not null,
	ten_LOAIPHONG varchar(25),
	giaPhong int not null,
	soLuongNguoi int not null,
	tinhTrangPhong bit NULL
)

create table chitiethopdong
(
	id_CTHOPDONG int primary key ,
	id_PHONGTRO int NOT NULL , 
	tenCOC int not null, 
	THOIGIAN_DATCOC datetime not null,
	NGAY_LAPHOPDONG datetime not null,
	NGAY_KETTHUCHOPDONG datetime not null,
	GHICHU VARCHAR(50) NULL
)

create table HOPDONG
(
	id_HOPDONG INT PRIMARY KEY ,
	id_CTHOPDONG int not null FOREIGN KEY REFERENCES chitiethopdong(id_CTHOPDONG) ,
	id_PHONGTRO int not null,	
	TINHTRANG BIT NOT NULL DEFAULT N'KHÔNG THỂ QUÊN CHỌN',
	ghichu NVARCHAR NULL
)

create table PHONGTRO
(
	id_PHONGTRO int Primary key , 
	id_HOPDONG int FOREIGN KEY REFERENCES HOPDONG(id_HOPDONG),
	id_TRANGTHIETBI int FOREIGN KEY REFERENCES trangthietbi(id_TRANGTHIETBI),
	id_LOAIPHONG int FOREIGN KEY REFERENCES LOAIPHONG(id_LOAIPHONG) ,
	id_KHACHHANG int FOREIGN KEY REFERENCES KHACHHANG(id_KHACHHANG),
	ten_PHONG VARCHAR(25) Not null,
	giaPhong int not null,
	tinhTrangPhong bit null
)

create table CHITETDANGBAI
(
	id_CTDANGBAI int primary key,
	id_BAIDANG int not null,
	ten_BAIDANG varchar(25) not null,
	ten_TACGIA varchar(25) not NULL,
	noidung_BAIDANG varchar(255) not null,
	thoigian_DANGBAI datetime not null,
	thoigian_KETTHUC datetime not null,
	tinhTrangBai bit null
)

create table DANGBAI
(
	id_BAIDANG int primary key,
	id_CTDANGBAI int FOREIGN KEY REFERENCES CHITETDANGBAI(id_CTDANGBAI),
	id_taikhoan int  FOREIGN KEY REFERENCES DANGNHAP(id_taikhoan),
	thoigian_DANGBAI datetime not null,
	ten_TACGIA varchar(25)not null,
	ghichu_DANGBAI varchar(50)
)