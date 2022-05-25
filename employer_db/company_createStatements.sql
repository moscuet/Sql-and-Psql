drop database if exists companydb;
create database companydb;

use companydb;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(20) not null,
    departmentFloor varchar(15) not null
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    salary decimal(6,2) not null,
    departmentNumber integer not null,
    foreign key (departmentNumber) references department(departmentId)
);

insert into department values(1,'ict', 'basement');
insert into department values(2, 'admin','top floor');
insert into department values(3,'secr','bunker');

insert into employee values(1,'Mary','River',3000,1);
insert into employee values(2, 'Matt','River',4000,1);
insert into employee values(3, 'Amanda','Smith',7000,2);
insert into employee values(4, 'Joe', 'Doe',9000,3);

drop user if exists 'bigboss'@'localhost';
create user 'bigboss'@'localhost' identified by 'secret';

grant all privileges on companydb.* to 'bigboss'@'localhost';

select * from department;
select * from employee;
select salary from employee where firstname='Mary' and lastname='River';
select departmentName from employee, department where departmentNumber=departmentId;

select departmentName from employee, department 
where departmentNumber=departmentId and firstname='Mary';

select departmentName from employee, department 
where employee.departmentNumber=department.departmentId and firstname='Mary';
