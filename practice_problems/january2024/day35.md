# **Practice Problem #35: Most Reviewed Restaurant**
### January 4th, 2024
### Languages Used: SQL

<br>

*This is the [Most Reviewed Restaurant](https://www.analystbuilder.com/questions/most-reviewed-restaurant-dkcJO) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to show the restaurant that received the most comments for their restaurant. If there is a tie, choose the restaurant with the highest average rating.


<br>

restaurant_reviews Table:

| Field      | Data Type |
| :--------- | :-------- |
| restaurant | text      |
| comment    | text      |
| rating     | float     |

restaurant_reviews Input:

| restaurant       | comment                                        | rating |
| :--------------- | :--------------------------------------------- | :----- |
| Jimmy's Barbecue | Loved the meat!                                | 4.5    |
| Sandwich Life    | _NULL_                                         | 5      |
| Dog in a Bun     | _NULL_                                         | 4      |
| Spaghetti-Os     | No thanks!                                     | 3      |
| Jimmy's Barbecue | _NULL_                                         | 5      |
| Dog in a Bun     | Best Hot Dog ever!                             | 4.5    |
| Spaghetti-Os     | _NULL_                                         | 3.5    |
| Jimmy's Barbecue | Delicious! Highly recommend!                   | 5      |
| Sandwich Life    | _NULL_                                         | 4      |
| Jimmy's Barbecue | _NULL_                                         | 4      |
| Spaghetti-Os     | Don't recommend. Just Spaghetti-Os from a can. | 2.5    |
| Jimmy's Barbecue | _NULL_                                         | 4.5    |
| Dog in a Bun     | _NULL_                                         | 4      |
| Dog in a Bun     | Yummy!                                         | 4.5    |

<br>

# My Solution

``` SQL
SELECT
  restaurant,
  COUNT(comment) AS comment_count,
  AVG(rating) AS average_rating
FROM 
  restaurant_reviews
GROUP BY
  restaurant
ORDER BY
  comment_count DESC,
  average_rating DESC
LIMIT
  1
```

Output Table:

| restaurant       | comment_count | avg_rating |
| :--------------- | :------------ | :--------- |
| Jimmy's Barbecue | 2             | 4.6        |
