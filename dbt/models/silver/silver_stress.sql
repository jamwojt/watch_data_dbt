SELECT
    datetime,
    device_id,
    user_id,
    stress,
    CASE
        WHEN stress <= 25 THEN 'relaxed'
        WHEN stress <= 50 THEN 'low'
        WHEN stress <= 75 THEN 'moderate'
        WHEN stress > 75 THEN 'high'
    END AS stress_category,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AS _silver_at
FROM {{ ref('watch_data', 'stg_stress') }}
