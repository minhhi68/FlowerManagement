create database PlantShop
GO
use PlantShop
GO


create table Accounts(
accID int identity(1,1)primary key,
email varchar(30) unique,
password varchar(30),
fullname varchar(30),
phone varchar(12),
status int check(status =1 or status=0),-- 1:active; 0:inactive
role int check(role=1 or role=0) --:admin, 0:user
)
GO


create table Categories(
CateID int identity(1,1) primary key,
CateName varchar(30)
)
GO


create table Plants(
PID int identity(1,1) primary key,
PName varchar(30),
price int check(price>=0),
imgPath varchar(50),
description text,
status int, --1:active, 0:inactive
CateID int foreign key references Categories(CateID)
)
GO


create table Orders(
OrderID int identity(1,1) primary key,
OrdDate date,
shipdate date,
status int check(status =1 or status=2 or status=3),
--1:processing,2: completed, 3: cancel
AccID int foreign key references Accounts(AccID)
)
GO


create table OrderDetails(
DetailId int identity(1,1) primary key,
OrderID int foreign key references Orders(OrderID),
FID int foreign key references Plants(PID),
quantity int check(quantity>=1)
)


select accID, email, password, fullname, phone, status, role
from Accounts
where status = 1 and email = 'admin@gmail.com' and password = 'admin' COLLATE latin1_General_CS_AS

select PID, PName, imgPath, description, status,Plants.CateID as 'CateID', CateName
from Plants
inner join Categories 
on Plants.CateID = Categories.CateID


where Plants.PName like '%%'

where Categories.CateName like '%rose%'



--private int orderID;
   -- private String orderDate;
   -- private String shipDate;
   -- private int status;
   -- private int accID;

Select [OrderID], [OrdDate], [shipdate], Orders.[status], orders.[AccID]
from Orders
inner join Accounts 
on Orders.AccID = Accounts.accID
Where email = 'user@gmail.com'


--private int orderDetailID;
  --  private int orderID;
  --  private int plantID;
   -- private String plantName;
   -- private int price;
   -- private String imgPath;
  --  private int quantity;


select DetailId, OrderID, FID, Plants.PName, Plants.price, Plants.imgPath, OrderDetails.quantity
from OrderDetails
inner join Plants
on OrderDetails.FID = Plants.PID
Where OrderID = 1



select Plants
from Plants
inner join Categories
on Plants.CateID = Categories.CateID

select PID, PName, Price, imgPath, description, status,Plants.CateID as 'CateID', CateName
                        from Plants
                        inner join Categories 
                        on Plants.CateID = Categories.CateID
						where Plants.PID = 1


						select top 1 orderID from Orders order by orderId desc


						select *
						from Orders
						Where OrdDate between '2021-1-1' and '2021-1-12'

						Select [OrderID], [OrdDate], [shipdate], Orders.[status], orders.[AccID]
                        from Orders
                        inner join Accounts 
                        on Orders.AccID = Accounts.accID
                        Where Accounts.email = 'user@gmail.com' and OrdDate between '2021-1-1' and '2021-1-12'

						

						update Accounts
						set status = 1
						where email = ?

						select CateID, CateName
						from Categories














