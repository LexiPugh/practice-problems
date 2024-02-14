# **Practice Problem #76: Average Revenue**
### February 14th, 2024
### Languages Used: SQL

<br>

*This is the [Average Revenue](https://www.analystbuilder.com/questions/average-revenue-QvqCI) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Uncle Ralph's Pizza Shop opened up 5 new stores in 2020. After 3 years Uncle Ralph wanted to see how each of his stores was doing.

Write a query to determine the average revenue by store.

Order by revenue largest to smallest.

<br>

revenue Table:

| Field            | Data Type |
| :--------------- | :-------- |
| store_id         | int       |
| year             | int       |
| revenue_millions | int       |

revenue Input:

| store_id | year | revenue_millions |
| :------- | :--- | :--------------- |
| 1253     | 2020 | 12               |
| 7452     | 2020 | 100              |
| 1269     | 2020 | 52               |
| 8665     | 2020 | 3                |
| 4345     | 2020 | 15               |
| 1253     | 2021 | 18               |
| 7452     | 2021 | 87               |
| 1269     | 2021 | 61               |
| 8665     | 2021 | 8                |
| 4345     | 2021 | 33               |
| 1253     | 2022 | 42               |
| 7452     | 2022 | 110              |
| 1269     | 2022 | 88               |
| 8665     | 2022 | 11               |
| 4345     | 2022 | 35               |

<br>

# My Solution

``` SQL
SELECT
  store_id,
  AVG(revenue_millions) AS average_revenue
FROM 
  revenue
GROUP BY
  store_id
ORDER BY
  average_revenue DESC
```

Output Table:

| store_id | average_revenue |
| :------- | :-------------- |
| 7452     | 99              |
| 1269     | 67              |
| 4345     | 27.6667         |
| 1253     | 24              |
| 8665     | 7.3333          |
