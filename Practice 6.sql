with companies_app as (select
company_id, title, description,
count(company_id) as number_cnt
FROM job_listings
group by company_id, title, description
having count(company_id)> 1 )
select count (distinct company_id) as duplicate_companies
from companies_app
where number_cnt > 1
