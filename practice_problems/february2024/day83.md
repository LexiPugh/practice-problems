# **Practice Problem #83: Cloud Storage Fees**
### February 21st, 2024
### Languages Used: SQL

<br>

*This is the [Cloud Storage Fees](https://www.analystbuilder.com/questions/cloud-storage-fees-Pgkqq) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Each person is given 200gb of free cloud storage. If they go over they have to pay $1 per gigabyte. Identify each person that went over their free limit and calculate how much they will owe.

Output should have the customer_id and the amount they owe called "fees".

Order fees from largest to smallest.

<br>

cloud_storage Table:

| Field        | Data Type |
| :----------- | :-------- |
| customer_id  | int       |
| storage_used | int       |

cloud_storage Input:

| customer_id | storage_used |
| ----------- | ------------ |
| 1001        | 32           |
| 1002        | 289          |
| 1003        | 104          |
| 1004        | 340          |
| 1005        | 150          |
| 1006        | 371          |
| 1007        | 183          |
| 1008        | 211          |
| 1009        | 11           |
| 1010        | 202          |

<br>

# My Solution

``` SQL
SELECT 
  customer_id,
  ABS(200 - storage_used) AS fees
FROM 
  cloud_storage
WHERE
  storage_used > 200
ORDER BY
  fees DESC
```

Output Table:

| customer_id | fees |
| ----------- | ---- |
| 1006        | 171  |
| 1004        | 140  |
| 1002        | 89   |
| 1008        | 11   |
| 1010        | 2    |
