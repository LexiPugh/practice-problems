# **Practice Problem #12: Movie Theater**
### December 12th, 2023
### Languages Used: SQL

<br>

*This is the [Movie Theater](https://www.analystbuilder.com/questions/movie-theater-HinSS) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Select customers IDs who bought "M&Ms", "Snickers", or "Twizzlers".

<br>

customers Table:

| Field                 | Data Type         | 
| :----------------     | :----------       | 
| customer_id           | int               | 
| movie                 | text              |
| purchased_items       | text              |


customers Input:

| customer_id    | movie              | purchased_items  |                                               
| :------------  | :----------        | :----------      |                                                      
| 101	           | Lion King          | Popcorn          |     
| 102	           | Avengers           | Milk Duds	       |             
| 103	           | Lord of the Rings  | M&Ms             | 
| 104	           | Wakanda Forever    | Twizzlers        |  
| 105	           | The Godfather      | Snickers         |  
| 106	           | Pulp Fiction       | Popcorn          |  
| 107	           | Star Wars          | Raisinettes      |     
| 108	           | Inception          | Milky Way        |  
| 109	           | The Matrix         | Snickers         |  
| 110	           | Interstellar       | Popcorn          |  
| 111	           | Terminator         | M&Ms             |    
                    

<br>

# My Solution

``` SQL
SELECT
  customer_id
FROM 
  customers
WHERE
  purchased_items IN ('M&Ms', 'Snickers', 'Twizzlers')
```

Output Table:
| customer_id    |                                              
| :------------  |                                                     
| 103	           |
| 104	           |             
| 105	           |
| 109	           |  
| 111	           |  
