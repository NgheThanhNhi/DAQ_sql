--Ex 1:
select Name
from STUDENTS 
where Marks>75
Order by right(Name,3), ID
--Ex 2:
select user_id,  
UPPER(LEFT(name,1)) || LOWER(SUBSTRING(name from 2 for 5)) as name
from Users
--Ex 3: 
SELECT manufacturer,
'$' || '' || ROUND(total_sales/1000000,0) || ' ' || 'million' as sale
FROM pharmacy_sales
--Ex 4: 
SELECT product_id, 
ROUND(avg(stars),2) as avg_stars,
EXTRACT(month from submit_date) as mth
FROM reviews
group by product_id, submit_date
--Ex 5:
SELECT sender_id,
COUNT(message_id) as message_counts
from messages
where extract(month from sent_date)=8
and extract (year from sent_date)=2022
group by sender_id
order by message_counts DESC
limit 2
--Ex 6:
select tweet_id
from Tweets
where
length(content)>15
--Ex 8:
select 
COUNT(id) as number_of_employees
from employees
where  EXTRACT(month from joining_date) between 1 and 7
and extract(year from joining_date)=2022
--Ex 9:
select 
POSITION('a'in first_name) as position
from worker
where first_name='Amitah'
--Ex 10: 
select 
substring(title, length(winery)+2, 4) as vintage_years
    from winemag_p2
    where country='Macedonia'



