# **Practice Problem #84: Must Buy it All**
### February 22nd, 2024
### Languages Used: SQL

<br>

*This is the [Must Buy it All](https://www.analystbuilder.com/questions/must-buy-it-all-HZoGq) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

A company is about to launch a new product and wants to estimate how many current customers will buy their new product.

To do this, they want to identify all of the past customers who have bought all of their products.

They currently only have 4 products.

Write a query to identify customer_IDs that have bought all of their current products.

Note: If a customer buys many of the same product that still only counts as buying one of their products.

<br>

purchases Table:

| Field         | Data Type |
| :------------ | :-------- |
| customer_id   | int       |
| product_id    | int       |
| purchase_date | date      |

purchases Input:

| customer_id | product_id | purchase_date |
| :---------- | :--------- | :------------ |
| 1004        | 1          | 2018-08-15    |
| 1002        | 1          | 2019-07-01    |
| 1001        | 1          | 2019-08-20    |
| 1004        | 2          | 2019-09-06    |
| 1003        | 1          | 2019-10-26    |
| 1005        | 1          | 2020-04-15    |
| 1003        | 2          | 2020-06-04    |
| 1002        | 2          | 2020-07-22    |
| 1001        | 2          | 2020-09-10    |
| 1002        | 3          | 2021-03-01    |
| 1001        | 3          | 2021-04-20    |
| 1003        | 1          | 2021-06-22    |
| 1005        | 2          | 2022-03-14    |
| 1002        | 3          | 2022-03-19    |
| 1002        | 3          | 2022-03-22    |
| 1001        | 4          | 2022-05-08    |
| 1005        | 3          | 2022-06-07    |
| 1005        | 4          | 2023-01-01    |
| 1005        | 1          | 2023-03-09    |

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
  COUNT(DISTINCT product_id) = 4
```

Output Table:

| customer_id |
| :---------- |
| 1001        |
| 1005        |
