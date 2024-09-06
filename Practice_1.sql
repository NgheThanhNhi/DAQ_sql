--Ex1:
select NAME from CITY
where COUNTRYCODE="USA" and POPULATION>120000
--Ex2:
select * from CITY
where COUNTRYCODE="JPN" 
--Ex3:
select CITY, STATE from STATION
--Ex4:
select distinct CITY from STATION
where CITY like 'A%' or CITY like 'E%' or CITY like 'I%' or CITY like 'O%' or CITY like 'U%'
order by id ASC 
--Ex5:
select distinct CITY from STATION
where CITY like '%A' or CITY like '%E' or CITY like '%I' or CITY like '%O' or CITY like '%U'
--Ex6:
select distinct CITY from STATION
where not (CITY like 'A%' or CITY like 'E%' or CITY like 'I%' or CITY like 'O%' or CITY like 'U%')
--Ex7:
select name from Employee
order by name ASC
--Ex8:
select name from Employee
where salary >2000 and months <10
order by employee_id ASC
--Ex9:
select product_id from Products
where low_fats='Y' and recyclable='Y'
--Ex10:
select name from Customer
where referee_id=1 or referee_id is NULL 
--Ex11:
select name, population, area from World
where population >=25000000 
--Ex12:
select distinct author_id as "id" from Views
where author_id= viewer_id 
--Ex13:
SELECT part, assembly_step from parts_assembly
where finish_date is NULL
--Ex14:
select * from lyft_drivers
where 30000> yearly_salary or yearly_salary >70000 
--Ex15:
select advertising_channel from uber_advertising
where year=2019 and money_spent>100000


