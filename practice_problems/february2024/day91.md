# **Practice Problem #91: Employee Turnover**
### February 29th, 2024
### Languages Used: SQL

<br>

*This is the [Employee Turnover](https://www.analystbuilder.com/questions/employee-turnover-uqTRa) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

This company noticed a lot of their employees were quitting recently.

Determine what percentage of employees quit in 2022.

<br>

employee_turnover Table:

| Field        | Data Type |
| :----------- | :-------- |
| employee_id  | int       |
| date_started | datetime  |
| date_left    | datetime  |

employee_turnover Input:

| employee_id | date_started | date_left  |
| :---------- | :----------- | :--------- |
| 1           | 2021-01-01   | 2022-01-01 |
| 2           | 2017-05-10   | _NULL_     |
| 3           | 2014-06-24   | 2022-11-09 |
| 4           | 2020-03-10   | _NULL_     |
| 5           | 2022-04-03   | _NULL_     |
| 6           | 2011-05-30   | 2019-03-18 |
| 7           | 2019-11-02   | _NULL_     |
| 8           | 2020-10-15   | _NULL_     |

<br>

# My Solution

``` SQL
SELECT
  (COUNT(CASE WHEN YEAR(date_left) = 2022 THEN 1 ELSE NULL END) / COUNT(date_started)) * 100 AS employee_turnover_pct
FROM 
  employee_turnover
```

Output Table:

| employee_turnover_pct |
| :-------------------- |
| 25                    |
