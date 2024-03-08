--remember to run sql before running java because if the database is in use in servlet, the script cannot be executed
--for re-run, save again then re-run to avoid lag
USE [master]
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Perfume')
	DROP DATABASE Perfume
GO

create database Perfume
go

use Perfume
go

create table Admins(
ID [int] IDENTITY(1,1) primary key,
username varchar(20) NOT NULL,
[password] varchar(20) NOT NULL,
[role] int NOT NULL,
)

create table Customers(
ID [int] IDENTITY(1,1) primary key,
[username] varchar(20) NOT NULL,
[password] varchar(20) NOT NULL,
[name] [nvarchar](50) NOT NULL,
[phone] varchar(10) NOT NULL,
[email] varchar(max) NOT NULL,
[image] [nvarchar](max) NULL,
)
go

create table Categories
(
[ID] [int] IDENTITY(1,1) primary key,
[name] nvarchar(50) NOT NULL,
)
go

create table Brands(
[ID] [int] IDENTITY(1,1) primary key,
[name] [varchar](50) NOT NULL,
[image] [nvarchar](max) NOT NULL,
)
go

create table Perfumes(
ID [int] IDENTITY(1,1) primary key,
[name] [nvarchar](max) NOT NULL,
[price] [int] NOT NULL,
[quantity] [int] NOT NULL,
[size] [int] NOT NULL,
[image] [nvarchar](max) NOT NULL,
[releaseDate] [date] NOT NULL,
[bid] [int] references Brands(ID),
[cid] [int] references Categories(ID),
)
go
CREATE TABLE Orders(
[ID] [int] primary key,
[cusid] [int] references [Customers](ID),
[orderdate] [date] NOT NULL,
[address] [nvarchar](100) NOT NULL,
[status] [varchar](50) NOT NULL,
)
go
CREATE TABLE OrderDetails (
ID int IDENTITY(1,1) primary key,
oid INT,
pid INT,
quantity INT NOT NULL,
FOREIGN KEY (oid) REFERENCES Orders(ID),
FOREIGN KEY (pid) REFERENCES Perfumes(ID),
)

CREATE TABLE CartDetails (
ID int IDENTITY(1,1) primary key,
cusid INT,
pid INT,
quantity INT NOT NULL,
FOREIGN KEY (cusid) REFERENCES Customers(ID),
FOREIGN KEY (pid) REFERENCES Perfumes(ID),
)
go
--Brands
INSERT [dbo].[Brands] ( [name], [image]) VALUES ( 'Gucci', 'gucci.jpg')
INSERT [dbo].[Brands] ( [name], [image]) VALUES ( 'Chanel', 'chanel.jpg')
INSERT [dbo].[Brands] ( [name], [image]) VALUES ( 'Tom Ford', 'tomford.jpg')
INSERT [dbo].[Brands] ( [name], [image]) VALUES ( 'Guerlain', 'guerlain.jpg')
INSERT [dbo].[Brands] ( [name], [image]) VALUES ( 'Christian Dior', 'dior.jpg')
go
--Categories
INSERT [dbo].[Categories] ( [name]) Values ('Woman')
INSERT [dbo].[Categories] ( [name]) Values ('Man')
INSERT [dbo].[Categories] ( [name]) Values ('Unisex')
go
--Perfumes
INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Flora Gorgeous Gardenia',10,100,168,'gucci_flora_gorgeous_gardenia.jpg',CAST(N'2022-08-12' AS Date),1,1)
INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Guilty Pour Homme',30,90,151,'gucci_guilty_pour_homme.jpg',CAST(N'2023-07-12' AS Date),1,1)
INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('A Floral Verse',20,100,384,'gucci_a_floral_verse.jpg',CAST(N'2023-02-22' AS Date),1,3)

INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Gabrielle Perfume',20,50,135,'chanel_gabrielle_perfume.jpg',CAST(N'2023-09-10' AS Date),2,1)
INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Bleu De Chanel',50,100,150,'chanel_bleu_de_chanel.jpg',CAST(N'2022-10-02' AS Date),2,2)
INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Coco',50,100,165,'chanel_coco.jpg',CAST(N'2021-10-12' AS Date),2,1)

INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Oud Wood',20,100,425,'tomford_oud_wood.jpg',CAST(N'2021-03-22' AS Date),3,3)
INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Black Orchid Perfume',50,50,155,'tomford_black_orchid_perfume.jpg',CAST(N'2023-07-09' AS Date),3,3)

INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values(N'Néroli Outrenoir',20,100,355,'guerlain_neroli_outrenoir.jpg',CAST(N'2022-04-24' AS Date),4,3)
INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Shalimar',50,30,372,'guerlain_shalimar.jpg',CAST(N'2021-03-30' AS Date),4,1)

INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values(N'J''adore',60,100,160,'dior_jadore.jpg',CAST(N'2022-05-16' AS Date),5,1)
INSERT [dbo].Perfumes ([name],quantity,[size],[price],[image],[releaseDate],[bid],[cid]) 
values('Miss Dior',60,100,160,'dior_miss_dior.jpg',CAST(N'2023-09-19' AS Date),5,1)

--Customers
insert into Customers (username,[password],[name],[phone],email)
    Values('nghiemngoc1','1','Nghiem Ngoc','1234567890','nghiemngoc2912@gmail.com')
insert into Customers (username,[password],[name],[phone],email)
    Values('nghiemngoc2','2','Nghiem Bac','0123456789','bacnghiem7@gmail.com')
insert into Customers (username,[password],[name],[phone],email)
    Values('nghiemngoc3','3','Nghiem Khang','1123456789','ngocnthhe186888@fpt.vn')
--Admins
INSERT [dbo].[Admins] ( [username], [password],[role]) VALUES ( 'nghiemngoc1', '1',0)
INSERT [dbo].[Admins] ( [username], [password],[role]) VALUES ( 'nghiemngoc2', '2',0)
INSERT [dbo].[Admins] ( [username], [password],[role]) VALUES ( 'nghiemngoc3', '3',1)
INSERT [dbo].[Admins] ( [username], [password],[role]) VALUES ( 'nghiemngoc4', '4',1)
INSERT [dbo].[Admins] ( [username], [password],[role]) VALUES ( 'nghiemngoc5', '5',1)
go
--Orders
insert into Orders (ID,cusid,[address],orderdate,[status])
    Values(1,1,'Vinh Tuong, Vinh Phuc',CAST(N'2024-02-23' AS Date),'complete')
insert into Orders (ID,cusid,[address],orderdate,[status])
    Values(2,1,'Binh Duong Vinh Tuong, Vinh Phuc',CAST(N'2024-02-24' AS Date),'complete')
insert into Orders (ID,cusid,[address],orderdate,[status])
    Values(3,3,'New York',CAST(N'2024-02-24' AS Date),'preparing')
insert into Orders (ID,cusid,[address],orderdate,[status])
    Values(4,2,'Thach That',CAST(N'2024-02-25' AS Date),'shipping')
insert into Orders (ID,cusid,[address],orderdate,[status])
    Values(5,3,'Yen Hoa',CAST(N'2024-02-25' AS Date),'denied')
insert into Orders (ID,cusid,[address],orderdate,[status])
    Values(6,2,'Viet Tri Phu Tho',CAST(N'2024-02-26' AS Date),'confirming')
insert into Orders (ID,cusid,[address],orderdate,[status])
    Values(7,1,'Yen Bai',CAST(N'2024-02-27' AS Date),'complete')
insert into Orders (ID,cusid,[address],orderdate,[status])
    Values(8,2,'Nghe An',CAST(N'2024-02-28' AS Date),'complete')
--OrderDetails
insert into OrderDetails (oid,pid,quantity) Values(1,3,2)
insert into OrderDetails (oid,pid,quantity) Values(1,5,3)
insert into OrderDetails (oid,pid,quantity) Values(2,3,2)
insert into OrderDetails (oid,pid,quantity) Values(2,7,1)
insert into OrderDetails (oid,pid,quantity) Values(3,4,2)
insert into OrderDetails (oid,pid,quantity) Values(4,1,5)
insert into OrderDetails (oid,pid,quantity) Values(5,10,2)
insert into OrderDetails (oid,pid,quantity) Values(5,9,1)
insert into OrderDetails (oid,pid,quantity) Values(6,11,2)
insert into OrderDetails (oid,pid,quantity) Values(6,7,1)
insert into OrderDetails (oid,pid,quantity) Values(6,2,2)
insert into OrderDetails (oid,pid,quantity) Values(7,4,2)
insert into OrderDetails (oid,pid,quantity) Values(7,8,3)
insert into OrderDetails (oid,pid,quantity) Values(8,7,5)
insert into OrderDetails (oid,pid,quantity) Values(8,6,4)