WITH tmp AS (
SELECT
    a.id,
    b.interval,
    json_extract(json_parse(b.value), '$.columns') AS value,
    a._source_file,
    a._ingested_at
FROM
    {{ ref('stg_base_activity_swimming') }} a
CROSS JOIN
    UNNEST(a.intervals) WITH ORDINALITY AS b(key, value, interval)
)
SELECT
    id AS activity_id,
    interval,
    CAST(json_extract(value, '$[1].value') AS VARCHAR) AS stroke,
    CAST(json_extract(value, '$[2].value') AS REAL) AS meters,
    CAST(json_extract(value, '$[3].value') AS INTEGER) AS bpm,
    CAST(json_extract(value, '$[4].value') AS REAL) AS seconds,
    _source_file,
    CAST(at_timezone(_ingested_at, 'Europe/Warsaw') AS TIMESTAMP(6) WITH TIME ZONE) AS _ingested_at
FROM tmp
