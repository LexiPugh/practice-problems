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

SELECT 
  store_id,
  ROUND(AVG(revenue), 2) AS revenue
FROM 
  stores
GROUP BY
  store_id
HAVING
  AVG(revenue) > 1000000
ORDER BY
  store_id

SELECT 
  country,
  population,
  square_kilometers
FROM 
  countries
WHERE
  square_kilometers >= 3000000
  OR population >= 100000000
ORDER BY
  country

SELECT
  video_id
FROM 
  youtube_videos
WHERE
  (thumbs_up / (thumbs_up + thumbs_down) * 100 ) < 55
ORDER BY
  video_id

SELECT
  card_name,
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM 
  monthly_cards_issued
GROUP BY
  card_name
ORDER BY
  difference DESC

SELECT 
  ROUND(CAST(SUM(item_count * order_occurrences) 
  / SUM(order_occurrences) AS numeric), 1) AS mean
FROM 
  items_per_order

SELECT 
  user_id,
  MAX(post_date::date) - MIN(post_date::date) AS days_between
FROM
  posts
WHERE
  DATE_PART('year', post_date) = 2021
GROUP BY
  user_id
HAVING
  COUNT(user_id) >= 2

SELECT 
  e.user_id
FROM 
  emails AS e INNER JOIN texts AS t
  ON e.email_id = t.email_id
WHERE
  t.action_date = e.signup_date + INTERVAL '1 day'
  AND t.signup_action = 'Confirmed'

SELECT 
  device_id,
  MIN(date_played) AS earliest_date
FROM 
  devices
WHERE
  game = 'League of Legends'
GROUP BY
  device_id
ORDER BY
  earliest_date

SELECT 
  *,
  ((car_price - production_cost) * cars_sold) AS profit
FROM 
  tesla_models
ORDER BY
  profit DESC
LIMIT
  1

SELECT 
  CEIL(AVG(Salary - REPLACE(Salary, '0', ''))) AS amount_error
FROM
  EMPLOYEES

SELECT 
  CONCAT(Name, '(', LEFT(Occupation, 1), ')')
FROM 
  OCCUPATIONS 
ORDER BY 
  Name;

SELECT 
  CONCAT('There are a total of ', COUNT(Occupation), " ", LOWER(Occupation), "s.") as total FROM OCCUPATIONS 
GROUP BY
  Occupation 
ORDER BY 
  total

SELECT
  product_name,
  ROUND(((sales_price - purchase_price) * 0.93), 2) AS profit
FROM 
  products
ORDER BY
  profit DESC,
  product_name ASC

SELECT
  employee_id
FROM 
  employees 
ORDER BY
  birth_date ASC
LIMIT
  3

SELECT 
  * 
FROM 
  phone_numbers
WHERE
  LEFT(numbers, 3) = 701

SELECT
  restaurant,
  COUNT(comment) AS comment_count,
  AVG(rating) AS average_rating
FROM 
  restaurant_reviews
GROUP BY
  restaurant
ORDER BY
  comment_count DESC,
  average_rating DESC
LIMIT
  1

SELECT 
  * ,
  ABS(tomato_rating - user_rating) AS rating_difference
FROM 
  ratings
ORDER BY
  rating_difference DESC
LIMIT
  1

SELECT 
  owner_name,
  vehicle
FROM 
  inspections 
WHERE
  minor_issues <= 3
  AND critical_issues < 1
ORDER BY
  owner_name

SELECT 
  class,
  AVG(grade) AS average_grade
FROM 
  classes
GROUP BY
  class
ORDER BY
  average_grade DESC

SELECT 
  address
FROM 
  homes
WHERE 
  year >= 2012 
  AND year <= 2017