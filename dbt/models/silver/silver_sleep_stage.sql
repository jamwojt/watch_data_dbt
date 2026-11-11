SELECT
    datetime,
    device_id,
    user_id,
    CASE stage
        WHEN 0 THEN "REM"
        WHEN 1 THEN "light"
        WHEN 2 THEN "deep"
        WHEN 3 THEN "light"
        WHEN 4 THEN "light"
    END AS beginning_stage,
    CASE stage
        WHEN 0 THEN "REM"
        WHEN 1 THEN "light_after_awake"
        WHEN 2 THEN "deep"
        WHEN 3 THEN "light"
        WHEN 4 THEN "light_after_rem"
    END AS substage,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AT TIMEZONE 'Europe/Warsaw' AS _silver_at
FROM {{ ref('watch_data', 'stg_sleep_stage') }}
