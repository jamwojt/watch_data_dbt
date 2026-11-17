SELECT
    datetime,
    device_id,
    user_id,
    count AS value,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AS _silver_at
FROM {{ ref('watch_data', 'stg_sleep_restless_moments') }}
