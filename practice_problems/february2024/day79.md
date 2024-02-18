# **Practice Problem #79: Product Launch**
### February 17th, 2024
### Languages Used: SQL

<br>

*This is the [Product Launch](https://www.analystbuilder.com/questions/product-launch-UxfIn) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

You are given a table of product launches for companies each year.

Write a query to count the net difference between the number of products companies launched in 2023 with the number of products companies launched in the previous year.

Output the name of the companies and the net difference of products released for 2023 compared to the previous year.

Order on company name alphabetically.

<br>

products Table:

| Field        | Data Type |
| :----------- | :-------- |
| year         | int       |
| company_name | text      |
| product_name | text      |

products Input:

| year | company_name | product_name  |
| :--- | :----------- | :------------ |
| 2022 | Apple        | iPhone 13     |
| 2022 | Apple        | iPhone SE     |
| 2023 | Apple        | iPhone 14     |
| 2022 | Samsung      | Galaxy S21    |
| 2022 | Samsung      | Galaxy Note20 |
| 2022 | Samsung      | Galaxy A52    |
| 2023 | Samsung      | Galaxy S22    |
| 2022 | Huawei       | P50           |
| 2023 | Huawei       | P60           |
| 2023 | Huawei       | Mate 50       |
| 2022 | Google       | Pixel 6       |
| 2023 | Google       | Pixel 7       |
| 2022 | Xiaomi       | Mi 11         |
| 2023 | Xiaomi       | Mi 12         |
| 2023 | Oppo         | Find X3       |
| 2023 | Oppo         | Reno 5        |
| 2022 | Oppo         | Reno 6        |
| 2023 | Sony         | Xperia 2      |

<br>

# My Solution

``` SQL
SELECT 
  company_name,
  COUNT(CASE WHEN year = 2023 THEN 1 END) - COUNT(CASE WHEN year = 2022 THEN 1 END) AS difference
FROM 
  products
GROUP BY
  company_name
ORDER BY
  company_name
```

Output Table:

| company_name | difference |
| ------------ | ---------- |
| Apple        | -1         |
| Google       | 0          |
| Huawei       | 1          |
| Oppo         | 1          |
| Samsung      | -2         |
| Sony         | 1          |
| Xiaomi       | 0          |
