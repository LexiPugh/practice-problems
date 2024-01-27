# **Practice Problem #57: Bike Price**
### January 26th, 2024
### Languages Used: SQL

<br>

*This is the [Bike Price](https://www.analystbuilder.com/questions/bike-price-zKcOR) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Sarah's Bike Shop sells a lot of bikes and wants to know what the average sale price is of her bikes.

She sometimes gives away a bike for free for a charity event and if she does she leaves the price of the bike as blank, but marks it sold.

Write a query to show her the average sale price of bikes for only bikes that were sold, and not donated.

Round answer to 2 decimal places.

<br>

inventory Table:

| Field      | Data Type |
| :--------- | :-------- |
| bike_id    | int       |
| bike_price | float     |
| bike_sold  | text      |

inventory Input:

| bike_id | bike_price | bike_sold |
| :------ | :--------- | :-------- |
| 1001    | 329.99     | Y         |
| 1002    | 99.99      | Y         |
| 1003    | 109.99     | Y         |
| 1004    | 299.99     | Y         |
| 1005    | _NULL_     | N         |
| 1006    | 329.97     | Y         |
| 1007    | 175.99     | N         |
| 1008    | 88.99      | Y         |
| 1009    | _NULL_     | Y         |
| 1010    | 125.99     | Y         |
| 1011    | 571.99     | N         |
| 1012    | 729.99     | N         |
| 1013    | 189.99     | Y         |
| 1014    | 652.99     | N         |


<br>

# My Solution

``` SQL
SELECT 
  ROUND(AVG(bike_price), 2) AS average_sale_price
FROM 
  inventory
WHERE 
  bike_price IS NOT NULL
  AND bike_sold = "Y"
```

Output Table:

| average_sale_price |
| :----------------- |
| 196.86             |
