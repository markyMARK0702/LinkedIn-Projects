		  --Mark Miller--
 --Whitford Country Club Database--
--Database Management Final Project--
           --4/18/2017--


/*DELETE ALL
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;*/		
  

--Beginning Statements--
drop table if exists Persons;
drop table if exists AquaticDirector;
drop table if exists Lifeguard;
drop table if exists Chef;
drop table if exists Waiter;
drop table if exists Manager;
drop table if exists Member;
drop table if exists Privilege;
drop table if exists JobTask;
drop table if exists CountryClubDues;
drop table if exists Payment;
drop table if exists PaymentInfo;
--drop view if exists AquaticDirectorInfo;
--drop view if exists LifeGuardInfo;
--drop view if exists ChefInfo;
--drop view if exists WaiterInfo;
--drop view if exists ManagerInfo;
--drop view if exists CCMemberInfo;
--drop view if exists PaymentDeterminate;

		   
		   
--Create Statements--

CREATE TABLE Persons(
	PID int not null unique,
	FirstName varchar not null,
	LastName varchar not null,
	Age int not null,
	Gender char(6) not null,
	Email varchar not null, 
	unique (PID),
	primary key (PID)
);

CREATE TABLE Privilege(
	PrivilegeID int not null unique,
	PoolAccess boolean not null,
	ClubAccess boolean not null,
	SwimTeam boolean not null,
	EmployeeAccess boolean not null, 
	GuestPass boolean not null,
	unique (PrivilegeID),
	primary key (PrivilegeID)
);

CREATE TABLE CountryClubDues(
	Dues varchar not null unique,
	MonthlyPayUSD int not null,
	TabDuesUSD int not null,
	CCPlanDuesUSD int not null,
	unique (Dues),
	primary key (Dues)
);

CREATE TABLE Member(
	PID int not null references Persons(PID),
	MemberID Serial not null unique,
	Dues varchar not null references CountryClubDues(Dues),
	PrivilegeID int not null references Privilege(PrivilegeID),
	primary key (MemberID)
);

CREATE TABLE Employee(
	PID int not null references Persons(PID),
	EmployeeID varchar not null unique,
	PrivilegeID int not null references Privilege(PrivilegeID),
	unique (EmployeeID),
	primary key (EmployeeID)
);

CREATE TABLE AquaticDirector(
	EmployeeID varchar not null references Employee(EmployeeID),
	PoolCertNum int not null,
	primary key (EmployeeID)
);

CREATE TABLE Lifeguard(
	EmployeeID varchar not null references Employee(EmployeeID),
	CPRCertNum int not null,
	primary key (EmployeeID)
);

CREATE TABLE Chef(
	EmployeeID varchar not null references Employee(EmployeeID),
	ChefCertNum int not null,
	primary key (EmployeeID)
);

CREATE TABLE Waiter(
	EmployeeID varchar not null references Employee(EmployeeID),
	WaiterCertnum int not null,
	primary key (EmployeeID)
);

CREATE TABLE Manager(
	EmployeeID varchar not null references Employee(EmployeeID),
	CPRCertNum int not null,
	PoolCertNum int not null,
	primary key (EmployeeID)
);


CREATE TABLE JobTask(
	EmployeeID varchar not null references Employee(EmployeeID),
	PoolOverview boolean not null,
	FirstAid boolean not null,
	GuardPool boolean not null,
	CleanPool boolean not null,
	ManagePool boolean not null,
	WorkOverview boolean not null,
	DelieverFood boolean not null,
	TakeOrders boolean not null,
	PrepareFood boolean not null,
	SwimTeamStaff boolean not null,
	primary key (EmployeeID)
);

CREATE TABLE PaymentInfo(
	PayInfo char(50) not null unique,
	Address char(25) not null,
	City char(25) not null,
	StateTerritory char(50) not null,
	zip int not null,
	BankDepositNum int not null,
	EmailNotification char(50) not null,
	primary key (PayInfo)
);

CREATE TABLE Payment(
	EmployeeID varchar not null references Employee(EmployeeID),
	PayInfo char(50) not null references PaymentInfo(PayInfo),
	PaymentAmtUSD int not null,
	SalaryUSD int not null,
	TotalHrsWorked int not null,
	TotalOvertimeHrs int not null,
	primary key (EmployeeID)	
);

	
--Inserting Data--
insert into Persons(PID, FirstName, LastName, Age, Gender, Email) values
	('0001','Mark','Miller','19','Male','markmiller3@marist.edu'),
	('0002','Chris','Kolimingo','18','Male','chriskol1@gmail.com'),
	('0003','Mike','Love','18','Male','mikelove1@gmail.com'),
	('0004','Joey','Baldja','19','Male','joeybaldja1@gmail.com'),
	('0005','Stephen','Miller','26','Male','stephenmiller1@gmail.com'),
	('0006','Kerry','Schubert','24','Male','kerryschubert1@gmail.com'),
	('0007','Tori','Flaherty','19','Female','tori.flaherty1@marist.edu'),
	('0008','Sara','Schubert','26','Female','SaraSchubert1@gmail.com'),
	('0009','Kelsey','Smith','18','Female','kelseysmith1@gmail.com'),
	('0010','Alan','Labouseur','40','Male','www.3NFconsulting.com'),
	('0011','Lauren','Kennen','23','Female','laurenkennen1@gmail.com'),
	('0012','Conor','Tunno','21','Male','conortunno1@gmail.com'),
	('0013','Erica','Marie','23','Female','ericamarie1@gmail.com'),
	('0014','Minion','Liengtiraphan','21','Male','Piradon.Liengtiraphan1@marist.edu'),
	('0015','Mason','Murphy','20','Male','masonmurphy1@gmail.com'),
	('0016','Eric','Snook','19','Male','Eric.Snook@dasd.edu'),
	('0017','Matthew','Read','20','Male','matthew.read1@marist.edu'),
	('0018','Kate','Kolosecke','16','Female','katekolo1@gmail.com'),
	('0019','Andrew','Gorr','20','Male','andrewgorr1@gmail.com'),
	('0020','Andrew','Austria','35','Male','andrewaus1@gmail.com'),
	('0021','Brian','Brucker','40','Male','Brian.Brucker@westpharma.com'),
	('0022','Marc','Christensen','20','Male','marc.christensen1@marist.edu'),
	('0023','Rob','Lynch','20','Male','rob.lynch1@marist.edu'),
	('0024','Matt','Lake','23','Male','matthew.lake1@marist.edu'),
	('0025','Andrew','Arrigo','19','Male','andrew.arrigo1@marist.edu'),
	('0026','Jack','Ryan','21','Male','jack.ryan1@marist.edu');
	
insert into Privilege(PrivilegeID, PoolAccess, ClubAccess, SwimTeam, EmployeeAccess, GuestPass) values
	('100',true,false,true,true,false),
	('101',true,false,true,true,false),
	('102',true,false,true,true,false),
	('103',true,false,true,true,false),
	('104',false,true,false,true,false),
	('105',false,true,false,true,false),
	('106',true,true,false,true,false),
	('107',false,true,false,true,false),
	('108',true,false,true,true,false),
	('109',true,true,true,true,true),
	('110',true,true,true,true,true),
	('111',true,true,true,false,true),
	('112',true,false,true,true,false),
	('113',true,true,false,true,false),
	('114',true,true,false,true,false),
	('115',true,true,true,true,true),
	('116',false,true,false,true,false),
	('117',false,true,false,true,false),
	('118',true,true,false,true,false),
	('119',false,true,false,true,false),
	('120',true,true,true,true,true),
	('121',true,true,false,true,false),
	('122',true,true,true,false,true),
	('123',true,true,true,true,true),
	('124',true,true,true,false,true),
	('125',true,true,true,false,true);

insert into CountryClubDues(Dues, MonthlyPayUSD, TabDuesUSD, CCPlanDuesUSD) values
	('d0001', '300','100','200'),
	('d0002', '500','50','200'),
	('d0003', '250','100','200'),
	('d0004', '300','150','200');
	
insert into Member(PID, Dues, PrivilegeID) values
	('0012','d0001','111'),
	('0023','d0002','122'),
	('0025','d0003','124'),
	('0026','d0004','125');
	
	
insert into Employee(PID, EmployeeID, PrivilegeID) values
	('0001','1000','100'),
	('0002','1001','101'),
	('0003','1002','102'),
	('0004','1003','103'),
	('0005','1004','104'),
	('0006','1005','105'),
	('0007','1006','106'),
	('0008','1007','107'),
	('0009','1008','108'),
	('0010','1009','109'),
	('0011','1010','110'),
	('0013','1012','112'),
	('0014','1013','113'),
	('0015','1014','114'),
	('0016','1015','115'),
	('0017','1016','116'),
	('0018','1017','117'),
	('0019','1018','118'),
	('0020','1019','119'),
	('0021','1020','120'),
	('0022','1021','121'),
	('0024','1023','123');
	

insert into AquaticDirector(EmployeeID, PoolCertNum) values
	('1015','123456789'),
	('1020','190123456');
	
	
insert into Lifeguard(EmployeeID, CPRCertNum) values
	('1000','234567890'),
	('1001','345678901'),
	('1002','456789012'),
	('1003','567890123'),
	('1008','678901234'),
	('1012','789012345');
	
	
insert into Chef(EmployeeID, ChefCertNum) values
	('1004','123000000'),
	('1005','124000000'),
	('1007','125000000'),
	('1016','126000000'),
	('1017','127000000'),
	('1019','128000000');
	
	
insert into Waiter(EmployeeID, WaiterCertnum) values
	('1006','234000000'),
	('1013','235000000'),
	('1014','236000000'),
	('1018','237000000'),
	('1021','238000000');
	
	
insert into Manager(EmployeeID, PoolCertNum, CPRCertNum) values
	('1009','222222222','444444444'),
	('1010','111111111','555555555'),
	('1023','333333333','666666666');
	
	
insert into	JobTask(EmployeeID, PoolOverview, FirstAid, GuardPool, CleanPool, ManagePool, WorkOverview, DelieverFood, TakeOrders, PrepareFood, SwimTeamStaff) values
	('1000',false,true,true,true,false,false,false,false,false,false),
	('1001',false,true,true,true,false,false,false,false,false,false),
	('1002',false,true,true,true,false,false,false,false,false,false),
	('1003',false,true,true,true,false,false,false,false,false,false),
	('1004',false,false,false,false,false,false,false,false,true,false),
	('1005',false,false,false,false,false,false,false,false,true,false),
	('1006',false,false,false,false,false,false,true,true,false,false),
	('1007',false,false,false,false,false,false,false,false,true,false),
	('1008',false,true,true,true,false,false,false,false,false,false),
	('1009',true,true,true,true,true,true,true,true,true,true),
	('1010',true,true,true,true,true,true,true,true,true,true),
	('1012',false,true,true,true,false,false,false,false,false,false),
	('1013',false,false,false,false,false,false,true,true,false,false),
	('1014',false,false,false,false,false,false,true,true,false,false),
	('1015',true,true,false,true,true,false,false,false,false,true),
	('1016',false,false,false,false,false,false,false,false,true,false),
	('1017',false,false,false,false,false,false,false,false,true,false),
	('1018',false,false,false,false,false,false,true,true,false,false),
	('1019',false,false,false,false,false,false,false,false,true,false),
	('1020',true,true,false,true,true,false,false,false,false,true),
	('1021',false,false,false,false,false,false,true,true,false,false),
	('1023',true,true,true,true,true,true,true,true,true,true);

insert into PaymentInfo(PayInfo, Address, City, StateTerritory, zip, BankDepositNum, EmailNotification) values
	('Mark-Miller-Info','37 Hawk Lane','Poughkeepsie','NY','12601','11011','markmiller3@marist.edu'),
	('Chris-Kolimingo-Info','2 Random Lane','Downingtown','PA','19335','11012','chriskol1@gmail.com'),
	('Mike-Love-Info','3 Random Drive','Downingtown','PA','19335','11013','mikelove1@gmail.com'),
	('Joey-Baldja-Info','4 Random Ave', 'Downingtown','PA','19335','11014','joeybaldja1@gmail.com'),
	('Stephen-Miller-Info','5 Nowhere Road','Poughkeepsie','NY','12601','11015','stephenmiller1@gmail.com'),
	('Kerry-Schubert-Info','6 Nowhere Ave','Poughkeepsie','NY','12601','11016','kerryschubert1@gmail.com'),
	('Tori-Flaherty-Info','7 Nowhere Drive','Poughkeepsie','NY','12601','11017','tori.flaherty1@marist.edu'),
	('Sara-Schubert-Info','8 Weird Lane','Poughkeepsie','NY','12601','11018','Sara.Schubert1@gmail.com'),
	('Kelsey-Smith-Info','9 Weird Road','Poughkeepsie','NY','12601','11019','kelsey.smith1@gmail.com'),
	('Alan-Labouseur-Info','10 Idontknow Ave','Poughkeepsie','NY','12601','11020','www.3NFconsulting.com'),
	('Lauren-Kennen-Info','11 Clark Ave','Downingtown','PA','19335','11021','laurenkennen1@gmail.com'),
	('Erica-Marie-Info','12 Fulton Ave','Poughkeepsie','NY','12601','11022','ericamarie1@gmail.com'),
	('Minion-Liengtiraphan-Info','13 Random Street','Poughkeepsie','NY','12601','11023','Piradon.Liengtiraphan1@marist.edu'),
	('Mason-Murphy-Info','14 Random Way','Poughkeepsie','NY','12601','11024','mason.murphy1@gmail.com'),
	('Eric-Snook-Info','15 No Ave','Poughkeepsie','NY','12601','11025','Eric.Snook@dasd.edu'),
	('Matt-Read-Info','16 Read Ave','Poughkeepsie','NY','12601','11026','matthew.read1@marist.edu'),
	('Kate-Kolosecke-Info','17 South Road','Downingtown','PA','19335','11027','kate.kolo1@gmail.com'),
	('Andrew-Gorr-Info','18 Nowhere Street','Downingtown','PA','19335','11028','andrew.gorr1@gmail.com'),
	('Andrew-Austria-Info','19 Random Way','Downingtown','PA','19335','11029','andrew.aus1@gmail.com'),
	('Brian-Brucker-Info','20 Which Way','Downingtown','PA','19335','11030','Brian.Brucker@westpharma.com'),
	('Marc-Christensen-Info','21 That Way','Poughkeepsie','NY','12601','11031','marc.christensen1@marist.edu'),
	('Matthew-Lake-Info','22 Every Way','Poughkeepsie','NY','12601','11032','matthew.lake1@marist.edu');
	
	
insert into Payment(EmployeeID, PayInfo, PaymentAmtUSD, SalaryUSD, TotalHrsWorked, TotalOvertimeHrs) values
	('1000','Mark-Miller-Info','5454','9','600','6'),
	('1001','Chris-Kolimingo-Info','2700','9','300','0'),
	('1002','Mike-Love-Info','2520','9','280','0'),
	('1003','Joey-Baldja-Info','3240','9','360','0'),
	('1004','Stephen-Miller-Info','2320','8','290','0'),
	('1005','Kerry-Schubert-Info','1680','8','210','0'),
	('1006','Tori-Flaherty-Info','1200','8','150','0'),
	('1007','Sara-Schubert-Info','3392','8','410','14'),
	('1008','Kelsey-Smith-Info','440','8','55','0'),
	('1009','Alan-Labouseur-Info','1000000','1000000','1','0'),
	('1010','Lauren-Kennen-Info','256','8','30','2'),
	('1012','Erica-Marie-Info','972','9','108','0'),
	('1013','Minion-Liengtiraphan-Info','1','1','1','0'),
	('1014','Mason-Murphy-Info','1980','9','220','0'),
	('1015','Eric-Snook-Info','3600','9','400','0'),
	('1016','Matt-Read-Info','238','7','10','24'),
	('1017','Kate-Kolosecke-Info','259','7','30','7'),
	('1018','Andrew-Gorr-Info','840','7','120','0'),
	('1019','Andrew-Austria-Info','1400','7','200','0'),
	('1020','Brian-Brucker-Info','2400','6','400','0'),
	('1021','Marc-Christensen-Info','2280','6','380','0'),
	('1023','Matthew-Lake-Info','1600','8','200','0');

	

	
	
	
	
	
	
	
	
	
	
	
	CREATE VIEW LifeGuardInfo AS
	select 
		   GuardPool.JobTask,
		   CleanPool.JobTask,
		   FirstAid.JobTask,
		   PoolAccess.Privilege,
		   SwimTeam.Privilege,
		   EmployeeAccess.Privilege
	from  JobTask, Privilege
	where Employee.EmployeeID = JobTask.EmployeeID
	  and Employee.PriviledgeID = Privilege.PrivilegeID;
	  
	  
CREATE VIEW AquaticDirectorInfo AS
	select
		   PoolOverview.JobTask,
		   SwimTeamStaff.JobTask,
		   WorkOveriew.JobTask,
		   PoolAccess.Privilege,
		   ClubAccess.Privilege,
		   EmployeeAccess.Privilege,
		   SwimTeam.Privilege
	from  JobTask, Privilege
	where Employee.EmployeeID = JobTask.EmployeeID
	  and Employee.PrivilegeID = Privilege.PrivilegeID;
	  
	  
CREATE VIEW ChefInfo AS
	select 
		   PrepareFood.JobTask,
		   EmployeeAccess.Privilege,
		   ClubAccess.Privilege
	from  JobTask, Privilege
	where Employee.EmployeeID = JobTask.EmployeeID
	  and Employee.PriviledgeID = Privilege.PrivilegeID;
	  
CREATE VIEW WaiterInfo AS
	select 
		   TakeOrders.JobTask,
		   DelieverFood.JobTask,
		   EmployeeAccess.Privilege,
		   CLubAccess.Privilege
	from JobTask, Privilege
	where Employee.EmployeeID = JobTask.EmployeeID
	  and Employee.PriviledgeID = Privilege.PrivilegeID;
	  
	  
CREATE VIEW ManagerInfo AS
	select 
		   PoolOverview.JobTask,
		   FirstAid.JobTask,
		   GuardPool.JobTask,
		   CleanPool.JobTask,
		   ManagePool.JobTask,
		   WorkOveriew.JobTask,
		   SwimTeamStaff.JobTask,
		   PoolAccess.Privilege,
		   ClubAccess.Privilege,
		   SwimTeam.Privilege,
		   EmployeeAccess.Privilege
	from JobTask, Privilege
	where Employee.EmployeeID = JobTask.EmployeeID
	  and Employee.PriviledgeID = Privilege.PrivilegeID;
	  
	  
CREATE VIEW CCMemberInfo AS
	select 
		   MemeberID.Member,
		   PoolAccess.Privilege,
		   ClubAccess.Privilege,
		   SwimTeam.Privilege,
		   GuestPass.Privilege
	from Member, Privilege
	where Member.PriviledgeID = Privilege.PrivilegeID
	order by MemberID desc;
	
	
CREATE VIEW PaymentDeterminate AS 
	select 
		   EmployeeID.Employee,
		   SalaryUSD.Payment
		   TotalOvertimeHrs.Payment,
		   TotalHrsWorked.Payment
	from  Employee, Payment
	where Employee.EmployeeID = Payment.EmployeeID,
	order by EmployeeID desc;
	
CREATE VIEW CCMemberDues AS
	select 
		   Member.MembeID,
		   MonthlyPayUSD.CountryClubDues,
		   TabDuesUSD.CountryClubDues,
		   CCPlanDuesUSD.CountryClubDues,
	from Member, CountryClubDues
	where Member.Dues = CountryClubDues.Dues,
	order by MemberID desc;