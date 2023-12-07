# **Practice Problem #7: Most Orders**
### December 7th, 2023
### Languages Used: SQL and Python

<br>

*This is the [Most Orders](https://www.analystbuilder.com/questions/most-orders-lPUKT) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to identify the customer who had the largest number of orders.

Return the Customer_ID and number of orders, but if 2 customers had the same amount of orders, return them both.

<br>

orders Table:

| Field                 | Data Type         | 
| :----------------     | :----------       | 
| customer_id           | int               | 
| number_of_orders      | int               |


orders Input:

| customer_id    | number_of_orders |                                               
| :------------  | :----------      |                                                      
| 1	             | 15               |   
| 2	             | 25               |            
| 3	             | 4                |
| 4	             | 21               | 
| 5	             | 5                | 
| 6	             | 9                |
| 7	             | 25               |    
| 8	             | 22               |   
| 9	             | 2                |            
| 10	           | 1                |
| 11	           | 14               | 
| 12	           | 11               |    
                    

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  customer_id,
  number_of_orders
FROM 
  orders
WHERE
   number_of_orders = (SELECT MAX(number_of_orders) FROM orders)
```

### Second Solution: Python

``` Python
max_order = orders['number_of_orders'].max()

orders = orders[(orders.number_of_orders == max_order)]

orders
```

Output Table:
| customer_id    | number_of_orders  |                                               
| :------------  | :----------       |                                                      
| 2   	         | 25                |   
| 7   	         | 25                |             
  
