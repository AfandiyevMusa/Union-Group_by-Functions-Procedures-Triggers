create table Countries(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50)
)

insert into Countries(Name)
values('Azerbaijan'),
('Turkey'),
('USA'),
('UK')

create table Cities(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50),
    [CountryId] int FOREIGN KEY REFERENCES Countries(Id)
)

insert into Cities(Name, CountryId)
values('Izmir', 2),
('Boston', 3),
('Baku', 1),
('London', 4)

create table StaffMembers(
    Id int PRIMARY KEY IDENTITY(1,1),
    [FullName] NVARCHAR(50),
    [Email] NVARCHAR(50),
    [Address] NVARCHAR(50),
    [CityId] int FOREIGN KEY REFERENCES Cities(Id)
)

insert into StaffMembers(FullName, Email, Address, CityId)
values('Musa Afandiyev', 'afandiyev@gmail.com', 'neftciler', 2),
('Murad Jafarov', 'jafarov@gmail.com', 'xalqlar', 3),
('Rasul Hasanov', 'hasanov@gmail.com', 'ehmedli', 2),
('Nijat Novruzzade', 'novruzzade@gmail.com', 'azadliq', 1)

create table Roles(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50)
)

insert into Roles([Name])
VALUES('Role1'),
('Role2'),
('Role3'),
('Role4'),
('Role5')

create table MembersRoles(
    Id int PRIMARY KEY IDENTITY(1,1),
    [StaffMemberId] int FOREIGN KEY REFERENCES StaffMembers(Id),
    [RoleId] int FOREIGN KEY REFERENCES Roles(Id)
)

INSERT into MembersRoles([StaffMemberId], [RoleId])
VALUES(2, 3),
(1, 4),
(3, 1),
(2, 4),
(4, 5)

create table Students(
    Id int PRIMARY KEY IDENTITY(1,1),
    [FullName] NVARCHAR(50),
    [Email] NVARCHAR(50),
    [Age] int,
    [Address] NVARCHAR(50),
    [Phone] NVARCHAR(50),
    [CityId] int FOREIGN KEY REFERENCES Cities(Id)
)

insert into Students([FullName], [Email], [Age], [Address], [Phone], [CityId])
values('Musa Afandiyev', 'afandiyev@gmail.com', 19, 'neftciler', '502391243', 2),
('Murad Jafarov', 'jafarov@gmail.com', 19, 'xalqlar', '502354324', 3),
('Rasul Hasanov', 'hasanov@gmail.com', 15, 'ehmedli', '501235634', 2),
('Anar Huseynov', 'huseynov@gmail.com', 38, 'xirdalan', '504532315', 1),
('Ramil Allahverdiyev', 'ramil@gmail.com', 26, 'bileceri', '502366643', 3),
('Nijat Novruzzade', 'novruzzade@gmail.com', 21, 'azadliq', '504351120', 1)

create table Rooms(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50),
    [Capacity] int
)

INSERT into Rooms([Name], [Capacity])
VALUES('Room1', 12),
('Room2', 43),
('Room3', 25),
('Room4', 30),
('Room5', 18)

create table Educations(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50)
)

insert into Educations([Name])
VALUES('Education1'),
('Education2'),
('Education3'),
('Education4'),
('Education5')

create table Groups(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50),
    [Capacity] int,
    [RoomId] int FOREIGN KEY REFERENCES Rooms(Id),
    [EducationId] int FOREIGN KEY REFERENCES Educations(Id)
)

INSERT into Groups([Name], [Capacity], [RoomId], [EducationId])
VALUES('Group1', 15, 2, 1),
('Group2', 38, 3, 5),
('Group3', 32, 5, 2),
('Group4', 22, 4, 4),
('Group5', 14, 1, 3)

create table StudentsGroups(
    Id int PRIMARY KEY IDENTITY(1,1),
    [GroupId] int FOREIGN KEY REFERENCES Groups(Id),
    [StudentId] int FOREIGN KEY REFERENCES Students(Id)
)

INSERT into StudentsGroups([GroupId], [StudentId])
VALUES(2, 3),
(2, 4),
(4, 5),
(3, 1),
(1, 4)

create table Teachers(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Age] int,
    [Email] NVARCHAR(50),
    [Salary] FLOAT,
    [CityId] int FOREIGN KEY REFERENCES Cities(Id)
)

insert into Teachers([Name], [Surname], [Age], [Email], [Salary], [CityId])
values('Nijat', 'Novruzzade', 21, 'novruzzade@gmail.com', 1300, 1),
('Ramil', 'Allahverdiyev', 26, 'ramil@gmail.com', 1800, 3),
('Musa', 'Afandiyev', 19, 'afandiyev@gmail.com', 2300, 2),
('Rasul', 'Hasanov', 15, 'hasanov@gmail.com', 2000, 2),
('Anar', 'Huseynov', 38, 'huseynov@gmail.com', 1500, 1),
('Murad', 'Jafarov', 19, 'jafarov@gmail.com', 1200, 3)

create table TeacherGroup(
    Id int PRIMARY KEY IDENTITY(1,1),
    [TeacherId] int FOREIGN KEY REFERENCES Teachers(Id),
    [GroupId] int FOREIGN KEY REFERENCES Groups(Id)
)

INSERT into TeacherGroup([TeacherId], [GroupId])
values(3, 1),
(2, 4),
(4, 5),
(1, 4),
(2, 3)

create table WeekDays(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Day] NVARCHAR(50) 
)

insert into WeekDays([Day])
values('Monday'),
('Tuesday'),
('Wednesday'),
('Thursday'),
('Friday'),
('Saturday'),
('Sunday')

create table Seanses(
    Id int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(50)
)

INSERT into Seanses([Name])
VALUES('Value1'),
('Value2'),
('Value3'),
('Value4'),
('Value5')

create table WeekDaySeans(
    Id int PRIMARY KEY IDENTITY(1,1),
    [WeekDayId] int FOREIGN KEY REFERENCES WeekDays(Id),
    [SeansId] int FOREIGN KEY REFERENCES Groups(Id)
)

INSERT into WeekDaySeans([WeekDayId], [SeansId])
VALUES(4, 1),
(3, 2),
(1, 4),
(2, 3),
(5, 4),
(2, 3)

create table GroupWeekDaySeanses(
    Id int PRIMARY KEY IDENTITY(1,1),
    [GroupId] int FOREIGN KEY REFERENCES Groups(Id),
    [WeekDaySeansId] int FOREIGN KEY REFERENCES WeekDaySeans(Id)
)

INSERT into WeekDaySeans([WeekDayId], [SeansId])
values(3, 2),
(1, 4),
(2, 3),
(4, 1),
(2, 3),
(5, 4)