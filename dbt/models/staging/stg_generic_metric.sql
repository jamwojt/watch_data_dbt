SELECT
    CAST(from_unixtime(timestamp / 1000)) AS TIMESTAMP(6) WITH TIME ZONE) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(metric_type AS INTEGER) AS metric_type,
    metric_score,
    CAST(metric_extra AS INTEGER) AS metric_extra,
    _source_file,
    CAST(_ingested_at AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM {{ source('bronze', 'generic_metric') }}
