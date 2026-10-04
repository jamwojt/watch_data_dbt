SELECT
    from_unixtime(timestamp, 'Europe/Warsaw') AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(energy AS INTEGER) AS energy,
    _source_file,
    _ingested_at
FROM {{ source('bronze', 'body_energy') }}
