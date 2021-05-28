use QuanlyFastFood
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
-- thêm dữ liệu Account
 insert into Account (UserName,DisplayName,PassWord,Type)
 values
 (N'K9',N'RongK9',N'1',1)

 insert into Account (UserName,DisplayName,PassWord,Type)
 values
 (N'staff',N'staff',N'1',0)

  GO

  create proc USP_GetAccountByUserName
  @userName nvarchar (100)
  AS
  BEGIN
  select *from Account where UserName=@userName
  END

   GO
   
Insert into Account (UserName,DisplayName,PassWord,Type) values(N'quanvt',N'vmquan',N'123',0)

  EXEC USP_GetAccountByUserName @userName=N'K9'
  
  delete from Account where PassWord=N'123' 
 
  SELECT * FROM Account WHERE UserName = N''OR 1=1--

  CREATE PROC USP_Login
  @userName nvarchar(100), @passWord nvarchar(100)
  AS
  BEGIN
  SELECT * FROM Account WHERE UserName=@userName and PassWord=@passWord
  END
  GO
  --them bàn ăn
  DECLARE @i int =0
  while @i<=10
  Begin
  Insert TableFood(name) values (N'Bàn' + CAST(@i as nvarchar(100)))
  set @i=@i+1
  END

  Insert into TableFood(name,status)values (N'Bàn 1')

  Insert into TableFood(name,status)values (N'Bàn 2')

Insert into TableFood(name,status)values (N'Bàn 3')

create proc USP_GetTableList
AS SELECT * FROM TableFood
GO

UPdate TableFood set status=N'Có người' where id=9

EXEC USP_GetTableList

Go
-- them category
 Insert FoodCategory (name) values(N'Hải sản')
  Insert FoodCategory (name) values(N'Nông sản')
   Insert FoodCategory (name) values(N'Lâm sản')
    Insert FoodCategory (name) values(N'Sản sản')
	 Insert FoodCategory (name) values(N'Nước')


	 --thêm món ăn
	 Insert Food(name,idCategory,price) values(N'Tôm hùm nướng phô mai',1,300000)
	  Insert Food(name,idCategory,price) values(N'Hào chiên bơ',1,500000)
	   Insert Food(name,idCategory,price) values(N'Gà nướng muối ớt',2,200000)
	   Insert Food(name,idCategory,price) values(N'Heo nướng kim châm',3,150000)
	    Insert Food(name,idCategory,price) values(N'Cơm chiên cá mặn',4,50000)
		Insert Food(name,idCategory,price) values(N'Cacao',5,15000)
		Insert Food(name,idCategory,price) values(N'sữa tươi trân châu',5,20000)

		-- thêm Bill
		Insert Bill(DateCheckIn,DateCheckOut,idTable,status) values(GETDATE(),null,3,0)
		Insert Bill(DateCheckIn,DateCheckOut,idTable,status) values(GETDATE(),null,4,0)
		Insert Bill(DateCheckIn,DateCheckOut,idTable,status) values(GETDATE(),GETDATE(),5,1)
	   
	   --thêm Bill info
	   Insert BillInfo(idBill,idFood,count) values(5,1,2)
	   Insert BillInfo(idBill,idFood,count) values(5,3,4)
	   Insert BillInfo(idBill,idFood,count) values(5,5,1)
	   Insert BillInfo(idBill,idFood,count) values(6,1,2)
	   Insert BillInfo(idBill,idFood,count) values(6,6,2)
	    Insert BillInfo(idBill,idFood,count) values(4,5,2)

	   Go
	  select *from BillInfo
	   select *from FoodCategory
	   select * from Food
	   select *from Bill
	  SELECT * FROM Bill WHERE idTable=3 AND status = 1 

	  SELECT f.name,bi.count,f.price, f.price*bi.count AS totalPrice FROM BillInfo AS bi, Bill AS b, Food AS f 
		WHERE bi.idBill= b.id AND bi.idFood= f.id AND b.status=0 AND b.idTable=4

		
	   
