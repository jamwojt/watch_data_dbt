SELECT
    CAST(from_unixtime(timestamp / 1000) AS TIMESTAMP(6) WITH TIME ZONE) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(count AS INTEGER) AS count,
    _source_file,
    CAST(_ingested_at AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM {{ source('bronze', 'sleep_restless_moments') }}
