# **Practice Problem #8: Duplicate Emails**
### December 8th, 2023
### Languages Used: SQL and Python

<br>

*This is the [Duplicate Emails]([https://www.analystbuilder.com/questions/duplicate-emails-EPzzg]) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

There's recently been an error on our server where some emails were duplicated. We need to identify those emails so we can remove the duplicates.

Write a query to report all the duplicate emails and how many times they are in the database.

Output should be in alphabetical order.

<br>

emails Table:

| Field                 | Data Type         | 
| :----------------     | :----------       | 
| id                    | int               | 
| email                 | text              |


emails Input:

| id             | email                    |                                               
| :------------  | :----------              |                                                      
| 1	             | alex@gmail.com           |   
| 2	             | Gregory@yahoo.com        |            
| 3	             | alex@analystbuilder.com  |
| 4	             | sally@aol.com            | 
| 5	             | ted@gmail.com            | 
| 6	             | Kevin@yahoo.com          |
| 7	             | Jennifer@yahoo.com       |    
| 8	             | alex@gmail.com           |   
| 9	             | Larry@gmail.com          |            
| 10	           | Ted@yahoo.com            |
| 11	           | sally@aol.com            |    
                    

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT
  email,
  COUNT(email) AS email_count
FROM 
  emails
GROUP BY
  email
HAVING
  email_count > 1
ORDER BY
  email
```

### Second Solution: Python

``` Python
group = emails.groupby(['email']).count().reset_index().rename(columns={'id': 'email_count'})

filter = group[group['email_count'] > 1]

emails = filter.sort_values(by='email')

emails[['email', 'email_count']]
```

Output Table:
| email           | email_count       |                                               
| :------------   | :----------       |                                                      
| alex@gmail.com	| 2                 |   
| sally@aol.com	  | 2                 |             
  
