# **Practice Problem #63: Buying Less**
### February 1st, 2024
### Languages Used: SQL

<br>

*This is the [Buying Less](https://www.analystbuilder.com/questions/buying-less-FeGKV) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Amazon wants to identify customers who aren't spending much on their website to give them targeted discounts and ads.

Find customers who ordered less than $250 worth of products or placed 2 or less orders.

<br>

purchases Table:

| Field       | Data Type |
| :---------- | :-------- |
| customer_id | int       |
| order_total | int       |

purchases Input:

| customer_id | order_total |
| :---------- | :---------- |
| 1001        | 147         |
| 1001        | 45          |
| 1001        | 72          |
| 1001        | 114         |
| 1001        | 35          |
| 1001        | 7           |
| 1002        | 36          |
| 1002        | 62          |
| 1002        | 53          |
| 1002        | 75          |
| 1003        | 31          |
| 1003        | 12          |
| 1004        | 16          |
| 1004        | 80          |
| 1004        | 79          |
| 1004        | 150         |
| 1005        | 51          |
| 1005        | 112         |

<br>

# My Solution

``` SQL
SELECT 
  customer_id 
FROM 
  purchases
GROUP BY
  customer_id
HAVING
  SUM(order_total) < 250
  OR COUNT(customer_id) <= 2
```

Output Table:

| customer_id |
| :---------- |
| 1002        |
| 1003        |
| 1005        |
