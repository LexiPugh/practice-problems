# **Practice Problem #94: Direct Reports**
### March 3rd, 2024
### Languages Used: SQL

<br>

*This is the [Direct Reports](https://www.analystbuilder.com/questions/direct-reports-qQoVA) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to determine how many direct reports each Manager has.

Note: Managers will have "Manager" in their title.

Report the Manager ID, Manager Title, and the number of direct reports in your output.

<br>

direct_reports Table:

| Field       | Data Type |
| :---------- | :-------- |
| employee_id | int       |
| position    | text      |
| managers_id | int       |

direct_reports Input:

| employee_id | position                 | managers_id |
| :---------- | :----------------------- | :---------- |
| 1001        | Analytics Manager        | 1013        |
| 1002        | Data Engineer            | 1007        |
| 1003        | Data Engineer            | 1001        |
| 1004        | Database Developer       | 1017        |
| 1005        | Data Analyst             | 1001        |
| 1006        | Data Engineer            | 1017        |
| 1007        | Data Engineering Manager | 1013        |
| 1008        | Database Developer       | 1001        |
| 1009        | Data Engineer            | 1007        |
| 1010        | Data Scientist           | 1017        |
| 1011        | Data Analyst             | 1001        |
| 1012        | Data Engineer            | 1007        |
| 1013        | CTO                      | _NULL_      |
| 1014        | Data Scientist           | 1017        |
| 1015        | Data Analyst             | 1001        |
| 1016        | Data Scientist           | 1017        |
| 1017        | Data Science Manager     | 1013        |
| 1018        | Database Developer       | 1007        |
| 1019        | Data Analyst             | 1001        |

<br>

# My Solution

``` SQL
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
```

Output Table:

| managers_id | managers_position        | direct_reports |
| :---------- | :----------------------- | :------------- |
| 1001        | Analytics Manager        | 6              |
| 1007        | Data Engineering Manager | 4              |
| 1017        | Data Science Manager     | 5              |
