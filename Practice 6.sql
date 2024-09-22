with companies_app as (select
company_id, title, description,
count(company_id) as number_cnt
FROM job_listings
group by company_id, title, description
having count(company_id)> 1 )
select count (distinct company_id) as duplicate_companies
from companies_app
where number_cnt > 1

--Ex 2: 
with num_appli as (SELECT product, category,
SUM(spend) as total_spend from product_spend
where category='appliance'
group by product, category
order by SUM(spend) DESC limit 2),
num_elec as (SELECT product, category,
SUM(spend) as total_spend from product_spend
where category='electronics'
group by product, category
order by  SUM(spend) DESC limit 2)

select  category, product, total_spend 
from num_appli
UNION
select category, product, total_spend  
from num_elec
order by category, total_spend DESC -----Hong hiểu sao lúc em submit nó vẫn báo sai cho cái hàng refrigerator nó khác số ạ

--Ex 3:
with number as (select policy_holder_id,
count(policy_holder_id) as number_claims
FROM callers
group by policy_holder_id
having count(policy_holder_id)>= 3 )
select count (distinct policy_holder_id) as duplicate_companies
from number
where number_claims >= 3
--Ex 4:
select page_id from pages
where page_id not in (select page_id
from page_likes 
where page_id is not null)

--Ex 5:
WITH active_users AS (
  SELECT user_id, EXTRACT(MONTH FROM event_date) AS working_month
  FROM user_actions
  WHERE EXTRACT(MONTH FROM event_date) IN (6, 7)
  GROUP BY user_id, working_month
)
SELECT working_month, COUNT(DISTINCT user_id) AS monthly_active_users
FROM active_users
WHERE working_month = 7
AND user_id IN (
  SELECT user_id
  FROM active_users
  WHERE working_month = 6
)
GROUP BY working_month
--Ex 6: 
SELECT DISTINCT 
TO_CHAR(trans_date, 'yyyy-mm') AS month, country,
COUNT(id) AS trans_count,
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(amount) as trans_total_amount,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY country, month
--Ex 7:
WITH ranked_sales AS (SELECT product_id, 
year AS first_year,  
ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY year) AS rn
FROM Sales)
SELECT a.product_id, a.first_year, b.quantity, b.price
FROM ranked_sales AS a
LEFT JOIN Sales AS b
ON a.product_id = b.product_id AND a.first_year = b.year
WHERE a.rn = 1
--Ex 8:
SELECT customer_id 
from Customer
GROUP BY customer_id 
HAVING  count(DISTINCT(product_key)) = (select count(DISTINCT(product_key)) from Product )
--Ex 9:
select employee_id
from Employees 
where salary<30000 
and manager_id is not null
and manager_id not in (select employee_id from Employees ) group by employee_id
--Ex 10:
--em không nhấn đc vào link ạ, nó cứ ra link của bài 1 job listings ý
--Ex 11:
  with best_rater as (select user_id,count(rating) 
as film_rater from  MovieRating
group by user_id)

(select  b.name as results
from MovieRating as a
left join
Users as b
on a.user_id=b.user_id
group by a.user_id, b.name
having count(rating)= (select max(film_rater) from best_rater)
order by b.name ASC 
limit 1)
union all
(select b.title as results
from MovieRating as a
left join Movies as b
on a.movie_id=b.movie_id
where rating=(select max(rating) from MovieRating))

  
--Ex 12: 
with connection as (select accepter_id as id,
count (requester_id) as friend
from RequestAccepted
group by accepter_id
union all
select requester_id as id,
count (accepter_id) as friend
from RequestAccepted
group by requester_id)
select id, sum (friend) as num from
connection
group by id
