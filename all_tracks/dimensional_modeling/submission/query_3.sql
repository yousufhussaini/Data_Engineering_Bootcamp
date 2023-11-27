CREATE TABLE
  yousufh23.actors_history_scd (
    quality_class VARCHAR,
    is_active BOOLEAN,
    start_date INTEGER,
    end_date INTEGER,
    current_year INTEGER
  )
WITH
  (
    FORMAT = 'PARQUET',
    partitioning = ARRAY['current_year']
  )
