select
    CAST(from_unixtime(timestamp)) AS TIMESTAMP(6) WITH TIME ZONE) AS datetime,
    CAST(device_id AS integer) AS device_id,
    CAST(user_id AS integer) AS user_id,
    CAST(event AS integer) AS event,
    CAST(event_type AS integer) AS event_type,
    CAST(data AS integer) AS data,
    _source_file,
    CAST(_ingested_at AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
from {{ source('bronze', 'event') }}
