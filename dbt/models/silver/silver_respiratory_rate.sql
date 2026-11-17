SELECT
    datetime,
    device_id,
    user_id,
    respiratory_rate,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AS _silver_at
FROM {{ ref('watch_data', 'stg_respiratory_rate') }}
