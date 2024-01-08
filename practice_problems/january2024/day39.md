# **Practice Problem #39: Homes Built**
### January 8th, 2024
### Languages Used: SQL and Python

<br>

*This is the [Homes Built](https://www.analystbuilder.com/questions/homes-built-rkYrz) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Select all homes that were built between 2012 and 2017.

Return only the address for that home.

<br>

homes Table:

| Field   | Data Type |
| :------ | :-------- |
| address | text      |
| year    | int       |

homes Input:

| address                 | year |
| :---------------------- | :--- |
| 851 Hickory Ridge Drive | 2018 |
| 3198 Cody Ridge Road    | 2019 |
| 3705 Saints Alley       | 1999 |
| 4752 Station Street     | 2004 |
| 2261 Arrowood Drive     | 2018 |
| 382 Round Table Drive   | 2023 |
| 2850 Perry Street       | 2012 |
| 535 Wiseman Street      | 2000 |
| 795 Woodlawn Drive      | 2006 |
| 3981 American Drive     | 2014 |
| 399 Kenwood Place       | 2022 |
| 2007 Tibbs Avenue       | 2014 |

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  address
FROM 
  homes
WHERE 
  year >= 2012 
  AND year <= 2017
```

### Second Solution: Python

``` Python
homes = homes[(homes['year'] >= 2012) & (homes['year'] <= 2017)]

homes[['address']]
```

Output Table:

| address             |
| :------------------ |
| 2850 Perry Street   |
| 3981 American Drive |
| 2007 Tibbs Avenue   |
