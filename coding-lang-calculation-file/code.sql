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


SELECT
  Name
FROM
  STUDENTS
WHERE 
  Marks > 75
ORDER BY 
  RIGHT(Name, 3) ASC,
  ID


SELECT
  ROUND(SUM(lost_revenue_millions), 0) AS total_revenue_lost
FROM 
  sales


SELECT 
  customer_id
FROM 
  customers
WHERE
  TIMESTAMPDIFF(YEAR, birth_date, '2023-01-01') >= 55
ORDER BY
  customer_id


SELECT 
  *,
  CASE
    WHEN batting_average > 0.37 THEN "Great Hitter"
    WHEN batting_average < 0.27 THEN "Below Average"
    ELSE "Average"
  END AS "skill_level"
FROM 
  players


SELECT 
  gender,
  ROUND(AVG(total_purchase), 2) AS avg_purchase_price
FROM 
  purchases
GROUP BY
  gender
ORDER BY
  gender


SELECT 
  patient_id,
  ROUND(weight_pounds/(POWER(height_inches, 2)) * 703, 1) AS BMI
FROM 
  patients
HAVING
  BMI > 30


SELECT 
  drug,
  (total_sales - cogs) AS profit
FROM 
  pharmacy_sales
ORDER BY
  profit DESC
LIMIT
  3


SELECT 
  manufacturer,
  COUNT(drug) AS drug_count,
  ABS(SUM(total_sales - cogs)) AS total_loss
FROM 
  pharmacy_sales
WHERE 
  total_sales - cogs <= 0
GROUP BY
  manufacturer
ORDER BY
  total_loss DESC


SELECT 
  manufacturer,
  CONCAT('$' , ROUND((SUM(total_sales)/1000000), 0), ' million') AS total_sales
FROM 
  pharmacy_sales
GROUP BY
  manufacturer
ORDER BY
  SUM(total_sales) DESC,
  manufacturer ASC


SELECT 
  bread_name,
  meat_name
FROM 
  bread_table
  CROSS JOIN meat_table
ORDER BY
  bread_name, 
  meat_name


SELECT 
  LEFT(id, 5) AS fixed_id,
  SUBSTRING(id, 6) AS fixed_name
FROM 
  bad_data


SELECT 
  DISTINCT customer_id
FROM 
  transactions
ORDER BY
  customer_id


SELECT
  region
FROM 
  food_regions
GROUP BY 
  region
ORDER BY
  SUM(fast_food_millions) DESC
LIMIT
  1


SELECT 
  u.user_id
FROM 
  users AS u INNER JOIN orders AS o
  ON u.user_id = o.buyer_id
WHERE
  YEAR(u.join_date) = 2022
  AND YEAR(o.order_date) = 2022
ORDER BY
  u.user_id


SELECT 
  employee_id, 
  name
FROM 
  employee 
WHERE 
  employee_id NOT IN (SELECT emp_id FROM bonus)
ORDER BY
 employee_id 


SELECT 
  (COUNT(pizza_order) * (0.50 * 2)) - (COUNT(pizza_order) * (0.50 * 1.5)) AS money_saved
FROM 
  orders
WHERE
  pizza_order = 'Pepperoni'


SELECT 
  ROUND((COUNT(has_member_card)/COUNT(kroger_id)) *100, 2) AS member_percentage
FROM 
  customers


SELECT 
  ROUND(AVG(bike_price), 2) AS average_sale_price
FROM 
  inventory
WHERE 
  bike_price IS NOT NULL
  AND bike_sold = "Y"


SELECT 
  pollutant,
  ROUND(AVG(concentration), 2) AS avg_concentration
FROM 
  pollution
GROUP BY
  pollutant
HAVING
  AVG(concentration) > 0.5
ORDER BY
  pollutant


SELECT 
  *,
  CASE
    WHEN pay_level = 1 THEN (salary * 1.1)
    WHEN pay_level = 2 THEN (salary * 1.15)
    ELSE (salary * 3)
  END AS new_salary
FROM 
  employees


SELECT 
  post_id,
  (actions/impressions)*100 AS popularity_score
FROM 
  linkedin_posts
HAVING
  popularity_score >= 1
ORDER BY
  popularity_score DESC


SELECT 
  CASE
    WHEN response = "Yes" THEN "Y"
    WHEN response = "No" THEN "N"
    ELSE response
  END AS response_fixed
FROM 
  responses


SELECT
  drug_name,
  money_spent,
  money_made,
  ABS(ROUND((money_made - money_spent), 1)) AS money_lost
FROM 
  big_pharma 
WHERE
  money_made - money_spent < 0
ORDER BY
  money_lost DESC
LIMIT 
  3


SELECT 
  customer_id 
FROM 
  purchases
GROUP BY
  customer_id
HAVING
  SUM(order_total) < 250
  OR COUNT(customer_id) <= 2


SELECT 
  country,
  ROUND(SUM(carbon_emissions_millions), 1) AS total_emissions
FROM 
  greenhouse_gases
GROUP BY
  country
ORDER BY
  total_emissions DESC
LIMIT
  1


SELECT 
  company 
FROM 
  companies
WHERE
  year >= DATE_SUB('2023-01-01', INTERVAL 3 YEAR)
GROUP BY 
  company
HAVING
  SUM(profit) > 20000000
ORDER BY
  company


SELECT 
  employee_id,
  SUM(amount_spent) AS total_amount_spent,
  CASE
    WHEN SUM(amount_spent)-100 > 0 THEN SUM(amount_spent)-100
    ELSE 0
  END AS amount_owed
FROM 
  crew_spending
GROUP BY
  employee_id
ORDER BY
  amount_owed DESC,
  employee_id


SELECT 
  candidate_id
FROM 
  candidates
WHERE
  problem_solving IS NOT NULL
  AND sql_experience IS NOT NULL
  AND domain_knowledge IS NOT NULL
  AND (python IS NOT NULL OR r_programming IS NOT NULL)


SELECT 
  customer_id,
  name,
  email
FROM 
  gmail_users
WHERE
  email LIKE '%@gmail.com'
ORDER BY
  customer_id ASC


SELECT 
  user_id,
  AVG(minutes_per_session) AS avg_time_gaming
FROM 
  sessions
WHERE
  activity = 'Gaming'
GROUP BY
  user_id
ORDER BY
  user_id


SELECT 
  * 
FROM 
  uber_income
WHERE
  income <= 10000
  OR income > 65000
ORDER BY
  income DESC


SELECT 
  first_name,
  last_name
FROM 
  students
WHERE 
  grade = 'A'
  OR grade = 'B'
ORDER BY
  first_name,
  last_name


SELECT
  team 
FROM 
  football
WHERE
  points_scored > 400
  AND penalties <= 80


SELECT
  animal,
  region,
  average_weight
FROM 
  animals_main
UNION
SELECT
  animal,
  region,
  average_weight
FROM 
  animals_secondary
ORDER BY
  animal


SELECT 
  COUNT(bike_id) AS needs_replacement
FROM 
  bikes
WHERE
  miles >= 10000


SELECT 
  product_name
FROM 
  bakery_items
WHERE
  product_name LIKE '%Chocolate%'


SELECT
  store_id,
  AVG(revenue_millions) AS average_revenue
FROM 
  revenue
GROUP BY
  store_id
ORDER BY
  average_revenue DESC


SELECT 
  COUNT(customer_id) AS received_discount
FROM 
  customers
WHERE
  age > 65
  OR total_purchase > 200


SELECT 
  date_visited,
  COUNT(DISTINCT(visitor_id)) AS unique_visitors
FROM 
  web_traffic
GROUP BY
  date_visited
ORDER BY
  date_visited ASC


SELECT 
  company_name,
  COUNT(CASE WHEN year = 2023 THEN 1 END) - COUNT(CASE WHEN year = 2022 THEN 1 END) AS difference
FROM 
  products
GROUP BY
  company_name
ORDER BY
  company_name


SELECT 
  MONTH(date) AS month,
  SUM(profit) AS total_profit
FROM 
  profits
GROUP BY
  month
HAVING
  month <= 6
  AND total_profit > 0
ORDER BY
  total_profit DESC


SELECT 
  year_played,
  SUM(season_attendance) AS total_attendance
FROM 
  football_attendance 
GROUP BY
  year_played
ORDER BY
  total_attendance DESC
LIMIT 1


SELECT 
  company,
  ROUND((employees_fired / company_size) * 100, 2) AS pct_employees_fired
FROM 
  tech_layoffs
GROUP BY
  company
ORDER BY
  company


SELECT 
  customer_id,
  ABS(200 - storage_used) AS fees
FROM 
  cloud_storage
WHERE
  storage_used > 200
ORDER BY
  fees DESC


SELECT 
  customer_id
FROM 
  purchases
GROUP BY
  customer_id
HAVING 
  COUNT(DISTINCT product_id) = 4


SELECT 
  computer_id
FROM 
  computer_replacement
WHERE
  date_activated < DATE_SUB("2023-01-01", INTERVAL 5 YEAR)


SELECT 
  *,
  CASE
    WHEN laptop_name LIKE '%SSD%' THEN 'SSD'
    ELSE 'HDD'
  END AS storage_type
FROM 
  laptops
ORDER BY
  laptop_id


SELECT 
  u.first_name
FROM 
  user_time AS ut INNER JOIN users AS u
  ON ut.user_id = u.user_id
WHERE
  ut.media_time_minutes > (SELECT AVG(media_time_minutes) FROM user_time)
ORDER BY
  u.first_name


SELECT 
  student_name,
  grade,
  DENSE_RANK() OVER (ORDER BY grade DESC) AS ranks
FROM 
  grades
ORDER BY
  ranks,
  student_name


SELECT 
  customer_id,
  SUBSTRING_INDEX(full_name, ' ', 1 ) AS first_name
FROM 
  customers


SELECT 
  c.name
FROM 
  customers AS c INNER JOIN date_viewed AS d
  ON c.customer_id = d.customer_id
GROUP BY
  c.name
ORDER BY
  COUNT(d.movie_id) DESC
LIMIT
  1


SELECT
  (COUNT(CASE WHEN YEAR(date_left) = 2022 THEN 1 ELSE NULL END) / COUNT(date_started)) * 100 AS employee_turnover_pct
FROM 
  employee_turnover


SELECT
  employee_name,
  COUNT(full_time) AS num_jobs
FROM
  ( SELECT 
      * 
    FROM 
      job_two
    UNION
    SELECT
      *
    FROM
      job_one ) AS job_data
WHERE
  full_time = 'Y'
GROUP BY 
  employee_name
HAVING 
  num_jobs = 2


SELECT 
  a.employee_name,
  b.employee_name AS boss_name
FROM 
  boss AS a LEFT JOIN boss AS b
  ON a.boss_id = b.employee_id
ORDER BY
  employee_name


SELECT 
  m.managers_id,
  e.position AS managers_position,
  COUNT(m.managers_id) AS direct_reports
FROM 
  direct_reports AS m JOIN direct_reports AS e
  ON m.managers_id = e.employee_id
WHERE
  e.position LIKE '%Manager%'
GROUP BY
  m.managers_id,
  e.position


SELECT 
  order_id
FROM 
  amazon_returns
GROUP BY
  order_id
HAVING
  (SUM(product_price) * 0.15) <= SUM(estimated_return_price)


SELECT 
  e.employee_id,
  e.department,
  o.old_salary,
  ROUND(o.old_salary * 1.15, 2) AS new_salary
FROM 
  employee_raise AS e
  JOIN (SELECT department, MIN(salary) AS old_salary 
        FROM employee_raise 
        GROUP BY department) AS o
  ON e.department = o.department AND e.salary = o.old_salary
GROUP BY
  department
ORDER BY
  new_salary DESC


SELECT
  d.employee_id,
  CASE
    WHEN SUM(d.deal_size) > s.quota THEN 'yes'
    ELSE 'no'
  END AS made_quota
FROM 
  deals AS d INNER JOIN sales_quotas AS s 
  ON d.employee_id = s.employee_id
GROUP BY
  d.employee_id,
  s.quota
ORDER BY
  d.employee_id


SELECT
  COUNT(company_id) AS duplicate_companies
FROM
  (SELECT 
    company_id,
    title,
    description,
    COUNT(job_id) AS number_of_jobs
  FROM 
    job_listings
  GROUP BY
    company_id,
    title,
    description) AS duplicate_listings
WHERE
  duplicate_listings.number_of_jobs > 1


SELECT 
  name, 
  movie_name, 
  view_date
FROM 
  date_viewed AS dv
  INNER JOIN customers AS c ON dv.customer_id = c.customer_id
  INNER JOIN movienames AS mn ON dv.movie_id = mn.movie_id
ORDER BY 
  view_date, 
  movie_name


SELECT 
  gender,
  dates,
  points,
  SUM(points) OVER(PARTITION BY gender ORDER BY dates, points) AS running_total
FROM 
  points


SELECT 
  TRIM(SUBSTRING_INDEX(address, '-', 1)) AS street,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(address, '-', 2), '-', -1)) AS city,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(address, '-', 3), '-', -1)) AS state,
  TRIM(SUBSTRING_INDEX(address, '-', -1)) AS zip_code
FROM addresses


SELECT 
  p.first_name,
  p.last_name,
  CASE
    WHEN c.email IS NULL THEN CONCAT(LOWER(first_name), '.', LOWER(last_name), '@gmail.com')
    ELSE c.email
  END AS new_email
FROM 
  people AS p INNER JOIN contacts AS c
  ON p.id = c.id
ORDER BY
  new_email


SELECT
  artist_id,
  SUM(score) AS total_score,
  RANK() OVER(ORDER BY SUM(score) DESC) AS rank_num
FROM 
  rankings
GROUP BY
  artist_id
ORDER BY
  rank_num,
  artist_id


SELECT 
  name 
FROM 
  employee_info
WHERE
  end_of_year_review_rating <= 5
  AND (tasks_completed/tasks_assigned) * 100 < 75
ORDER BY
  name


SELECT 
  employee_name,
  (SUM(CASE WHEN call_outcome = 'Y' THEN 1 ELSE 0 END)/COUNT(*)) * 100 AS pct_resolved
FROM 
  help_desk_manager
GROUP BY
  employee_name
ORDER BY
  employee_name


SELECT 
  medication,
  rec_dosage
FROM 
  medication_information
UNION ALL
SELECT
  medication_name,
  recommended_dosage
FROM
  med_list
ORDER BY
  medication


SELECT 
  department,
  first_name,
  last_name,
  salary,
  AVG(salary) OVER(PARTITION BY department) dept_avg
FROM 
  employee_salary
ORDER BY
  department ASC,
  salary DESC


SELECT
  date
FROM (
  SELECT 
    date,
    temperature AS temp,
    LAG(temperature) OVER(ORDER BY date ASC) AS previous_temp
  FROM 
    temperatures
) AS temp_table
WHERE
  temp > previous_temp
ORDER BY
  date


SELECT
  customer_id,
  transaction_id,
  amount,
  (amount * 0.67) AS discounted_amount
FROM (
  SELECT 
    customer_id, 
    transaction_id,
    amount,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY transaction_id ASC) AS row_num
  FROM 
    purchases
  ) AS temp_table
WHERE
  row_num = 3
ORDER BY
  customer_id ASC


SELECT 
  ROUND(right_vote / (right_vote + left_vote) * 100, 2) AS Right_Twix_Percentage,
  ROUND(left_vote / (right_vote + left_vote) * 100, 2) AS Left_Twix_Percentage
FROM 
  candy_poll


SELECT 
  owner_name,
  CASE 
    WHEN MIN(all_walks) < 5 THEN 'Bad Owner'
    ELSE 'Good Owner'
  END AS owner_type
FROM (
  SELECT
    owner_name,
    dog_name,
    SUM(times_walked) AS all_walks
  FROM
    walks
  GROUP BY
    owner_name,
    dog_name
) AS temp_table
GROUP BY
  owner_name
ORDER BY
  owner_name ASC


SELECT
  student_name,
  class_id,
  grade
FROM (
  SELECT 
    student_name,
    class_id,
    grade,
    ROW_NUMBER() OVER(PARTITION BY student_name ORDER BY grade DESC, class_id ASC) AS grade_rank
  FROM 
    highest_grade
) AS temp_table
WHERE
  grade_rank = 1
ORDER BY
  student_name ASC


SELECT
  department_name,
  employee_name,
  salary
FROM (
  SELECT 
    d.department_name,
    e.employee_name,
    e.salary,
    ROW_NUMBER() OVER(PARTITION BY department_name ORDER BY salary DESC) AS row_num
  FROM 
    departments AS d INNER JOIN employees AS e
    ON d.department_id = e.department_id
  ) AS temp_table
WHERE 
  row_num = 2


SELECT
  company_id,
  employee_id,
  department,
  CASE
    WHEN total_salary > 200000 THEN (salary * 0.9)
    WHEN total_salary <= 99000 THEN (salary * 0.6)
    ELSE (salary * 0.75) 
  END AS taxed_salary
FROM (
  SELECT 
    company_id,
    employee_id,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY company_id) AS total_salary
  FROM
    taxes) AS temp_table


SELECT
  property_id,
  profit,
  SUM(profit) OVER(ORDER BY purchase_price ASC) AS profit_running_total
FROM(
  SELECT
    property_id,
    purchase_price,
    (estimated_sale_price - purchase_price) AS profit
  FROM 
    investment_property) AS temp_table


SELECT 
  COUNT(check_out) AS past_check_out
FROM 
  hotel_guests
WHERE 
  TIME(check_out) > '10:00:00'


SELECT 
  MONTH(transaction_date) AS month,
  country AS country,
  SUM(CASE WHEN state = 'Approved' THEN 1 ELSE 0 END) AS approved_transactions,
  SUM(CASE WHEN state = 'Approved' THEN amount ELSE 0 END) AS approved_amount,
  SUM(CASE WHEN state = 'Declined' THEN 1 ELSE 0 END) AS chargebacks,
  SUM(CASE WHEN state = 'Declined' THEN amount ELSE 0 END) AS chargeback_amount
FROM 
  transactions
GROUP BY
  month,
  Country
ORDER BY
  month ASC


SELECT 
  type,
  SUM(CASE WHEN state = 'Completed' THEN 1 ELSE 0 END) AS completed_requests,
  SUM(CASE WHEN state <> 'Completed' THEN 1 ELSE 0 END) AS incomplete_requests,
  SUM(CASE WHEN state = 'Completed' THEN 1 ELSE 0 END) / (SUM(CASE WHEN state = 'Completed' THEN 1 ELSE 0 END) + SUM(CASE WHEN state <> 'Completed' THEN 1 ELSE 0 END)) * 100 AS pct_complete
FROM 
  help_requests
GROUP BY
  type


SELECT
  user_id
FROM 
  users
WHERE
  user_id NOT IN (
  SELECT
    user_id
  FROM 
    users
  WHERE
    activity_date > '2022-01-01'
  )
GROUP BY
  user_id
ORDER BY 
  user_id


SELECT
  *
FROM (
  SELECT 
    customer_id,
    SUM(sale_amount) AS total_sales,
    RANK() OVER(ORDER BY SUM(sale_amount) DESC) AS rank_num
  FROM 
    customer_transactions
  GROUP BY
    customer_id
  ORDER BY
    rank_num,
    customer_id) AS temp_table
WHERE
  rank_num IN (1, 2, 3)


SELECT
  product_id,
  CONCAT(UCASE(LEFT(fixed_product_name, 1)), LCASE(SUBSTRING(fixed_product_name, 2))) AS product_name,
  amount_sold
FROM (
  SELECT 
    product_id,
    REGEXP_REPLACE(product_name, '[^0-9a-zA-Z ]', '') AS fixed_product_name,
    amount_sold
  FROM 
    janines_mistakes ) AS temp_table

  
SELECT
  chef_name,
  returned_orders
FROM (
  SELECT 
    chef_name,
    SUM(CASE WHEN order_returned = 'Y' THEN 1 ELSE 0 END) AS returned_orders,
    RANK() OVER(ORDER BY SUM(CASE WHEN order_returned = 'Y' THEN 1 ELSE 0 END) DESC) AS rank_num
  FROM 
    orders
  GROUP BY
    chef_name ) AS temp_table
WHERE 
  rank_num = 1
ORDER BY
  chef_name ASC


SELECT
  twitter_id,
  AVG(time_difference) AS avg_time_diff
FROM (
  SELECT 
    twitter_id,
    TIMESTAMPDIFF(MINUTE, LAG(tweet_time) OVER(PARTITION BY twitter_id ORDER BY tweet_time), tweet_time) AS time_difference
  FROM 
    twitter_addiction) AS tweet_time_table
GROUP BY
  twitter_id


SELECT
  domain,
  COUNT(domain) AS domain_count
FROM (
  SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(email_address, "@", -1), '.', 1) AS domain
  FROM 
    emails ) AS temp_table
GROUP BY
  domain
ORDER BY
  domain_count DESC,
  domain DESC


SELECT
  customer_id
FROM (
  SELECT 
    customer_id,
    DATEDIFF(visit_date, LAG(visit_date) OVER(PARTITION BY customer_id ORDER BY customer_id ASC, visit_date ASC)) AS days_between_purchase
  FROM 
    customers ) AS difference_table
WHERE
  days_between_purchase <= 5
GROUP BY
  customer_id


SELECT 
  player,
  points,
  DENSE_RANK() OVER(ORDER BY points DESC) AS ranking
FROM 
  player_totals


SELECT 
  actions,
  COUNT(actions) AS action_count,
  RANK() OVER(ORDER BY COUNT(actions) DESC) AS rank_num
FROM 
  facebook
WHERE
  dates = '2023-12-25'
GROUP BY
  actions
ORDER BY
  rank_num ASC,
  actions ASC


SELECT 
  CONCAT(UPPER(LEFT(first_name, 1)), LOWER(SUBSTRING(first_name, 2)), " ",
  UPPER(LEFT(last_name, 1)), LOWER(SUBSTRING(last_name, 2))) AS full_name
FROM 
  names
ORDER BY
  full_name ASC


SELECT
  *
FROM 
  job_listings
WHERE
  (job_title LIKE '%Senior%' OR job_title LIKE '%Lead%')
  AND (required_skills LIKE '%SQL%' AND required_skills LIKE '%Python%')
  AND (SUBSTRING_INDEX(SUBSTRING_INDEX(job_salary,'-', 1), "$", -1) > 85000)
ORDER BY
  job_id ASC


SELECT
  date_sold,
  ABS(cake - pie) AS difference,
  CASE WHEN cake > pie THEN "Cake" ELSE "Pie" END AS more_sold
FROM (
  SELECT 
    date_sold,
    SUM(CASE WHEN product = 'Cake' THEN amount_sold ELSE 0 END) AS cake,
    SUM(CASE WHEN product = 'Pie' THEN amount_sold ELSE 0 END) AS pie
  FROM 
    desserts
  GROUP BY
    date_sold
  ORDER BY
    date_sold ) AS cake_pie_table

  
SELECT 
  isp_name,
  AVG(TIMESTAMPDIFF(MINUTE, STR_TO_DATE(start_time, "%m/%d/%Y %T"), STR_TO_DATE(end_time, "%m/%d/%Y %T"))) AS average_outage_duration,
  SUM(CASE WHEN end_time IS NULL THEN 1 ELSE 0 END) AS ongoing_outages
FROM 
  isp_outages
GROUP BY
  isp_name
ORDER BY
  average_outage_duration DESC


SELECT 
  driver_id,
  total_rides,
  CASE
    WHEN total_rides < 100 THEN 0
    WHEN (total_rides >= 100 AND total_rides < 500) THEN 100
    WHEN (total_rides >= 500 AND total_rides < 1000) THEN 100+500
    WHEN (total_rides >= 1000 AND total_rides < 2000) THEN 100+500+1000
    ELSE 100+500+1000+((FLOOR(total_rides/1000) - 1) * 1000)
  END AS bonus
FROM 
  lyft_bonuses
GROUP BY
  driver_id
ORDER BY
  driver_id


SELECT
  p.product_id,
  p.price
FROM (
  SELECT
    product_id,
    MAX(dates) AS max_date
  FROM
    price_check
  WHERE 
    dates <= '2022-04-07'
  GROUP BY
    product_id ) AS m
  JOIN price_check AS p 
  ON p.product_id = m.product_id
  AND p.dates = m.max_date
ORDER BY
  product_id


WITH consecutive_visits AS (
  SELECT 
      n.id,
      name,
      visit_date,
      DATEDIFF(d.visit_date, LAG(visit_date) OVER(PARTITION BY id ORDER BY visit_date ASC)) AS days_between_visits
    FROM 
      names AS n INNER JOIN dates AS d
      ON n.id = d.id
)
SELECT
  id,
  name,
  MAX(num_consecutive_visits) AS max_consecutive_visits
FROM (
  SELECT
    *,
    SUM(CASE WHEN days_between_visits = 1 THEN 1 ELSE 0 END) + 1 AS num_consecutive_visits
  FROM 
    consecutive_visits
  GROUP BY
    id ) AS final_consecutive_visits

  
WITH joined_data AS (
  SELECT 
    o.total_amount,
    c.customer_name,
    MONTH(order_date) AS month
  FROM 
    orders AS o INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
)
SELECT
  month,
  customer_name,
  monthly_total_spending
FROM (
  SELECT
    *,
    SUM(total_amount) AS monthly_total_spending,
    ROW_NUMBER() OVER(PARTITION BY month ORDER BY total_amount DESC) AS row_num
  FROM
    joined_data
  GROUP BY 
    month,
    customer_name ) AS spending_table
WHERE
  row_num = 1
ORDER BY
  month ASC


WITH rank_table AS (
  SELECT 
    *,
    DENSE_RANK() OVER(ORDER BY time_in_seconds DESC) AS rank_number
  FROM 
    nascar_times
)
SELECT
  label,
  time_in_seconds AS time,
  CASE WHEN label = 'Slowest' THEN RANK() OVER(PARTITION BY label ORDER BY time_in_seconds DESC)
  ELSE RANK() OVER(PARTITION BY label ORDER BY time_in_seconds ASC)
  END AS ranking
FROM (
  SELECT
    *,
    CASE WHEN rank_number IN (1, 2, 3) THEN 'Slowest'
    ELSE 'Fastest'
    END AS label
  FROM 
    rank_table
  WHERE
    rank_number IN (1, 2, 3, 23, 22, 21)
  GROUP BY
    rank_number ) AS laps_table
ORDER BY
  label DESC,
  ranking ASC


SELECT 
  CASE
    WHEN address LIKE '%Suite%' THEN TRIM(SUBSTRING_INDEX(address, 'Suite', 1))
    WHEN address LIKE '%Unit%' THEN TRIM(SUBSTRING_INDEX(address, 'Unit', 1))
    ELSE TRIM(SUBSTRING_INDEX(address, "-", 1))
  END AS street,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(address, "-", 2), "-", -1)) AS city,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(address, "-", 3), "-", -1), " ", 1)) AS state,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(address, "-", 3), "-", -1), " ", -1)) AS postal_code
FROM 
  addresses


WITH joined_filtered_data AS (
SELECT 
  status,
  request_at
FROM 
  rides AS r 
  JOIN users AS u1 ON r.client_id = u1.user_id
  JOIN users AS u2 ON r.driver_id = u2.user_id
WHERE
  u1.banned <> 'Yes'
  AND u2.banned <> 'Yes'
  AND r.request_at BETWEEN '2023-12-23' AND '2023-12-25' 
)
SELECT 
  request_at,
  ROUND((SUM(CASE WHEN status <> 'completed' THEN 1 ELSE 0 END) / COUNT(status)) * 100, 2) AS cancellation_rate
FROM 
  joined_filtered_data
GROUP BY
  request_at


WITH RECURSIVE employeehierarchy AS (
  SELECT 
    employee_id,
    1 AS level 
  FROM 
    hierarchy
  WHERE
    supervisor_id IS NULL
  UNION ALL
  SELECT
    h.employee_id,
    eh.level + 1 AS level
  FROM 
    hierarchy AS h INNER JOIN employeehierarchy AS eh 
    ON h.supervisor_id = eh.employee_id
)
SELECT
  employee_id,
  level
FROM
  employeehierarchy
ORDER BY 
  employee_id


WITH inflation_table AS (
SELECT 
  country,
  consumer_price_index AS current_rate,
  LAG(consumer_price_index) OVER(PARTITION BY country ORDER BY year ASC) AS previous_rate
FROM 
  inflation
)
SELECT
  country,
  AVG(((current_rate - previous_rate) / previous_rate) * 100) AS average_inflation,
  RANK() OVER(ORDER BY AVG(((current_rate - previous_rate) / previous_rate) * 100) DESC) AS rank_num
FROM
  inflation_table
GROUP BY 
  country
ORDER BY
  rank_num


WITH sending_opening_times AS (
SELECT 
  ab.age_bucket,
  SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) AS time_spent_sending,
  SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) AS time_spent_opening
FROM
  activities AS a INNER JOIN age_breakdown AS ab 
  ON a.user_id = ab.user_id
GROUP BY
  age_bucket
)
SELECT
  age_bucket,
  ROUND(time_spent_sending / (time_spent_sending + time_spent_opening) * 100.0, 2) AS sending_pct,
  ROUND(time_spent_opening / (time_spent_sending + time_spent_opening) * 100.0, 2) AS opening_pct
FROM
  sending_opening_times


WITH row_num_table AS (
SELECT 
  measurement_value,
  DATE_TRUNC('day', measurement_time) as measurement_day,
  ROW_NUMBER() OVER(PARTITION BY DATE_TRUNC('day', measurement_time) ORDER BY measurement_time ASC) AS row_num
FROM 
  measurements
)
SELECT
  measurement_day,
  SUM(CASE WHEN row_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum,
  SUM(CASE WHEN row_num % 2 <> 0 THEN measurement_value ELSE 0 END) AS odd_sum
FROM
  row_num_table
GROUP BY
  measurement_day


SELECT
  user_id,
  spend,
  transaction_date
FROM (
  SELECT 
    *,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS row_num
  FROM 
    transactions ) AS row_num_table
WHERE
  row_num = 3


SELECT 
  user_id,
  tweet_date,
  ROUND(AVG(tweet_count) OVER(PARTITION BY user_id ORDER BY tweet_date ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_average
FROM 
  tweets


WITH rank_table AS (
  SELECT 
    *,
    RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rank_num
  FROM 
    user_transactions
)
SELECT 
  transaction_date,
  user_id,
  COUNT(product_id) AS purchase_count
FROM 
  rank_table
WHERE
  rank_num = 1
GROUP BY
  transaction_date,
  user_id
ORDER BY
  transaction_date ASC


WITH products_ranked AS (
  SELECT 
    category,
    product,
    SUM(spend) AS total_spend,
    RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS rank_num
  FROM 
    product_spend
  WHERE
      DATE_PART('year', transaction_date) = 2022
  GROUP BY
    product,
    category
)
SELECT
  category,
  product,
  total_spend
FROM
  products_ranked
WHERE
  rank_num IN (1, 2)


WITH joined_data AS (
  SELECT 
    artist_name,
    DENSE_RANK() OVER(ORDER BY COUNT(s.song_id) DESC) AS artist_rank
  FROM 
    artists AS a
    INNER JOIN songs AS s ON a.artist_id = s.artist_id
    INNER JOIN global_song_rank AS gsr ON s.song_id = gsr.song_id
  WHERE
    rank <= 10
  GROUP BY
    artist_name
)
SELECT
  artist_name,
  artist_rank
FROM
  joined_data
WHERE
  artist_rank IN (1, 2, 3, 4, 5)
ORDER BY
  artist_rank ASC


SELECT
  COUNT(policy_holder_id) AS policy_holder_count
FROM (
  SELECT
    policy_holder_id,
    COUNT(case_id) AS call_count
  FROM 
    callers
  GROUP BY
    policy_holder_id
  HAVING
    COUNT(case_id) >= 3
) AS calls_table


SELECT
  ROUND((uncategorized_calls / total_calls) * 100.0, 1) AS uncategorized_calls_pct
FROM (
  SELECT 
    SUM(CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1.0 ELSE 0.0 END) AS uncategorized_calls,
    COUNT(*) AS total_calls
  FROM 
    callers 
) AS calls_table


WITH confirmed_accounts AS (
  SELECT 
    SUM(CASE WHEN t.signup_action = 'Confirmed' THEN 1.0 ELSE 0.0 END) AS confirmed_accounts,
    COUNT(*) AS total_accounts
  FROM 
    emails AS e RIGHT JOIN texts AS t  
    ON e.email_id = t.email_id
)
SELECT 
  ROUND((confirmed_accounts / total_accounts), 2) AS confirm_rate
FROM
  confirmed_accounts


WITH mode_rank_table AS (
  SELECT 
    item_count,
    order_occurrences,
    RANK() OVER(ORDER BY order_occurrences DESC) AS mode_rank
  FROM 
    items_per_order
)
SELECT
  item_count AS mode
FROM
  mode_rank_table
WHERE
  mode_rank = 1
ORDER BY
  mode ASC


WITH rank_table AS (
  SELECT
    *,
    RANK() OVER(PARTITION BY card_name ORDER BY issue_year ASC, issue_month ASC) AS rank_num
  FROM
    monthly_cards_issued
)
SELECT
  card_name,
  issued_amount
FROM
  rank_table
WHERE
  rank_num = 1
ORDER BY
  issued_amount DESC


WITH calls_table AS 
( 
  SELECT 
    SUM(CASE WHEN caller.country_id <> receiver.country_id THEN 1.0 ELSE NULL END) AS international_calls, 
    COUNT(*) AS total_calls 
  FROM 
  phone_calls AS pc 
  LEFT JOIN phone_info AS caller ON pc.caller_id = caller.caller_id 
  LEFT JOIN phone_info AS receiver ON pc.receiver_id = receiver.caller_id 
) 
SELECT 
  ROUND((international_calls / total_calls) * 100.0, 1) AS international_calls_pct 
FROM 
  calls_table


SELECT 
  company_name,
  stock_symbol,
  ROUND(share_price * shares_outstanding, 2) AS market_capitalization
FROM 
  companies
ORDER BY
  market_capitalization DESC


SELECT 
  product_name,
  ROUND(((new_size/original_size)*100)-100, 0) AS size_change_percentage,
  ROUND(((new_price/original_price)*100)-100, 0) AS price_change_percentage,
  CASE 
    WHEN (new_size < original_size) AND (new_price > original_price) 
    THEN 'True' ELSE 'False' 
  END AS shrinkflation_flag
FROM 
  products
ORDER BY
  product_name ASC


SELECT 
  country,
  ROUND(national_debt, 0) AS national_debt
FROM 
  global_debts
WHERE
  year = (SELECT MAX(year) FROM global_debts)
ORDER BY
  national_debt DESC
LIMIT 
  3


WITH calculator_sales AS
(
  SELECT 
    SUM(CASE WHEN year = 2000 THEN calculator_sales ELSE 0 END) AS sales2000,
    SUM(CASE WHEN year = 2023 THEN calculator_sales ELSE 0 END) AS sales2023
  FROM 
    calculators
)
SELECT
  ROUND(((sales2023 - sales2000) / sales2000) * 100, 2) AS pct_change
FROM
  calculator_sales


SELECT 
  CASE WHEN product_id > 0 THEN product_id ELSE NULL END AS product_id,
  CASE WHEN quantity_sold > 0 THEN quantity_sold ELSE 0 END AS quantity_sold,
  CASE WHEN revenue IS NOT NULL THEN revenue ELSE (SELECT AVG(revenue) FROM dirty_data) END AS revenue
FROM 
  dirty_data


SELECT 
  country,
  average_height
FROM 
  heights
HAVING
  average_height > (SELECT AVG(average_height) FROM heights)
ORDER BY
  average_height DESC


SELECT 
  company_name,
  fiscal_year,
  (taxable_income * tax_rate) AS taxes_owed
FROM 
  company_financials
WHERE
  fiscal_year = (SELECT MAX(fiscal_year) FROM company_financials)
ORDER BY
  taxes_owed DESC


SELECT 
  flight_id,
  airline,
  departure_city,
  arrival_city,
  passenger_count
FROM 
  domestic_flights 
UNION
SELECT
  flight_number,
  carrier,
  origin_city,
  destination_city,
  passenger_total
FROM
  international_flights
WHERE
  international_zone = 'Zone A'
ORDER BY
  flight_id ASC


SELECT 
  sale_date,
  store_id,
  AVG(daily_sales) OVER(PARTITION BY store_id ORDER BY sale_date ASC) AS running_average
FROM 
  sales_records
ORDER BY
  store_id,
  sale_date


SELECT 
  AVG(sale_amount) AS avg_excluding_nulls,
  SUM(sale_amount) / COUNT(CASE WHEN sale_amount IS NULL THEN 0 ELSE 1 END) AS avg_including_nulls,
  AVG(CASE WHEN sale_amount IS NULL THEN (SELECT MIN(sale_amount) FROM missing_values) ELSE sale_amount END) AS avg_including_min
FROM 
  missing_values


SELECT 
    e.name AS Employee
FROM 
    employee AS b JOIN employee AS e
    ON b.id = e.managerId
WHERE
    e.salary > b.salary

  
SELECT
    class
FROM
    courses
GROUP BY
    class
HAVING
    COUNT(student) >= 5


SELECT
    customer_number
FROM
    orders
GROUP BY
    customer_number
ORDER BY
    COUNT(order_number) DESC
LIMIT
    1


SELECT
    name,
    COALESCE(SUM(distance), 0) AS travelled_distance
FROM
    users AS u LEFT JOIN rides AS r
    ON u.id = r.user_id
GROUP BY
    name,
    user_id
ORDER BY
    travelled_distance DESC,
    name ASC


SELECT
    *
FROM
    patients
WHERE
    conditions LIKE "DIAB1%"
    OR conditions LIKE "% DIAB1%"


SELECT 
	*
FROM
	cd.facilities


SELECT
     name,
     membercost
FROM
     cd.facilities


SELECT
     *
FROM
     cd.facilities
WHERE
     membercost > 0


SELECT
     facid,
     name,
     membercost,
     monthlymaintenance
FROM
     cd.facilities
WHERE
     membercost < (monthlymaintenance / 50)
     AND membercost > 0


SELECT
     *
FROM
     cd.facilities
WHERE
     name LIKE '%Tennis%'


SELECT
     *
FROM
     cd.facilities
WHERE
     facid IN (1, 5)


SELECT
     name,
     CASE WHEN monthlymaintenance > 100 THEN 'expensive' ELSE 'cheap' END AS cost
FROM
     cd.facilities


SELECT
     memid, 
     surname, 
     firstname,
     joindate
FROM
     cd.members
WHERE
     DATE_TRUNC('month', joindate) >= '2012-09-01 00:00'


SELECT
     DISTINCT(surname)
FROM
     cd.members
ORDER BY
     surname
LIMIT
     10


SELECT
     surname
FROM
     cd.members
UNION
SELECT
     name
FROM
     cd.facilities


SELECT
     MAX(joindate) AS latest
FROM
     cd.members


SELECT
	firstname,
	surname,
	joindate
FROM
	cd.members
WHERE
	joindate = (SELECT MAX(joindate) FROM cd.members)


SELECT
	COUNT(*)
FROM
	cd.facilities


SELECT
	COUNT(*)
FROM
	cd.facilities
WHERE
	guestcost >= 10


SELECT
	recommendedby,
	COUNT(*)
FROM
	cd.members
WHERE
	recommendedby IS NOT NULL
GROUP BY
	recommendedby
ORDER BY
	recommendedby


SELECT
	facid,
	SUM(slots) AS total_slots
FROM
	cd.bookings
GROUP BY
	facid
ORDER BY
	facid


SELECT
	facid,
	SUM(slots) AS total_slots
FROM
	cd.bookings
WHERE
	DATE_TRUNC('month', starttime) = '2012-09-01 00:00:00'
GROUP BY
	facid
ORDER BY
	total_slots


SELECT
	facid,
	DATE_PART('month', starttime) AS month,
	SUM(slots) AS total_slots
FROM
	cd.bookings
WHERE
	DATE_TRUNC('year', starttime) = '2012-01-01 00:00:00'
GROUP BY
	facid,
	month
ORDER BY
	facid,
	month