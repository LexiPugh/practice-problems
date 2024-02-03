# **Practice Problem #64: Greenhouse Gases**
### February 2nd, 2024
### Languages Used: SQL

<br>

*This is the [Greenhouse Gases](https://www.analystbuilder.com/questions/greenhouse-gases-JUvPk) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to determine which country produced the most total greenhouse gases from 2020 - 2022.

Include the country and their total Greenhouse Gases in your output.

Note: round greenhouse gases to 1 decimal place.

<br>

greenhouse_gases Table:

| Field                     | Data Type |
| :------------------------ | :-------- |
| year                      | int       |
| country                   | text      |
| carbon_emissions_millions | float     |

greenhouse_gases Input:

| year | country        | carbon_emissions_millions |
| :--- | :------------- | :------------------------ |
| 2022 | China          | 10170.5                   |
| 2022 | United States  | 5147                      |
| 2022 | India          | 3207.6                    |
| 2022 | Russia         | 1740.8                    |
| 2022 | Japan          | 1197.5                    |
| 2022 | Germany        | 798.9                     |
| 2022 | South Korea    | 682.3                     |
| 2022 | Iran           | 646.9                     |
| 2022 | Saudi Arabia   | 619.5                     |
| 2022 | Canada         | 562.5                     |
| 2022 | Indonesia      | 555.7                     |
| 2022 | Mexico         | 530.4                     |
| 2022 | United Kingdom | 501.3                     |
| 2022 | Brazil         | 479.7                     |
| 2022 | Australia      | 406                       |
| 2021 | China          | 10872.2                   |
| 2021 | United States  | 5416.4                    |
| 2021 | India          | 2629.4                    |
| 2021 | Russia         | 1704.7                    |
| 2021 | Japan          | 1230.2                    |
| 2021 | Germany        | 805.5                     |
| 2021 | Iran           | 648.2                     |
| 2021 | South Korea    | 646.8                     |
| 2021 | Saudi Arabia   | 619.6                     |
| 2021 | Canada         | 577.3                     |
| 2021 | Indonesia      | 555.6                     |
| 2021 | Mexico         | 529.1                     |
| 2021 | United Kingdom | 487.3                     |
| 2021 | Brazil         | 484.5                     |
| 2021 | Australia      | 421.9                     |
| 2020 | China          | 10125.1                   |
| 2020 | United States  | 5269.3                    |
| 2020 | India          | 2616.9                    |
| 2020 | Russia         | 1637.5                    |
| 2020 | Japan          | 1204.1                    |
| 2020 | Germany        | 805.4                     |
| 2020 | Iran           | 618.9                     |
| 2020 | South Korea    | 610.3                     |
| 2020 | Saudi Arabia   | 598.8                     |
| 2020 | Canada         | 555.3                     |
| 2020 | Indonesia      | 553.5                     |
| 2020 | Mexico         | 524.5                     |
| 2020 | United Kingdom | 461.8                     |
| 2020 | Brazil         | 465.7                     |
| 2020 | Australia      | 414.4                     |

<br>

# My Solution

``` SQL
SELECT 
  country,
  ROUND(SUM(carbon_emissions_millions), 1) AS total_emissions
FROM 
  greenhouse_gases
GROUP BY
  country
ORDER BY
  total_emissions DESC
LIMIT
  1
```

Output Table:

| country | total_emissions |
| :------ | :-------------- |
| China   | 31167.8         |
