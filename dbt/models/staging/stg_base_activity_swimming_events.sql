SELECT
    id,
    intervals,
    _source_file,
    _ingested_at
FROM {{ ref('stg_base_activity_swimming') }}
