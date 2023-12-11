# **Practice Problem #11: Unfinished Parts**
### December 11th, 2023
### Languages Used: Python

<br>

*This is the [Factorial Formula](https://datalemur.com/questions/python-factorial-formula) practice problem from DataLemur. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Given a number *n*, write a formula that returns *n!*.

In case you forgot the factorial formula, *n!* = *n*∗(*n*−1)∗(*n*−2)∗.....2∗1

For example, 5! = 5∗4∗3∗2∗1=120 so we'd return 120.

Assume *n* is a non-negative integer.


<br>

# My Solution

``` Python
def factorial(n):
  factorial = 1
  for i in range(1, n+1):
    factorial = factorial * i
  return factorial
```
