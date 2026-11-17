SELECT 
    datetime,
    device_id,
    user_id,
    spo2,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AS _silver_at
FROM {{ ref('watch_data', 'stg_spo2') }}
