# **Practice Problem #47: Pharmacy Analytics (Part 2)**
### January 16th, 2024
### Languages Used: SQL

<br>

*This is the [Pharmacy Analytics (Part 2)](https://datalemur.com/questions/non-profitable-drugs) practice problem from DataLemur. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. Each drug is exclusively manufactured by a single manufacturer.

Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.

Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value. Display the results sorted in descending order with the highest losses displayed at the top.

<br>

pharmacy_sales Table:

| Column Name     | Type     |
| :-------------- | :------- |
| product_id      | integer  |
| units_sold      | integer  |
| total_sales     | decimal  |
| cogs            | decimal  |
| manufacturer    | varchar  |
| drug            | varchar  |


pharmacy_sales Example Input:

| product_id     | units_sold     | total_sales     | cogs       | manufacturer     | drug                      |
| :------------- | :------------- | :-------------- | :--------- | :--------------- | :------------------------ |
| 156            | 89514          | 3130097.00      | 3427421.73 | Biogen           | Acyclovir                 |
| 25             | 222331         | 2753546.00      | 2974975.36 | AbbVie           | Lamivudine and Zidovudine |
| 50             | 90484          | 2521023.73      | 2742445.90 | Eli Lilly        | Dermasorb TA Complete Kit |
| 98             | 110746         | 813188.82       | 140422.87  | Biogen           | Medi-Chord                |


Example Output:

| manufacturer     | drug_count     | total_loss     |
| :--------------- | :------------- | :------------- |
| Biogen           | 1              | 297324.73      |
| AbbVie           | 1              | 221429.36      |
| Eli Lilly        | 1              | 221422.17      |

Explanation:
The first three rows indicate that some drugs resulted in losses. Among these, Biogen had the highest losses, followed by AbbVie and Eli Lilly. However, the Medi-Chord drug manufactured by Biogen reported a profit and was excluded from the result.

The dataset you are querying against may have different input & output - this is just an example!

<br>

# My Solution

``` SQL
SELECT 
  manufacturer,
  COUNT(drug) AS drug_count,
  ABS(SUM(total_sales - cogs)) AS total_loss
FROM 
  pharmacy_sales
WHERE 
  total_sales - cogs <= 0
GROUP BY
  manufacturer
ORDER BY
  total_loss DESC
```

Output Table:

| manufacturer      | drug_count | total_loss |
| :---------------- | :--------- | :--------- |
| Johnson & Johnson | 6          | 894913.13  |
| Eli Lilly         | 4          | 447352.90  |
| Biogen            | 3          | 417018.89  |
| AbbVie            | 2          | 413991.10  |
| Roche             | 2          | 159741.62  |
| Bayer             | 1          | 28785.28   |
