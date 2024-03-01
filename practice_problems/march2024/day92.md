# **Practice Problem #92: Full Time Jobs**
### March 1st, 2024
### Languages Used: SQL

<br>

*This is the [Full Time Jobs](https://www.analystbuilder.com/questions/full-time-jobs-wrQwf) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to find the people who are currently working 2 or more full-time jobs. Return their first and last name, and the number of full-time jobs they are working.

<br>

job_two Table:

| Field         | Data Type |
| :------------ | :-------- |
| employee_id   | int       |
| employee_name | text      |
| salary        | int       |
| full_time     | text      |

job_two Input:

| employee_id | employee_name   | salary | full_time |
| :---------- | :-------------- | :----- | :-------- |
| 560021      | Sue Johnson     | 65000  | Y         |
| 560022      | Kelly Lorily    | 75000  | N         |
| 560023      | Joshua Mackas   | 60000  | N         |
| 560024      | Caleb Glen      | 45000  | Y         |
| 560025      | Gerald McFinney | 55000  | Y         |
| 560026      | Amanda Bines    | 85000  | Y         |
| 560027      | Roger Felton    | 65000  | N         |
| 560028      | Mark Hammel     | 55000  | Y         |

job_one Table:

| Field       | Data Type |
| :---------- | :-------- |
| employee_id | int       |
| name        | text      |
| salary      | int       |
| full_time   | text      |

job_one Input:

| employee_id | name                | salary | full_time |
| :---------- | :------------------ | :----- | :-------- |
| 1001        | Mark Hammel         | 65000  | Y         |
| 1002        | Craig Johnson       | 75000  | Y         |
| 1003        | Kelly Lorily        | 60000  | N         |
| 1004        | Marigold Feltswater | 45000  | Y         |
| 1005        | Herald Jobine       | 55000  | Y         |
| 1006        | Amanda Bines        | 85000  | Y         |
| 1007        | Rebecca Love        | 65000  | Y         |
| 1008        | Trevor McMoran      | 55000  | N         |

<br>

# My Solution

``` SQL
SELECT
  employee_name,
  COUNT(full_time) AS num_jobs
FROM
  ( SELECT 
      * 
    FROM 
      job_two
    UNION
    SELECT
      *
    FROM
      job_one ) AS job_data
WHERE
  full_time = 'Y'
GROUP BY 
  employee_name
HAVING 
  num_jobs = 2
```

Output Table:

| employee_name | num_jobs |
| :------------ | :------- |
| Amanda Bines  | 2        |
| Mark Hammel   | 2        |
