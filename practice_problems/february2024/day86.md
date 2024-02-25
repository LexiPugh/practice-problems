# **Practice Problem #86: SuperCoolElectronicsStore.com**
### February 24th, 2024
### Languages Used: SQL

<br>

*This is the [SuperCoolElectronicsStore.com](https://www.analystbuilder.com/questions/supercoolelectronicsstorecom-pspre) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Customers on the SuperCoolElectronicsStore.com's website are having to manually check each laptop see whether it has SSD or HDD storage.

The Owner of the store wants to categorize his laptops so clients can filter on it. We need to add this field to the table.

Add a column called "storage_type". If the Laptop is SSD give it an "SSD" label. If it is HDD give it an "HDD label.

Include all columns from original table in your output with your new column at the end.

Order the data on laptop id from smallest to largest.

<br>

laptops Table:

| Field       | Data Type |
| :---------- | :-------- |
| laptop_id   | int       |
| laptop_name | text      |
| price       | float     |

laptops Input:

| laptop_id | laptop_name                                       | price   |
| :-------- | :------------------------------------------------ | :------ |
| 1         | Acer Aspire 5 - 1TB HDD - 8GB RAM                 | 699.99  |
| 2         | Dell XPS 13 - 512GB SSD - 16GB RAM                | 1299.99 |
| 3         | HP Pavilion 15 - 500GB HDD - 12GB RAM             | 549.99  |
| 4         | Lenovo ThinkPad X1 Carbon - 256GB SSD - 16GB RAM  | 1499.99 |
| 5         | ASUS ROG Strix Scar III - 1TB HDD - 32GB RAM      | 1899.99 |
| 6         | MacBook Air (M1 2020) - 512GB SSD - 8GB RAM       | 999.99  |
| 7         | Dell Inspiron 14 - 1TB HDD - 8GB RAM              | 449.99  |
| 8         | HP Spectre x360 - 512GB SSD - 16GB RAM            | 1299.99 |
| 9         | Lenovo Legion Y540 - 1TB HDD - 16GB RAM           | 1199.99 |
| 10        | MacBook Pro 13 (M1 2020) - 256GB SSD - 8GB RAM    | 1299.99 |
| 11        | Acer Predator Helios 300 - 1TB HDD - 16GB RAM     | 1299.99 |
| 12        | Dell G7 17 - 512GB SSD - 32GB RAM                 | 1699.99 |
| 13        | ASUS VivoBook 15 - 500GB HDD - 12GB RAM           | 599.99  |
| 14        | Microsoft Surface Laptop 4 - 512GB SSD - 16GB RAM | 1299.99 |
| 15        | Lenovo Yoga C930 - 1TB HDD - 8GB RAM              | 1099.99 |
| 16        | MSI GS66 Stealth - 1TB SSD - 32GB RAM             | 1999.99 |
| 17        | HP Envy x360 - 256GB SSD - 16GB RAM               | 899.99  |
| 18        | Dell Alienware m15 - 512GB SSD - 32GB RAM         | 2199.99 |
| 19        | Acer Swift 3 - 500GB HDD - 8GB RAM                | 699.99  |
| 20        | MacBook Pro 16 (Intel 2019) - 1TB SSD - 16GB RAM  | 2399.99 |
| 21        | ASUS ZenBook 14 - 512GB SSD - 16GB RAM            | 899.99  |
| 22        | HP Omen 15 - 1TB SSD - 32GB RAM                   | 1499.99 |
| 23        | Lenovo IdeaPad L340 - 1TB HDD - 12GB RAM          | 799.99  |
| 24        | Microsoft Surface Pro 7 - 256GB SSD - 8GB RAM     | 899.99  |
| 25        | Dell Precision 5750 - 2TB HDD - 64GB RAM          | 2999.99 |

<br>

# My Solution

``` SQL
SELECT 
  *,
  CASE
    WHEN laptop_name LIKE '%SSD%' THEN 'SSD'
    ELSE 'HDD'
  END AS storage_type
FROM 
  laptops
ORDER BY
  laptop_id
```

Output Table:

| laptop_id | laptop_name                                       | price   | storage_type |
| :-------- | :------------------------------------------------ | :------ | :----------- |
| 1         | Acer Aspire 5 - 1TB HDD - 8GB RAM                 | 699.99  | HDD          |
| 2         | Dell XPS 13 - 512GB SSD - 16GB RAM                | 1299.99 | SSD          |
| 3         | HP Pavilion 15 - 500GB HDD - 12GB RAM             | 549.99  | HDD          |
| 4         | Lenovo ThinkPad X1 Carbon - 256GB SSD - 16GB RAM  | 1499.99 | SSD          |
| 5         | ASUS ROG Strix Scar III - 1TB HDD - 32GB RAM      | 1899.99 | HDD          |
| 6         | MacBook Air (M1 2020) - 512GB SSD - 8GB RAM       | 999.99  | SSD          |
| 7         | Dell Inspiron 14 - 1TB HDD - 8GB RAM              | 449.99  | HDD          |
| 8         | HP Spectre x360 - 512GB SSD - 16GB RAM            | 1299.99 | SSD          |
| 9         | Lenovo Legion Y540 - 1TB HDD - 16GB RAM           | 1199.99 | HDD          |
| 10        | MacBook Pro 13 (M1 2020) - 256GB SSD - 8GB RAM    | 1299.99 | SSD          |
| 11        | Acer Predator Helios 300 - 1TB HDD - 16GB RAM     | 1299.99 | HDD          |
| 12        | Dell G7 17 - 512GB SSD - 32GB RAM                 | 1699.99 | SSD          |
| 13        | ASUS VivoBook 15 - 500GB HDD - 12GB RAM           | 599.99  | HDD          |
| 14        | Microsoft Surface Laptop 4 - 512GB SSD - 16GB RAM | 1299.99 | SSD          |
| 15        | Lenovo Yoga C930 - 1TB HDD - 8GB RAM              | 1099.99 | HDD          |
| 16        | MSI GS66 Stealth - 1TB SSD - 32GB RAM             | 1999.99 | SSD          |
| 17        | HP Envy x360 - 256GB SSD - 16GB RAM               | 899.99  | SSD          |
| 18        | Dell Alienware m15 - 512GB SSD - 32GB RAM         | 2199.99 | SSD          |
| 19        | Acer Swift 3 - 500GB HDD - 8GB RAM                | 699.99  | HDD          |
| 20        | MacBook Pro 16 (Intel 2019) - 1TB SSD - 16GB RAM  | 2399.99 | SSD          |
| 21        | ASUS ZenBook 14 - 512GB SSD - 16GB RAM            | 899.99  | SSD          |
| 22        | HP Omen 15 - 1TB SSD - 32GB RAM                   | 1499.99 | SSD          |
| 23        | Lenovo IdeaPad L340 - 1TB HDD - 12GB RAM          | 799.99  | HDD          |
| 24        | Microsoft Surface Pro 7 - 256GB SSD - 8GB RAM     | 899.99  | SSD          |
| 25        | Dell Precision 5750 - 2TB HDD - 64GB RAM          | 2999.99 | HDD          |
