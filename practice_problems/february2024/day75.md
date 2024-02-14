# **Practice Problem #75: Chocolate**
### February 13th, 2024
### Languages Used: SQL

<br>

*This is the [Chocolate](https://www.analystbuilder.com/questions/chocolate-vPiUY) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

I love chocolate and only want delicious baked goods that have chocolate in them!

Write a Query to return bakery items that contain the word "Chocolate".

<br>

bakery_items Table:

| Field        | Data Type |
| :----------- | :-------- |
| product_name | text      |

bakery_items Input:

| product_name                       |
| :--------------------------------- |
| Double Chocolate Doughnut          |
| Sweet Loaf                         |
| Croissant                          |
| Chocolate Banana Muffin            |
| Glazed Doughnut                    |
| Cinnamon Roll                      |
| Cheese Danish                      |
| Peanut Butter Chocolate Pound Cake |
| Fruit Tart                         |

<br>

# My Solution

``` SQL
SELECT 
  product_name
FROM 
  bakery_items
WHERE
  product_name LIKE '%Chocolate%'
```

Output Table:

| product_name                       |
| :--------------------------------- |
| Double Chocolate Doughnut          |
| Chocolate Banana Muffin            |
| Peanut Butter Chocolate Pound Cake |
