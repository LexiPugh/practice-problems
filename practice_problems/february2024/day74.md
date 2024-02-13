# **Practice Problem #74: Electric Bike Replacement**
### February 12th, 2024
### Languages Used: SQL

<br>

*This is the [Electric Bike Replacement](https://www.analystbuilder.com/questions/electric-bike-replacement-ZaFie) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

After about 10,000 miles, Electric bike batteries begin to degrade and need to be replaced.

Write a query to determine the amount of bikes that currently need to be replaced.

<br>

bikes Table:

| Field   | Data Type |
| :------ | :-------- |
| bike_id | int       |
| miles   | int       |

bikes Input:

| bike_id | miles |
| :------ | :---- |
| 120320  | 15842 |
| 120321  | 15027 |
| 120322  | 6657  |
| 120323  | 22431 |
| 120324  | 14427 |
| 120325  | 6868  |
| 120326  | 9341  |
| 120327  | 17345 |
| 120328  | 14668 |
| 120329  | 11322 |
| 120330  | 22363 |
| 120331  | 4939  |
| 120332  | 915   |
| 120333  | 6380  |

<br>

# My Solution

``` SQL
SELECT 
  COUNT(bike_id) AS needs_replacement
FROM 
  bikes
WHERE
  miles >= 10000
```

Output Table:

| needs_replacement |
| :---------------- |
| 8                 |
