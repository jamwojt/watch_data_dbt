SELECT
    CAST(
        at_timezone(
            from_unixtime(timestamp), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(spo2 AS INTEGER) AS spo2,
    CAST(type_num AS INTEGER) AS type_num,
    _source_file,
    _ingested_at
FROM {{ source('bronze', 'spo2') }}
