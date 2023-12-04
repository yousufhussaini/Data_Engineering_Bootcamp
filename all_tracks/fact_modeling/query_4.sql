WITH
  today AS (
    SELECT
      *
    FROM
      yousufh23.user_devices_cumulated

  ),
  date_list_int AS (
    SELECT
      user_id,
      CAST(
        SUM(
          CASE
            WHEN CONTAINS(dates_active, sequence_date) THEN POW(2, DATE_DIFF('day', sequence_date, DATE))
            ELSE 0
          END
        ) AS BIGINT
      ) AS history_int
    
  num_days_active DESC

