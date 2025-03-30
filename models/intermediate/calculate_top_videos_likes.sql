WITH group_data AS (
    SELECT
        region_code,
        category_id,
        video_id,
        title,
        published_at,
        like_count,
        ROW_NUMBER() OVER (PARTITION BY region_code ORDER BY like_count DESC) AS rank
    FROM {{ref('load_data')}}
)
SELECT *
FROM group_data
WHERE rank = 1
