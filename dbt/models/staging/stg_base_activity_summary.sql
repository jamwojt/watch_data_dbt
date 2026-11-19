SELECT
    CAST(_id AS INTEGER) AS id,
    CAST(from_unixtime(start_time / 1000) AS TIMESTAMP(6) WITH TIME ZONE) AS start_datetime,
    CAST(from_unixtime(end_time / 1000) AS TIMESTAMP(6) WITH TIME ZONE) AS end_datetime,
    name,
    CAST(activity_kind AS INTEGER) AS activity_kind,
    base_longitude,
    base_latitude,
    base_altitude,
    gpx_track,
    raw_details_path,
    CAST(device_id AS INTEGER) AS device_id,
    CAST(user_id AS INTEGER) AS user_id,
    raw_summary_data,
    _source_file,
    CAST(_ingested_at AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM {{ source('bronze', 'base_activity_summary') }}
