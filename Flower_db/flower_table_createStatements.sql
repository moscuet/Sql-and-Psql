drop database if exists flowerdb;
create database flowerdb;
use flowerdb;

create table flower(
    flowerId integer not null primary key,
    name varchar(29) not null,
    site varchar(15) not null,
    unitPrice integer not null,
    stock integer not null
);
insert into flower values(10, 'ocrchid','Vantaa',9,300);
insert into flower values(20, 'sunflower','Dhaka',5,500);

drop user if exists 'emily'@'localhost';
create user 'emily'@'localhost' identified by 'ufKE20DU';

grant all privileges on employeeDb.* to 'emily'@'localhost';



-- mysql <Rahman_Mostafizur_flower_createStatements.sql

