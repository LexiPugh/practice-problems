# **Practice Problem #25: Compressed Mean**
### December 25th, 2023
### Languages Used: SQL

<br>

*This is the [Compressed Mean](https://datalemur.com/questions/alibaba-compressed-mean) practice problem from DataLemur. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

You're trying to find the mean number of items per order on Alibaba, rounded to 1 decimal place using tables which includes information on the count of items in each order (item_count table) and the corresponding number of orders for each item count (order_occurrences table).

<br>

items_per_order Table:

| Column Name       | Type    |
| ----------------- | ------- |
| item_count        | integer |
| order_occurrences | integer |


items_per_order Example Input:

| item_count | order_occurrences |
| ---------- | ----------------- |
| 1          | 500               |
| 2          | 1000              |
| 3          | 800               |
| 4          | 1000              |


Example Output:

| mean |
| ---- |
| 2.7  |

Explanation:
Let's calculate the arithmetic average:

Total items = (1*500) + (2*1000) + (3*800) + (4*1000) = 8900

Total orders = 500 + 1000 + 800 + 1000 = 3300

Mean = 8900 / 3300 = 2.7

The dataset you are querying against may have different input & output - this is just an example!

<br>

# My Solution

``` SQL
SELECT 
  ROUND(CAST(SUM(item_count * order_occurrences) 
  / SUM(order_occurrences) AS numeric), 1) AS mean
FROM 
  items_per_order
```

Output Table:

| mean |
| ---- |
| 3.9  |
