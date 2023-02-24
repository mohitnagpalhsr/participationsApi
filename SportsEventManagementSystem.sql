create database SportsEventManagement

use SportsEventManagement

create table Sport(sportsId int primary key Identity(1001,1),
noOfPlayers int,
sportsName varchar(20) Unique,
sportsType varchar(7));

create table Event(eventId int primary key identity(2001,1),
eventDate Date,
eventName varchar(40),
noofSlots int,
sportsName varchar(20),
status varchar(9) Default 'scheduled');

create table Player(playerId int primary key identity(3001,1), 
playerName varchar(40),
age int,
contactNumber varchar(15),
email varchar(30),
gender varchar(6),
sportsName varchar(20),
status varchar(8) Default 'inactive');

create table Participation(participationId int primary key identity(4001,1),
playerId int Foreign key references Player(playerId),
playerName varchar(20),
eventId int Foreign key references Event(eventId),
eventName varchar(30),
sportsId int Foreign key references Sport(sportsId),

--have to edit the below foreign key to Player(sportsName) because a cricket player cannot play volleyball

sportsName varchar(20) --Not Null Foreign key references Sports(sportsName),
,status varchar(10) Default 'pending',
comments varchar(max));

create table LoginModel(Id int primary key identity(5001,1),
Username varchar(20) Unique,
Password nvarchar(max),
RefreshToken nvarchar(max),
RefreshTokenExpiryTime datetime2(7),
Role varchar(10) Default 'user');

insert into Sport values(11,'cricket','outdoor');
insert into Sport values(11,'football','outdoor');
insert into Sport values(2,'table_tennis','indoor');
insert into Sport values(2,'chess','indoor');
insert into Sport values(12,'volleyball','outdoor');

insert into LoginModel(Username,Password,Role) values('admin','$2a$11$DIWvT.aSzqUD4TVl/ewWneN.s1QCa4R/XwZwGW9SuXRllUM9eHKKS','admin');
insert into LoginModel(Username,Password,Role) values('mohit123','$2a$11$qs3Ym3ujo8aiHnNbgNhkluP7c0MlvS8IeY795foPrv1v.NRM.X9EC','user');

insert into Event(eventdate,eventname,noofslots,sportsname) values('2023-04-24','event1',2,'cricket');
insert into Event(eventdate,eventname,noofslots,sportsname) values('2023-03-11','event2',1,'football');
insert into Event(eventdate,eventname,noofslots,sportsname) values('2023-02-21','event3',3,'cricket');
insert into Event(eventdate,eventname,noofslots,sportsname) values('2023-05-09','event4',4,'table_tennis');
insert into Event(eventdate,eventname,noofslots,sportsname) values('2023-06-01','event5',2,'football');

insert into Player(playername,age,contactnumber,email,gender,sportsname) values('abc',24,1234567890,'abc@mail.com','male','cricket');
insert into Player(playername,age,contactnumber,email,gender,sportsname) values('cde',21,5793702047,'cde@mail.com','female','table_tennis');
insert into Player(playername,age,contactnumber,email,gender,sportsname) values('efg',25,9837085038,'efg@mail.com','female','volleyball');
insert into Player(playername,age,contactnumber,email,gender,sportsname) values('ijk',19,9334567890,'ijk@mail.com','male','football');
insert into Player(playername,age,contactnumber,email,gender,sportsname) values('lmn',23,7375934793,'lmn@mail.com','female','chess');

insert into Participation(playerId, playerName, eventId, eventName, sportsId, sportsName, Status) values(3001,'abcdef',2003,'event3',1004,'chess','pending');
insert into Participation(playerId, playerName, eventId, eventName, sportsId, sportsName, Status) values(3003,'efghi',2002,'event2',1001,'football','approved');
insert into Participation(playerId, playerName, eventId, eventName, sportsId, sportsName, Status) values(3004,'ijklm',2005,'event5',1003,'cricket','approved');
insert into Participation(playerId, playerName, eventId, eventName, sportsId, sportsName, Status) values(3002,'cdefg',2001,'event1',1002,'table_tennis','declined');
insert into Participation(playerId, playerName, eventId, eventName, sportsId, sportsName, Status) values(3005,'lmnop',2004,'event4',1005,'volleyball','pending');

select * from sport


--for renaming a table
--exec sp_rename 'Sports', 'Sport'