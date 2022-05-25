use flowerdb;
insert into flower values(4, 'rose', 'half shadow',	8, 10);
insert into flower values(2, 'mushroom', 'sunny', 9, 7);
insert into flower values(6, 'toadstool', 'bucket', 10, 30);
insert into flower values(5, 'tulip', 'shady', 4, 15);
insert into flower values(1, 'lily-of-the-valley','rocky', 2, 20);
insert into flower values(7, 'marigold','swamp', 7, 25);
insert into flower values(3, 'violet',	'garage', 3, 100);

-- select
select * from flower;
select name, unitPrice, flowerId from flower;
select * from flower where unitPrice = 8;
select * from flower where stock = 7;
select * from flower where stock = 20;

-- update data

update flower set site='sunny',  unitPrice = 3 where flowerID=5;
select * from flower where flowerID =5;

update flower set name='tulip', stock = 25 where flowerID=6;
select * from flower where flowerID =6;

update flower set site='half shadow', stock = 7 , unitPrice = 4 where flowerID=5;
select * from flower where flowerID =5;

update flower set name ='lily-of-the-valley', site= 'shady' , unitPrice = 5 where flowerID = 7;
select * from flower where flowerID =7;

-- delet data

delete from flower where flowerID = 7;
delete from flower where flowerID = 6;
delete from flower where name = 'rose';
insert into flower values(8, 'randomflower','swamp', 15, 30);
select * from flower;

delete from flower where site = 'swamp' or unitPrice = 5;
select * from flower;

delete from flower where unitPrice = 9 or site = 'sunny' or name =  'violet';
select * from flower;



-- mysql<Rahman_Mostafizur_flower_sqlStatements.sql;