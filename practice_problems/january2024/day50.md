# **Practice Problem #50: Separation**
### January 19th, 2024
### Languages Used: SQL

<br>

*This is the [Separation](https://www.analystbuilder.com/questions/separation-DbHMu) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Data was input incorrectly into the database. The ID was combined with the First Name.

Write a query to separate the ID and First Name into two separate columns.

Each ID is 5 characters long.

<br>

bad_data Table:

| Field | Data Type |
| :---- | :-------- |
| id    | text      |

bad_data Input:

| id           |
| :----------- |
| 12345Johnny  |
| 93829Sally   |
| 20391Larry   |
| 29324Valerie |


<br>

# My Solution

``` SQL
SELECT 
  LEFT(id, 5) AS fixed_id,
  SUBSTRING(id, 6) AS fixed_name
FROM 
  bad_data
```

Output Table:

| fixed_id | fixed_name |
| :------- | :--------- |
| 12345    | Johnny     |
| 93829    | Sally      |
| 20391    | Larry      |
| 29324    | Valerie    |
