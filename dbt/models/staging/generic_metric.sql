SELECT
    CAST(
        at_timezone(
            from_unixtime(timestamp), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(metric_type AS INTEGER) AS metric_type,
    metric_score,
    CAST(metric_extra AS INTEGER) AS metric_extra,
    _source_file,
    _ingested_at
FROM {{ source('bronze', 'generic_metric') }}
