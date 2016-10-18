
create table category (
	idCat int primary key auto_increment, 
	parentID int,
    name varchar(100),
	icon varchar(100),
	status varchar(10)
);
-- property category
create table property (
	idProperty int primary key auto_increment, 
    catID int,
    name varchar(100),
    status varchar(10)
);
-- property chi tiết từng sản phẩm
create table propertyDetail (
	idProperty int,
    idProduct int,
    value varchar(100),
    status varchar(10), 
    PRIMARY KEY (idProperty, idProduct)
);
-- người sử dụng
create table user (
	idUser int primary key auto_increment,
    userName varchar(50), 
    userPass varchar(50),
    ten varchar(300),
    address varchar(300),
    phone varchar(20),
    email varchar(20), 
    status varchar(10)
);
-- shop
create table shop (
	idShop int primary key auto_increment,
    idUser int,
    address varchar(300),
    phone varchar(20),
    email varchar(20), 
    status varchar(10)
);
-- sản phẩm
create table product (
	idProduct int primary key auto_increment, 
    ten varchar(50), 
    price float,
    idShop varchar(50), 
    quanlity int, 
    dateAdd datetime, 
    idBrand int,
    status varchar(10)
);
-- hãng sản xuất
create table brand (
	idBrand int primary key auto_increment,
    ma varchar(50), 
    ten varchar(50),
    status varchar(10)
);
-- hóa đơn
create table orders (
	idOrder int primary key auto_increment,
    idUser int,
    dateCreate datetime, 
    dateUpdate datetime,
    status varchar(10)
);
-- hóa đơn chi tiết
create table orderDetail (
	idOD int primary key auto_increment,
    idOrder int,
    idProduct int,
    price float
);
-- table rate
create table rate( 
	idRate int primary key auto_increment,
    idUser int, 
    id int,  
    rate int
);
-- ảnh sản phẩm
create table image (
	idImage int primary key auto_increment, 
    idProduct int, 
    url varchar(200), 
    status varchar(10)
);






