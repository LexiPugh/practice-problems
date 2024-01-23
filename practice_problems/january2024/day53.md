# **Practice Problem #53: 2022 Orders**
### January 22nd, 2024
### Languages Used: SQL

<br>

*This is the [2022 Orders](https://www.analystbuilder.com/questions/2022-orders-WsKLr) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to find the users that joined in 2022 and also made a purchase in 2022.

Return the IDs smallest to largest.

<br>

users Table:

| Field     | Data Type |
| :-------- | :-------- |
| user_id   | int       |
| join_date | date      |

users Input:

| user_id | join_date  |
| :------ | :--------- |
| 1       | 2021-04-07 |
| 2       | 2022-01-08 |
| 3       | 2022-01-23 |

orders Table:

| Field      | Data Type |
| :--------- | :-------- |
| order_id   | int       |
| order_date | date      |
| buyer_id   | int       |

orders Input:

| order_id | order_date | buyer_id |
| :------- | :--------- | :------- |
| 1        | 2022-01-01 | 1        |
| 2        | 2021-10-10 | 2        |
| 3        | 2022-06-04 | 1        |
| 4        | 2019-05-04 | 1        |
| 5        | 2021-12-25 | 2        |
| 6        | 2022-02-28 | 3        |

<br>

# My Solution

``` SQL
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
```

Output Table:

| user_id |
| :------ |
| 3       |
