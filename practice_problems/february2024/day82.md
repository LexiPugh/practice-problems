# **Practice Problem #82: Tech Layoffs**
### February 20th, 2024
### Languages Used: SQL

<br>

*This is the [Tech Layoffs](https://www.analystbuilder.com/questions/tech-layoffs-CpLXE) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Tech companies have been laying off employees after a large surge of hires in the past few years.

Write a query to determine the percentage of employees that were laid off from each company.

Output should include the company and the percentage (to 2 decimal places) of laid off employees.

Order by company name alphabetically.

<br>

tech_layoffs Table:

| Field           | Data Type |
| :-------------- | :-------- |
| company         | text      |
| company_size    | int       |
| employees_fired | int       |

tech_layoffs Input:

| company   | company_size | employees_fired |
| :-------- | :----------- | :-------------- |
| Apple     | 147000       | 0               |
| Microsoft | 181000       | 6000            |
| Google    | 139500       | 15000           |
| Amazon    | 1300000      | 12000           |
| Facebook  | 60750        | 11000           |
| Tesla     | 70000        | 1000            |

<br>

# My Solution

``` SQL
SELECT 
  company,
  ROUND((employees_fired / company_size) * 100, 2) AS pct_employees_fired
FROM 
  tech_layoffs
GROUP BY
  company
ORDER BY
  company
```

Output Table:

| company   | pct_employees_fired |
| :-------- | :------------------ |
| Amazon    | 0.92                |
| Apple     | 0                   |
| Facebook  | 18.11               |
| Google    | 10.75               |
| Microsoft | 3.31                |
| Tesla     | 1.43                |
