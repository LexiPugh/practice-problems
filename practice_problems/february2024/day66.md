# **Practice Problem #66: Crew Overspending**
### February 4th, 2024
### Languages Used: SQL

<br>

*This is the [Crew Overspending](https://www.analystbuilder.com/questions/crew-overspending-nIHch) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

A construction company gave each employee a $100 per diem for food for the week. If they spend over that amount they owe the company that money back.

Calculate how much each person spent and how much they owe the company. If they spent less than $100 they owe $0.

Provide the employee_id, amount spent, and amount owed (labeled "amount_owed") in the output.

Order by the amount owed from highest to lowest. Order by employee id if there are multiple people who owe the same amount.

<br>

crew_spending Table:

| Field          | Data Type |
| :------------- | :-------- |
| employee_id    | int       |
| transaction_id | int       |
| amount_spent   | int       |

crew_spending Input:

| employee_id | transaction_id | amount_spent |
| :---------- | :------------- | :----------- |
| 1003        | 119            | 20           |
| 1008        | 121            | 19           |
| 1007        | 196            | 13           |
| 1002        | 203            | 28           |
| 1007        | 217            | 14           |
| 1005        | 241            | 27           |
| 1001        | 254            | 10           |
| 1005        | 264            | 11           |
| 1006        | 332            | 15           |
| 1001        | 347            | 14           |
| 1005        | 367            | 36           |
| 1008        | 441            | 8            |
| 1006        | 458            | 24           |
| 1007        | 544            | 30           |
| 1002        | 548            | 17           |
| 1004        | 611            | 14           |
| 1003        | 627            | 30           |
| 1006        | 628            | 23           |
| 1001        | 746            | 17           |
| 1008        | 770            | 26           |
| 1001        | 786            | 26           |
| 1004        | 837            | 38           |
| 1003        | 839            | 20           |
| 1009        | 874            | 12           |
| 1008        | 892            | 16           |
| 1002        | 903            | 31           |
| 1009        | 915            | 39           |
| 1002        | 920            | 27           |
| 1004        | 949            | 40           |
| 1005        | 992            | 33           |
| 1004        | 1096           | 33           |
| 1007        | 1185           | 11           |
| 1009        | 1187           | 39           |
| 1009        | 1197           | 28           |
| 1006        | 1207           | 33           |
| 1003        | 1226           | 22           |

<br>

# My Solution

``` SQL
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
```

Output Table:

| employee_id | total_amount_spent | amount_owed |
| :---------- | :----------------- | :---------- |
| 1004        | 125                | 25          |
| 1009        | 118                | 18          |
| 1005        | 107                | 7           |
| 1002        | 103                | 3           |
| 1001        | 67                 | 0           |
| 1003        | 92                 | 0           |
| 1006        | 95                 | 0           |
| 1007        | 68                 | 0           |
| 1008        | 69                 | 0           |
