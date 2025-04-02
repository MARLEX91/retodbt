

WITH identify_viral_videos AS (
SELECT
    region_code,
    video_id, 
    title, 
    channel_title, 
    view_count, 
    like_count, 
    comment_count, 
    published_at,
    ROUND(view_count * 1.0 / (CURRENT_DATE - published_at), 2) AS views_per_day
FROM {{ref('stg_raw_data')}}
WHERE (CURRENT_DATE - published_at) > 0
AND region_code = 'AU'
)

SELECT *
FROM identify_viral_videos
LIMIT 10

