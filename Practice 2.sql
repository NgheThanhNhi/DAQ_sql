--Ex 1:
Select Distinct CITY from STATION
where ID%2=0 
--Ex 2:
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION 
--Ex 3
--Ex 5:
SELECT candidate_id ,
count(skill) as number_of_skill
from candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING count(skill)>2
--Ex 6: 
SELECT distinct user_id,
date(max(post_date))-date(min(post_date)) as days_between
from posts
where post_date >= '2021-01-01' and post_date<'2021-02-01'
group by user_id
having count(post_id)>=2
--EX 7:
SELECT card_name,
MAX (issued_amount)- MIN (issued_amount) as number_differences
FROM monthly_cards_issued 
group by card_name
--Ex 8:
SELECT DISTINCT  manufacturer, 
count (drug) as number_of_drug,
sum (total_sales-cogs) ,
abs(sum (total_sales-cogs)) as loss
from pharmacy_sales
where total_sales-cogs <= 0
group by manufacturer
order by sum (total_sales-cogs) DESC
--Ex 9:
select * from Cinema
where rating > 8.6
order by rating DESC
--Ex 10:
select teacher_id,
Count(distinct subject_id) as cnt
from Teacher
group by teacher_id 
--Ex 11:
select user_id,
count(follower_id) as followers_count 
from Followers
group by user_id
order by user_id
--Ex 12: dữ liệu kỳ quá ạ
