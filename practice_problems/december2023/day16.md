# **Practice Problem #16: Gamer Tags**
### December 16th, 2023
### Languages Used: SQL and Python

<br>

*This is the [Gamer Tags](https://www.analystbuilder.com/questions/gamer-tags-ggMnJ) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Create a gamer tag for each player in the tournament.

Select the first 3 characters of their first name and combine that with the year they were born.

Your output should have their first name, last name, and gamer tag called "gamer_tag"

Order output on gamertag in alphabetical order.

<br>

gamer_tags Table:

| Field               | Data Type        | 
| :----------------   | :----------      | 
| first_name          | text             | 
| last_name           | text             | 
| birth_date	        | date             | 
| game	              | text             | 

gamer_tags Input:

| first_name  | last_name  | birth_date	  | game               |                                              
| :---------  | :--------  | :----------  | :----------        |                                                
| Alexander	  | Maxwell    | 1998-01-01   | League of Legends  | 
| Johnny	    | Baxter     | 1997-11-05		| Dota 2             |    
| Kelly	      | Zillen     | 1996-03-04   | League of Legends  |
| Kevin	      | Mallow     | 2000-12-12	  | League of Legends  |
| Lisa	      | Larz       | 1997-03-04		| Dota 2             |    


<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT
  first_name,
  last_name,
  CONCAT(LEFT(first_name, 3), YEAR(birth_date)) AS gamer_tag
FROM 
  gamer_tags
ORDER BY
  gamer_tag
```

### Second Solution: Python

``` Python
first_three_letters = gamer_tags['first_name'].str[:3]

year_of_birth = gamer_tags['birth_date'].str.split('/').str[2]

gamer_tags['gamer_tag'] = first_three_letters + year_of_birth

gamer_tags = gamer_tags.sort_values(by='gamer_tag')

gamer_tags[['first_name', 'last_name', 'gamer_tag']]
```

Output Table:
| first_name  | last_name  | gamer_tag	  |                                            
| :---------  | :--------  | :----------  |                                                
| Alexander	  | Maxwell    | Ale1988      |
| Johnny	    | Baxter     | Joh1997		  |   
| Kelly	      | Zillen     | Kel1996      |
| Kevin	      | Mallow     | Kev2000  	  |
| Lisa	      | Larz       | Lis1997  		|