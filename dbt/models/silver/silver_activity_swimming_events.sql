SELECT
    activity_id,
    interval,
    stroke,
    meters,
    bpm,
    seconds,
    _source_file,
    _ingested_at AS _bronze_at,
    current_timestamp(6) AS _silver_at
FROM {{ ref('watch_data', 'stg_base_activity_swimming_events') }}
