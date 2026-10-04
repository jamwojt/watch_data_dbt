SELECT 
    from_unixtime(timestamp, 'Europe/Warsaw') AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(stress AS INTEGER) AS stress,
    _source_file,
    ingested_at
FROM {{ source('bronze', 'stress') }}
