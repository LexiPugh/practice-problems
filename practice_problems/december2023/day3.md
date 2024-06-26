# **Practice Problem #3: Combine Two Tables**
### December 3rd, 2023
### Languages Used: SQL

<br>

*This is the [Combine Two Tables](https://www.analystbuilder.com/questions/combine-two-tables-LTaKJ) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Join these two tables together to return the first name, last name, and state for each person.

If there is no matching employee in the location table the state should be Null for that person.

Order the output alphabetically on their first names.

<br>

employee_name Table:

| Field                 | Data Type          | 
| :----------------     | :----------        | 
| person_id             | int                | 
| first_name            | text               | 
| last_name             | text               |


employee_name Input:

| person_id    | first_name    | last_name   |                                                         
| :------------| :----------   | :---------- |                                                       
| 1	           | John          | Jackson     |  
| 2	           | Sally         | Surray	     |                   
| 3	           | Luke          | Lambowitz   |              
| 4            | Kurt	         | Kindly      |
                    

employee_location Table:

| Field                 | Data Type          | 
| :----------------     | :----------        | 
| employee_id           | int                | 
| city                  | text               | 
| state                 | text               | 
| state_id              | text               | 

employee_location Input:

| employee_id  | city          | state          | state_id    |                                              
| :------------| :----------   | :----------    | :---------- |                                                
| 1	           | Charlotte     | North Carolina | NC          |
| 3	           | Austin        | Texas	        | TX          |    
| 4	           | New York      | New York       | NY          | 


<br>

# My Solution

``` SQL
SELECT
  first_name,
  last_name,
  state
FROM 
  employee_name AS n
  LEFT JOIN employee_location AS l
  ON n.person_id = l.employee_id
ORDER BY
  first_name
```

Output Table:
| first_name    | last_name     | state           |                                                        
| :----------   | :----------   | :----------     |                                               
| John          | Jackson       | North Carolina  |
| Kurt          | Kindly	      | New York        |         
| Luke          | Lambowitz     | Texas           |  
| Sally	        | Surray        | *NULL*          |
