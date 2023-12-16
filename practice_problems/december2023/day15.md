# **Practice Problem #15: Ice Cream Popularity**
### December 15th, 2023
### Languages Used: SQL and Python

<br>

*This is the [Ice Cream Popularity](https://www.analystbuilder.com/questions/ice-cream-popularity-InQki) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

The National Ice Cream Association recently released their Ranking for Ice Cream flavors for 2023.

One disgruntled ice cream lover was not happy with the official rankings and decided to create his own community sourced rankings.

He wanted to send the ice cream flavors that the community ranked higher than the judges to hopefully persuade them to raise their scores.

Write a query to return ice cream flavors that were ranked higher by the community than the official ratings.

Order the flavors alphabetically.

<br>

ice_cream Table:

| Field               | Data Type         | 
| :----------------   | :----------       | 
| rank                | int               | 
| flavor              | text              | 
| official_rating	    | float             | 
| community_rating	  | float             | 

ice_cream Input:

| rank       | flavor                 | official_rating	 | community_rating  |                                              
| :--------- | :--------              | :----------      | :----------       |                                                
| 1	         | Vanilla                | 9.5              | 8                 | 
| 2	         | Mint Chocolate Chip    | 9.4	             | 7                 |    
| 3	         | Chocolate              | 9.3              | 9.8               |
| 4	         | Pistachio              | 8.7              | 4.2               |
| 5	         | Cake Batter            | 8.6	             | 9.1               |    
| 6	         | Rocky Road             | 8.4              | 9.5               | 
| 7	         | Moose Tracks           | 8.4              | 8.4               |
| 8	         | Cookie Dough           | 8.2	             | 8.2               |    
| 9	         | Salted Caramel         | 8                | 6.8               |
| 10	       | Cookies n' Cream       | 8                | 8.8               |
| 11	       | Chocolate Swirl        | 8	               | 7.7               |    
| 12	       | Pistachio              | 7.6              | 7.6               |
| 13	       | Chocolate Chip         | 7.2              | 7.2               |
| 14	       | Cotton Candy           | 7	               | 6.5               |    
| 15	       | Strawberry Cheesecake  | 7                | 7.1               |
| 16	       | Matcha Green Tea       | 7	               | 7                 |    
| 17	       | Bubblegum              | 6.8              | 6.8               |
| 18	       | Strawberry             | 6.7              | 7.2               |
| 19	       | Neapolitan             | 6	               | 6                 |    
| 20	       | Butter Pecan           | 3                | 3                 |


<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  flavor
FROM 
  ice_cream
WHERE
  community_rating > official_rating
ORDER BY
  flavor
```

### Second Solution: Python

``` Python
ice_cream = ice_cream[ice_cream['community_rating'] > ice_cream['official_rating']]

ice_cream = ice_cream.sort_values(by='flavor')

ice_cream[['flavor']]
```

Output Table:
| flavors                |                                              
| :------------          |                                                     
| Cake Batter   	       |
| Chocolate   	         |
| Cookies n' Cream   	   |
| Rocky Road   	         |
| Strawberry   	         |
| Strawberry Cheesecake  |