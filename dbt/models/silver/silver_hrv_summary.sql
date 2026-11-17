SELECT
    datetime,
    device_id,
    user_id,
    weekly_average,
    last_night_average,
    last_night5_min_high,
    baseline_low_upper,
    baseline_balanced_lower,
    baseline_balanced_upper,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AS _silver_at
FROM {{ ref('watch_data', 'stg_hrv_summary') }}
