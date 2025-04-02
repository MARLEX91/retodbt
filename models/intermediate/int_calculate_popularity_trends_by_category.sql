
WITH data_videos AS(
    SELECT 
        category_id, 
        COUNT(video_id) AS total_videos, 
        SUM(view_count) AS total_views, 
        SUM(like_count) AS total_likes, 
        SUM(comment_count) AS total_comments, 
        ROUND(AVG(like_count * 1.0 / view_count), 4) AS avg_like_ratio, 
        ROUND(AVG(comment_count * 1.0 / view_count), 4) AS avg_comment_ratio
    FROM {{ref('stg_raw_data')}}
    GROUP BY category_id
    ORDER BY total_views DESC
)
SELECT *
FROM data_videos

