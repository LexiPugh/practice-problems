# **Practice Problem #69: Average Gaming Session**
### February 7th, 2024
### Languages Used: SQL

<br>

*This is the [Average Gaming Session](https://www.analystbuilder.com/questions/average-gaming-session-dyGji) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

What was the average time spent, per user, gaming on their computer?

<br>

sessions Table:

| Field               | Data Type |
| :------------------ | :-------- |
| user_id             | int       |
| session_id          | int       |
| minutes_per_session | int       |
| activity            | text      |

sessions Input:

| user_id | session_id | minutes_per_session | activity |
| :------ | :--------- | :------------------ | :------- |
| 1       | 1          | 44                  | Gaming   |
| 1       | 1          | 27                  | Homework |
| 1       | 1          | 25                  | YouTube  |
| 2       | 7          | 37                  | Gaming   |
| 2       | 6          | 23                  | Gaming   |
| 3       | 5          | 88                  | Homework |
| 3       | 5          | 85                  | Homework |
| 3       | 4          | 76                  | Homework |
| 4       | 3          | 88                  | YouTube  |
| 4       | 3          | 57                  | Gaming   |
| 4       | 2          | 32                  | Gaming   |
| 4       | 2          | 98                  | YouTube  |

<br>

# My Solution

``` SQL
SELECT 
  user_id,
  AVG(minutes_per_session) AS avg_time_gaming
FROM 
  sessions
WHERE
  activity = 'Gaming'
GROUP BY
  user_id
ORDER BY
  user_id
```

Output Table:

| user_id | avg_time_gaming |
| :------ | :-------------- |
| 1       | 44              |
| 2       | 30              |
| 4       | 44.5            |
