# **Practice Problem #32: Profit Margin**
### January 1st, 2024
### Languages Used: SQL and Python

<br>

*This is the [Profit Margin](https://www.analystbuilder.com/questions/profit-margin-xBniY) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Determine the profit margin for each product.

The profit margin is derived by subtracting the Purchase Price from the Sale Price and then applying a 7% tax on that amount.

Present the product name along with its corresponding profit (round to 2 decimal places).

Order products by largest profit to smallest and products alphabetically.

<br>

products Table:

| Field          | Data Type |
| :------------- | :-------- |
| product_name   | text      |
| purchase_price | float     |
| sales_price    | float     |

products Input:

| product_name                      | purchase_price | sales_price |
| :-------------------------------- | :------------- | :---------- |
| Dog shampoo                       | 5              | 10          |
| Dog conditioner                   | 6.5            | 12          |
| Dog nail clippers                 | 3.25           | 8           |
| Dog hair brush                    | 4.75           | 9.5         |
| Dog ear cleaner                   | 2.8            | 6.5         |
| Dog grooming scissors             | 7.2            | 15          |
| Dog toothbrush and toothpaste set | 4              | 10          |

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT
  product_name,
  ROUND(((sales_price - purchase_price) * 0.93), 2) AS profit
FROM 
  products
ORDER BY
  profit DESC,
  product_name ASC
```

### Second Solution: Python

``` Python
products['profit'] = ((products['sales_price'] - products['purchase_price']) * 0.93).round(2)

products = products.sort_values(['profit', 'product_name'], ascending=[False, True])

products[['product_name', 'profit']]
```

Output Table:

| product_name                      | profit |
| :-------------------------------- | :----- |
| Dog grooming scissors             | 7.25   |
| Dog toothbrush and toothpaste set | 5.58   |
| Dog conditioner                   | 5.12   |
| Dog shampoo                       | 4.65   |
| Dog hair brush                    | 4.42   |
| Dog nail clippers                 | 4.42   |
| Dog ear cleaner                   | 3.44   |
