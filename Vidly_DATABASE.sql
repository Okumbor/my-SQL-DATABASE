create database VIDLY_DATA
--NOTE: i have only executed 'create database'.
use VIDLY_DATA
--Customers Table
create table Customers (Customer_Id int primary key identity (1101,1) , Full_Name nvarchar(60) unique not null,Customer_Patronage int, 
E_mail varchar(50), Phone_Number nvarchar(20) unique, Cust_Address nvarchar(40) )
create index PhoneNumber on Customers(Phone_Number);
insert into Customers values('Steve Rodgers', 6, 'ste.rodger@gmail.com', '+2357031366551', '245B Sonia str.' )
insert into Customers values('Robert Julius', 30, 'robe.julius@gmail.com', '+2357038962351', '201 Albert str.' )
insert into Customers values('Collins Propper', 12, 'co.Propper@gmail.com', '+2357031066678', '25 Parson str.' )
insert into Customers values('Bruce Banner', 36, 'Bru.Banner@gmail.com', '+2357031369750', '1B coffee str.' )
insert into Customers values('alph julie', 51, 'alp.julie@gmail.com', '+2357031368326', '5 goto str.' )
insert into Customers values('Ult Black', 78, 'ult.black@gmail.com', '+2357031256589', '97 upper steve str.' )
insert into Customers values('Tovia chris',35, 'to.chris@gmail.com', '+2357031314756', '54 pity str.' )
insert into Customers values('Kingsley Williams', 45, 'kin.will@gmail.com', '+2357031346498', '55B yetunde str.' )
insert into Customers values('Poppo Yola', 49, 'pop.yola@gmail.com', '+2357031856345', '89 barclay str.' )

select * from Customers;

--Movies Table
create table Movies (Movies_Id int primary key identity (1201,1), Barcode nvarchar(12) unique not null, Movies_Name nvarchar(60) unique not null, 
Qty_in_Stock int , Movies_Price int)
--drop table Movies

insert into Movies values('CB3633BI89', 'ALADDIN', 20, 600)
insert into Movies values('CB3634BI90', 'LION KING', 15, 900)
insert into Movies values('CB3635BI91', 'AVENGERS: END GAME', 44, 850)
insert into Movies values('CB3636BI92', 'CAPTAIN MARVEL', 21, 600)
insert into Movies values('CB7634BE30', 'SPIDER-MAN:HOMECOMING', 30, 300)
insert into Movies values('CB7635BE31', 'BLACK PANTER 2', 50, 200)
insert into Movies values('CB7636BE32', 'SEVEN DEADLY SINS', 40, 300)
insert into Movies values('CB7637BE33', 'ALITA', 35, 600)
insert into Movies values('CB7644BE83','GODZILLA', 39,500)
--DELETE from Movies WHERE Barcode='LION KING'

SELECT * FROM Movies where Movies_Name like '%b%' 

select * from Movies;
--Movies_Rentage Table
create table Movies_Rentage (Mov_Rent_Id int primary key identity (1231,1), Barcode nvarchar(12) unique not null, Movies_Name nvarchar(60) unique not null,
Qty_in_Stock int ,Amount_Charged int , Qty_Movies_rented int, Rented_Date date default getdate(), Return_Date Date,Qty_Lost int, Amount_Charged_Lost_Movies int, 
/*coupons when returned*/ Coupons int, CustomerId int foreign key references Customers(Customer_Id),MoviesId int foreign key references Movies(Movies_Id) )
insert into Movies_Rentage values('CB3633BI89', 'ALADDIN', 20, 600,12, GETDATE(),Null,Null,3000,NULL,1101,1201)
insert into Movies_Rentage values('CB3634BI90', 'LION KING', 15, 900,6, GETDATE(),Null,Null,4500,NULL,1102,1202)
insert into Movies_Rentage values('CB3635BI91', 'AVENGERS: END GAME', 44, 850,35, GETDATE(),Null,Null,4250,NULL,1103,1203)
insert into Movies_Rentage values('CB3636BI92', 'CAPTAIN MARVEL', 21, 600,10, GETDATE(),Null,Null,3000,NULL,1104,1204)
insert into Movies_Rentage values('CB7634BE30', 'SPIDER-MAN:HOMECOMING', 30, 300,14, GETDATE(),Null,Null,1500,NULL,1105,1205)
insert into Movies_Rentage values('CB7635BE31', 'BLACK PANTER 2', 50, 200,32, GETDATE(),Null,Null,1000,NULL,1106,1206)
insert into Movies_Rentage values('CB7636BE32', 'SEVEN DEADLY SINS', 40, 300,36, GETDATE(),Null,1,1500,NULL,1107,1207)
insert into Movies_Rentage values('CB7637BE33', 'ALITA', 35, 600,20, GETDATE(),Null,Null,3000,NULL,1108,1208)
insert into Movies_Rentage values('CB7644BE83','GODZILLA', 39,500,32, GETDATE(),Null,Null,2500,NULL,NULL,1209)

create index BarCode on Movies_Rentage(Barcode);
select * from Movies_Rentage;


--Employees Table
create table Employees (Employee_Id int primary key identity (1401,1), Employee_Full_Name nvarchar(60), 
E_mail varchar(50),Position varchar(50),Authorisation varchar(50), Phone_Number nvarchar(20) )
insert into Employees values('Evans Bruce', 'evans.b@gmail.com','Store Manager', 'All Access','+2357031369245' )
insert into Employees values('Henry Pen', 'herny.pgmail.com','Cashier', 'Movies & Customers','+2357056649240' )
insert into Employees values('Love Hiddink', 'love.h@gmail.com','Cashier', 'Movies & Customers','+2357011369458' )

select * from Employees;

--Revenue Table
create table Revenue (Revenue int primary key identity (1501,1), Movies_Name nvarchar(60) unique not null foreign key references Movies(Movies_Name),
Daily_Revenue int, Monthly_Revenue int,Yearly_Revenue int)
insert into Revenue values('ALADDIN', 1200,7200,86400)
insert into Revenue values('LION KING', 900,5400,64800)
insert into Revenue values('AVENGERS: END GAME', 850,29750,357000)
insert into Revenue values('CAPTAIN MARVEL', 2400,6000,72000)
insert into Revenue values('SPIDER-MAN:HOMECOMING', 900,4200,50400)
insert into Revenue values('BLACK PANTER 2', 0,6400,76800)
insert into Revenue values('SEVEN DEADLY SINS', 900,10800,129600)
insert into Revenue values('ALITA', 0,12000,144000)
insert into Revenue values('GODZILLA', 6000,35000,420000)
--drop table Revenue
select * from Revenue
