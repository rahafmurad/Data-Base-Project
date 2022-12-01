create  SCHEMA  resturant;
create Table resturant.Customer(
cid   INT(5) NOT NULL,
cName varchar(20) ,
Email  varchar(70) unique ,
street  varchar(20) ,
city  varchar(20) ,
ZipCode varchar(5),
CONSTRAINT Customer_PK PRIMARY KEY (cid)
);
 create Table resturant.Branch(
branchID  INT(5) NOT NULL,
location varchar(70) ,
phoneNumber INT(10) unique ,
CONSTRAINT Branch_PK PRIMARY KEY (branchID)
);
create Table resturant.Employee(
eid   INT(5) NOT NULL,
eName varchar(20) ,
position varchar(20) unique ,
salary  DECIMAL (7, 2) ,
address  varchar(50) ,
DateOfBirth varchar(10),
sex varchar(1) ,
branchID INT(5),
StartDate varchar(10),
CONSTRAINT Customer_PK PRIMARY KEY (eid),
CONSTRAINT Employee_FK1 FOREIGN KEY (branchID) REFERENCES Branch(branchID) ON DELETE SET NULL
);
create Table resturant.reservation(
reservationID   INT(4) NOT NULL,
reservationDate varchar(10) ,
tableNo INT(3)  ,
cid   INT(5),
CONSTRAINT reservation_PK PRIMARY KEY (reservationID),
CONSTRAINT reservation_FK1 FOREIGN KEY (cid) REFERENCES Customer(cid) ON DELETE SET NULL
);
create Table resturant.Menuitem(
dishID   INT(4) NOT NULL,
dishName varchar(10) ,
size varchar(1) check (size IN ('S' , 'M','L') ) ,
price INT(2),
eid   INT(5),
CONSTRAINT Menuitem_PK PRIMARY KEY (dishID),
CONSTRAINT Menuitem_FK1 FOREIGN KEY (eid) REFERENCES Employee(eid) ON DELETE SET NULL
);
create Table resturant.Serves(
eid  INT(4) NOT NULL,
cid INT(4) NOT NULL ,
CONSTRAINT Serves_PK PRIMARY KEY (eid,cid),
CONSTRAINT Serves_FK1 FOREIGN KEY (eid) REFERENCES Employee(eid) ON DELETE CASCADE,
CONSTRAINT Serves_FK2 FOREIGN KEY (cid) REFERENCES Customer(cid) ON DELETE CASCADE
);
INSERT resturant.Customer
VALUES (12345 , 'maher' , 'maher@gmail.com', 'jabl-alnoor','makkah', '01234') ;
INSERT resturant.Customer
VALUES (12333 , 'ahmed' , 'ahmed@gmail.com', 'sharaye','makkah', '01235') ;
INSERT resturant.Customer
VALUES (12200 , 'ali' , 'al@gmail.com', 'tahlia','jeddah', '12435') ;
INSERT resturant.Customer
VALUES (12290 , 'mohammed' , 'm23m@gmail.com', 'tahlia','jeddah', '12435') ;
INSERT resturant.Customer
VALUES (12223 , 'ali' , 'ali23@gmail.com', 'khalid-bin-waleed','jeddah', '12436') ;

INSERT resturant.Branch
VALUES (11234 , 'al-salam-ST_jeddah' , 0596481523) ;
INSERT resturant.Branch
VALUES (11233 , 'al-mrouje-ST_riydh' , 0596481555) ;
INSERT resturant.Branch
VALUES (11223 , 'king-khaled-ST_khobar' , 0596481553) ;
INSERT resturant.Branch
VALUES (11232 , 'prince-mansour-ST_dammam' , 0596481522) ;
INSERT resturant.Branch
VALUES (11798 , 'prince-salman-khaled-ST_kharj' , 0596481500) ;

INSERT resturant.Employee
VALUES (555123 , 'khaled' , 'Dishwasher', 2000.00,'jeddah', '12/3/1991', 'M',11234,'3/2/2010') ;
INSERT resturant.Employee
VALUES (444123 , 'raneem' , 'Manager', 10000.00,'riydh', '3/3/2000', 'F',11233,'3/12/2020') ;
INSERT resturant.Employee
VALUES (666123 , 'reem' , 'Chef', 7000.00,'khobar', '11/7/1995', 'F',11223,'30/2/2005') ;
INSERT resturant.Employee
VALUES (999123 , 'ahmed' , 'Cashier', 6000.00,'dammam', '15/3/1998', 'M',11232,'15/8/2001') ;
INSERT resturant.Employee
VALUES (333123 , 'mohammed' , 'Waiter', 5000.00,'kharj', '11/7/1990', 'M',11232,'15/8/2003') ;

INSERT resturant.reservation
VALUES (0123 , '15/8/2021' , 102 ,12345) ;
INSERT resturant.reservation
VALUES (0111 , '18/8/2021' , 103 ,12333) ;
INSERT resturant.reservation
VALUES (0133 , '15/8/2021' , 105 ,12200) ;
INSERT resturant.reservation
VALUES (0223 , '20/8/2021' , 102 ,12290) ;
INSERT resturant.reservation
VALUES (0321 , '1/9/2021' , 109 ,12223) ;

INSERT resturant.Menuitem
VALUES (0012 , 'burger' , 'M' ,15,'555123') ;
INSERT resturant.Menuitem
VALUES (0013 , 'piza' , 'L' ,25,'333123') ;
INSERT resturant.Menuitem
VALUES (0010 , 'burrito' , 'M' ,15,'444123') ;
INSERT resturant.Menuitem
VALUES (0022 , 'crispy' , 'M' ,14,'666123') ;
INSERT resturant.Menuitem
VALUES (0033 , 'pasta' , 'L' ,15,'999123') ;

INSERT resturant.Serves
VALUES (555123 ,12345 ) ;
INSERT resturant.Serves
VALUES (444123 ,12333 ) ;
INSERT resturant.Serves
VALUES (666123 ,12200 ) ;
INSERT resturant.Serves
VALUES (999123 ,12290 ) ;
INSERT resturant.Serves
VALUES (333123 ,12223) ;

SELECT *
FROM resturant.Employee
WHERE position = 'Manager' ;

SELECT eid , eName , position, salary
FROM resturant.Employee
WHERE salary >2000.00 ;

SELECT dishName , price
FROM resturant.Menuitem
order by price ;

SELECT city, COUNT(cid) AS count
FROM  resturant.Customer
GROUP BY city ;


