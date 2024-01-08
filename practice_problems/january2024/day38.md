# **Practice Problem #38: Best Classes**
### January 7th, 2024
### Languages Used: SQL and Python

<br>

*This is the [Best Classes](https://www.analystbuilder.com/questions/best-classes-EJhxO) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to determine which classes have the highest average grade.

Output the class and average grade.

Order average grade from highest to lowest.

<br>

classes Table:

| Field        | Data Type |
| :----------- | :-------- |
| student_name | text      |
| class        | text      |
| grade        | int       |

classes Input:

| student_name | class   | grade |
| :----------- | :------ | :---- |
| Student A    | English | 98    |
| Student A    | Math    | 76    |
| Student A    | Science | 99    |
| Student B    | English | 83    |
| Student B    | Math    | 96    |
| Student B    | Science | 91    |
| Student C    | English | 91    |
| Student C    | Math    | 96    |
| Student C    | Science | 90    |
| Student D    | English | 94    |
| Student D    | Math    | 99    |
| Student D    | Science | 99    |

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  class,
  AVG(grade) AS average_grade
FROM 
  classes
GROUP BY
  class
ORDER BY
  average_grade DESC
```

### Second Solution: Python

``` Python
classes = classes.groupby(['class'])['grade'].mean().reset_index(name='average_grade')

classes = classes.sort_values(by='average_grade', ascending=False)

classes
```

Output Table:

| class   | average_grade |
| :------ | :------------ |
| Science | 94.75         |
| Math    | 91.75         |
| English | 91.5          |
