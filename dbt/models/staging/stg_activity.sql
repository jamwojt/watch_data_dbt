SELECT
    CAST(
        at_timezone(
            from_unixtime(timestamp), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) as datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(raw_intensity AS INTEGER) AS raw_intensity,
    CAST(steps AS INTEGER) AS steps,
    CAST(raw_kind AS INTEGER) AS raw_kind,
    _source_file,
    _ingested_at
FROM {{ source('bronze', 'activity') }}
