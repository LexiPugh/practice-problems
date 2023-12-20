SELECT
  tweet_count_per_user AS tweet_bucket,
  COUNT(user_id) AS users_num
FROM (
  SELECT 
    user_id,
    COUNT(tweet_id) AS tweet_count_per_user
  FROM 
    tweets
  WHERE
    DATE_PART('year', tweet_date) = 2022
  GROUP BY
    user_id
) AS total_tweets
GROUP BY tweet_count_per_user

SELECT 
  candidate_id
FROM 
  candidates
WHERE
  skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY
  candidate_id
HAVING
  COUNT(skill) = 3
ORDER BY
  candidate_id;

SELECT
  first_name,
  last_name,
  state
FROM 
  employee_name AS n
  LEFT JOIN employee_location AS l
  ON n.person_id = l.employee_id
ORDER BY
  first_name

SELECT
  p.page_id
FROM 
  pages AS p
LEFT JOIN 
  page_likes AS l
  ON p.page_id = l.page_id
WHERE 
  l.page_id IS NULL
ORDER BY
  p.page_id

SELECT 
  country
FROM 
  big_gdp 
WHERE
  gdp_per_million > 10000000
ORDER BY
  country

SELECT 
  customer_id,
  ROUND((purchased_items/carted_items)*100, 2) AS percentage
FROM 
  shopping_cart
ORDER BY
  customer_id DESC

SELECT 
  customer_id,
  number_of_orders
FROM 
  orders
WHERE
   number_of_orders = (SELECT MAX(number_of_orders) FROM orders)

SELECT
  email,
  COUNT(email) AS email_count
FROM 
  emails
GROUP BY
  email
HAVING
  email_count > 1
ORDER BY
  email

SELECT 
  SUM(CASE 
    WHEN device_type = 'laptop' THEN 1 ELSE 0
  END) AS laptop_views,
  SUM(CASE 
    WHEN device_type in ('tablet', 'phone') THEN 1 ELSE 0 
  END) AS mobile_views
FROM 
  viewership

SELECT 
  part,
  assembly_step
FROM 
  parts_assembly
WHERE
  finish_date IS NULL

SELECT
  customer_id
FROM 
  customers
WHERE
  purchased_items IN ('M&Ms', 'Snickers', 'Twizzlers')

SELECT 
  * 
FROM 
  patients 
WHERE
  age > 50 
  AND cholesterol >= 240 
  AND weight >= 200
ORDER BY
  cholesterol DESC

SELECT 
  COUNT(DISTINCT customer_id) AS customer_count 
FROM 
  transactions
WHERE
  bill_total > 500

SELECT 
  flavor
FROM 
  ice_cream
WHERE
  community_rating > official_rating
ORDER BY
  flavor

SELECT
  first_name,
  last_name,
  CONCAT(LEFT(first_name, 3), YEAR(birth_date)) AS gamer_tag
FROM 
  gamer_tags
ORDER BY
  gamer_tag

SELECT 
  sender_id,
  COUNT(message_id) AS message_count
FROM 
  messages
WHERE
  DATE_PART('month', sent_date) = '8'
  AND DATE_PART('year', sent_date) = '2022'
GROUP BY
  sender_id
ORDER BY
  message_count DESC
LIMIT
  2

SELECT 
  city,
  COUNT(order_id) AS total_orders
FROM 
  trades AS t INNER JOIN users AS u    
  ON t.user_id = u.user_id
WHERE
  status = 'Completed'
GROUP BY
  city
ORDER BY
  total_orders DESC
LIMIT 
  3

SELECT 
  app_id,
  ROUND(100.0 * SUM(CASE
    WHEN event_type = 'click' THEN 1 ELSE 0
  END) / SUM(CASE
    WHEN event_type = 'impression' THEN 1 ELSE 0
  END), 2) AS ctr
FROM 
  events
WHERE
  DATE_PART('year', timestamp) = 2022
GROUP BY
  app_id

SELECT
  country,
  population
FROM
  country
WHERE
  population BETWEEN 50000000 AND 100000000
ORDER BY
  population