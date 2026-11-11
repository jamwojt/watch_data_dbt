SELECT
    CAST(
        at_timezone(
            from_unixtime(timestamp), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(level AS INTEGER) AS level,
    CAST(battery_index AS INTEGER) AS battery_index,
    _source_file,
    _ingested_at
FROM {{ source('bronze', 'battery_level') }}
