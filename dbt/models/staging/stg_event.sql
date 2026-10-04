select
    from_unixtime(timestamp, 'europe/warsaw') as datetime,
    cast(device_id as integer) as device_id,
    cast(user_id as integer) as user_id,
    cast(event as integer) as event,
    cast(event_type as integer) as event_type,
    cast(data as integer) as data,
    _source_file,
    _ingested_at
from {{ source('bronze', 'event') }}
