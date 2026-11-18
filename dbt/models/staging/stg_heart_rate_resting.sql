SELECT
    CAST(
        at_timezone(
            from_unixtime(timestamp / 1000), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(heart_rate AS INTEGER) AS heart_rate,
    _source_file,
    CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM {{ source('bronze', 'heart_rate_resting') }}
