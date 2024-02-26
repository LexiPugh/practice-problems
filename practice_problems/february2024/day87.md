# **Practice Problem #87: Media Addicts**
### February 25th, 2024
### Languages Used: SQL

<br>

*This is the [Media Addicts](https://www.analystbuilder.com/questions/media-addicts-deISZ) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Social Media Addiction can be a crippling disease affecting millions every year.

We need to identify people who may fall into that category.

Write a query to find the people who spent a higher than average amount of time on social media.

Provide just their first names alphabetically so we can reach out to them individually.

<br>

user_time Table:

| Field              | Data Type |
| :----------------- | :-------- |
| user_id            | int       |
| media_time_minutes | int       |

user_time Input:

| user_id | media_time_minutes |
| :------ | :----------------- |
| 1       | 0                  |
| 2       | 200                |
| 3       | 250                |
| 4       | 15                 |
| 5       | 500                |
| 6       | 45                 |
| 7       | 450                |
| 8       | 1000               |
| 9       | 300                |
| 10      | 60                 |

users Table:

| Field      | Data Type |
| :--------- | :-------- |
| user_id    | int       |
| first_name | text      |

users Input:

| user_id | first_name |
| :------ | :--------- |
| 1       | John       |
| 2       | Janice     |
| 3       | Michael    |
| 4       | Molly      |
| 5       | Adam       |
| 6       | Amanda     |
| 7       | Chris      |
| 8       | Christine  |
| 9       | Bella      |
| 10      | Brian      |

<br>

# My Solution

``` SQL
SELECT 
  u.first_name
FROM 
  user_time AS ut INNER JOIN users AS u
  ON ut.user_id = u.user_id
WHERE
  ut.media_time_minutes > (SELECT AVG(media_time_minutes) FROM user_time)
ORDER BY
  u.first_name
```

Output Table:

| first_name |
| :--------- |
| Adam       |
| Bella      |
| Chris      |
| Christine  |
