select
    CAST(
        at_timezone(
            from_unixtime(timestamp), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) as datetime,
    cast(device_id as integer) as device_id,
    cast(user_id as integer) as user_id,
    cast(event as integer) as event,
    cast(event_type as integer) as event_type,
    cast(data as integer) as data,
    _source_file,
    CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
from {{ source('bronze', 'event') }}
