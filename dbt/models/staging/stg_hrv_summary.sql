select
    CAST(from_unixtime(timestamp / 1000) AS TIMESTAMP(6) WITH TIME ZONE) AS datetime,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    CAST(weekly_average AS INTEGER) AS weekly_average,
    CAST(last_night_average AS INTEGER) AS last_night_average,
    CAST(last_night5_min_high AS INTEGER) AS last_night5_min_high,
    CAST(baseline_low_upper AS INTEGER) AS baseline_low_upper,
    CAST(baseline_balanced_lower AS INTEGER) AS baseline_balanced_lower,
    CAST(baseline_balanced_upper AS INTEGER) AS baseline_balanced_upper,
    _source_file,
    CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
from {{ source('bronze', 'hrv_summary') }}
