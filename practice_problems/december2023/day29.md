# **Practice Problem #29: Tesla Models**
### December 29th, 2023
### Languages Used: SQL and Python

<br>

*This is the [Tesla Models](https://www.analystbuilder.com/questions/tesla-models-soJdJ) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Tesla just provided their quarterly sales for their major vehicles.

Determine which Tesla Model has made the most profit.

Include all columns with the "profit" column at the end.

<br>

tesla_models Table:

| Field           | Data Type |
| :-------------- | :-------- |
| tesla_model     | text      |
| car_price       | int       |
| cars_sold       | int       |
| production_cost | int       |

tesla_models Input:

| tesla_model | car_price | cars_sold | production_cost |
| :---------- | :-------- | :-------- | :-------------- |
| Model 3     | 46990     | 156357    | 21000           |
| Model S     | 104990    | 23464     | 43000           |
| Model X     | 120990    | 19542     | 48000           |
| Model Y     | 65990     | 191451    | 35000           |

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  *,
  ((car_price - production_cost) * cars_sold) AS profit
FROM 
  tesla_models
ORDER BY
  profit DESC
LIMIT
  1
```

### Second Solution: Python

``` Python
tesla_models['profit'] = (tesla_models['car_price'] - tesla_models['production_cost']) * tesla_models['cars_sold']

tesla_models = tesla_models.sort_values(by = 'profit', ascending = False)

tesla_models.head(1)
```

Output Table:

| tesla_model | car_price | cars_sold | production_cost | profit     |
| :---------- | :-------- | :-------- | :-------------- | :--------- |
| Model Y     | 65990     | 191451    | 35000           | 5933066490 |
