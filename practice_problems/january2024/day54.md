# **Practice Problem #54: Bad Bonuses**
### January 23rd, 2024
### Languages Used: SQL

<br>

*This is the [Bad Bonuses](https://www.analystbuilder.com/questions/bad-bonuses-Eqhib) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Everyone at Analyst Builder is supposed to receive a bonus at the end of the year.

Unfortunately some people didn't receive their bonus as was promised.

Write a query to determine the employees who did not receive their bonus so we can notify accounting.

Return their id and name in the output. Order the id from lowest to highest.

<br>

employee Table:

| Field         | Data Type |
| :------------ | :-------- |
| employee_id   | int       |
| name          | text      |
| salary        | int       |
| supervisor_id | float     |

employee Input:

| employee_id | name    | salary | supervisor_id |
| :---------- | :------ | :----- | :------------ |
| 1           | Josh    | 65000  | _NULL_        |
| 2           | Mary    | 30000  | 1             |
| 3           | Tim     | 32000  | 1             |
| 4           | Sarah   | 40000  | _NULL_        |
| 5           | Michael | 35000  | 4             |

bonus Table:

| Field  | Data Type |
| :----- | :-------- |
| emp_id | int       |
| bonus  | int       |

bonus Input:

| emp_id | bonus |
| :----- | :---- |
| 1      | 2000  |
| 4      | 850   |
| 5      | 750   |

<br>

# My Solution

``` SQL
SELECT 
  employee_id, 
  name
FROM 
  employee 
WHERE 
  employee_id NOT IN (SELECT emp_id FROM bonus)
ORDER BY
 employee_id 
```

Output Table:

| employee_id | name |
| :---------- | :--- |
| 2           | Mary |
| 3           | Tim  |
