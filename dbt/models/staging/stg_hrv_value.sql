select
    from_unixtime(timestamp, 'europe/warsaw') as datetime,
    cast(device_id as integer) as device_id,
    cast(user_id as integer) as user_id,
    cast(value as integer) as value,
    _source_file,
    _ingested_at
from {{ source('bronze', 'hrv_value') }}
