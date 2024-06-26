# **Practice Problem #21: Million Dollar Store**
### December 21st, 2023
### Languages Used: SQL

<br>

*This is the [Million Dollar Store](https://www.analystbuilder.com/questions/million-dollar-store-ARdQa) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query that returns all of the stores whose average yearly revenue is greater than one million dollars.

Output the store ID and average revenue. Round the average to 2 decimal places.

Order by store ID.

<br>

stores Table:

| Field    | Data Type |
| :------- | :-------- |
| store_id | int       |
| year     | int       |
| revenue  | int       |

stores Input:

| store_id | year | revenue |
| :------- | :--- | :------ |
| 1        | 2020 | 1000000 |
| 2        | 2020 | 1500000 |
| 3        | 2020 | 800000  |
| 4        | 2020 | 180000  |
| 1        | 2021 | 2000000 |
| 2        | 2021 | 1800000 |
| 3        | 2021 | 1000000 |
| 4        | 2021 | 900000  |
| 1        | 2022 | 700000  |
| 2        | 2022 | 2000000 |
| 3        | 2022 | 600000  |
| 4        | 2022 | 1300000 |

<br>

# My Solution

``` SQL
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
```

Output Table:

| store_id | revenue    |
| -------- | :--------- |
| 1        | 1233333.33 |
| 2        | 1766666.67 |
