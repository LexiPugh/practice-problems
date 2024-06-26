# **Practice Problem #20: Medium Sized Countries**
### December 20th, 2023
### Languages Used: SQL

<br>

*This is the [Medium Sized Countries](https://www.analystbuilder.com/questions/medium-sized-countries-tfErj) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Identify all of the countries that have populations between 50 million and 100 million.

Provide the country and population in the output from smallest to largest population.

<br>

country Table:

| Field                | Data Type |
| :------------------- | :-------- |
| rank                 | int       |
| country              | text      |
| gdp_in_millions      | float     |
| population           | int       |
| world_gdp_percentage | float     | 

country Input:

| rank | country                  | gdp_in_millions | population | world_gdp_percentage |
| :--- | :----------------------- | :-------------- | :--------- | :------------------- |
| 1    | United States            | 19485394        | 325084756  | 24.08                |
| 2    | China                    | 12237700.48     | 1421021791 | 15.12                |
| 3    | Japan                    | 4872415.104     | 127502725  | 6.02                 |
| 4    | Germany                  | 3693204.332     | 82658409   | 4.56                 |
| 5    | India                    | 2650725.335     | 1338676785 | 3.28                 |
| 6    | United Kingdom           | 2637866.34      | 66727461   | 3.26                 |
| 7    | France                   | 2582501.307     | 64842509   | 3.19                 |
| 8    | Brazil                   | 2053594.877     | 207833823  | 2.54                 |
| 9    | Italy                    | 1943835.376     | 60673701   | 2.4                  |
| 10   | Canada                   | 1647120.175     | 36732095   | 2.04                 |
| 11   | Russia                   | 1578417.212     | 145530082  | 1.95                 |
| 12   | South Korea              | 1530750.923     | 51096415   | 1.89                 |
| 13   | Australia                | 1323421.072     | 24584620   | 1.64                 |
| 14   | Spain                    | 1314314.164     | 46647428   | 1.62                 |
| 15   | Mexico                   | 1150887.823     | 124777324  | 1.42                 |
| 16   | Indonesia                | 1015420.587     | 264650963  | 1.25                 |
| 17   | Turkey                   | 851549.2996     | 81116450   | 1.05                 |
| 18   | Netherlands              | 830572.6189     | 17021347   | 1.03                 |
| 19   | Saudi Arabia             | 686738.4        | 33101179   | 0.85                 |
| 20   | Switzerland              | 678965.4233     | 8455804    | 0.84                 |
| 21   | Argentina                | 637430.3315     | 43937140   | 0.79                 |
| 22   | Sweden                   | 535607.3855     | 9904896    | 0.66                 |
| 23   | Poland                   | 526465.839      | 37953180   | 0.65                 |
| 24   | Belgium                  | 494763.5519     | 11419748   | 0.61                 |
| 25   | Thailand                 | 455302.683      | 69209810   | 0.56                 |
| 26   | Iran                     | 454012.7687     | 80673883   | 0.56                 |
| 27   | Austria                  | 416835.9759     | 8819901    | 0.52                 |
| 28   | Norway                   | 399488.8978     | 5296326    | 0.49                 |
| 29   | United Arab Emirates     | 382575.0851     | 9487203    | 0.47                 |
| 30   | Nigeria                  | 375745.4865     | 190873244  | 0.46                 |
| 31   | Israel                   | 353268.4119     | 8243848    | 0.44                 |
| 32   | South Africa             | 348871.648      | 57009756   | 0.43                 |
| 33   | Hong Kong                | 341449.3405     | 7306322    | 0.42                 |
| 34   | Ireland                  | 331430.014      | 4753279    | 0.41                 |
| 35   | Denmark                  | 329865.5372     | 5732274    | 0.41                 |
| 36   | Singapore                | 323907.2344     | 5708041    | 0.4                  |
| 37   | Malaysia                 | 314710.2595     | 31104646   | 0.39                 |
| 38   | Colombia                 | 314457.6019     | 48909839   | 0.39                 |
| 39   | Philippines              | 313595.2087     | 105172925  | 0.39                 |
| 40   | Pakistan                 | 304951.8185     | 207906209  | 0.38                 |
| 41   | Chile                    | 277075.9444     | 18470439   | 0.34                 |
| 42   | Finland                  | 252301.8376     | 5511371    | 0.31                 |
| 43   | Bangladesh               | 249723.8625     | 159685424  | 0.31                 |
| 44   | Egypt                    | 235369.1293     | 96442591   | 0.29                 |
| 45   | Vietnam                  | 223779.8658     | 94600648   | 0.28                 |
| 46   | Portugal                 | 219308.1289     | 10288527   | 0.27                 |
| 47   | Czech Republic (Czechia) | 215913.545      | 10641034   | 0.27                 |
| 48   | Romania                  | 211883.9235     | 19653969   | 0.26                 |
| 49   | Peru                     | 211389.2722     | 31444298   | 0.26                 |
| 50   | New Zealand              | 204139.0499     | 4702034    | 0.25                 |
| 51   | Greece                   | 203085.5514     | 10569450   | 0.25                 |
| 52   | Iraq                     | 192060.8108     | 37552781   | 0.24                 |
| 53   | Algeria                  | 167555.2801     | 41389189   | 0.21                 | 


<br>

# My Solution

``` SQL
SELECT
  country,
  population
FROM
  country
WHERE
  population BETWEEN 50000000 AND 100000000
ORDER BY
  population
```

Output Table:
| country        | population |
| :------------- | :--------- |
| South Korea    | 51096415   |
| South Africa   | 57009756   |
| Italy          | 60673701   |
| France         | 64842509   |
| United Kingdom | 66727461   |
| Thailand       | 69209810   |
| Iran           | 80673883   |
| Turkey         | 81116450   |
| Germany        | 82658409   |
| Vietnam        | 94600648   |
| Egypt          | 96442591   |