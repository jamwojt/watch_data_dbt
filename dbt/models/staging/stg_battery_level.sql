SELECT
    CAST(from_unixtime(timestamp)) AS TIMESTAMP(6) WITH TIME ZONE) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(level AS INTEGER) AS level,
    CAST(battery_index AS INTEGER) AS battery_index,
    _source_file,
    CAST(_ingested_at AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM {{ source('bronze', 'battery_level') }}
