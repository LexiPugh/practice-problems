# **Practice Problem #88: Ranking Students**
### February 26th, 2024
### Languages Used: SQL

<br>

*This is the [Ranking Students](https://www.analystbuilder.com/questions/ranking-students-oiUWe) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Rank the student's scores in the Grades table from highest to lowest. If two students have the same grade, give them the same ranking. The next rank should be the next number numerically.

Output should include name, grade, and rank. Order the output by rank in ascending order and name alphabetically.

<br>

grades Table:

| Field        | Data Type |
| :----------- | :-------- |
| student_name | text      |
| grade        | int       |

grades Input:

| student_name | grade |
| :----------- | :---- |
| Andy         | 97    |
| Dwight       | 98    |
| Pam          | 86    |
| Michael      | 58    |
| Kelly        | 72    |
| Creed        | 25    |
| Jim          | 98    |
| Toby         | 85    |

<br>

# My Solution

``` SQL
SELECT 
  student_name,
  grade,
  DENSE_RANK() OVER (ORDER BY grade DESC) AS ranks
FROM 
  grades
ORDER BY
  ranks,
  student_name
```

Output Table:

| student_name | grade | ranks |
| :----------- | :---- | :---- |
| Dwight       | 98    | 1     |
| Jim          | 98    | 1     |
| Andy         | 97    | 2     |
| Pam          | 86    | 3     |
| Toby         | 85    | 4     |
| Kelly        | 72    | 5     |
| Michael      | 58    | 6     |
| Creed        | 25    | 7     |
