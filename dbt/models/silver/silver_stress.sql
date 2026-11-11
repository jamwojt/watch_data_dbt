SELECT
    datetime,
    device_id,
    user_id,
    stress,
    CASE stress
        WHEN BETWEEN 0 AND 25 THEN 'relaxed'
        WHEN BETWEEN 26 AND 50 THEN 'low'
        WHEN BETWEEN 51 AND 75 THEN 'moderate'
        WHEN > 75 THEN 'high'
    END AS stress_category,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AT TIMEZONE 'Europe/Warsaw' AS _silver_at
FROM {{ ref('watch_data', 'stg_stress') }}
