# SQL commands to create and populate the MySQL database for
# CNT 4714 - Summer 2018 - Project 4
#
# delete the database if it already exists
drop database if exists project4;

#create a new database named project4
create database project4;

#switch to the new database
use project4;

#create the schemas for the four relations in this database
create table suppliers (
    snum varchar(4) not null,
    sname varchar(20) not null,
    status integer,
    city varchar(20),
    primary key (snum)
);

create table parts (
    pnum varchar(4) not null,
    pname varchar(15) not null,
    color varchar(15),
    weight integer,
    city varchar(20),
    primary key (pnum)
);

create table jobs (
    jnum varchar(4) not null,
    jname varchar(15) not null,
    numworkers integer,
    city varchar(20),
    primary key (jnum)
);

create table shipments (
    snum varchar(4) not null,
    pnum varchar(4) not null,
    jnum varchar(4) not null,
    quantity integer,
    primary key (snum, pnum, jnum)
);
    
# populate the database tables

insert into suppliers values ('S20','Danilo Rossi',2,'Milan');
insert into suppliers values ('S21','Lizzie Armistead',1,'Hempstead');
insert into suppliers values ('S8','Giancarlo Fisichella',3,'Milan');
insert into suppliers values ('S1','Michael Schumacher', 1, 'Berlin');
insert into suppliers values ('S10','David Coulthard',2,'London');
insert into suppliers values ('S2','Juan Pablo Montoya',4,'Interlagos');
insert into suppliers values ('S15','Jennifer Lawrence',6,'Owensboro');
insert into suppliers values ('S4','Mark Webber',5,'Melbourne');
insert into suppliers values ('S5','Jenson Button',4,'London');
insert into suppliers values ('S22','Jan Ullrich',5,'Bonn');
insert into suppliers values ('S7','Christian Albers',3,'Orlando');
insert into suppliers values ('S16','Fernando Alonso',4,'Madrid');
insert into suppliers values ('S9','Kimi Rikonnen',2,'Helsinki');
insert into suppliers values ('S17','Rubens Barichello',3,'Sao Paulo');
insert into suppliers values ('S18','Tom Boonen',2,'Brussels');
insert into suppliers values ('S11','Bernard Hinault',7,'Paris');
insert into suppliers values ('S13','Candice Swanepoel',3,'Cape Town');
insert into suppliers values ('S3','Dietrich Thurau',1,'Berlin');
insert into suppliers values ('S14','Adriana Lima',4,'Sao Paulo');
insert into suppliers values ('S6','Nicola Gianniberti',2,'Milan');
insert into suppliers values ('S12','Eddy Merckx',1,'Brussels');
insert into suppliers values ('S19','Johan Messeuw',1,'Eekloo');
insert into suppliers values ('S32','Bernd Schnieder',2,'Berlin'); 
insert into suppliers values ('S33','Rolf Aldag',3,'Berlin');
insert into suppliers values ('S44','Beryl Burton',4,'London');
insert into suppliers values ('S56','Marianne Vos',8,'Zandvoort'); 

insert into parts values ('P11','link','silver',4,'Milan');
insert into parts values ('P12','clevis','black',3,'Bonn');
insert into parts values ('P19','screw','green',3,'Paris');
insert into parts values ('P1','bolt','black',14,'London');
insert into parts values ('P2','lever','yellow',5,'Orlando');
insert into parts values ('P9','bolt','silver',3,'Berlin');
insert into parts values ('P4','nut','silver',3,'London');
insert into parts values ('P5','nut','blue',8,'Berlin');
insert into parts values ('P8','cam','titanium',3,'Berlin');
insert into parts values ('P3','bolt','blue',10,'Chicago');
insert into parts values ('P10','nut','red',2,'Orlando');
insert into parts values ('P13','liner','blue',1,'Brussels');
insert into parts values ('P6','shaft','black',14,'Melbourne');
insert into parts values ('P7','cog','red',1,'Chicago');
insert into parts values ('P24','cog','silver',2,'Paris');
insert into parts values ('P33','cover','red',7,'Tampa');
insert into parts values ('P44','link','green',5,'Zurich');
insert into parts values ('P48','washer','green',1,'Stuttgart');
insert into parts values ('P53','rod','green',4,'Zandvoort');



insert into jobs values ('J1','Operation DB',45,'Berlin');
insert into jobs values ('J6','A New Job',14,'Milan');
insert into jobs values ('J13','Night Strike',350,'Paris');
insert into jobs values ('J4','New Job',50,'Berlin');
insert into jobs values ('J2','Really Big Job',500,'Melbourne');
insert into jobs values ('J3','Small Job',100,'Chicago');
insert into jobs values ('J5','My Job',1,'Orlando');
insert into jobs values ('J22','Project On-Time',200,'London');


insert into shipments values ('S1','P1','J1',40);
insert into shipments values ('S1','P3','J13',95);
insert into shipments values ('S1','P8','J3',200);
insert into shipments values ('S1','P8','J13',200);
insert into shipments values ('S6','P5','J22',200);
insert into shipments values ('S6','P6','J22',120);
insert into shipments values ('S1','P19','J13',200);
insert into shipments values ('S1','P22','J5',40);
insert into shipments values ('S6','P44','J4',20);
insert into shipments values ('S2','P3','J1',40);
insert into shipments values ('S1','P1','J4',200);
insert into shipments values ('S6','P53','J1',25);
insert into shipments values ('S2','P3','J2',15);
insert into shipments values ('S1','P8','J1',80);
insert into shipments values ('S1','P8','J2',100);
insert into shipments values ('S2','P3','J4',50);
insert into shipments values ('S44','P44','J2',100);  
insert into shipments values ('S2','P3','J22',50);
insert into shipments values ('S2','P4','J1',50);
insert into shipments values ('S6','P48','J2',100);
insert into shipments values ('S3','P10','J4',200);
insert into shipments values ('S2','P3','J3',20);
insert into shipments values ('S3','P3','J1',99);
insert into shipments values ('S3','P3','J6',75);
insert into shipments values ('S3','P4','J6',80);
insert into shipments values ('S1','P8','J22',340);
insert into shipments values ('S2','P3','J5',91);
insert into shipments values ('S3','P5','J6',120);
insert into shipments values ('S6','P10','J3',100);
insert into shipments values ('S3','P9','J1',110);  
insert into shipments values ('S3','P24','J2',200);
insert into shipments values ('S44','P48','J5',40);
insert into shipments values ('S4','P6','J2',50);  
insert into shipments values ('S6','P1','J2',40);  
insert into shipments values ('S6','P2','J2',60);
insert into shipments values ('S6','P3','J4',500);
insert into shipments values ('S6','P4','J2',120);
insert into shipments values ('S6','P7','J1',300);
insert into shipments values ('S21','P2','J4',200);
insert into shipments values ('S6','P8','J3',110);
insert into shipments values ('S1','P8','J4',100);
insert into shipments values ('S7','P1','J2',40);  
insert into shipments values ('S1','P8','J6',230);
insert into shipments values ('S6','P9','J4',180);
insert into shipments values ('S6','P12','J4',75);
insert into shipments values ('S1','P8','J5',225);
insert into shipments values ('S6','P24','J2',20);
insert into shipments values ('S6','P33','J4',40);
insert into shipments values ('S7','P6','J2',40);
insert into shipments values ('S7','P12','J2',40);
insert into shipments values ('S6','P13','J5',100);
insert into shipments values ('S6','P19','J5',50);
insert into shipments values ('S12','P3','J22',750);
insert into shipments values ('S17','P3','J2',800);
insert into shipments values ('S6','P11','J2',40);
insert into shipments values ('S22','P1','J3',120);



# uncomment the following 4 lines if you want to see the results of creating and populating the database
# select * from suppliers;
# select * from parts;
# select * from jobs;
# select * from shipments;
