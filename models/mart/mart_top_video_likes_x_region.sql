-- TOP VIDEO LIKES BY region
-- This model selects the top video likes by region from the intermediate model calculate_top_videos_likes
-- and returns the result with the specified columns.

WITH result AS (
    SELECT 
        region_code,
        category_id,
        video_id,
        title,
        published_at,
        like_count
    FROM {{ref('int_calculate_top_videos_likes')}}
)

SELECT *
FROM result