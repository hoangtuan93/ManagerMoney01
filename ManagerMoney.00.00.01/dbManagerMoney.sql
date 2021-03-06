CREATE DATABASE dbManagerMoney
GO
USE dbManagerMoney
GO
-- TABLE USER

CREATE TABLE tblUser(
	ID_USER INT IDENTITY(1,1) PRIMARY KEY,
	NAME NVARCHAR(100) NOT NULL,
	USERNAME VARCHAR(20) UNIQUE NOT NULL,
	PASS VARCHAR(100) NOT NULL,
)
GO
--TABLE CATEGORIZE 
CREATE TABLE tblCategorize(
	ID_CATEGORIZE INT IDENTITY(1,1) PRIMARY KEY,
	NAME_CATEGORIZE VARCHAR(100) NOT NULL,
	DESCRIPTION_CATEGORIZE NTEXT NULL,
)
GO
--TABLE PRODUCT
CREATE TABLE tblProduct(
	ID_PRODUCT INT IDENTITY PRIMARY KEY,
	NAME_PRODUCT NVARCHAR(100) NOT NULL,
	ID_CATEGORIZE INT NOT NULL,
	DESCRIPTION_PRODUCT NTEXT NOT NULL,
	CONSTRAINT FK_product_cateorize FOREIGN KEY tblProduct(ID_CATEGORIZE) REFERENCES tblCategorize(ID_CATEGORIZE)
)
GO
--TABLE TOTAL AMOUNT DETAIL
CREATE TABLE tblTotalAmountDetail(
	ID_TOTAL_DETAIL INT IDENTITY(1,1) PRIMARY KEY,
	ID_PRODUCT INT NOT NULL,
	ID_USER INT NOT NULL,
	UNIT_PRODUCT VARCHAR(100) NOT NULL,
	PRICE FLOAT NOT NULL,
	CONSTRAINT FK_TOTAL_PPRODUCT FOREIGN KEY tblTotalAmountDetail(ID_PRODUCT) REFERENCES tblPeoduct(ID_PRODUCT),
	CONSTRAINT FK_TOTAL_USER  FOREIGN KEY tblTotalAmountDetail(ID_USER) REFERENCES tblUser(ID_USER)
)
GO
-- TABLE TOTAL AMOUNT / MOTH

CREATE TABLE tblTotalAmount(
	ID_TOTAL INT IDENTITY(1,1) PRIMARY KEY,
	ID_TOTAL_DETAIL INT NOT NULL,
	DATE_BUY DATE NOT NULL,
	TOTAL_AMOUNT FLOAT NOT NULL,
	CONSTRAINT FK_TOTAL_DETAIL FOREIGN KEY tblTotalAmount(ID_TOTAL) REFERENCES tblTotalAmountDetail(ID_TOTAL_DETAIL)
)
