# **Practice Problem #89: TMI (Too Much Information)**
### February 27th, 2024
### Languages Used: SQL

<br>

*This is the [TMI (Too Much Information)](https://www.analystbuilder.com/questions/tmi-too-much-information-VyNhZ) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Often when you're working with customer information you'll want to sell that data to a third party. Sometimes it is illegal to give away sensitive information such as a full name.

Here you are given a table that contains a customer ID and their full name.

Return the customer ID with only the first name of each customer.

<br>

customers Table:

| Field       | Data Type |
| :---------- | :-------- |
| customer_id | int       |
| full_name   | text      |

customers Input:

| customer_id | full_name     |
| :---------- | :------------ |
| 1001        | John McGary   |
| 1002        | Sally Sue     |
| 1003        | Jenny McBlue  |
| 1004        | Craig Johnson |
| 1005        | Henry Hue     |
| 1006        | Alex Freebird |

<br>

# My Solution

``` SQL
SELECT 
  customer_id,
  SUBSTRING_INDEX(full_name, ' ', 1 ) AS first_name
FROM 
  customers
```

Output Table:

| customer_id | first_name |
| :---------- | :--------- |
| 1001        | John       |
| 1002        | Sally      |
| 1003        | Jenny      |
| 1004        | Craig      |
| 1005        | Henry      |
| 1006        | Alex       |
