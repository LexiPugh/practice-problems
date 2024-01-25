# **Practice Problem #56: Kroger's Members**
### January 25th, 2024
### Languages Used: SQL

<br>

*This is the [Kroger's Members](https://www.analystbuilder.com/questions/krogers-members-FjyKN) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Kroger's is a very popular grocery chain in the US. They offer a membership card in exchange for a discount on select items. Customers can still shop at Krogers without the card.

Write a query to find the percentage of customers who shop at Kroger's who also have a Kroger's membership card. Round to 2 decimal places.

<br>

customers Table:

| Field           | Data Type |
| :-------------- | :-------- |
| kroger_id       | int       |
| has_member_card | text      |

customers Input:

| kroger_id | has_member_card |
| :-------- | :-------------- |
| 1         | Y               |
| 2         | Y               |
| 3         | _NULL_          |
| 4         | Y               |
| 5         | _NULL_          |
| 6         | Y               |
| 7         | _NULL_          |
| 8         | Y               |
| 9         | Y               |
| 10        | Y               |
| 11        | _NULL_          |
| 12        | _NULL_          |
| 13        | Y               |
| 14        | _NULL_          |
| 15        | _NULL_          |
| 16        | Y               |
| 17        | _NULL_          |
| 18        | Y               |
| 19        | Y               |
| 20        | _NULL_          |
| 21        | Y               |
| 22        | _NULL_          |
| 23        | Y               |
| 24        | Y               |
| 25        | _NULL_          |
| 26        | Y               |
| 27        | _NULL_          |
| 28        | Y               |
| 29        | _NULL_          |
| 30        | Y               |


<br>

# My Solution

``` SQL
SELECT 
  ROUND((COUNT(has_member_card)/COUNT(kroger_id)) *100, 2) AS member_percentage
FROM 
  customers
```

Output Table:

| member_percentage |
| :---------------- |
| 56.67             |
