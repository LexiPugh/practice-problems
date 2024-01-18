# **Practice Problem #49: Sandwich Generation**
### January 18th, 2024
### Languages Used: SQL

<br>

*This is the [Sandwich Generation](https://www.analystbuilder.com/questions/sandwich-generation-excIi) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Yan is a sandwich enthusiast and is determined to try every combination of sandwich possible. He wants to start with every combination of bread and meats and then move on from there, but he wants to do it in a systematic way.

Below we have 2 tables, bread and meats

Output every possible combination of bread and meats to help Yan in his endeavors.

Order by the bread and then meat alphabetically. This is what Yan prefers.

<br>

bread_table Table:

| Field      | Data Type |
| :--------- | :-------- |
| bread_id   | int       |
| bread_name | text      |

bread_table Input:

| bread_id | bread_name  |
| :------- | :---------- |
| 1        | Whole Wheat |
| 2        | White       |
| 3        | Sourdough   |
| 4        | Brioche     |

meat_table Table:

| Field      | Data Type |
| :--------- | :-------- |
| bread_id   | int       |
| bread_name | text      |

meat_table Input:

| meat_id | meat_name  |
| :------ | :--------- |
| 1       | Turkey     |
| 2       | Ham        |
| 3       | Roast Beef |
| 4       | Pastrami   |
| 5       | Salami     |
| 6       | Chicken    |
| 7       | Bacon      |

<br>

# My Solution

``` SQL
SELECT 
  bread_name,
  meat_name
FROM 
  bread_table
  CROSS JOIN meat_table
ORDER BY
  bread_name, 
  meat_name
```

Output Table:

| bread_name  | meat_name  |
| :---------- | :--------- |
| Brioche     | Bacon      |
| Brioche     | Chicken    |
| Brioche     | Ham        |
| Brioche     | Pastrami   |
| Brioche     | Roast Beef |
| Brioche     | Salami     |
| Brioche     | Turkey     |
| Sourdough   | Bacon      |
| Sourdough   | Chicken    |
| Sourdough   | Ham        |
| Sourdough   | Pastrami   |
| Sourdough   | Roast Beef |
| Sourdough   | Salami     |
| Sourdough   | Turkey     |
| White       | Bacon      |
| White       | Chicken    |
| White       | Ham        |
| White       | Pastrami   |
| White       | Roast Beef |
| White       | Salami     |
| White       | Turkey     |
| Whole Wheat | Bacon      |
| Whole Wheat | Chicken    |
| Whole Wheat | Ham        |
| Whole Wheat | Pastrami   |
| Whole Wheat | Roast Beef |
| Whole Wheat | Salami     |
| Whole Wheat | Turkey     |
