SELECT
    datetime,
    device_id,
    user_id,
    metric_type,
    metric_score,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AS _silver_at
FROM {{ ref('watch_data', 'stg_generic_metric') }}
