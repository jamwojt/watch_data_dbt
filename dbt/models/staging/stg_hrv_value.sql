select
    CAST(from_unixtime(timestamp / 1000) AS TIMESTAMP(6) WITH TIME ZONE) AS datetime,
    cast(device_id as integer) as device_id,
    cast(user_id as integer) as user_id,
    cast(value as integer) as value,
    _source_file,
    CAST(_ingested_at AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
from {{ source('bronze', 'hrv_value') }}
