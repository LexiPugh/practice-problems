# **Practice Problem #26: Second Day Confirmation**
### December 26th, 2023
### Languages Used: SQL

<br>

*This is the [Second Day Confirmation](https://datalemur.com/questions/second-day-confirmation) practice problem from DataLemur. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Assume you're given tables with information about TikTok user sign-ups and confirmations through email and text. New users on TikTok sign up using their email addresses, and upon sign-up, each user receives a text message confirmation to activate their account.

Write a query to display the user IDs of those who did not confirm their sign-up on the first day, but confirmed on the second day.

Definition:

- action_date refers to the date when users activated their accounts and confirmed their sign-up through text messages.

<br>

emails Table:

| Column Name     | Type     |
| --------------- | -------- |
| email_id        | integer  |
| user_id         | integer  |
| signup_date     | datetime |


emails Example Input:

| email_id     | user_id     | signup_date         |
| ------------ | ----------- | ------------------- |
| 125          | 7771        | 06/14/2022 00:00:00 |
| 433          | 1052        | 07/09/2022 00:00:00 |


texts Table:

| Column Name     | Type                                  |
| --------------- | ------------------------------------- |
| text_id         | integer                               |
| email_id        | integer                               |
| signup_action   | string ('Confirmed', 'Not confirmed') |
| action_date     | datetime                              |

texts Example Input:

| text_id     | email_id     | signup_action     | action_date         |
| ----------- | ------------ | ----------------- | ------------------- |
| 6878        | 125          | Confirmed         | 06/14/2022 00:00:00 |
| 6997        | 433          | Not Confirmed     | 07/09/2022 00:00:00 |
| 7000        | 433          | Confirmed         | 07/10/2022 00:00:00 |

Example Output:

| user_id     |
| ----------- |
| 1052        |

Explanation:
Only User 1052 confirmed their sign-up on the second day.

The dataset you are querying against may have different input & output - this is just an example!

<br>

# My Solution

``` SQL
SELECT 
  e.user_id
FROM 
  emails AS e INNER JOIN texts AS t
  ON e.email_id = t.email_id
WHERE
  t.action_date = e.signup_date + INTERVAL '1 day'
  AND t.signup_action = 'Confirmed'
```

Output Table:

| user_id |
| ------- |
| 1052    |
| 1235    |
