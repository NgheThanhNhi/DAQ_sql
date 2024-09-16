--Ex 1:
SELECT
COUNT (CASE 
      WHEN device_type='tablet' OR device_type='phone' THEN 'mobile_views'
 
      END) AS mobile_views,
COUNT (CASE
WHEN device_type='laptop' then 'laptop_views'
END) as laptop_views 
      from viewership
--Ex 2: 
SELECT x,y,z,
CASE WHEN x+z>y and  x+y>z  then 'Yes'
else 'No'
END as Triangle
from Triangle
--Ex 3:
 SELECT 
 ROUND( 100.0 *SUM(CASE 
WHEN call_category IS NULL OR call_category = 'n/a' THEN 1 ELSE 0 END) 
/ COUNT(*), 1) AS pct_uncategorized
FROM callers

--Ex 4:
 select name
from Customer
where referee_id is NULL or referee_id= 1
  
--Ex 5:
select survived,
SUM (CASE
WHEN pclass=1 THEN 1 
ELSE 0
END) as first_class,
SUM (CASE
WHEN pclass=2 THEN 1 
ELSE 0
END) as second_class,
SUM (CASE
WHEN pclass=3 THEN 1 
ELSE 0
END) as third_class
from titanic
group by  survived


