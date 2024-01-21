# **Practice Problem #52: Food Divides Us**
### January 21st, 2024
### Languages Used: SQL

<br>

*This is the [Food Divides Us](https://www.analystbuilder.com/questions/food-divides-us-GvhLL) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

In the United States, fast food is the cornerstone of its very society. Without it, it would cease to exist.

But which region spends the most money on fast food?

Write a query to determine which region spends the most amount of money on fast food.

<br>

food_regions Table:

| Field              | Data Type |
| :----------------- | :-------- |
| state              | text      |
| region             | text      |
| fast_food_millions | int       |

food_regions Input:

| state          | region    | fast_food_millions |
| :------------- | :-------- | :----------------- |
| Alabama        | South     | 83                 |
| Alaska         | West      | 80                 |
| Arizona        | West      | 81                 |
| Arkansas       | South     | 45                 |
| California     | West      | 52                 |
| Colorado       | West      | 84                 |
| Connecticut    | Northeast | 13                 |
| Delaware       | South     | 39                 |
| Florida        | South     | 78                 |
| Georgia        | South     | 29                 |
| Hawaii         | West      | 81                 |
| Idaho          | West      | 99                 |
| Illinois       | Midwest   | 67                 |
| Indiana        | Midwest   | 82                 |
| Iowa           | Midwest   | 27                 |
| Kansas         | Midwest   | 50                 |
| Kentucky       | South     | 99                 |
| Louisiana      | South     | 11                 |
| Maine          | Northeast | 85                 |
| Maryland       | South     | 47                 |
| Massachusetts  | Northeast | 71                 |
| Michigan       | Midwest   | 60                 |
| Minnesota      | Midwest   | 28                 |
| Mississippi    | South     | 87                 |
| Missouri       | Midwest   | 69                 |
| Montana        | West      | 73                 |
| Nebraska       | Midwest   | 100                |
| Nevada         | West      | 36                 |
| New Hampshire  | Northeast | 92                 |
| New Jersey     | Northeast | 33                 |
| New Mexico     | West      | 92                 |
| New York       | Northeast | 17                 |
| North Carolina | South     | 98                 |
| North Dakota   | Midwest   | 16                 |
| Ohio           | Midwest   | 15                 |
| Oklahoma       | South     | 43                 |
| Oregon         | West      | 93                 |
| Pennsylvania   | Northeast | 100                |
| Rhode Island   | Northeast | 47                 |
| South Carolina | South     | 62                 |
| South Dakota   | Midwest   | 33                 |
| Tennessee      | South     | 100                |
| Texas          | South     | 94                 |
| Utah           | West      | 41                 |
| Vermont        | Northeast | 48                 |
| Virginia       | South     | 79                 |
| Washington     | West      | 80                 |
| West Virginia  | South     | 49                 |
| Wisconsin      | Midwest   | 35                 |
| Wyoming        | West      | 15                 |


<br>

# My Solution

``` SQL
SELECT
  region
FROM 
  food_regions
GROUP BY 
  region
ORDER BY
  SUM(fast_food_millions) DESC
LIMIT
  1
```

Output Table:

| region |
| :----- |
| South  |
