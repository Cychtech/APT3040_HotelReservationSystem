create database SeneheNiwasa;

use SeneheNiwasa;

create table Guest(GID varchar(5) NOT NULL,
					  f_name varchar(20) NOT NULL,
					  l_name varchar(20) NOT NULL,
					  DOB Date NOT NULL,
					  Nationality varchar(10) NOT NULL,
					  NIC varchar(15),
					  Passport varchar(15),
					  tel VARCHAR(15) NOT NULL,
					  constraint primary key(GID)
					  );

create table Room(Room_ID varchar(5) not null,	
				  Room_Type varchar(20)not null,
				  Status varchar(20) NOT NULL,
				  Room_Price decimal(10,2)not null,
				  constraint primary key(Room_ID)
				  );

create table Reservation(Res_ID varchar(5)not null primary key,
						 Check_In_Date Date not null,
						 Check_Out_Date Date not null,
						 agent varchar(20)
						 );
				  
CREATE TABLE Payment(
  PID VARCHAR(5) NOT NULL,
  Res_ID VARCHAR(5),
  amountPaid DECIMAL(15,2),
  paymentDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  paymentMethod VARCHAR(20),
  CONSTRAINT PRIMARY KEY (PID),
  CONSTRAINT FOREIGN KEY (Res_ID) REFERENCES Reservation(Res_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Payment(
  PID VARCHAR(5) NOT NULL,
  Res_ID VARCHAR(5),
  amountPaid DECIMAL(15,2),
  paymentDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  paymentMethod VARCHAR(20),
  CONSTRAINT PRIMARY KEY (PID),
  CONSTRAINT FOREIGN KEY (Res_ID) REFERENCES Reservation(Res_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);





					 
create table ReservationDetails(ResDetails_ID varchar(5)not null,
								 GID varchar(5)not null,
								 Room_ID varchar(5)not null,
								 Res_ID varchar(5) not null,
								 Reserved_Date DATE not null,
								 price decimal(15,2)not null,
								 constraint primary key(ResDetails_ID),
								 constraint foreign key(GID) references Guest(GID)
								 on delete cascade on update cascade,
								 constraint foreign key(Room_ID) references Room(Room_ID)
								 on delete cascade on update cascade,
								 constraint foreign key(Res_ID) references Reservation(Res_ID)
								 on delete cascade on update cascade
								 );
						 			
						 						  
insert into Guest values('C001','Samaru','Nirman','1990-12-29','SriLankan','904652986V',null,'0768625678');
insert into Guest values('C002','Ian','Robert','1978-03-06','British',null,'466238877','12355895588');
insert into Guest values('C003','David','Baross','1978-05-08','German',null,'C5HTXFCKR','965874562');
insert into Guest values('C004','Rene','Piche','1975-02-11','Canadian',null,'GM261260','863214587');
insert into Guest values('C005','Oksana','Pryshyak','1974-05-01','Ukrain',null,'EK101980','2547892548');
insert into Guest values('C006','Daniela','Stehulova','1979-06-05','Chech',null,'41161377','8963214578');
insert into Guest values('C007','Sarath','Soisa','1988-05-02','SriLankan','884652986V',null,'0768789678');

insert into Room values('Rm001','Superior Double','Available',8000);
insert into Room values('Rm002','Standard Double','Available',7500);
insert into Room values('Rm003','Basic Double','Available',6500);
insert into Room values('Rm004','Whole Villa','Available',17000);

insert into Reservation values('R001','2015-09-25','2015-09-27','Booking.Com');
insert into Reservation values('R002','2016-04-08','2016-04-15','Agoda');
insert into Reservation values('R003','2015-11-25','2015-11-27','AirBnB');
insert into Reservation values('R004','2016-09-25','2015-09-27','Booking.Com');
insert into Reservation values('R005','2015-10-25','2015-10-27','AirBnB');
insert into Reservation values('R006','2015-12-07','2015-12-24','Direct');
insert into Reservation values('R007','2015-08-25','2015-08-27','Agoda');

INSERT INTO Payment (PID, Res_ID, amountPaid, paymentMethod) VALUES ('P001', 'R001', 1000, 'Cash');
INSERT INTO Payment (PID, Res_ID, amountPaid, paymentMethod) VALUES ('P002', 'R001', 1000, 'Card');
INSERT INTO Payment (PID, Res_ID, amountPaid, paymentMethod) VALUES ('P003', 'R002', 1000, 'Card');
INSERT INTO Payment (PID, Res_ID, amountPaid, paymentMethod) VALUES ('P004', 'R003', 1000, 'Cash');
INSERT INTO Payment (PID, Res_ID, amountPaid, paymentMethod) VALUES ('P005', 'R004', 1000, 'Cash');

insert into ReservationDetails values('RD001','C001','Rm002','R001','2015-09-10',7500);
insert into ReservationDetails values('RD002','C002','Rm004','R002','2016-04-08',17000);
insert into ReservationDetails values('RD003','C003','Rm002','R003','2015-11-20',7500);
insert into ReservationDetails values('RD004','C004','Rm003','R004','2016-09-24',6500);
insert into ReservationDetails values('RD005','C005','Rm001','R005','2015-09-10',8000);
insert into ReservationDetails values('RD006','C006','Rm004','R006','2015-06-22',17000);

create table Users(Username varchar(10)primary key,
				  Password varchar(10)not null,
				  privilege varchar(15)not null
				  );

insert into Users values('Admin','admin','Administrator');
insert into Users values('User','1234','Receptionist');