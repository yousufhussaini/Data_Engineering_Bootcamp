INSERT INTO
  yousufh23.actors_history_scd
WITH
  lag AS (
    SELECT
      actor,
      actorid,
      quality_class,
      CASE
        WHEN is_active THEN 1
        ELSE 0
      END AS is_active,
      CASE
        WHEN LAG(is_active, 1) OVER (
          PARTITION BY
            actor
          ORDER BY
            current_year
        ) THEN 1
        ELSE 0
      END AS is_active_last_year,
      current_year
    FROM
      yousufh23.actors
  ),
  streak AS (
    SELECT
      *,
      SUM(
        CASE
          WHEN is_active <> is_active_last_year THEN 1
          ELSE 0
        END
      ) OVER (
        PARTITION BY
          actor
        ORDER BY
          current_year
      ) AS streak_identifier
    FROM
      lag
  )



SELECT
  actor,
  actorid,
  quality_class,
  streak_identifier,
  MAX(is_active) = 1 AS is_active,
  MIN(current_year) AS start_year,
  MAX(current_year) AS end_year,
  2021 AS current_year
FROM
  streak
GROUP BY
  actor,
  actorid,
  quality_class,
  streak_identifier


WITH
  last_year_scd AS (
    SELECT
      *
    FROM
      yousufh23.actors_scd
    WHERE
      current_year = 2021
  ),
  current_year_scd AS (
    SELECT
      *
    FROM
      yousufh23.actors
    WHERE
      current_year = 2022
  ),

