# **Practice Problem #10: Unfinished Parts**
### December 10th, 2023
### Languages Used: SQL

<br>

*This is the [Unfinished Parts](https://datalemur.com/questions/tesla-unfinished-parts) practice problem from DataLemur. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Tesla is investigating production bottlenecks and they need your help to extract the relevant data. Write a query to determine which parts have begun the assembly process but are not yet finished.

Assumptions:

- parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
- An unfinished part is one that lacks a finish_date.

<br>

parts_assembly Table:

| Column Name           | Type          | 
| :----------------     | :----------   | 
| part                  | string        | 
| finish_date           | datetime      | 
| assembly_step         | integer       |


parts_assembly Example Input:

| part         | finish_date           | assembly_step  |                                                
| :------------| :----------           | :----------    |                                             
| battery		   | 01/22/2022 00:00:00	 | 1              |                 
| battery	     | 02/22/2022 00:00:00	 | 2              |                     
| battery	     | 03/22/2022 00:00:00	 | 3              |              
| bumper       | 01/22/2022 00:00:00	 | 1              | 
| bumper       | 02/22/2022 00:00:00	 | 2              | 
| bumper       | 	                     | 3              | 
| bumper       | 	                     | 4              | 

Example Output:

| part                  | assembly_step        | 
| :----------------     | :----------          | 
| bumper                |   3                  | 
| bumper                |   4                  | 

Explanation:
The bumpers in step 3 and 4 are the only item that remains unfinished as it lacks a recorded finish date.

The dataset you are querying against may have different input & output - this is just an example!

<br>

# My Solution

``` SQL
SELECT 
  part,
  assembly_step
FROM 
  parts_assembly
WHERE
  finish_date IS NULL
```

Output Table:

| part                  | assembly_step        | 
| :----------------     | :----------          | 
| bumper                |   3                  | 
| bumper                |   4                  |
| engine                |   5                  |
