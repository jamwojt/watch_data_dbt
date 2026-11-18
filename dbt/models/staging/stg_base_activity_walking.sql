WITH tmp_activity AS (
    SELECT
        CAST(_id AS INTEGER) AS id,
        json_parse(summary_data) AS summary_data,
        _source_file,
        CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
    FROM {{ source('bronze', 'base_activity_summary') }}
    WHERE activity_kind=32
)
SELECT
    id,
    CAST(json_extract_scalar(summary_data, '$.activeSeconds.value') AS REAL) AS active_seconds,
    CAST(json_extract_scalar(summary_data, '$.distanceMeters.value') AS REAL) AS distance,
    CAST(CAST(json_extract_scalar(summary_data, '$.steps.value') AS REAL) AS INTEGER) AS steps,
    CAST(json_extract_scalar(summary_data, '$.caloriesBurnt.value') AS INTEGER) AS calories_burnt,
    CAST(json_extract_scalar(summary_data, '$.active_calories.value') AS INTEGER) AS active_calories,
    CAST(json_extract_scalar(summary_data, '$.restingCalories.value') AS INTEGER) AS resting_calories,
    CAST(json_extract_scalar(summary_data, '$.estimatedSweatLoss.value') AS INTEGER) AS sweat_loss_ml,
    CAST(json_extract_scalar(summary_data, '$.averageHR.value') AS INTEGER) AS average_heart_rate,
    CAST(json_extract_scalar(summary_data, '$.maxHR.value') AS INTEGER) AS max_heart_rate,
    CAST(json_extract_scalar(summary_data, '$.averageCadence.value') AS REAL) AS average_cadence,
    CAST(json_extract_scalar(summary_data, '$.maxCadence.value') AS REAL) AS max_cadence,
    CAST(json_extract_scalar(summary_data, '$.activityTotalAscent.value') AS INTEGER) AS total_ascent,
    CAST(json_extract_scalar(summary_data, '$.activityTotalDescent.value') AS INTEGER) AS total_descent,
    CAST(json_extract_scalar(summary_data, '$.averageKMPaceSeconds.value') AS REAL) AS average_seconds_per_km,
    CAST(json_extract_scalar(summary_data, '$.maxPace.value') AS REAL) AS min_seconds_per_km,
    CAST(json_extract_scalar(summary_data, '$.hrZoneNa.value') AS REAL) AS heart_rate_na_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneWarmUp.value') AS REAL) AS heart_rate_warmup_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneEasy.value') AS REAL) AS heart_rate_easy_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneAerobic.value') AS REAL) AS heart_rate_aerobic_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneThreshold.value') AS REAL) AS heart_rate_threshold_zone_time,
    CAST(json_extract_scalar(summary_data, '$.hrZoneMaximum.value') AS REAL) AS heart_rate_maximum_zone_time,
    CAST(json_extract_scalar(summary_data, '$.anaerobicTrainingEffect.value') AS REAL) AS anaerobic_effect,
    CAST(json_extract_scalar(summary_data, '$.aerobicTrainingEffect.value') AS REAL) AS aerobic_effect,
    CAST(json_extract_scalar(summary_data, '$.maximumOxygenUptake.value') AS REAL) AS max_oxygen_uptake_ml_kg_min,
    CAST(json_extract_scalar(summary_data, '$.recoveryTime.value') AS INTEGER) AS recovery_time_seconds,
    CAST(json_extract_scalar(summary_data, '$.training_load.value') AS REAL) AS training_load,
    CAST(json_extract_scalar(summary_data, '$.training_effect_total.value') AS REAL) AS training_effect_total,
    CAST(json_extract_scalar(summary_data, '$.body_energy_at_start.value') AS INTEGER) AS start_body_energy,
    CAST(json_extract_scalar(summary_data, '$.body_energy_at_end.value') AS INTEGER) AS end_body_energy,
    CAST(json_extract_scalar(summary_data, '$.hr_user_resting.value') AS INTEGER) AS resting_heart_rate,
    CAST(json_extract_scalar(summary_data, '$.recovery_time_remaining_at_start.value') AS INTEGER) AS start_recovery_time,
    CAST(json_extract_scalar(summary_data, '$.hr_user_max.value') AS INTEGER) AS max_hr,
    CAST(json_extract_scalar(summary_data, '$.battery_level_start.value') AS INTEGER) AS start_battery_level,
    CAST(json_extract_scalar(summary_data, '$.battery_level_end.value') AS INTEGER) AS end_battery_level,
    _source_file,
    CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM tmp_activity
