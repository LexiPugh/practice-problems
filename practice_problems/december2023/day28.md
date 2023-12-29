# **Practice Problem #28: Device First Used**
### December 28th, 2023
### Languages Used: SQL and Python

<br>

*This is the [Device First Used](https://www.analystbuilder.com/questions/device-first-used-pNEqD) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to return the device IDs that play League of Legends and include in the first time that device played that game in your output.

Order by the oldest to newest time played.

<br>

devices Table:

| Field       | Data Type |
| ----------- | --------- |
| device_id   | int       |
| date_played | date      |
| game        | text      |

devices Input:

| device_id | date_played | game              |
| --------- | ----------- | ----------------- |
| 1         | 2022-03-08  | Dota2             |
| 1         | 2019-02-16  | League of Legends |
| 1         | 2021-01-27  | Dota2             |
| 1         | 2020-09-05  | League of Legends |
| 2         | 2019-05-04  | Dota2             |
| 2         | 2021-11-15  | Dota2             |
| 2         | 2020-09-05  | Dota2             |
| 3         | 2022-10-02  | League of Legends |
| 3         | 2019-06-15  | Dota2             |

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT 
  device_id,
  MIN(date_played) AS earliest_date
FROM 
  devices
WHERE
  game = 'League of Legends'
GROUP BY
  device_id
ORDER BY
  earliest_date
```

### Second Solution: Python

``` Python
devices = devices[devices['game'] == 'League of Legends']

devices = devices.groupby('device_id').min().reset_index()

devices = devices.sort_values(by='date_played', ascending=False)

devices[['device_id', 'date_played']]
```

Output Table:

| device_id | date_played |
| --------- | ----------- |
| 1         | 2019-02-16  |
| 3         | 2022-10-02  |