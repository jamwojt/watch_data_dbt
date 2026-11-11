SELECT
    datetime,
    device_id,
    user_id,
    weekly_average,
    last_night_average,
    last_night_5min_high,
    baseline_low_uppper,
    baseline_balanced_lower,
    baseline_balanced_upper,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AT TIMEZONE 'Europe/Warsaw' AS _silver_at
FROM {{ ref('watch_data', 'stg_hrv_summary') }}
