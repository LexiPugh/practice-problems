# **Practice Problem #22: Big Countries**
### December 22nd, 2023
### Languages Used: SQL

<br>

*This is the [Big Countries](https://www.analystbuilder.com/questions/big-countries-JmTAY) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or

it has a population of at least one hundred million (i.e., 100,000,000).

Write a query to report the name, population, and area of the big countries.

Return the result table by country alphabetically.

<br>

countries Table:

| Field             | Data Type |
| :---------------- | --------- |
| country_id        | int       |
| country           | text      |
| square_kilometers | int       |
| population        | int       |

countries Input:

| country_id | country        | square_kilometers | population |
| ---------- | :------------- | ----------------- | :--------- |
| 1          | United States  | 9826630           | 325084756  |
| 2          | China          | 9596961           | 1421021791 |
| 3          | Japan          | 377915            | 127502725  |
| 4          | Germany        | 357114            | 82658409   |
| 5          | India          | 3287263           | 1338676785 |
| 6          | United Kingdom | 243610            | 66727461   |
| 7          | Nigeria        | 923768            | 190873244  |
| 8          | Israel         | 22072             | 8243848    |
| 9          | South Africa   | 1221037           | 57009756   |
| 10         | Hong Kong      | 1106              | 7306322    |
| 11         | Ireland        | 70273             | 4753279    |
| 12         | Denmark        | 42931             | 5732274    |
| 13         | Singapore      | 728               | 5708041    |
| 14         | Malaysia       | 329847            | 31104646   |
| 15         | Turkey         | 783562            | 81116450   |
| 16         | Netherlands    | 41543             | 17021347   |
| 17         | Saudi Arabia   | 2149690           | 33101179   |
| 18         | Switzerland    | 41290             | 8455804    |
| 19         | Argentina      | 2780400           | 43937140   |
| 20         | Sweden         | 450295            | 9904896    |
| 21         | Poland         | 312696            | 37953180   |
| 22         | Belgium        | 30528             | 11419748   |
| 23         | Thailand       | 513120            | 69209810   |

<br>

# My Solution

``` SQL
SELECT 
  country,
  population,
  square_kilometers
FROM 
  countries
WHERE
  square_kilometers >= 3000000
  OR population >= 100000000
ORDER BY
  country
```

Output Table:

| country       | population | square_kilometers |
| :------------ | :--------- | ----------------- |
| China         | 1421021791 | 9596961           |
| India         | 1338676785 | 3287263           |
| Japan         | 127502725  | 377915            |
| Nigeria       | 190873244  | 923768            |
| United States | 325084756  | 9826630           |
