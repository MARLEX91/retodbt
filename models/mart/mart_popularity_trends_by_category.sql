-- This model is used to create a mart table that contains the most popular trends by category.
-- It selects the relevant columns from the intermediate model calculate_popularity_trends_by_category  
-- and returns the result with the specified columns.
-- The model is used to analyze the popularity trends of videos by category.
WITH data_most_popular_videos AS (
    SELECT 
        category_id, 
        total_videos, 
        total_views, 
        total_likes, 
        total_comments, 
        avg_like_ratio, 
        avg_comment_ratio
    FROM {{ref('int_calculate_popularity_trends_by_category')}}
)

SELECT *
FROM data_most_popular_videos

--  Insight: Podemos ver qué categorías son más vistas y cuáles generan más interacción (likes/comentarios).