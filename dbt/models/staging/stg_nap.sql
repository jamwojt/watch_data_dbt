SELECT
    CAST(
        at_timezone(
            from_unixtime(timestamp), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) AS start_datetime,
    CAST(
        at_timezone(
            from_unixtime(end_timestamp), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) AS end_datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    _source_file,
    CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM {{ source('bronze', 'nap') }}
