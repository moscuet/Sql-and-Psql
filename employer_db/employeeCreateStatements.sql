drop database if exists employeeDb;
create database employeeDb;

create table employeeDb.employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    department varchar(15),
    salary decimal(6,2)
);

drop user if exists 'mary'@'localhost';
create user 'mary'@'localhost' identified by 'secret';

grant all privileges on employeeDb.* to 'mary'@'localhost';

insert into employeeDb.employee values(1, 'Mary','River','ict',3000);
insert into employeeDb.employee values(2, 'Matt','River','admin',4000);
insert into employeeDb.employee values(3, 'Peter','Purse','finance',7000);
insert into employeeDb.employee values(4, 'Will','Guard','sec',6000);
insert into employeeDb.employee values(5, 'Layla','Ocean','ict',4400);
insert into employeeDb.employee values(6, 'Jesse','Smith',null,null);
insert into employeeDb.employee (employeeId,firstname,lastname) 
values(7, 'Vera','Jones');
insert into employeeDb.employee (employeeId,firstname,lastname,department)
values(8, 'Felix','Jones','admin');
insert into employeeDb.employee (employeeId,firstname,lastname,salary)
values(9, 'Amanda','Jones',9000);


