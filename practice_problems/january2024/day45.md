# **Practice Problem #45: Obesity**
### January 14th, 2024
### Languages Used: SQL

<br>

*This is the [Obesity](https://www.analystbuilder.com/questions/obesity-Chusc) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

If a patient has a BMI of 30 or over they are considered obese.

The calculation for BMI is as follows:

(Formula: weight (lb) / [height (in)]^2 x 703)

Find the patients who are considered "obese" and provide the patient ID and their BMI. Round BMI to 1 decimal point.

<br>

patients Table:

| Field         | Data Type |
| :------------ | :-------- |
| patient_id    | int       |
| height_inches | int       |
| weight_pounds | int       |

patients Input:

| patient_id | height_inches | weight_pounds |
| :--------- | :------------ | :------------ |
| 1001       | 69            | 178           |
| 1002       | 63            | 250           |
| 1003       | 70            | 190           |
| 1004       | 66            | 155           |
| 1005       | 65            | 375           |
| 1006       | 72            | 100           |
| 1007       | 68            | 450           |
| 1008       | 61            | 290           |

<br>

# My Solution

``` SQL
SELECT 
  patient_id,
  ROUND(weight_pounds/(POWER(height_inches, 2)) * 703, 1) AS BMI
FROM 
  patients
HAVING
  BMI > 30
```

Output Table:

| patient_id | BMI  |
| :--------- | :--- |
| 1002       | 44.3 |
| 1005       | 62.4 |
| 1007       | 68.4 |
| 1008       | 54.8 |
