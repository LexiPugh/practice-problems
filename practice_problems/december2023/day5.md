# **Practice Problem #5: Big GDP**
### December 5th, 2023
### Languages Used: SQL

<br>

*This is the [Big GDP](https://www.analystbuilder.com/questions/big-gdp-uTwYE) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Amidst the global chocolate crisis, we must urgently identify the countries with GDPs over 10 Trillion to ensure they can still afford to satisfy their sweet cravings.

Please identify all countries with an annual GDP over 10 Trillion per year.

Provide only the country name in your output in alphabetical order.

<br>

big_gdp Table:

| Field                 | Data Type         | 
| :----------------     | :----------       | 
| country_id            | int               | 
| country               | text              | 
| gdp_per_million       | int               |
| population            | int               |


big_gdp Input:

| country_id   | country         | gdp_per_million   | population   |                                                
| :------------| :----------     | :----------       | :----------  |                                               
| 1	           | United States   | 19485394          | 325084756    |
| 2	           | China           | 12237700	         | 1421021791   |              
| 3	           | Japan           | 4872415	         | 127502725    |
| 4	           | Germany         | 3693204	         | 82658409     |
| 5	           | India           | 2650725		       | 1338676785   |              
| 6	           | United Kingdom  | 2637866		       | 66727461     |    
| 7	           | Nigeria         | 1375745           | 190873244    |
| 8	           | Israel          | 353268		         | 8243848      |              
| 9	           | South Africa    | 348872	           | 57009756     |    
| 10	         | Hong Kong       | 341449	           | 7306322      |
| 11	         | Ireland         | 331430		         | 4753279      |              
| 12	         | Denmark         | 329866		         | 5732274      |    
| 13	         | Singapore       | 323907            | 5708041      |
| 14	         | Malaysia        | 314710	           | 31104646     |              
| 15	         | Turkey          | 851549		         | 81116450     |    
| 16	         | Netherlands     | 830573	           | 17021347     |
| 17	         | Saudi Arabia    | 686738		         | 33101179     |              
| 18	         | Switzerland     | 678965		         | 8455804      |    
| 19	         | Argentina       | 637430	           | 43937140     |
| 20	         | Sweden          | 535607		         | 9904896      |              
| 21	         | Poland          | 526466		         | 37953180     |
| 22	         | Belgium         | 494764		         | 11419748     |              
| 23	         | Thailand	       | 4872415	         | 69209810     |        
                    

<br>

# My Solution

``` SQL
SELECT 
  country
FROM 
  big_gdp 
WHERE
  gdp_per_million > 10000000
ORDER BY
  country
```

Output Table:
| country         |                                                       
| :----------     |                                            
| China           |
| United States   |        
