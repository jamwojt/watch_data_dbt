SELECT DISTINCT
    metric_type,
    CASE metric_type
        WHEN 11 THEN 'basal metabolic rate'
        ELSE 'unknown type ' || CAST(metric_type AS VARCHAR)
    END AS metric_name
FROM {{ ref('watch_data', 'stg_generic_metric') }}
