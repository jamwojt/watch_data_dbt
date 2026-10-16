select
    CAST(
        at_timezone(
            from_unixtime(timestamp), 'europe/warsaw'
        ) as TIMESTAMP(6) WITH TIME ZONE
    ) AS datetime,
    cast(device_id as integer) as device_id,
    cast(user_id as integer) as user_id,
    cast(respiratory_rate as integer) as respiratory_rate,
    _source_file,
    _ingested_at
from {{ source('bronze', 'respiratory_rate') }}
