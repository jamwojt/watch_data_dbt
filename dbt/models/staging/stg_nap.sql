SELECT
    CAST(from_unixtime(timestamp / 1000) AS TIMESTAMP(6) WITH TIME ZONE) AS start_datetime,
    CAST(from_unixtime(end_timestamp / 1000) AS TIMESTAMP(6) WITH TIME ZONE) AS end_datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    _source_file,
    CAST(_ingested_at AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM {{ source('bronze', 'nap') }}
