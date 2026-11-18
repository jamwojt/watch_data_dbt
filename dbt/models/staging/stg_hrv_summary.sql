select
    CAST(
        at_timezone(
            from_unixtime(timestamp / 1000), 'Europe/Warsaw'
        ) AS TIMESTAMP(6) WITH TIME ZONE
    ) AS datetime,
    cast(device_id as integer) as device_id,
    cast(user_id as integer) as user_id,
    cast(weekly_average as integer) as weekly_average,
    cast(last_night_average as integer) as last_night_average,
    cast(last_night5_min_high as integer) as last_night5_min_high,
    cast(baseline_low_upper as integer) as baseline_low_upper,
    cast(baseline_balanced_lower as integer) as baseline_balanced_lower,
    cast(baseline_balanced_upper as integer) as baseline_balanced_upper,
    _source_file,
    CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
from {{ source('bronze', 'hrv_summary') }}
