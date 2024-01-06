# **Practice Problem #36: Rotten Drama**
### January 5th, 2024
### Languages Used: SQL and Python

<br>

*This is the [Rotten Drama](https://www.analystbuilder.com/questions/rotten-drama-wCFMP) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Rotten Tomatoes has their own rating system for movies and shows. Users are also able to give feedback and rate movies and shows.

Write a query to find the Show/Movie with the biggest difference in Rotten Tomatoes Rating and User Rating.

Difference should be a positive integer.

Output all columns with the difference at the end.


<br>

ratings Table:

| Field         | Data Type |
| :------------ | :-------- |
| name          | text      |
| tomato_rating | int       |
| user_rating   | int       |

ratings Input:

| name                     | tomato_rating | user_rating |
| :----------------------- | :------------ | :---------- |
| Venom                    | 30            | 81          |
| Star Wars: The Last Jedi | 52            | 88          |
| The Greatest Showman     | 57            | 86          |
| Passengers               | 30            | 63          |
| Justice League           | 42            | 75          |
| Batman v Superman        | 30            | 62          |
| Captain Marvel           | 21            | 56          |
| Don't Look Up            | 22            | 78          |
| Contagion                | 65            | 91          |

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  * ,
  ABS(tomato_rating - user_rating) AS rating_difference
FROM 
  ratings
ORDER BY
  rating_difference DESC
LIMIT
  1
```

### Second Solution: Python

``` Python
ratings['rating_difference'] = abs(ratings['tomato_rating'] - ratings['user_rating'])

ratings = ratings.sort_values(by='rating_difference', ascending=False)

ratings.head(1)
```

Output Table:

| name          | tomato_rating | user_rating | rating_difference |
| :------------ | :------------ | :---------- | :---------------- |
| Don't Look Up | 22            | 78          | 56                |
