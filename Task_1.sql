create table Customers (
    Id int primary key IDENTITY(1,1),
    Name NVARCHAR(50),
    Age int,
    Address NVARCHAR(50)
)

create table Employers (
    Id int PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Age int,
    Address NVARCHAR(50)
)

SELECT * from Employers
UNION
select * from Customers

SELECT * from Employers
UNION ALL
select * from Customers

SELECT * from Employers
EXCEPT
select * from Customers

SELECT * from Employers
INTERSECT
select * from Customers

SELECT GETDATE()

SELECT * from Employers
order by Age DESC

select * from Employers where id > 3
order by [Name] DESC

create VIEW vw_CustomersInfo
as
select COUNT(*) as 'Count of Customers Age', Age from Customers
GROUP BY [Age]
having COUNT(*) > 1

create function GetStudentsCountByAge()
returns INT
as
begin
DECLARE @age int;
SELECT @age = count(*) from Customers
return @age 
END

select dbo.GetStudentsCountByAge()

create function GetStudentsCountByGivenAge(@givenAge int)
returns INT
as
begin
DECLARE @age int;
SELECT @age = count(*) from Customers where Age > @givenAge
return @age 
END

select dbo.GetStudentsCountByGivenAge(20)

create PROCEDURE usp_InsertCustomer
@Name NVARCHAR(50),
@Age int,
@Address NVARCHAR(50)
as
BEGIN
INSERT into Customers([Name], [Age], [Address])
VALUES(@Name, @Age, @Address)
END

EXEC usp_InsertCustomer 'Telman', 19, 'Ehmedli'

create table CustomerLogs(
    Id int PRIMARY KEY IDENTITY(1,1),
    CustomerId int,
    Operation NVARCHAR(50),
    Date DATETIME
)

create TRIGGER trg_InsertCustomer on Customers
for INSERT
as
BEGIN
    insert into CustomerLogs([CustomerId], [Operation], [Date])
    SELECT Id, 'Insert', GETDATE() from inserted
END

create TRIGGER trg_DeleteCustomer on Customers
after DELETE
as
BEGIN
    insert into CustomerLogs([CustomerId], [Operation], [Date])
    SELECT Id, 'Delete', GETDATE() from deleted
END

DELETE from Customers where id = 2