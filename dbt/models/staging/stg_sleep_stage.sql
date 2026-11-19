select
    CAST(from_unixtime(timestamp / 1000) AS TIMESTAMP(6) WITH TIME ZONE) AS datetime,
    CAST(device_id AS integer) AS device_id,
    CAST(user_id AS integer) AS user_id,
    CAST(stage AS integer) AS stage,
    _source_file,
    CAST(_ingested_at AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
from {{ source('bronze', 'sleep_stage') }}
