-- TASK 2
create table Students (
    Id int PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
    Age int,
    Email NVARCHAR(50),
    Address NVARCHAR(50)
)

insert into Students([Name], [Surname], [Age], [Email], [Address])
values ('Musa', 'Afaniyev', 19, 'afandiyev@gmail.com', 'Neftciler'),
('Murad', 'Jafarov', 19, 'jafarov@gmail.com', 'Nzs'),
('Rasul', 'Hasanov', 15, 'hasanov@gmail.com', 'Xalqlar'),
('Cavid', 'Bashirov', 29, 'bashirov@gmail.com', 'Ehmedli'),
('Novreste', 'Aslanzade', 25, 'aslanzada@gmail.com', 'Azadliq'),
('Nicat', 'Novruzzade', 21, 'novruzzada@gmail.com', 'Azadliq'),
('Ramil', 'Allahverdiyev', 26, 'ramil@gmail.com', 'Xirdalan')


-- select * from Students

CREATE table StudentArchives(
    Id int PRIMARY KEY IDENTITY(1,1),
    StudentId INT,
    Operation NVARCHAR(50),
    Date DATETIME
)

create PROCEDURE usp_DeleteStudent
@id INT
AS
BEGIN
    DELETE from Students where id = @id
END

create TRIGGER trg_DeleteStudent on Students
after DELETE
as
BEGIN
    INSERT into StudentArchives([StudentId], [Operation], [Date])
    select Id, 'Delete', GETDATE() from deleted
END

EXEC usp_DeleteStudent 5

