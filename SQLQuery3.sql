--Assessment #3
--Part #1

drop database ExerciseDb01
create database ExerciseDb01
use ExerciseDb01

create table CompanyInfo
( CId int primary key identity,
CName nvarchar(50) not null
)

insert into CompanyInfo values('SamSung'),
('HP'),
('Apple'),
('Dell'),
('Toshiba'),
('Redmi')
select * from CompanyInfo

create table ProductInfo
(PId int primary key identity(101,1),
PName nvarchar(50) not null,
PPrice float,
PMDate date,
CId int
)

insert into ProductInfo values('Laptop',55000.90,'12/12/2023',1)
insert into ProductInfo values('Laptop',35000.90,'12/12/2012',2)
insert into ProductInfo values('Mobile',15000.90,'12/03/2012',2)
insert into ProductInfo values('Laptop',135000.90,'12/12/2012',3)
insert into ProductInfo values('Mobile',65000.90,'12/12/2012',3)
insert into ProductInfo values('Laptop',35000.90,'12/12/2012',5)
insert into ProductInfo values('Mobile',35000.90,'12/01/2012',5)
insert into ProductInfo values('Earpod',1000.90,'12/12/2012',3)
insert into ProductInfo values('Laptop',85000.90,'12/12/2021',6)
insert into ProductInfo values('Mobile',55000.90,'12/12/2020',1)
select * from ProductInfo

--Q1
Select c.CName as 'Company Name', p.PName as 'Product Name',  p.PPrice as 'Product Price', p.PMDate as 'Product Manufacturing Date' 
from CompanyInfo
as c join ProductInfo as p
on c.CId=p.CId

--Q2 
Select p.PName as 'Product Name',c.CName as 'Company Name'
from ProductInfo as p
join CompanyInfo as c
on p.CId=c.CId

--Q3
Select c.CName as 'Company', p.PName as 'Product'
from CompanyInfo as c cross join ProductInfo as p



--Part #2

create table Products
(PId int primary key identity(101,1),
PQ int not null,
PPrice float not null,
Discount int not null)

insert into Products values(20,2900.90,2)
insert into Products values(12,8900.90,3)
insert into Products values(25,76000.90,5)
select * from Products

create function DiscountedValue
(
@price float,
@discount int)
returns float
as 
begin
declare @DiscountedPrice float;
set @DiscountedPrice = @price - (@price * (@discount/100.0))
return @DiscountedPrice
end

select PId ,PPrice as 'Price', Discount,dbo.DiscountedValue(PPrice, Discount) as 'Price after Discount'
from Products