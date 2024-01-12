# **Practice Problem #43: Baseball Scouts**
### January 12th, 2024
### Languages Used: SQL and Python

<br>

*This is the [Baseball Scouts](hhttps://www.analystbuilder.com/questions/baseball-scouts-JlzcH) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Scouts often go to Amateur Baseball games to find potential players to bring up to the big leagues. They want to categorize the players to determine what skill level they're currently at.

If a player has a batting average of .38 or higher they are a "Great Hitter". If a player has a batting average between .27 and .37 they're "Average". Anything below a .27 is "Below Average"

Return each players ID, Batting Average, and skill level as "skill_level".

<br>

players Table:

| Field           | Data Type |
| :-------------- | :-------- |
| player_id       | int       |
| batting_average | float     |

players Input:

| player_id | batting_average |
| :-------- | :-------------- |
| 104       | 0.45            |
| 105       | 0.27            |
| 106       | 0.18            |
| 107       | 0.33            |
| 108       | 0.38            |
| 109       | 0.1             |
| 110       | 0.23            |
| 111       | 0.26            |
| 112       | 0.31            |
| 113       | 0.2             |
| 114       | 0.29            |
| 115       | 0.35            |
| 116       | 0.41            |
| 117       | 0.31            |
| 118       | 0.24            |
| 119       | 0.19            |
| 120       | 0.26            |
| 121       | 0.28            |
| 122       | 0.33            |

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  *,
  CASE
    WHEN batting_average > 0.37 THEN "Great Hitter"
    WHEN batting_average < 0.27 THEN "Below Average"
    ELSE "Average"
  END AS "skill_level"
FROM 
  players
```

### Second Solution: Python

``` Python
import numpy as np

players['skill_level'] = np.where(players['batting_average']>0.37, 'Great Hitter',
                         np.where(players['batting_average']<0.27, 'Below Average', 'Average'))

players
```

Output Table:

| player_id | batting_average | skill_level   |
| :-------- | :-------------- | :------------ |
| 104       | 0.45            | Great Hitter  |
| 105       | 0.27            | Average       |
| 106       | 0.18            | Below Average |
| 107       | 0.33            | Average       |
| 108       | 0.38            | Great Hitter  |
| 109       | 0.1             | Below Average |
| 110       | 0.23            | Below Average |
| 111       | 0.26            | Below Average |
| 112       | 0.31            | Average       |
| 113       | 0.2             | Below Average |
| 114       | 0.29            | Average       |
| 115       | 0.35            | Average       |
| 116       | 0.41            | Great Hitter  |
| 117       | 0.31            | Average       |
| 118       | 0.24            | Below Average |
| 119       | 0.19            | Below Average |
| 120       | 0.26            | Below Average |
| 121       | 0.28            | Average       |
| 122       | 0.33            | Average       |
