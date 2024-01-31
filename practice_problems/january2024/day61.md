# **Practice Problem #61: Intern Problems**
### January 30th, 2024
### Languages Used: SQL

<br>

*This is the [Intern Problems](https://www.analystbuilder.com/questions/intern-problems-apagH) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

We had two different interns manually inputting the data into our database.

Unfortunately they hadn't agreed on a format beforehand.... of course.

Standardize the output so all of the answers are either "Y" or "N".

<br>

responses Table:

| Field    | Data Type |
| :------- | :-------- |
| response | text      |

responses Input:

| response |
| :------- |
| Yes      |
| Yes      |
| Yes      |
| No       |
| No       |
| Yes      |
| No       |
| Yes      |
| No       |
| Y        |
| N        |
| Y        |
| Y        |
| Y        |
| N        |
| N        |
| N        |
| N        |
| Y        |

<br>

# My Solution

``` SQL
SELECT 
  CASE
    WHEN response = "Yes" THEN "Y"
    WHEN response = "No" THEN "N"
    ELSE response
  END AS response_fixed
FROM 
  responses
```

Output Table:

| response_fixed |
| :------------- |
| Y              |
| Y              |
| Y              |
| N              |
| N              |
| Y              |
| N              |
| Y              |
| N              |
| Y              |
| N              |
| Y              |
| Y              |
| Y              |
| N              |
| N              |
| N              |
| N              |
| Y              |
