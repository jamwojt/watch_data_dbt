SELECT 
    CAST(
        at_timezone(
            from_unixtime(timestamp / 1000), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(stress AS INTEGER) AS stress,
    _source_file,
    _ingested_at
FROM {{ source('bronze', 'stress') }}
