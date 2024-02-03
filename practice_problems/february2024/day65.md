# **Practice Problem #65: Richie Rich**
### February 3rd, 2024
### Languages Used: SQL

<br>

*This is the [Richie Rich](https://www.analystbuilder.com/questions/greenhouse-gases-JUvPk) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Select all of the companies that had Total profits higher than 20 million over the past 3 years.

Assume today's date is 1/1/2023. Look back 3 years from this day.

Order companies alphabetically.

<br>

companies Table:

| Field   | Data Type |
| :------ | :-------- |
| company | text      |
| year    | date      |
| profit  | int       |

companies Input:

| company       | year       | profit   |
| :------------ | :--------- | :------- |
| Techastro     | 2023-01-01 | 4000000  |
| Techastro     | 2022-12-20 | 2000000  |
| Techastro     | 2021-05-24 | 8000000  |
| Techastro     | 2020-03-26 | 5000000  |
| Techastro     | 2019-02-05 | 2000000  |
| Delivery Pros | 2022-03-06 | 11000000 |
| Delivery Pros | 2022-10-22 | 2000000  |
| Delivery Pros | 2021-11-02 | 12000000 |
| Delivery Pros | 2020-09-15 | 5000000  |
| Delivery Pros | 2019-05-12 | 5000000  |
| Wire Tech     | 2022-08-04 | 4000000  |
| Wire Tech     | 2022-06-06 | 2000000  |
| Wire Tech     | 2021-04-22 | 6000000  |
| Wire Tech     | 2020-01-23 | 2000000  |
| Wire Tech     | 2019-12-16 | 3000000  |

<br>

# My Solution

``` SQL
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
```

Output Table:

| company       |
| :------------ |
| Delivery Pros |
