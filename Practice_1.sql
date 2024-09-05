select NAME from CITY
where COUNTRYCODE="USA" and POPULATION>120000

select * from CITY
where COUNTRYCODE="JPN" 

select CITY, STATE from STATION

select distinct CITY from STATION
where CITY like 'A%' or CITY like 'E%' or CITY like 'I%' or CITY like 'O%' or CITY like 'U%'

select advertising_channel from uber_advertising
where year=2019 and money_spent>100000
