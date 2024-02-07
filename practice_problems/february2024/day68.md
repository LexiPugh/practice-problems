# **Practice Problem #68: Gmail Users**
### February 6th, 2024
### Languages Used: SQL

<br>

*This is the [Gmail Users](https://www.analystbuilder.com/questions/gmail-users-GVodi) practice problem from Analyst Builder. The question difficulty is Medium.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Identify all of the customers that use gmail as their email provider.

Provide their customer_id, name, and email.

Order the output by customer_id in ascending order.

<br>

gmail_users Table:

| Field               | Data Type |
| :------------------ | :-------- |
| customer_id         | int       |
| name                | text      |
| email               | text      |
| subscription_status | text      |
| last_purchase_date  | date      |

gmail_users Input:

| customer_id | name               | email                        | subscription_status | last_purchase_date |
| :---------- | :----------------- | :--------------------------- | :------------------ | :----------------- |
| 1           | John Doe           | john.doe@gmail.com           | Active              | 2023-01-15         |
| 2           | Jane Smith         | jane.smith@yahoo.com         | Inactive            | 2022-11-20         |
| 3           | Mike Johnson       | mike.johnson@gmail.com       | Active              | 2023-02-05         |
| 4           | Emily White        | emily.white@gmail.com        | Active              | 2023-03-10         |
| 5           | David Brown        | david.brown@hotmail.com      | Inactive            | 2022-12-05         |
| 6           | Sarah Taylor       | sarah.taylor@gmail.com       | Active              | 2023-02-28         |
| 7           | Brian Davis        | brian.davis@gmail.com        | Active              | 2023-03-05         |
| 8           | Lisa Miller        | lisa.miller@yahoo.com        | Inactive            | 2022-10-15         |
| 9           | Kevin Clark        | kevin.clark@gmail.com        | Active              | 2023-01-20         |
| 10          | Anna Lee           | anna.lee@gmail.com           | Active              | 2023-03-15         |
| 11          | Mark Wilson        | mark.wilson@hotmail.com      | Inactive            | 2022-09-18         |
| 12          | Jessica Turner     | jessica.turner@gmail.com     | Active              | 2023-02-10         |
| 13          | Richard Moore      | richard.moore@gmail.com      | Active              | 2023-03-12         |
| 14          | Laura Hall         | laura.hall@yahoo.com         | Inactive            | 2022-11-30         |
| 15          | Chris Adams        | chris.adams@gmail.com        | Active              | 2023-01-25         |
| 16          | Megan Cooper       | megan.cooper@gmail.com       | Active              | 2023-02-15         |
| 17          | Alex Mitchell      | alex.mitchell@yahoo.com      | Inactive            | 2022-12-10         |
| 18          | Rachel Parker      | rachel.parker@gmail.com      | Active              | 2023-03-08         |
| 19          | Eric Turner        | eric.turner@gmail.com        | Active              | 2023-01-28         |
| 20          | Olivia Baker       | olivia.baker@gmail.com       | Active              | 2023-03-18         |
| 21          | Daniel White       | daniel.white@hotmail.com     | Inactive            | 2022-11-25         |
| 22          | Emily Turner       | emily.turner@gmail.com       | Active              | 2023-02-20         |
| 23          | Michael Adams      | michael.adams@gmail.com      | Active              | 2023-03-02         |
| 24          | Sofia Davis        | sofia.davis@yahoo.com        | Inactive            | 2022-10-20         |
| 25          | Ryan Miller        | ryan.miller@gmail.com        | Active              | 2023-01-30         |
| 26          | Lisa Turner        | lisa.turner@gmail.com        | Active              | 2023-02-22         |
| 27          | Jordan Harris      | jordan.harris@gmail.com      | Active              | 2023-03-25         |
| 28          | Angela White       | angela.white@yahoo.com       | Inactive            | 2022-12-15         |
| 29          | Matthew Johnson    | matthew.johnson@gmail.com    | Active              | 2023-01-05         |
| 30          | Rachel Miller      | rachel.miller@gmail.com      | Active              | 2023-03-30         |
| 31          | Brandon Turner     | brandon.turner@yahoo.com     | Inactive            | 2022-11-28         |
| 32          | Emily Adams        | emily.adams@gmail.com        | Active              | 2023-02-18         |
| 33          | Zachary Clark      | zachary.clark@gmail.com      | Active              | 2023-03-22         |
| 34          | Natalie White      | natalie.white@hotmail.com    | Inactive            | 2022-10-25         |
| 35          | Brian Turner       | brian.turner@gmail.com       | Active              | 2023-01-10         |
| 36          | Samantha Hall      | samantha.hall@gmail.com      | Active              | 2023-02-08         |
| 37          | Tyler Wilson       | tyler.wilson@yahoo.com       | Inactive            | 2022-12-20         |
| 38          | Amanda Davis       | amanda.davis@gmail.com       | Active              | 2023-03-16         |
| 39          | Patrick Turner     | patrick.turner@gmail.com     | Active              | 2023-01-15         |
| 40          | Nicole Harris      | nicole.harris@yahoo.com      | Inactive            | 2022-11-22         |
| 41          | Joshua Baker       | joshua.baker@gmail.com       | Active              | 2023-02-25         |
| 42          | Vanessa White      | vanessa.white@gmail.com      | Active              | 2023-03-28         |
| 43          | Christopher Turner | christopher.turner@yahoo.com | Inactive            | 2022-12-08         |
| 44          | Lauren Adams       | lauren.adams@gmail.com       | Active              | 2023-01-18         |
| 45          | Justin Harris      | justin.harris@gmail.com      | Active              | 2023-03-10         |
| 46          | Allison Turner     | allison.turner@hotmail.com   | Inactive            | 2022-11-15         |
| 47          | Benjamin White     | benjamin.white@gmail.com     | Active              | 2023-02-28         |
| 48          | Kimberly Davis     | kimberly.davis@gmail.com     | Active              | 2023-03-05         |
| 49          | Andrew Turner      | andrew.turner@yahoo.com      | Inactive            | 2022-10-30         |
| 50          | Morgan Miller      | morgan.miller@gmail.com      | Active              | 2023-01-22         |

<br>

# My Solution

``` SQL
SELECT 
  customer_id,
  name,
  email
FROM 
  gmail_users
WHERE
  email LIKE '%@gmail.com'
ORDER BY
  customer_id ASC
```

Output Table:

| customer_id | name            | email                     |
| :---------- | :-------------- | :------------------------ |
| 1           | John Doe        | john.doe@gmail.com        |
| 3           | Mike Johnson    | mike.johnson@gmail.com    |
| 4           | Emily White     | emily.white@gmail.com     |
| 6           | Sarah Taylor    | sarah.taylor@gmail.com    |
| 7           | Brian Davis     | brian.davis@gmail.com     |
| 9           | Kevin Clark     | kevin.clark@gmail.com     |
| 10          | Anna Lee        | anna.lee@gmail.com        |
| 12          | Jessica Turner  | jessica.turner@gmail.com  |
| 13          | Richard Moore   | richard.moore@gmail.com   |
| 15          | Chris Adams     | chris.adams@gmail.com     |
| 16          | Megan Cooper    | megan.cooper@gmail.com    |
| 18          | Rachel Parker   | rachel.parker@gmail.com   |
| 19          | Eric Turner     | eric.turner@gmail.com     |
| 20          | Olivia Baker    | olivia.baker@gmail.com    |
| 22          | Emily Turner    | emily.turner@gmail.com    |
| 23          | Michael Adams   | michael.adams@gmail.com   |
| 25          | Ryan Miller     | ryan.miller@gmail.com     |
| 26          | Lisa Turner     | lisa.turner@gmail.com     |
| 27          | Jordan Harris   | jordan.harris@gmail.com   |
| 29          | Matthew Johnson | matthew.johnson@gmail.com |
| 30          | Rachel Miller   | rachel.miller@gmail.com   |
| 32          | Emily Adams     | emily.adams@gmail.com     |
| 33          | Zachary Clark   | zachary.clark@gmail.com   |
| 35          | Brian Turner    | brian.turner@gmail.com    |
| 36          | Samantha Hall   | samantha.hall@gmail.com   |
| 38          | Amanda Davis    | amanda.davis@gmail.com    |
| 39          | Patrick Turner  | patrick.turner@gmail.com  |
| 41          | Joshua Baker    | joshua.baker@gmail.com    |
| 42          | Vanessa White   | vanessa.white@gmail.com   |
| 44          | Lauren Adams    | lauren.adams@gmail.com    |
| 45          | Justin Harris   | justin.harris@gmail.com   |
| 47          | Benjamin White  | benjamin.white@gmail.com  |
| 48          | Kimberly Davis  | kimberly.davis@gmail.com  |
| 50          | Morgan Miller   | morgan.miller@gmail.com   |
