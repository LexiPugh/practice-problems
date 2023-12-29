# **Practice Problem #23: Low Quality YouTube Video**
### December 23rd, 2023
### Languages Used: SQL and Python

<br>

*This is the [Low Quality YouTube Video](https://www.analystbuilder.com/questions/low-quality-youtube-video-idbeu) practice problem from Analyst Builder. The question difficulty is Easy.*

<br>

**Table of Contents**

-   [The Question](#the-question)
-   [My Solution](#my-solution)
  
<br>

## The Question

Write a query to report the IDs of low quality YouTube videos.

A video is considered low quality if the like percentage of the video (number of likes divided by the total number of votes) is less than 55%.

Return the result table ordered by ID in ascending order.

<br>

youtube_videos Table:

| Field       | Data Type |
| :---------- | --------- |
| video_id    | int       |
| thumbs_up   | int       |
| thumbs_down | int       |

youtube_videos Input:

| video_id | thumbs_up | thumbs_down |
| -------- | --------- | ----------- |
| 1        | 2980      | 2366        |
| 2        | 895       | 6289        |
| 3        | 8366      | 5714        |
| 4        | 5601      | 1378        |
| 5        | 861       | 523         |
| 6        | 1165      | 494         |
| 7        | 2346      | 1376        |
| 8        | 911       | 651         |
| 9        | 1920      | 6635        |
| 10       | 6073      | 8403        |
| 11       | 2863      | 5647        |
| 12       | 6167      | 1219        |
| 13       | 1316      | 5129        |
| 14       | 2782      | 7663        |
| 15       | 5429      | 4627        |

<br>

# My Solution

### First Solution: SQL

``` SQL
SELECT
  video_id
FROM 
  youtube_videos
WHERE
  (thumbs_up / (thumbs_up + thumbs_down) * 100 ) < 55
ORDER BY
  video_id
```

### Second Solution: Python

``` Python
youtube_videos['like_ratio'] = (youtube_videos['thumbs_up'] / (youtube_videos['thumbs_up'] + youtube_videos['thumbs_down']) * 100)

youtube_videos = youtube_videos[(youtube_videos['like_ratio'] < 55)]

youtube_videos = youtube_videos.sort_values(by='video_id', ascending=True)

youtube_videos[['video_id']]
```

Output Table:

| video_id |
| -------- |
| 2        |
| 9        |
| 10       |
| 11       |
| 13       |
| 14       |
| 15       |
