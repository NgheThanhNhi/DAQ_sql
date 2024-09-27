--Ex 1:
SELECT EXTRACT(year FROM transaction_date) AS transaction_year,
  product_id,
spend AS curr_year_spend,
LAG(spend) OVER (PARTITION BY product_id 
    ORDER BY EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend,
  ROUND(100.00 * (spend - LAG(spend) OVER (PARTITION BY product_id 
    ORDER BY EXTRACT(YEAR FROM transaction_date))) / 
    LAG(spend) OVER (PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date)), 2) AS yoy_rate
FROM user_transactions
--Ex 2:
SELECT DISTINCT card_name, 
first_value(issued_amount) OVER(PARTITION BY card_name ORDER BY make_date(issue_year,issue_month,'01')) as amount
FROM monthly_cards_issued
ORDER BY amount DESC
--Ex 3: 
WITH ranked_transactions AS (
SELECT user_id, spend, transaction_date,
row_number() OVER (PARTITION BY user_id ORDER BY transaction_date) AS rank
 FROM transactions)
SELECT user_id, spend, transaction_date
FROM ranked_transactions
WHERE rank = 3
--Ex 4: 
WITH cte AS (SELECT *,
 rank() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS rank
FROM user_transactions)
SELECT transaction_date, user_id, COUNT(product_id) AS count
FROM cte
WHERE rank = 1
GROUP BY transaction_date, user_id
--Ex 5:
select user_id,    
tweet_date,ROUND(AVG(tweet_count) OVER (PARTITION BY user_id     
ORDER BY tweet_date     
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg_3d
FROM tweets tweet_date
--ex 6:
  SELECT 
    COUNT(merchant_id) AS payment_count
FROM ( SELECT  merchant_id, 
EXTRACT(EPOCH FROM transaction_timestamp - LAG(transaction_timestamp) OVER(
PARTITION BY merchant_id, credit_card_id, amount  
ORDER BY transaction_timestamp)) / 60 AS minute_difference FROM transactions) AS subquery
WHERE minute_difference <= 10
--Ex 7:
SELECT category, product, total_spend 
from (SELECT product, category, SUM(spend) as total_spend  from product_spend
where category = 'appliance'
group by product, category
order by SUM(spend) DESC 
LIMIT 2
UNION ALL
SELECT product,  category, 
SUM(spend) AS total_spend 
FROM product_spend where category = 'electronics'
gROUP BY product, category
order by SUM(spend) desc
LIMIT 2
) as combined_results
order by category, total_spend DESC
--Ex 8:
SELECT 
a.artist_name, c.rank,
DENSE_RANK() OVER (ORDER BY c.rank) AS music_rank
FROM artists a
JOIN songs b ON a.artist_id = b.artist_id
JOIN global_song_rank c ON b.song_id = c.song_id
