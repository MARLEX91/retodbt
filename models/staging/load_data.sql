
with source_data as (
    SELECT
        region_code,
        category_id,
        video_id,
        title,
        CAST(published_at AS DATE) AS published_at,
        CAST(view_count AS BIGINT) AS view_count,
        CAST(like_count AS BIGINT) AS like_count,
        CAST(comment_count AS BIGINT) AS comment_count
    FROM read_csv_auto('data/part-00000-de475d8c-7311-4884-8001-d453a713dcc8-c000.csv')
    WHERE published_at ~ '^\d{4}-\d{2}-\d{2}$'
)

SELECT *
FROM source_data
