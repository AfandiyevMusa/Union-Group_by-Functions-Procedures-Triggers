create table Countries(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50) not NULL
)

insert into Countries(Name)
values('Azerbaijan'),
('Turkey'),
('USA'),
('UK'),
('Italy'),
('France')

create table Cities(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50) not NULL,
    [CountryId] int FOREIGN KEY REFERENCES Countries(Id)
)

insert into Cities(Name, CountryId)
values('Izmir', 2),
('London', 4),
('Paris', 6),
('Baku', 1),
('Boston', 3),
('Milan', 5)

create table Employees(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50) not NULL,
    [Surname] NVARCHAR(50) not NULL,
    [Age] int,
    [Salary] FLOAT,
    [Position] NVARCHAR(50),
    [IsDeleted] bit DEFAULT 0,
    [CityId] int FOREIGN KEY REFERENCES Cities(Id)
)

insert into Employees([Name], [Surname], [Age], [Salary], [Position], [CityId])
values('Nijat', 'Novruzzade', 21, 1300, 'Manager', 1),
('Ramil', 'Allahverdiyev', 26, 1800, 'Administrator', 3),
('Musa', 'Afandiyev', 19, 2300, 'Vice president', 2),
('Rasul', 'Hasanov', 15, 2000, 'Assistant', 2),
('Anar', 'Huseynov', 38, 1500, 'Manager', 1),
('Murad', 'Jafarov', 19, 1200, 'Accountant', 3)

update Employees set IsDeleted = 1 where Id > 1 and Id < 4
update Employees set IsDeleted = 1 where Id = 6

update Employees set [Position] = 'Reseption' WHERE Id > 2 and Id <4 
update Employees set [Position] = 'Reseption' WHERE Id = 1

select Employees.Name as 'Name', Employees.Surname as 'Surname', [Cities].[Name] as 'Cities', [Countries].[Name] as 'Countries' from Employees 
INNER JOIN Cities ON Employees.CityId=Cities.Id 
INNER JOIN Countries ON Cities.CountryId=Countries.Id;

select [Employees].[Name] as 'Name', [Countries].[Name] as 'Countries' from Employees
INNER JOIN Cities ON Employees.CityId=Cities.Id 
INNER JOIN Countries ON Cities.CountryId=Countries.Id
where [Salary] >= 2000

select Cities.Name as 'Cities', Countries.Name as 'Countries' from Employees
INNER JOIN Cities ON Employees.CityId=Cities.Id 
INNER JOIN Countries ON Cities.CountryId=Countries.Id

select [Employees].[Name], [Employees].[Surname], [Employees].[Age], [Employees].[Salary], [Employees].[Position], [Employees].[IsDeleted], [Cities].[Name] AS 'Cities' FROM Employees
INNER JOIN Cities ON Employees.CityId=Cities.Id
WHERE [Position] = 'Reseption'

SELECT [Employees].[Name], [Employees].[Surname], [Cities].[Name] as 'Cities', [Countries].[Name] as 'Countries' from Employees
INNER JOIN Cities ON Employees.CityId=Cities.Id 
INNER JOIN Countries ON Cities.CountryId=Countries.Id
where IsDeleted = 1

SELECT * from Employees