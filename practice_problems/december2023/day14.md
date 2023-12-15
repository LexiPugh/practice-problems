# **Practice Problem #14: Wealthy Customers**
### December 14th, 2023
### Languages Used: SQL and Python

<br>

*This is the [Wealthy Customers](https://www.analystbuilder.com/questions/wealthy-customers-VaBYt) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to report the number of customers who had at least one bill with an amount strictly greater than 500.

<br>

transactions Table:

| Field                 | Data Type         | 
| :----------------     | :----------       | 
| transaction_id        | int               | 
| customer_id           | text              |
| bill_total            | int             |


transactions Input:

| transaction_id  | customer_id  | bill_total   |                                               
| :------------   | :----------  | :----------  |                                                      
| 1234	          | 1            | 705          |     
| 1235	          | 2            | 452	        |             
| 1236	          | 3            | 751          | 
| 1237	          | 1            | 530          |  
| 1238	          | 1            | 881          |  
| 1239	          | 1            | 425          |  
| 1240	          | 4            | 797          |     
| 1241	          | 5            | 846          |  
| 1242	          | 4            | 615          |  
| 1243	          | 4            | 898          |  
| 1244	          | 3            | 492          |    
                    

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  COUNT(DISTINCT customer_id) AS customer_count 
FROM 
  transactions
WHERE
  bill_total > 500
```

### Second Solution: Python

``` Python
transactions = transactions[transactions['bill_total'] > 500]

transactions = transactions['customer_id'].nunique()

transactions
```

Output Table:
| customer_count  |                                              
| :------------   |                                                     
| 4   	          |

