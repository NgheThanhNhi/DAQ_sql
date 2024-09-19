--Ex 1: 
select COUNTRY.CONTINENT, floor(avg(CITY.POPULATION))
from CITY 
INNER JOIN COUNTRY 
ON CITY.COUNTRYCODE=COUNTRY.CODE
group by CONTINENT
--Ex2
select ROUND(SUM(case when  a.signup_action = 'Confirmed' then 1 
  else 0 end)*1.00 / count(b.signup_action),2)
from  emails as a 
LEFT JOIN texts as b  
on a.email_id  = b.email_id
where e.email_id IS NOT NULL
--Ex 3:
select
b.age_bucket,
ROUND(100.0*SUM(CASE when a.activity_type='open' 
then  a.time_spent else 0 end)/sum(time_spent),1) as open_perc ,
ROUND(100.0*SUM(CASE when a.activity_type='send' 
then a.time_spent  else 0 end)/sum(time_spent),1) as send_perc
from activities as a  
inner join age_breakdown as b 
on a.user_id=b.user_id
group by b.age_bucket

--Ex 4:
SELECT a.customer_id  FROM customer_contracts as a  
INNER JOIN products as b 
ON a.product_id = b. product_id
GROUP BY customer_id 
HAVING
  COUNT(DISTINCT product_category) = 
  (SELECT COUNT(DISTINCT product_category) FROM products)
--Ex 5: 
select a.employee_id, a.name, count(b.reports_to) as reports_count, round(avg(b.age),0) as average_age
from Employees as a
inner join Employees as b 
  on a.employee_id=b.reports_to
group by a.employee_id, a.name
order by employee_id

--Ex 6:
select a.product_name, sum(b.unit) as unit from Products as a
  INNER join Orders as b 
  on a.product_id=b.product_id 
  where b.order_date>='2020-02-01' and b.order_date<='2020-02-29'
group by a.product_name
having sum(b.unit)>=100 
--Ex 7:
SELECT a.page_id
from  pages as a   
left join page_likes as b 
on a.page_id = b.page_id 
where b.page_id IS NULL
