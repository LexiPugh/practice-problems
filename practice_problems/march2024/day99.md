# **Practice Problem #99: Movie-aholic (Joins)**
### March 8th, 2024
### Languages Used: SQL

<br>

*This is the [Movie-aholic (Joins)](https://www.analystbuilder.com/courses/mysql-interview-crash-course/question/movie-aholic-zORGN) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Return the name of the customer, the movie they watched, and the day they watched it.

Order by view date and movie name.

<br>

date_viewed Table:

| Field       | Data Type |
| :---------- | :-------- |
| customer_id | int       |
| movie_id    | int       |
| view_date   | date      |

date_viewed Input:

| customer_id | movie_id | view_date  |
| :---------- | :------- | :--------- |
| 4           | 1        | 2009-11-01 |
| 2           | 1        | 2011-06-16 |
| 3           | 1        | 2013-02-03 |
| 2           | 2        | 2021-12-25 |
| 1           | 2        | 2022-01-05 |
| 3           | 2        | 2019-04-02 |
| 4           | 3        | 2017-01-29 |
| 1           | 3        | 2016-03-17 |
| 2           | 3        | 2020-06-09 |
| 3           | 4        | 2021-04-10 |
| 1           | 4        | 2001-09-02 |
| 3           | 4        | 2012-01-30 |
| 4           | 4        | 2000-10-13 |

customers Table:

| Field       | Data Type |
| :---------- | :-------- |
| customer_id | int       |
| name        | text      |

customers Input:

| customer_id | name   |
| :---------- | :----- |
| 1           | Ron    |
| 2           | Leslie |
| 3           | Tom    |
| 4           | April  |

movienames Table:

| Field      | Data Type |
| :--------- | :-------- |
| movie_id   | int       |
| movie_name | text      |

movienames Input:

| movie_id | movie_name         |
| :------- | :----------------- |
| 1        | Spider-Man         |
| 2        | Lord of The Rings  |
| 3        | Star Wars          |
| 4        | Back to the Future |

<br>

# My Solution

``` SQL
SELECT 
  name, 
  movie_name, 
  view_date
FROM 
  date_viewed AS dv
  INNER JOIN customers AS c ON dv.customer_id = c.customer_id
  INNER JOIN movienames AS mn ON dv.movie_id = mn.movie_id
ORDER BY 
  view_date, 
  movie_name
```

Output Table:

| name   | movie_name         | view_date  |
| ----- | :----------------- | :--------- |
| April  | Back to the Future | 2000-10-13 |
| Ron    | Back to the Future | 2001-09-02 |
| April  | Spider-Man         | 2009-11-01 |
| Leslie | Spider-Man         | 2011-06-16 |
| Tom    | Back to the Future | 2012-01-30 |
| Tom    | Spider-Man         | 2013-02-03 |
| Ron    | Star Wars          | 2016-03-17 |
| April  | Star Wars          | 2017-01-29 |
| Tom    | Lord of The Rings  | 2019-04-02 |
| Leslie | Star Wars          | 2020-06-09 |
| Tom    | Back to the Future | 2021-04-10 |
| Leslie | Lord of The Rings  | 2021-12-25 |
| Ron    | Lord of The Rings  | 2022-01-05 |
