WITH tmp_activity AS (
    SELECT
        CAST(_id AS INTEGER) AS id,
        json_parse(summary_data) AS summary_data,
        _source_file,
        CAST(_ingested_at, AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
    FROM {{ source('bronze', 'base_activity_summary') }}
    WHERE activity_kind=67108874
)
SELECT
    id,
    CAST(json_extract_scalar(summary_data, '$.activeSeconds.value') AS REAL) AS active_seconds,
    CAST(json_extract_scalar(summary_data, '$.distanceMeters.value') AS REAL) AS distance,
    CAST(json_extract_scalar(summary_data, '$.poolLength.value') AS REAL) AS pool_length,
    CAST(json_extract_scalar(summary_data, '$.swolfAvg.value') AS INTEGER) AS average_swolf,
    CAST(json_extract_scalar(summary_data, '$.strokes.value') AS INTEGER) AS stroke_count,
    CAST(json_extract_scalar(summary_data, '$.caloriesBurnt.value') AS INTEGER) AS calories_burnt,
    CAST(json_extract_scalar(summary_data, '$.active_calories.value') AS INTEGER) AS active_calories,
    CAST(json_extract_scalar(summary_data, '$.restingCalories.value') AS INTEGER) AS resting_calories,
    CAST(json_extract_scalar(summary_data, '$.averageHR.value') AS INTEGER) AS average_heart_rate,
    CAST(json_extract_scalar(summary_data, '$.maxHR.value') AS INTEGER) AS max_heart_rate,
    CAST(json_extract_scalar(summary_data, '$.avgStrokeRate.value') AS INTEGER) AS average_stroke_rate,
    CAST(json_extract_scalar(summary_data, '$.swim_avg_cadence.value') AS REAL) AS average_cadence,
    CAST(json_extract_scalar(summary_data, '$.averageKMPaceSeconds.value') AS REAL) AS average_pace_km_s,
    CAST(json_extract_scalar(summary_data, '$.maxPace.value') AS REAL) AS max_pace,
    CAST(json_extract_scalar(summary_data, '$.hrZoneNa.value') AS REAL) AS heart_rate_na_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneWarmUp.value') AS REAL) AS heart_rate_warmup_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneEasy.value') AS REAL) AS heart_rate_easy_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneAerobic.value') AS REAL) AS heart_rate_aerobic_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneMaximum.value') AS REAL) AS heart_rate_maximum_zone_time,
    CAST(json_extract_scalar(summary_data, '$.anaerobicTrainingEffect.value') AS REAL) AS anaerobic_effect,
    CAST(json_extract_scalar(summary_data, '$.aerobicTrainingEffect.value') AS REAL) AS aerobic_effect,
    CAST(json_extract_scalar(summary_data, '$.recoveryTime.value') AS INTEGER) AS recovery_time_seconds,
    CAST(json_extract_scalar(summary_data, '$.training_load.value') AS REAL) AS training_load,
    CAST(json_extract_scalar(summary_data, '$.training_effect_total.value') AS REAL) AS training_effect_total,
    CAST(json_extract_scalar(summary_data, '$.body_energy_at_start.value') AS INTEGER) AS body_energy_at_start,
    CAST(json_extract_scalar(summary_data, '$.body_energy_at_end.value') AS INTEGER) AS body_energy_at_end,
    CAST(json_extract_scalar(summary_data, '$.hr_user_resting.value') AS INTEGER) AS hr_user_resting,
    CAST(json_extract_scalar(summary_data, '$.battery_level_start.value') AS INTEGER) AS battery_level_start,
    CAST(json_extract_scalar(summary_data, '$.battery_level_end.value') AS INTEGER) AS battery_level_end,
    TRANSFORM(
        FILTER(
            MAP_ENTRIES(CAST(summary_data AS MAP(VARCHAR, JSON))),
            x -> regexp_like(x[1], '^interval_[0-9]+$')
        ),
        x -> CAST(
            ROW(x[1], json_format(x[2]))
            AS ROW(key VARCHAR,  value VARCHAR)
        )
    ) AS intervals,
    _source_file,
    CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM tmp_activity
