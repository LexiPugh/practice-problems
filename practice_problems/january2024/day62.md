# **Practice Problem #62: Big Pharma**
### January 31st, 2024
### Languages Used: SQL

<br>

*This is the [Big Pharma](https://www.analystbuilder.com/questions/big-pharma-tFfpy) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

A Pharmaceutical company wants to identify the drugs that are losing the most money.

Please write a query to find the top 3 drugs that lost money

Note: If less than 3 drugs lost money, only output the drugs that lost money for the company.

Output the drug name, money spent, money made and the amount they lost on that drug (rounded to one decimal place).

Order the output by largest loss to smallest loss.

<br>

big_pharma Table:

| Field       | Data Type |
| :---------- | :-------- |
| drug_name   | text      |
| money_spent | float     |
| money_made  | float     |

big_pharma Input:

| drug_name    | money_spent | money_made |
| :----------- | :---------- | :--------- |
| Rituximab    | 10.2        | 35.8       |
| Imatinib     | 4.5         | 22.1       |
| Lenalidomide | 8.7         | 28.9       |
| Bortezomib   | 2.1         | 11.4       |
| Ibrutinib    | 19.2        | 6.3        |
| Nilotinib    | 3.2         | 16.5       |
| Brentuximab  | 9.8         | 30.1       |
| Carfilzomib  | 1.5         | 9.6        |
| Pomalidomide | 37.1        | 25.3       |
| Enasidenib   | 5.6         | 20.9       |

<br>

# My Solution

``` SQL
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
```

Output Table:

| drug_name    | money_spent | money_made | money_lost |
| :----------- | :---------- | :--------- | :--------- |
| Ibrutinib    | 19.2        | 6.3        | 12.9       |
| Pomalidomide | 37.1        | 25.3       | 11.8       |
