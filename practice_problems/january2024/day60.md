# **Practice Problem #60: LinkedIn Famous**
### January 29th, 2024
### Languages Used: SQL

<br>

*This is the [LinkedIn Famous](https://www.analystbuilder.com/questions/linkedin-famous-oQMdb) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to determine the popularity of a post on LinkedIn

Popularity is defined by number of actions (likes, comments, shares, etc.) divided by the number impressions the post received * 100.

If the post receives a score higher than 1 it was very popular.

Return all the post IDs and their popularity where the score is 1 or greater.

Order popularity from highest to lowest.

<br>

linkedin_posts Table:

| Field       | Data Type |
| :---------- | :-------- |
| post_id     | int       |
| impressions | int       |
| actions     | int       |

linkedin_posts Input:

| post_id | impressions | actions |
| :------ | :---------- | :------ |
| 18492   | 49582       | 3891    |
| 18493   | 308331      | 133     |
| 18494   | 99497       | 4216    |
| 18495   | 243090      | 147     |
| 18496   | 423314      | 8710    |
| 18497   | 285188      | 304     |
| 18498   | 34170       | 985     |
| 18499   | 120319      | 4411    |
| 18500   | 206544      | 5195    |
| 18501   | 381259      | 9826    |
| 18502   | 1207537     | 9096    |
| 18503   | 393968      | 8047    |

<br>

# My Solution

``` SQL
SELECT 
  post_id,
  (actions/impressions)*100 AS popularity_score
FROM 
  linkedin_posts
HAVING
  popularity_score >= 1
ORDER BY
  popularity_score DESC
```

Output Table:

| post_id | popularity_score |
| :------ | :--------------- |
| 18492   | 7.8476           |
| 18494   | 4.2373           |
| 18499   | 3.6661           |
| 18498   | 2.8826           |
| 18501   | 2.5773           |
| 18500   | 2.5152           |
| 18496   | 2.0576           |
| 18503   | 2.0426           |
