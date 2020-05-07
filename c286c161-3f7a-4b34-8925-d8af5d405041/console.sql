create database studentTest;
use studentTest;
create table class
(
    ClassID   int          not null primary key auto_increment,
    ClassName NVARCHAR(15) not null,
    StartDate datetime     not null,
    Status    bit
);

create table Student
(
    StudentID   int          not null primary key,
    StudentName NVARCHAR(30) not null,
    Address     Nvarchar(50),
    Phone       VARCHAR(20),
    Status      bit,
    ClassID     int
);

create table Subject
(
    SubID   int          not null PRIMARY KEY auto_increment,
    SubName nvarchar(30) not null,
    Credit  tinyint      not null default 1 check ( Credit >= 1 ),
    Status  bit                   default 1
);

create table Mark
(
    MarkID    int not null primary key auto_increment,
    SubID     int not null unique,
    StudentID int not null unique,
    Mark      float   default 0 check ( mark between 0 and 100),
    ExamTimes tinyint default 1
);

alter table Student
    add foreign key Student (ClassID) references class (ClassID);

alter table class
    modify column StartDate datetime default now();

INSERT into class
values (1, 'A1', 20 / 12 / 2008, 1);

select *
from student
where StudentName like 'h%';


select *
from class
where month(StartDate) = 12;

select max(Credit)
from subject;

select *
from subject
where Credit = (select max(Credit) from Subject);

select *
from subject
where Credit between 3 and 5;


select class.ClassID, ClassName, StudentName, Address
from class join student on class.ClassID = Student.ClassID;

select * from subject
where Status = 0;

select SubName from subject
join mark on Subject.SubID = Mark.SubID
where Mark = (select max(Mark) from mark);

select * from student




