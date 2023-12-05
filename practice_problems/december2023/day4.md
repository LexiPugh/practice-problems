# **Practice Problem #4: Page With No Likes**
### December 4th, 2023
### Languages Used: SQL

<br>

*This is the [Page With No Likes](https://datalemur.com/questions/sql-page-with-no-likes) practice problem from DataLemur. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

<br>

pages Table:

| Field                 | Data Type          | 
| :----------------     | :----------        | 
| page_id               | integer            | 
| page_name             | varchar            | 


pages Example Input:

| page_id          | page_name               |                                                          
| :------------    | :----------             |                                                        
| 20001	           | SQL Solutions           |        
| 20045	           | Brain Exercises         |                       
| 20701	           | Tips for Data Analysts  |               
                    

page_likes Table:

| Field                 | Data Type          | 
| :----------------     | :----------        | 
| user_id               | integer            | 
| page_id               | integer            | 
| liked_date            | datetime           | 


page_likes Example Input:

| user_id      | page_id       | liked_date            |                                                    
| :------------| :----------   | :----------           |                                                  
| 111	         | 20001         | 04/08/2022 00:00:00   |     
| 121	         | 20045         | 03/12/2022 00:00:00	 |             
| 156	         | 20001         | 07/25/2022 00:00:00   |           

Example Output:

| page_id            | 
| :----------------  |
| 20701              | 

The dataset you are querying against may have different input & output - this is just an example!

<br>

# My Solution

``` SQL
SELECT
  p.page_id
FROM 
  pages AS p
LEFT JOIN 
  page_likes AS l
  ON p.page_id = l.page_id
WHERE 
  l.page_id IS NULL
ORDER BY
  p.page_id
```

Output Table:

| page_id            | 
| :----------------  |
| 20701              |
| 32728              |
