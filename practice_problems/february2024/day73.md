# **Practice Problem #73: Animals**
### February 11th, 2024
### Languages Used: SQL

<br>

*This is the [Animals](https://www.analystbuilder.com/questions/animals-zxjVm) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Combine these two tables so the output has all the animals, regions, and average weights from both tables in a single output.

Remove any duplicates if there are any and order by animal name alphabetically.

<br>

animals_secondary Table:

| Field          | Data Type |
| :------------- | :-------- |
| animal         | text      |
| region         | text      |
| average_weight | int       |

animals_secondary Input:

| animal          | region                                  | average_weight |
| :-------------- | :-------------------------------------- | :------------- |
| Rhinoceros      | Africa and Asia                         | 800            |
| Hippopotamus    | Africa                                  | 1200           |
| Walrus          | Arctic                                  | 600            |
| Squirrel Monkey | Central and South America               | 20             |
| Snow Leopard    | Central Asia                            | 30             |
| Beluga Whale    | Arctic and sub-Arctic                   | 1000           |
| Humpback Whale  | Global                                  | 25             |
| Orangutan       | Southeast Asia                          | 60             |
| Giant Panda     | China                                   | 80             |
| Manatee         | West Africa and Caribbean and US coasts | 600            |
| Koala           | Australia                               | 45031          |
| Sloth           | Central and South America               | 45030          |
| Platypus        | Australia                               | 25             |
| Bison           | North America                           | 600            |

animals_main Table:

| Field          | Data Type |
| :------------- | :-------- |
| animal         | text      |
| region         | text      |
| average_weight | int       |

animals_main Input:

| animal           | region                            | average_weight |
| :--------------- | :-------------------------------- | :------------- |
| African Elephant | Africa                            | 10000          |
| Bengal Tiger     | India and Bangladesh              | 180            |
| Polar Bear       | Arctic                            | 350            |
| Gorilla          | Central and West Africa           | 140            |
| Red Fox          | North America and Europe and Asia | 13             |
| Lion             | Africa                            | 150            |
| Grizzly Bear     | North America                     | 150            |
| Chimpanzee       | Central and West Africa           | 40             |
| Gray Wolf        | North America and Europe and Asia | 36             |
| Jaguar           | Central and South America         | 56             |
| Kangaroo         | Australia                         | 18             |

<br>

# My Solution

``` SQL
SELECT
  animal,
  region,
  average_weight
FROM 
  animals_main
UNION
SELECT
  animal,
  region,
  average_weight
FROM 
  animals_secondary
ORDER BY
  animal
```

Output Table:

| animal           | region                                  | average_weight |
| :--------------- | :-------------------------------------- | :------------- |
| African Elephant | Africa                                  | 10000          |
| Beluga Whale     | Arctic and sub-Arctic                   | 1000           |
| Bengal Tiger     | India and Bangladesh                    | 180            |
| Bison            | North America                           | 600            |
| Chimpanzee       | Central and West Africa                 | 40             |
| Giant Panda      | China                                   | 80             |
| Gorilla          | Central and West Africa                 | 140            |
| Gray Wolf        | North America and Europe and Asia       | 36             |
| Grizzly Bear     | North America                           | 150            |
| Hippopotamus     | Africa                                  | 1200           |
| Humpback Whale   | Global                                  | 25             |
| Jaguar           | Central and South America               | 56             |
| Kangaroo         | Australia                               | 18             |
| Koala            | Australia                               | 45031          |
| Lion             | Africa                                  | 150            |
| Manatee          | West Africa and Caribbean and US coasts | 600            |
| Orangutan        | Southeast Asia                          | 60             |
| Platypus         | Australia                               | 25             |
| Polar Bear       | Arctic                                  | 350            |
| Red Fox          | North America and Europe and Asia       | 13             |
| Rhinoceros       | Africa and Asia                         | 800            |
| Sloth            | Central and South America               | 45030          |
| Snow Leopard     | Central Asia                            | 30             |
| Squirrel Monkey  | Central and South America               | 20             |
| Walrus           | Arctic                                  | 600            |
