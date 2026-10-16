select
    CAST(
        at_timezone(
            from_unixtime(timestamp), 'Europe/Warsaw'
        ) as TIMESTAMP(6) WITH TIME ZONE
    ) AS datetime,
    cast(device_id as integer) as device_id,
    cast(user_id as integer) as user_id,
    cast(stage as integer) as stage,
    _source_file,
    _ingested_at
from {{ source('bronze', 'sleep_stage') }}
