SELECT
    datetime,
    device_id,
    user_id,
    heart_rate,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AT TIMEZONE 'Europe/Warsaw' AS _silver_at
FROM {{ ref('watch_data', 'stg_heart_rate_resting') }}
