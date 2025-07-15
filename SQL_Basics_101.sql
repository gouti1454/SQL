-- -- ------------------- -- ------------------- -- -----------------
/* always first execute the "use command and the database name" */ 
use employee_details


select * from Employees

select firstname,lastname from Employees

select EmployeeID,CONCAT(FirstName,' ',LastName) from Employees

/* adding full name column */
select EmployeeID,CONCAT(FirstName,' ',LastName) [Full Name] from Employees

/* giving alias  is "as"*/
select EmployeeID,CONCAT(FirstName,' ',LastName) as [Full Name] from Employees

/* Distant  statement */
select * from EmployeeRecords

select distinct firstname from employeerecords

select distinct firstname,lastname from employeerecords

/* creating temp table names */
select * into #temp1
from [dbo].[EmployeeRecords]

select * from #temp1
/* this temp table will only be accesable in this query window using the single hash "#"*/

select * from dbo.Employees


/* this temp table will be accesable in all the query window use doube hash "##" */
select * into ##temp2
from [dbo].[EmployeeRecords]

select * from ##temp2

select * from [dbo].[EmployeeRecords]
	where EmployeeID = 2

select EmployeeID,FirstName from [dbo].[EmployeeRecords]
where EmployeeID = 2

select * from dbo.Employees where Salary<75000.00

select * from dbo.Employees where Salary>=75000.00

select distinct * from dbo.Employees where Salary<75000.00

/* drag the table from the drop down [dbo].[Employees]*/ 
-- -- ------------------- -- -----------------
/* */
/* order by salary */
select * from [dbo].[Employees]
order by Salary

/* order by salary by descending order  */
select * from [dbo].[Employees]
order by Salary desc

/* order asendeing by first name and decensing by salary */
select * from [dbo].[Employees]
order by FirstName asc, Salary desc

/* order asendeing by Department and decensing by salary */
select * from [dbo].[Employees]
order by Department asc, Salary desc


/* employee records to find last name miller and using employeed id 3 */
select * from EmployeeRecords
where LastName = 'Miller' and EmployeeID = 3
/* using single qoute for number also */
select * from EmployeeRecords
where LastName = 'Miller' and EmployeeID = '3'

/* */
/* using or operator */
select * from EmployeeRecords
where Department = 'HR' or Department = 'Finance'

select * from EmployeeRecords
where (Department = 'HR' or Department = 'Finance') and Salary = 60000

/* not operator */
select * from EmployeeRecords
where not FirstName = 'John' and not Salary = 60000

/* */
select * from EmployeeRecords
where Salary >= 60000 and Salary <= 75000

/* between & not between */
select * from EmployeeRecords
where Salary not between 75000 and 85000

select * from EmployeeRecords
where Salary between 75000 and 85000

/* or */
select * from EmployeeRecords
where Department = 'HR' or Department = 'IT'

/* in */
select * from EmployeeRecords
where Department in ('HR' , 'IT')

/* not in */
select * from EmployeeRecords
where Department not in ('HR' , 'IT')

/* */
/* */
/* */
/* */
/* insert */
select * from dbo.Employees

insert into dbo.Employees (EmployeeID,FirstName,LastName,Department,Salary,HireDate)
values (6,'Raj','Ambani','IT',90000,'2023-04-21')

/* missing few columns  */
insert into dbo.Employees (EmployeeID,FirstName,LastName)
values (7,'Anu','Kumar')

/* values for all the columns has to b provided, where the column names are not provided*/
insert into dbo.Employees
values (8,'Manu','Ranhith','HR',73000,'2024-01-21')

/* INFORMATION_SCHEMA */
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Employees'


/* */
/* */

select * from dbo.Employees
/* empty value is passed then null value is replaced */

insert into dbo.Employees
values (9,'Jay','','IT',73000,'2022-04-04')

/* */
insert into dbo.Employees
values (10,'nitin','Kumar','0',54000,'2021-04-04')

/* is null */
select * from dbo.Employees 
where Department is null 

/* is not null */
select * from dbo.Employees 
where Department is not null 

/* */
/* */
/* update */
select * from dbo.Employees

/* create a has table such that original data is not affected */
select * into #11 from dbo.Employees
select * from #11

update #11 
set Department = 'HR'
where Department is null

update #11 
set Salary = 89000, HireDate = '2023-01-02'
where EmployeeID = 7

/* when where  condition is missed, it updates entire column */
select * into #12 from dbo.Employees
update #12 
set Department = 'Finance'
select * from #12

/* */
/* */
select * from dbo.Employees

select * into #13 from dbo.Employees

select * from #13

/* delete */
delete from #13
where LastName = '' or Department = '0'

select * into #14 from dbo.Employees
select * from #14

/* delete command without where statement, will delete the entire table */
delete from #14


/* truncate will clear the contents of the table*/
select * from #13

truncate table #13

/* drop will complete remove the record of the table name 
and will result error if tird to access */
drop table #13

-- this is comment - single line comment

-- top commamd 

select * from dbo.Employees

select top 2 * from Employees

select top 2 EmployeeID,Salary from Employees

select top 4 FirstName,LastName from dbo.Employees


/* SQL aggregate */
-- the database nae is selected

use [Sales Database]
select * from dbo.Sales
--
/* find max value */
select max(TotalAmount) [Maximum Amount] from dbo.Sales

select max(SaleDate) [Max Sale Date] from dbo.Sales

select max(paymentmethod) [Max pay method] from dbo.Sales

-- max quatity for each product id 
/* when there is no aggr fun not used the column needs to be given in group-by */
select productID,max(quantity) [Max quantity] from dbo.Sales
group by  productID

-- max total amount all distinct dates in saledate column
select * from dbo.Sales
select saledate,max(totalamount) [Max Tot Amt] from dbo.Sales 
group by SaleDate

/* find MIN value */
select min(Quantity) [Min quant] from dbo.Sales
select min(SaleDate) [Min Sale Date] from dbo.Sales
select min(paymentmethod) [Min pay method] from dbo.Sales

-- mini tot amount for storeid
select StoreID,min(totalamount) [Min Tot Amt] from dbo.Sales 
group by StoreID

/* Sum Avg Count */

use [Sales Database]
select * from dbo.Sales

select sum(quantity) [Tot Quantity] from dbo.Sales
--
select sum(quantity) [Tot Quantity],sum(TotalAmount) [Sum of Amt] from dbo.Sales
--
select avg(Quantity) [AVg Quanity] from dbo.Sales

select avg(Quantity) [AVg Quanity],avg(TotalAmount) from dbo.Sales

-- -- ------------------- -- -----------------

/* Group by */
use [Sales Database]
select * from dbo.Sales

select
ProductID,
sum(Quantity) as [Tot Quantity],
sum(Totalamount) as [Sum of amt],
avg(Totalamount) as [Avg amt]
from dbo.Sales
group by ProductID
-- -- ------------------- -- -----------------
/* 
-- sum od Quantiy, sum of amount, avg of quantiy & avg of amount
-- for dinstinct combinations of product id & storeID 
*/
select
ProductID,
storeid,
sum(Quantity) as [Tot Quantity],
sum(Totalamount) as [Sum of amt],
avg(quantity) as[avg quantity] ,
avg(Totalamount) as [Avg amt]
from dbo.Sales
group by ProductID,StoreID


--count func
select * from dbo.Sales

select count(*) [Num of rows] from dbo.Sales
-- null values are ignpred
select count(PaymentMethod) [No of Records] from dbo.Sales
--
select count(distinct productid) [Dist Pro] from dbo.Sales
--ignores null
select PaymentMethod,count( PaymentMethod) [ PayMode] from dbo.Sales
group by PaymentMethod

-- counts null values
select PaymentMethod,count( *) [ PayMode] from dbo.Sales
group by PaymentMethod

/* */
/* */
select * from dbo.Sales
select paymentmethod,sum(totalamount) as [Sum of sales] from dbo.Sales
group by PaymentMethod
--
/* order by func */
select ProductID,paymentmethod,sum(totalamount) as [Sum of sales] from dbo.Sales
group by ProductID,PaymentMethod
order by ProductID
/* */
/* */
/* having func */
-- tot sales, avg sales, tot qauntity for each disntict product
select
ProductID,
sum(TotalAmount) [Sum of sales],
sum(Quantity) [Tot Quanity],
avg(TotalAmount) [Avg Amt],
avg(Quantity) [Avg Quantity]
from dbo.Sales
group by ProductID -- just execute till this line to exclude the filter[having] below
having sum(TotalAmount)<700 and sum(Quantity)=21 --having is like filter
----- -- ------------------- -- -----------------
/* */
/* */
/* where and having func difference */
-- filter the total amount >=
select * from dbo.Sales
where TotalAmount>=161
-- 
select * from dbo.Sales
select ProductID, sum(TotalAmount) [sum of sales] from dbo.Sales
group by ProductID
having sum(TotalAmount)<700
--
select ProductID,sum(TotalAmount) [sum of sales] from dbo.Sales
where TotalAmount>=161 -- filtering based on total amount
group by ProductID
having sum(TotalAmount)>=250 -- applying filter on the group by
order by ProductID desc  -- sorting in desc 
-- -- ------------------- -- ------------------- -- ------------------- -- -----------------
/* */
/* */
/* */
/* Joins concept */
-- select * from table1 inner join table2
-- on table1.column1 = table2.column1
--
/* specifing alias names foe the tables and printing only specific columns at output
-- select A.cq,A.c2,B.c3  from table1 A inner join table2 B
-- on A.c1=B.c1
*/
use [Sales Database]
select * from dbo.table1
--
select * from dbo.table2
--
select * from table1 inner join table2 on table1.C1 = table2.C1 
--
-- usaing alias names
select * from table1 A inner join table2 B on A.C1 = B.C1 
--
select table1.C1,table1.C2,table2.C3
from table1  inner join table2  on table1.C1 = table2.C1 
--
-- using alias names
select A.C1,A.C2,B.C3
from table1 A  inner join table2 B on A.C1 = B.C1 
/* */
/* */
/* left Join or Left outer Join func  */
-- select * from table1 left join table2 on table1.c1=table2.c1
--
select * from table1 left join table2 on table1.C1 = table2.C1 
--
select * from table1 left outer join table2 on table1.C1 = table2.C1 
---- -- ------------------- -- ------------------- -- -----------------
/* */
/* */
/* */
/* right join or right outer join */
-- select * from table1 right join table2 on table1.c1=table2.c1
select * from table1 right join table2 on table1.C1 = table2.C1
/* */
/* */
/* */
/*  Left & right - Anti join = using where func i.e filter  */
--select * from table1 left join table2 on table1.c1=table2.c1
-- where table2.c3 is null
--
select * from table1 left join table2 on table1.c1=table2.c1
where table2.c3 is null
--
select * from table1 right join table2 on table1.C1 = table2.C1
where table1.c2 is null
/* */
/* */
/* Full outer join */
/* 
-- inner join 
-- only left join
-- only right join
*/
-- select * from full outer join table2 on table1.c1=table2.c1
select * from table1 full outer join table2 on table1.c1=table2.c1
/* */
/* */
/* self join */
--
select * from table1 as A inner join table1 as B on A.c1=B.c1
-- -- ------------------- -- -----------------
/* */
/* */
/* Union & Union all */
--number of columns have to be same in the selected tables in each tables.
--datatype of the columns must be same 
--order in which column are written has to be the same
--
-- select the Sales database
use [Sales Database]
--
select * from append1
--
select * from append2
--
-- union all will repeat duplicate records 
select c1,c2,c3 from append1
union all
select c1,c2,c3 from append2
--
--
-- union will remove duplicate records
select c1,c2,c3 from append1
union 
select c1,c2,c3 from append2
--
-- these are the conditions required to work correctly for append to work
--number of columns have to be same in the selected tables in each tables.
--datatype of the columns must be same 
--order in which column are written has to be the same
--
-- c1 is int, c2 is nvarchar, c3 is int 
-- the below will throw error due to datatype mismatch
select c1,c2,c3 from append1
union 
select c1,c3,c2 from append2
-- Conversion failed when converting the nvarchar value 'A' to data type int.
-- -- ------------------- -- ------------------- -- ------------------- -- -----------------
/* */
/* */
/* Like operator */
use [Sales Database]
select * from Employees_US
--
-- like used with wild cards 1. %  ,may represent 0,1,or multiple chars 
-- 2. _ , underscore represents only 1 character
-- find the  empployees whose last name starts with 's'
select * from Employees_US where lastname like 's%'
--
-- first name ends eith 's'
select * from Employees_US where firstname like '%a'
--
-- find the empl department contains 'eng'
select * from Employees_US where department like '%eng%'
--
-- emp whose last name is exactly 5 characters (underscore is used 5 times)
select * from Employees_US where lastname like '_____'
--
-- first name starts with 'c' or 'd'
select * from Employees_US where firstname like '[CD]%'
--
-- last name contains 'son'
select * from Employees_US where lastname like '%son%'
--
--whose first name containes the letter 'i' as the second char
select * from Employees_US where firstname like '_i%'
--
-- last name starts with anyletter b/w 'a & L'
select * from Employees_US where lastname like '[a-l]%'
--
-- first name dosent contains 'o'
select * from Employees_US where firstname not like '%o%'
--
-- last name ends with a & excatly 5 chars
select * from Employees_US where lastname like '____a'
--
-- depart strts with 'mar' & ends with  'ing'
select * from Employees_US where department like 'mar%ing'
--
--first name has 'a' in third position
select * from Employees_US where firstname like '__a%'
--
-- Last Name starts with 'Br' or 'Bl'
select * from Employees_US where lastname like 'br%' or lastname like 'bl%'
--
--First Name starts with a vowel
select * from Employees_US where firstname like '[aeiou]%'
--
-- First Name does not start with a consonant.
select * from Employees_US where firstname not like '[^aeiou]%'
--
--First Name starts with a consonant
select * from Employees_US where firstname like '[^aeiou]%'
--
--
---- -- ------------------- -- -----------------
/* */
/* */
/* case statements */
use [Sales Database]
select * from dbo.Products
--
--Add a column to categorize each product into categories high, medium & low
select *,
case
	when Price >500 then 'High'
	when Price <=500 and Price>=200 then 'Medium'
	else 'Low' -- else is not provided, null we assigned as values
end as [High/Medium/Low]
from dbo.Products
--
--Provide priority to each category & sort the data according to that priority
select * from dbo.Products
order by
case
	when category in ('Electronics') then 1
	when category in ('Furniture') then 2
	else 3
end
--
--
-- with out else
select * from dbo.Products
order by
case
	when category in ('Electronics') then 1
	when category in ('Furniture') then 2
	when category in ('Accessories') then 3
end
---
---- -- ------------------- -- ------------------- -- ------------------- -- -----------------
/* */
/* */
/* Nested case statements */
--
--group the data based on columns category & price into different categories i.e affordable & premium
use [Sales Database]
select 
*,
case
	when category = 'Electronics' then
		case when price >=300 then 'Preium electronics'
		else 'Affordable Electro'
		end
	when category = 'Furniture' then
		case when price>=250 then 'Preium Furniture'
		else 'Affordable Furniture'
		end
else
	case when price>=25 then 'Preium Accessories '
	else 'Affordable Accessories'
	end
end as [Groups] -- column name is added
from dbo.Products
--
--
-- with out else
use [Sales Database]
select 
*,
case
	when category = 'Electronics' then
		case when price >=300 then 'Preium electronics'
		else 'Affordable Electro'
		end
	when category = 'Furniture' then
		case when price>=250 then 'Preium Furniture'
		else 'Affordable Furniture'
		end
	when category = 'Accessories' then
		case when price>=25 then 'Preium Accessories '
		else 'Affordable Accessories'
		end
end as [Groups] -- column name is added
from dbo.Products
--
---- -- ------------------- -- ------------------- -- -----------------
/* */
/* */
/* SQL Datatypes */
-- String data
--
--char,vchar,nchar,nvarchar
-- single char length; char(1)
-- variable char ; varchar(256)
--nchar(1) ; support unicode char
--nvarchar(256); support unicode char
--
--
-- Number type
-- int, bright, tinyint, decimal(p,s), smallint
--Age of the students will require nomore than 2, then tinyint can be used to save memory
-- age of trees/buildings , use smallint
--decimal(p,s), p = total digits, s =no of digitis after the decimal. 
--999.99, decimal(5,2)
--
--Date data type, time data type, datetime data type
/*
create table student_details (
Student_Name nvarchar(256),
Gender char(1),
Age tinyint,
event_date date,
distance decimal(5,2))
*/
select * from [dbo].[student_details]
-- delete a table 
--drop table student_details
select * from student_details
--
insert into student_details(Student_Name,Gender,Age,event_date,distance)
values ('Raj kumar','M',21,'2021-09-13',123.11)
--
-- when inserting values for all the columns,  then coumns names can be omitted. 
insert into student_details
values ('Nitin Mathew','M',39,'2022-02-21',119.09)
--
--
-- inserting multiple records 
insert into student_details
values ('Gun Jan','M',49,'2024-05-11',115.35), 
('Anu Mahesh','M',33,'2022-11-11',100.35)
--
--
---- -- -----------------
/* INFORMATION_SCHEMA  */
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like 'student_details'
--
insert into student_details(Student_Name,Gender)
values ('Bing Test','M')
--
--
--daTA type of column age is tinyint (0 to 255)
-- erro message : Arithmetic overflow error for data type tinyint, value = 256.
insert into student_details(age)
values (256)
--
---- -- ------------------- -- -----------------
/* */
/* */
/* Copy data from existing table to new table */
--
-- case 1: New table dosent exits

select * from dbo.Sales
-- copying data from dbo.sales in to new table named as 'new_table_sales'
select * into new_table_sales  from dbo.Sales

select * from dbo.new_table_sales
-- just copying certain columns alone rather than all columns
--dropping table
drop table new_table_sales
--
select ProductID,Quantity into new_table_sales  from dbo.Sales
--
-- case 2: new table structure exits 
-- creating empty table with structure
select top 0 * into new_table_sales_2 from dbo.Sales --***
--
select * from new_table_sales_2
-- copyin the values into table
insert into new_table_sales_2 select * from dbo.Sales
--
----------copying certian columns
select * into new_table_3 from dbo.Sales where 1=0 --***
--
select * from dbo.new_table_3
-- other colums null will be added
insert into new_table_3 (ProductID,SaleDate) select productid,saledate from dbo.Sales
--
--
/* */
/* */
/*sub queries */
--
-- select the database 
use [employee_details]
--
select * from [dbo].[Customers]
select * from [dbo].[Orders]
--
-- customer ordered in aug
select * from dbo.customers
where customer_id in (
select distinct customer_id from orders where order_date between '2024-08-01' and '2024-08-31'
)
--
-- customers order other than aug
select * from dbo.customers
where customer_id in (
select distinct customer_id from orders where order_date not between '2024-08-01' and '2024-08-31'
)
---
--
--
select * from Employees
-- from employees table get data where salary > average salary
select * from Employees where salary > (
select avg(Salary) from Employees
)
--
select avg(Salary) from Employees
--
--
---- -- ------------------- -- ------------------- -- ------------------- -- -----------------
/* */
/* */
/*  Constraints */
/* not null constraint */
-- conditions that cab be applied on  columns of a table & these conditions are to be followed whlie
-- inserting records into the table
-- create database constraints_1
use [constraints_1]
--
-- not null constraint
--case 1 creating new table --**
--
create table test_not_null (
EID int not null,
age tinyint,
firstname varchar(256)
)
--
select * from test_not_null
--
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like 'test_not_null'
--
insert into test_not_null 
values (1,23,'Jack')
--
-- trying to insert null values 
--
/* error messages : Cannot insert the value NULL into column 'EID', 
table 'constraints_1.dbo.test_not_null'; 
column does not allow nulls. INSERT fails.
*/
insert into test_not_null 
values (null,23,'Jack')
--
-- other columns will accept null values
insert into test_not_null 
values (2,null,'RAJ')
--
--
-- case2 : the table already exists --**
-- make first name column nullable
alter table test_not_null
alter column firstname varchar(256) not null
--
-- tryng to insert null, error throws
insert into test_not_null 
values (3,23,null)
--
-- this will thorow error since, the age column already contains a null value. 
--hence the column cannot be conerted into "no nullable"
alter table test_not_null
alter column age tinyint not null
/* Cannot insert the value NULL into column 'age', table 'constraints_1.dbo.test_not_null'; 
column does not allow nulls. UPDATE fails.
*/
--
---- -- -----------------
/* unique constraint */
--case 1 creating new table --**
create table test_unique (
STD int unique,
age tinyint not null,
firstname varchar(256) not null unique,
lastname varchar(256)
)
--
select * from test_unique
--
insert into test_unique values (1,22,'Jhon','King')
--
-- when unique contraint is added duplicate cannot be added and throws error
/* Violation of UNIQUE KEY constraint 'UQ__test_uni__CA1EB6E14A8F9E76'. 
Cannot insert duplicate key in object 'dbo.test_unique'. 
The duplicate key value is (1).
*/
insert into test_unique values (1,24,'Mike','Don')
--
-- based on the column constraints here the null value is allowed to be added
insert into test_unique values (null,34,'Don','Land')
--
-- case2 : the table already exists --**
--
-- clearing all the values from the table
truncate table test_unique
--
-- changing a column with unique constraints 
alter table test_unique
add unique (lastname)
--
insert into test_unique values (null,34,'Don','Land')
/*
Violation of UNIQUE KEY constraint 'UQ__test_uni__58E25A423A270E26'. 
Cannot insert duplicate key in object 'dbo.test_unique'. 
The duplicate key value is (Land).
*/
insert into test_unique values (1,24,'Mike','Land')
--
--
--
/*  check Constraints */
-- it checks for certain contidion that can be applied on the columns of a table.
-- if the condition is not me, records cannot be inserted
--
--case 1 creating new table --**
use [constraints_1]
--
create table test_check(
EID int,
firstname varchar(256),
age tinyint check(age>=10)
)
--
select * from test_check
--
insert into test_check values (1,'Jhon',20)
--
-- error messge if try to execute below
/* 
The INSERT statement conflicted with the CHECK constraint "CK__test_check__age__3B75D760". 
The conflict occurred in database "constraints_1", table "dbo.test_check", column 'age'.
*/
insert into test_check values (2,'Bill',9)

-- drop table test_check
--

-- case2 : the table already exists --**
--
-- error trying to change where there are values on the column is present
/*
The ALTER TABLE statement conflicted with the CHECK constraint "CK__test_check__EID__3C69FB99". 
The conflict occurred in database "constraints_1", table "dbo.test_check", column 'EID'.
*/
alter table test_check
add check (eid>5)
--
update test_check set EID = 11 where EID = 1
--
-- now execute the previous command and will work 
alter table test_check
add check (eid>5)
--
--
--
/* Default Constraints */
use [constraints_1]
--
-- provide default values to columns
--case 1 creating new table --**
create table test_default (
EID int default 00,
firstname varchar(256) default 'new_employee',
lastname varchar(256),
age tinyint
)
--
--
select * from test_default
--
insert into test_default values(1,'Den','Bug',23)
--
-- default values will be assigned for missing cols
insert into test_default(lastname,age) values('Thor',33)
--
--null values will be added where there are no  default constraint
insert into test_default(lastname) values('Loki')
--
--drop table test_default

-- case2 : the table already exists --**
alter table test_default
add default 25 for age
--
-- since the default contraint is added, 
--when the lastname column value was inputed, 
--the default age was added
insert into test_default (lastname) values('Jain')
--
--
--
---- -- ------------------- -- ------------------- -- -----------------
/* Primary & foriegn Key */

-- 
/*Primary key= used to distinguidh b/w two records in a given table
-- non-null values
-- no duplicates

-- Foriegn key = values in FK will be a subset of Primary key
-- Duplicates allowed,
-- null values allowed
*/

--case 1 creating new table --**
--select database
use [constraints_1]
--create a table
create table test_pk_1(
eid int primary key,
gender char(1),
age tinyint,
firstname varchar(256)
)
-- insert values
insert into test_pk_1 values(1,'M',23,'Mike')
--
select * from test_pk_1
--
--error:duplcate
/* -- Violation of PRIMARY KEY constraint 'PK__test_pk___D9509F6D840ED81B'. 
-- Cannot insert duplicate key in object 'dbo.test_pk_1'. 
-- The duplicate key value is (1).*/
insert into test_pk_1 values(1,'F',21,'Mona')
--error: null
/* Cannot insert the value NULL into column 'eid', table 'constraints_1.dbo.test_pk_1'; 
column does not allow nulls. INSERT fails. */
insert into test_pk_1 values(null,'M',25,'Rick')
--

-- case2 : the table already exists --**
truncate table test_pk_1
--
--error : Table 'test_pk_1' already has a primary key defined on it.
alter table test_pk_1
add primary key(age) 
--
drop table test_pk_2
-- 
create table test_pk_2 (
SID int not null unique,
firstname nvarchar(256),
age tinyint not null
)
---- -- -----------------
/* alter table test_pk_2 
add primary key (SID)
*/
alter table test_pk_2 
add primary key (SID,age)
--
--
/* Foriegn key constraint*/
--
--case 1 creating new table --**
create table test_primary_key(
ID int primary key,
name varchar(256)
)
--
insert into test_primary_key values (1,'Mark'), (2,'Rob'),(3,'Jack')

select * from test_primary_key
--
create table test_foriegn_key (
ID int foreign key references test_primary_key(id),
course varchar(256)
)
--
insert into test_foriegn_key values (1,'A')
--
select * from test_foriegn_key
--
insert into test_foriegn_key values (null,'B')

-- error : 
--The INSERT statement conflicted with the FOREIGN KEY constraint 
-- "FK__test_foriegn__ID__5165187F". 
--The conflict occurred in database "constraints_1", 
--table "dbo.test_primary_key", column 'ID'.
--
insert into test_foriegn_key values (5,'C')
--
-- case2 : the table already exists --**
--
-- primary key not defiened while creating the table
create table test_foreign_key_case_2(
ID int,
course varchar(256)
)
--
-- modifying the table to assign primary key 
--
alter table test_foreign_key_case_2
add foreign key (id) references test_primary_key(id)
--
select * from test_foreign_key_case_2
--
---- -- -----------------
/* */
/* */
/* Order of exceution of the query */

use [constraints_1]
--
select * from EmployeeSalaries
--
select distinct top 1 department,AVG(salary) [Avg Salary] 
from employeesalaries
where salary>50000
group by department
having avg(salary)>55000
order by department
--
--
--
-- from & joins is executed then
-- where , is executed then
-- group by, is executed then
-- having, is executed then
-- select, is executed then
-- distinct, is executed then
-- order by, is executed then
-- last top. is executed then
---- -- ------------------- -- ------------------- -- -----------------
/* */
/* */
--
-- select database
use [SQL Basics Questions]
--
select * from Employees
--
----1) How to select all columns ?
select * from Employees

----2) How to select only the FirstName and Last Name columns from the Employees table?
select FirstName,LastName from Employees

----3) How to find all employees who work in the 'IT' department?
select * from Employees where Department = 'IT'

----or

select * from Employees where Department like 'IT'

----4) How to select employees with a salary greater than 70,000?
select * from Employees where Salary>70000

----5) How to sort the results by Last Name in ascending order?
select * from Employees order by LastName asc
----or
select * from Employees order by LastName


----6) How to select distinct departments from the Employees table?
select distinct Department from Employees


----7) How to count the number of employees in each department?
select Department,count(*) [Number of Employees] from Employees group by Department
----
select department,count(employeeid) [Number of Employees] from Employees group by Department

----8) How to find the maximum salary in the Employees table?
select max(salary) [Maximum salary] from Employees

----9) How to find the average salary of employees in the 'Finance' department?
select avg(Salary) [Finance Average] from Employees where Department like 'Finance'

----10) How to select employees whose last name starts with 'M'?
select * from Employees where LastName like 'm%'
/* */
/* */
--
--
select * from Employees
--
--1. How to select employees who work in the 'IT' department and have a salary greater than 75,000?
select * from employees where Department in ('IT') and Salary>=75000


--2. How to find employees who work in the 'HR' department or have a salary less than 60,000?
select * from Employees where Department in ('HR') or Salary<60000


--3. How to select employees who do not work in the 'Finance' department?
select * from Employees where Department not in ('Finance')

--or

select * from Employees where not Department = 'Finance'


--4. How to find employees whose salary is between 60,000 and 70,000 and who work in the 'Finance' department?
select * from Employees where Salary between 60000 and 70000 and Department in ('Finance')


--5. How to find employees who work in the 'IT' department and do not have a salary greater than 80,000?
select * from Employees where Department = 'Finance' and Salary<=80000

--or

select * from Employees where Department in ('Finance') and not Salary>80000


--6. How to find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65,000?
select * from Employees where (Department in ('HR') OR Department in ('Finance')) and Salary>=65000

select * from Employees

--7. How to select employees whose last name starts with 'D' and do not work in the 'HR' department?
select * from Employees where LastName like 'd%' and Department not in ('HR')


--8. How to find employees who do not work in the 'IT' department and have a salary greater than 70,000?
select * from Employees where not Department = 'IT' and Salary>70000


--9. How to select employees who work in the 'IT' department and either have a salary greater 
--than 75,000 or have the first name 'Laura'?
select * from Employees where (Salary>75000 or FirstName = 'Laura') and Department in ('IT')


--10. How to find employees who do not work in the 'HR' or 'IT' departments?
select * from Employees where Department not in ('HR','IT')
-- -- ------------------- -- ------------------- -- -----------------
/* */
/* */
--
--
use [SQL Questions]
--


select * from Customers

select * from Orders

select * from Products


--1) Write an SQL query to find the names of customers who have placed an order.
select distinct CustomerName from customers c inner join Orders o on o.CustomerID = c.CustomerID

--2) Find the list of customers who have not placed any orders.
select distinct CustomerName from Customers c left join Orders o on O.CustomerID = C.CustomerID where o.OrderID is null

--3) List all orders along with the product name and price.
select distinct ProductName,Price from Orders o join Products p on o.ProductID = p.ProductID  


--4) Find the names of customers and their orders, including customers who haven't placed any orders.
select distinct CustomerName,OrderID from Customers c left join Orders o on o.CustomerID = c.CustomerID

--5) Retrieve a list of products that have never been ordered.
select distinct p.ProductID,ProductName from Products p left join Orders o on p.ProductID = o.ProductID where o.OrderDate is null

--6) Find the total number of orders placed by each customer.
select customername,count(orderid) [Number of Orders] from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by customername

--OR 
select customername,count(orderid) [Number of Orders] from Customers c LEFT join Orders o on c.CustomerID = o.CustomerID
group by customername

--7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.
select distinct CustomerName,p.ProductID,ProductName,OrderDate
from Customers c left join Orders o on c.CustomerID = o.CustomerID left join Products p on o.ProductID = p.ProductID
-- -- -----------------
/* */
/* */
--
/* self join will give all the records */
select * from Customers x join Customers y on x.Country = y.Country
--
/* self join : not to match each other */
select * from Customers x join Customers y on x.Country = y.Country and x.CustomerID <> y.CustomerID and x.CustomerID > y.CustomerID
--
--1.idenitfy pairs of customer who  live in the same country
select  x.customerName,y.customerName 
from Customers x join Customers y on x.Country = y.Country and x.CustomerID <> y.CustomerID and x.CustomerID > y.CustomerID
--
--
--2. find customer who has spent the most on their orders
--
select * from Customers c inner join 
Orders o on c.CustomerID = o.CustomerID inner join Products p on o.ProductID = p.ProductID
--
select CustomerName,sum(Price) from Customers c inner join 
Orders o on c.CustomerID = o.CustomerID inner join Products p on o.ProductID = p.ProductID
group by CustomerName
--
select CustomerName,sum(Price) [Amount spent],DENSE_RANK() over(order by sum(price) desc) [DR] 
from Customers c inner join 
Orders o on c.CustomerID = o.CustomerID inner join Products p on o.ProductID = p.ProductID
group by CustomerName

-- final solution using a subquery 
select customername from
(select CustomerName,sum(Price) [Amount spent],DENSE_RANK() over(order by sum(price) desc) [DR] 
from Customers c inner join 
Orders o on c.CustomerID = o.CustomerID inner join Products p on o.ProductID = p.ProductID
group by CustomerName) m where DR =1
--
--
--3 find the customer ordered more than 1type of product
--
select * from Customers c inner join Orders o on c.CustomerID = o.CustomerID
--
select CustomerName,count(ProductID) 
from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by CustomerName
--
select CustomerName,count(ProductID) 
from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by CustomerName
having count(ProductID)>1
-- final solu
select CustomerName
from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by CustomerName
having count(ProductID)>1
--
--
--4 list all products and their corresponding orders, using right join, including products that have never been ordered
select * from Orders o right join Products p on o.ProductID = p.ProductID
--
select OrderID,p.ProductID,ProductName from Orders o right join Products p on o.ProductID = p.ProductID
--
--
--5 retrive all oredrs placed by customer from usa
--
select * from Customers c inner join Orders o on c.CustomerID = o.CustomerID where Country in ('USA')
--
select OrderID from Customers c inner join Orders o on c.CustomerID = o.CustomerID where Country in ('USA')
--
--6 customer names ordered above 500
--
select * from Customers c inner join Orders o on o.CustomerID = c.CustomerID inner join Products p on p.ProductID = o.ProductID
--
select * from Customers c inner join Orders o on o.CustomerID = c.CustomerID inner join Products p on p.ProductID = o.ProductID
where Price > 500
--
select CustomerName from Customers c inner join Orders o on o.CustomerID = c.CustomerID inner join Products p on p.ProductID = o.ProductID
where Price > 500
-- final solution
select distinct 
CustomerName from Customers c inner join Orders o on o.CustomerID = c.CustomerID inner join Products p on p.ProductID = o.ProductID
where Price > 500
--
--
--7 customers who order same product more than 1 onces
--
select * from Customers c inner join Orders o on c.CustomerID = o.CustomerID
--
select CustomerName,ProductID,count(OrderID) from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by CustomerName,ProductID

--
select CustomerName,ProductID,count(OrderID) from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by CustomerName,ProductID
having count(OrderID)>1
--
-- final solution
SELECT distinct m.CustomerName from
(select CustomerName,ProductID,count(OrderID) [count] from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by CustomerName,ProductID
having count(OrderID)>1) m
--
-- -- -----------------
/* */
/* --Rank, Dense Rank & Row Number Window Functions - 1 */
--
use [student]
--
select * from students
--
--assign row number to each records based on marks sorted in descending
--
--ROW_NUMBER()
select * ,ROW_NUMBER() over(order by marks desc) as [row-number]
from Students
--
--
-- rank() - rank fuctions, will skip the next numbers when there is a tie

select *,rank() over(order by marks desc) as [rank-func]
from students
--
--DENSE_RANK()
select *,DENSE_RANK() over(order by marks desc) [Dense rank]
from students
--
select *,DENSE_RANK() over(order by marks desc) [Dense rank], ROW_NUMBER() over(order by marks desc) as [row-number]
from students
--
-- -----------------
select * from students
-- 
--
-- partition by 
select *,ROW_NUMBER() over(partition by subject order by marks desc) as [Row_num_desc]
from students
--
select *,ROW_NUMBER() over(partition by subject order by marks asc) as [Row_num_Asc]
from students
-- 
--
select *,ROW_NUMBER() over(partition by student_name order by marks desc) as [Row_num_desc]
from students
--
--
select *,rank() over(partition by student_name order by marks desc) as [Rank_desc]
from students
--
--
--
select *,rank() over(partition by subject order by marks desc) as [Rank_desc]
from students
--
--
select *,dense_rank() over(partition by subject order by marks desc) as [Dense_Rank_desc]
from students
--
select *,dense_rank() over(partition by student_name order by marks desc) as [Dense_Rank_desc]
from students
-- ---------------------------------------------
/* */
/* */
/* */
/* LEAD function  */
use [profit db]
--
select * from ProfitData
--
--1 add new column to show next month profit for each product?**

select *,LEAD(Profit) over(partition by product order by monthnumber) [Next-Months-Profit]
from ProfitData
--
-- 2 Each month toatl profit to show by monthnumber & monthname,
-- also a new column to show next months total profit ?**
--
select MonthNumber,MonthName,sum(Profit) [Tot Profit],
LEAD(sum(Profit)) over(order by monthnumber asc) [Next-Months-Profit]
from ProfitData
group by MonthNumber,MonthName
order by MonthNumber
-- ---------------------
/* */
/* LAG function  */
--
select * from ProfitData
--
--1 add new column to show next month profit for each product?**
select *,
lag(profit) over(partition by product order by monthnumber) [lag-Next-Month-Profit]
from ProfitData
--
-- 2 Each month toatl profit to show by monthnumber & monthname,
-- also a new column to show "Previous months total profit ?**
--

select MonthNumber,MonthName,sum(Profit) [Tot Profit],
LAG(sum(Profit)) over(order by monthnumber asc) [LAG-Prev-Months-Profit]
from ProfitData
group by MonthNumber,MonthName
order by MonthNumber
-- ------------------------------------------
/* */
/* isnull, coalesce functiions   */
--
select * from Customers
--
select  isnull(null,'1 st value null')
--
select  isnull('abxn',null)
--
select  isnull(null,null)
--coalesce will find the first null value
select coalesce('a','b','c')
--
select coalesce(null,'b','c')
--
select coalesce(null,null,'c')
--
--
-- check for null value ans replace with a given value
--
select Customerid,email,phonenumber from Customers
--
select Customerid,ISNULL(email,'Email NA'),ISNULL(phonenumber,'PH no NA') from Customers
--
-- 
select Customerid,coalesce(email,phonenumber,'Contact not NA') [coalesce_func1] from Customers
-- ------------------------------------------
/* */
/* firstvalue() functiions   */
--
use [window_func1]
--
select * from EmployeeSalaries
--
-- first value finds the minium value
select *,
FIRST_VALUE(Salary) over(order by Salary asc) [Minimum_sal]
from EmployeeSalaries
--
--
select *,
FIRST_VALUE(EmployeeName) over(order by Salary asc) [Emp_Mini_sal],
FIRST_VALUE(Salary) over(order by Salary asc) [Minimum_sal]
from EmployeeSalaries
--
--
select *,
FIRST_VALUE(EmployeeID) over(partition by Department order by Salary desc) [First_val_data],
FIRST_VALUE(EmployeeName) over(partition by Department order by Salary desc) [First_val_Ename]
from EmployeeSalaries
--
--
-- ------------------------------------------
/* */
/* LAST value() functiions   */
--
--
use [window_func1]
--
-- error, icorrect query
select *,
LAST_VALUE(EmployeeName) over(order by salary desc) [last_val_emp_sal_low]
from EmployeeSalaries
--
-- Correct Solution
select *,
LAST_VALUE(EmployeeName) over(order by salary desc rows between unbounded preceding and unbounded following) [last_val_emp_sal_low]
from EmployeeSalaries
--
--
-- 
select *,
LAST_VALUE(EmployeeName) over(order by salary desc rows between unbounded preceding and unbounded following) [last_val_emp_sal_low],
LAST_VALUE(Salary) over(order by salary desc rows between unbounded preceding and unbounded following) [last_val_Lowest_sal]
from EmployeeSalaries
--
--partition by Department with lowest salary
select *,
LAST_VALUE(EmployeeName) over(partition by Department
order by salary desc 
rows between unbounded preceding and unbounded following) [last_val_emp_sal_low],
LAST_VALUE(Salary) over(partition by Department
order by salary desc 
rows between unbounded preceding and unbounded following) [last_val_Lowest_sal]
from EmployeeSalaries
--
-- --****-----
-- LAST value window fuction 
--: partition by Department with highest salary
select *,
LAST_VALUE(EmployeeName) over(partition by Department
order by salary asc 
rows between unbounded preceding and unbounded following) [last_val_emp_sal_high],
LAST_VALUE(Salary) over(partition by Department
order by salary asc 
rows between unbounded preceding and unbounded following) [last_val_High_sal]
from EmployeeSalaries
-- --
-- --****-----
-- first value window fuction 

select *,
FIRST_VALUE(EmployeeName) over(partition by Department
order by salary desc 
) [last_val_emp_sal_high],
FIRST_VALUE(Salary) over(partition by Department
order by salary desc 
) [last_val_High_sal]
from EmployeeSalaries
-- --
--
-- ------------------------------------------------------------------------------------
/* */
/* */
/*  (CTE) Common table expression */

--
use [employee_details]
--
select * from Employees
--
-- creating temparory table using hash
--
select * into #temp01 from Employees
--
select * from #temp01
--
-- case 1: CTE, any name can be given for CTE
with CTE as (
select * from #temp01
)
select * from CTE
--
--
--case 2
with test_CTE as (
select EmployeeID,firstname from #temp01 where EmployeeID in (2,4)
)
select * from test_CTE
--
--case 3 creating secon temp table
with [common table expression] as (
select * from #temp01 where EmployeeID in (1,2,3)
)
select * into #temp02 from [common table expression]

select * from #temp02
--
--case 4
with CTE_1 as(
select * from #temp01 where EmployeeID in (2,4,6)
)
update #temp01 set employeeid =101 where employeeid in (select distinct employeeid from CTE_1)

select * from #temp01
--
--
----case 5
with cte_2 as (
select * from #temp01 where EmployeeID =1
)
delete from #temp01 where EmployeeID in (select distinct EmployeeID from cte_2)

select * from #temp01
--
--
-- 
/* nested CTE */ 
select * from Employees

select * into #1 from dbo.Employees

---Example 1
With CTE1 as (
select * from #1 where EmployeeID in (1,2)
),CTE2 as (
select * from #1 where EmployeeID in (3,4)
)

select * from cte1
union all
select * from cte2


--Example 2
with cte3 as (
select employeeid,firstname from #1 where EmployeeID = 1
),cte4 as (
select employeeid,firstname from #1 where EmployeeID in (3)
)

select * into #2 from (
select * from cte3
union all
select * from cte4
) x

select * from #2

--Example 3 
with cte3 as (
select employeeid,firstname from #1 where EmployeeID = 1
),cte4 as (
select employeeid,firstname from #1 where EmployeeID in (3)
)

insert into #2 select * from (
select * from cte3
union all
select * from cte4
) x

select * from #2

--Example 4
with cte3 as (
select employeeid,firstname,Salary from #1 where EmployeeID = 2
),cte4 as (
select employeeid,firstname,Salary from #1 where EmployeeID in (4)
)

delete from #1 where EmployeeID in (select distinct employeeid from cte3
union all
select distinct EmployeeID from cte4
)


select * from #1

--Example 5 :
with cte3 as (
select employeeid,firstname,Salary from #1 where EmployeeID = 9
),cte4 as (
select employeeid,firstname,Salary from #1 where EmployeeID in (10)
)

update #1 set employeeid = 100 where EmployeeID not in (select distinct employeeid from cte3
union all
select distinct EmployeeID from cte4
)
--
--
--
--
--
--Recursive CTE
--Factorial of a given number (5)

with [R CTE] as (
--Anchor Query
select 1 as n

union all

--Recursive Query
-- n is check aobve n is assigned initial as 1
select n+1 from [R CTE] where n<=4

)

select exp(sum(log(n))) [Factorial] from [R CTE]
--------

-----------
--3*2*1
--5*4*3*2*1


----------------
with [R CTE] as (
--Anchor Query
select 1 as n

union all

--Recursive Query
select n+1 from [R CTE] where n<=4

)

select * from [r cte]
--
-- ------------------------------------------------------------------------------------
/* */
/* Stored procedure */

--
use testdb
--
select * from Employees
--
-- creating procedure
-- case 1
create procedure sp_test
as
begin
	select * from Employees
end
-- calling procedure
-- syntax 1
sp_test
-- 
-- syntax 2
exec sp_test
--
-- syntax 3
execute sp_test
--
-- creating procedure
-- case 2
create proc sp_test_1
as
begin
	select firstname,lastname from Employees
end
--
execute sp_test_1
--
-- ------------------------------------------------------------------------------------
/* */
/* View function : temporary virtual table, it s a stored SQL query
-- helps reducing the complexity
-- helps in implementing security
*/
--
--
use testdb
--
select * from Employees
--
select * into emp_bkp from Employees

select * from emp_bkp
--
create view view_table_1 as (
select * from emp_bkp
)

select * from view_table_1
--
--
-- view that will contain only selected column
-- which can be shared to others
-- not the entire table is shared
-- this way security can be implemented
--
create view view_table_2 as (
select EmployeeID,Firstname,lastname,DepartmentId from emp_bkp
)

select * from view_table_2
--
--
--
--updating the view_table_1 will also update the emp_bkp
select * from view_table_1
update view_table_1
set EmployeeID = 100
---
--
drop view view_table_2
--
--
-- ------------------------------------------------------------------------------------
/* */
/* index func in SQL */
/* Index = table of content  */
--
--
use testdb
--
select * from Employees
--
create index IX_index_1 on Employees(salary desc)
--
create index IX_index_2 on Employees(firstname,lastname desc)
--
drop index Employees.IX_index_2
drop index Employees.IX_index_1
--
/* cluster index */
-- only one cluster index can be created at a time
create clustered index CL_index_1 on Employees(EmployeeID)
select * from Employees
drop index Employees.CL_index_1
--
create clustered index CL_index_2 on Employees(EmployeeID desc)
drop index Employees.CL_index_2
--
--
-- ------------------------------------------------------------------------------------
----
-----
use [Advance_SQL_Ques]
--
--


select * from Employees

--2nd Highest Salary
select max(salary) [2nd Highest Salary] from employees where salary<
(select max(salary) from Employees)

--3rd highest salary
select max(salary) [3rd Highest Salary] from employees where salary< (
select max(salary) from employees where salary<
(select max(salary) from Employees))

--CTE
with cte as(
select *,DENSE_RANK() over(order by salary desc) [DR] from Employees
)

select salary [2nd Highest Salary] from cte where DR = 2

--3rd Highest Salary
with cte as(
select *,DENSE_RANK() over(order by salary desc) [DR] from Employees
)

select salary [3rd Highest Salary] from cte where DR = 3

--Sub Query along with Dense_Rank()

select salary as [2nd highest salary] from
(select *, DENSE_RANK() over(order by salary desc) [DR] from Employees) x
where DR = 2


select salary as [3rd highest salary] from
(select *, DENSE_RANK() over(order by salary desc) [DR] from Employees) x
where DR = 3

--Sub Query
select top 1 salary [2nd Highest Salary] from 
(select distinct top 2 salary from Employees order by Salary desc) x
order by Salary asc


--3rd Highest Salary
select top 1 salary [3rd Highest Salary] from 
(select distinct top 3 salary from Employees order by salary desc) y
order by Salary asc
---
---
---