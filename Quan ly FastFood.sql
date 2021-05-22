use [Quan ly FastFood]
GO

create table TableFood
(
id  int identity primary key,
name nvarchar(100) Not Null default N'Bàn chưa có tên',
status nvarchar(100) Not Null default N'Trống'
)
GO

create table Account
(
UserName nvarchar(100) primary key, 
DisplayName nvarchar(100) NOT NULL default N'QuanK',
PassWord nvarchar(1000)NOT NULL default 0,
Type int NOT NULL default 0
)
GO

create table FoodCategory
(
id  int identity primary key,
name nvarchar(100) Not Null default N'Chưa đặt tên'
)
GO

create table Food
(
id  int identity primary key,
name nvarchar(100) Not Null default N'Chưa đặt tên',
idCategory int Not Null,
price float Not Null default 0

foreign key (idCategory) references dbo.FoodCategory(id)
)
GO

create table Bill
(
id int identity primary key,
DateCheckIn date Not Null default getdate(),
DateCheckOut date,
idTable int Not Null,
status int Not Null default 0

foreign key(idTable) references dbo.TableFood(id)
)
GO

create table BillInfo
(
id int identity primary key,
idBill int Not Null,
idFood int Not Null,
count int Not Null default 0

foreign key (idBill) references dbo.Bill(id),
foreign key (idFood) references dbo.Food(id)
)
GO
