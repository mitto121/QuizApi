--Create Database QuizMasterDB

use [QuizMasterDB]



Create table UserAccount(
Id int primary key identity,
FirstName nvarchar(200),
LastName nvarchar(200) not null,
Email nvarchar(200),
UserName nvarchar(200) unique not null,
[Password] nvarchar(100) not null,
IsActive bit not null, 
CreatedDate DateTime not null,
IsAdmin bit not null 
)