SELECT
  tweet_count_per_user AS tweet_bucket,
  COUNT(user_id) AS users_num
FROM (
  SELECT 
    user_id,
    COUNT(tweet_id) AS tweet_count_per_user
  FROM 
    tweets
  WHERE
    DATE_PART('year', tweet_date) = 2022
  GROUP BY
    user_id
) AS total_tweets
GROUP BY tweet_count_per_user

SELECT 
  candidate_id
FROM 
  candidates
WHERE
  skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY
  candidate_id
HAVING
  COUNT(skill) = 3
ORDER BY
  candidate_id;
