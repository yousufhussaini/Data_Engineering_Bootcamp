 combine AS (
    SELECT
      COALESCE(ls.actor, cs.actor) AS actor,
      COALESCE(ls.actorid, cs.actorid) AS actorid,
      COALESCE(ls.quality_class, cs.quality_class) AS quality_class,
      COALESCE(ls.start_year, cs.current_year) AS start_year,
      COALESCE(ls.end_year, cs.current_year) AS end_year,
      CASE
        WHEN ls.is_active <> cs.is_active THEN 1
        WHEN ls.is_active = cs.is_active THEN 0
      END AS did_change,
      2022 AS current_year
    FROM
      last_year_scd ls
      FULL OUTER JOIN current_year_scd cs ON ls.actor = cs.actor
      AND ls.quality_class = cs.quality_class
      AND ls.end_year + 1 = cs.current_year
  )
SELECT
  *
FROM
  combine
