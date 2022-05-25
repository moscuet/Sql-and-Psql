use employeeDb;

select * from employee where salary is null;
select firstname from employee where department is null;
select firstname, department from employee where department is null;
select * from employee where department is not null;
select * from employee where department is not null and salary is not null;
select * from employee where department is null or salary is null;
update employee set salary=1000 where salary is null;
select * from employee;
update employee set salary=null where employeeId in (6,7,8);
select * from employee;
select count(*) as amount from employee;
select count(*) as rowCount from employee;
select count(department) from employee;
select count(firstname) from employee;
select count(firstname) as nameCount from employee;
select count(*)-count(department) as "department missing" from employee;
select count(*) as deptMissing from employee where department is null;
select count(department) as dm from employee where department is null;
select lastname, count(*) as amount from employee group by lastname;
select lastname, count(*) as amount from employee group by lastname order by amount;
select lastname, count(*) as amount from employee group by lastname order by amount desc;
select lastname, count(*) as amount from employee group by lastname having lastname in ('Jones','River');
select avg(salary) as average from employee;
select min(salary) as minimum, max(salary) as maximum from employee;
select max(salary)-min(salary) as difference from employee;

select firstname, lastname, salary, case when salary>6000 then 'top worker' else '-' end as notes
from employee order by salary desc, lastname,firstname;

select firstname,lastname,salary, case 
when salary=(select min(salary) from employee) then 'min' 
when salary=(select max(salary) from employee) then 'max' 
when salary is null then 'missing' 
else ' ' end as minmax 
from employee order by lastname asc;

update employee set salary=4000 where firstname='Will';

select firstname,lastname,salary, case 
when salary=(select min(salary) from employee) then 'min' 
when salary=(select max(salary) from employee) then 'max' 
when salary is null then 'missing' 
else ' ' end as minmax 
from employee order by lastname asc;