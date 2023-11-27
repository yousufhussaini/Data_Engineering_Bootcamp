INSERT INTO
 yousufh23.actors
WITH
  last_year AS (
    SELECT
      *
    FROM
      yousufh23.actors
    WHERE
      current_year = 2021
  ),
  this_year AS (
    SELECT
      *
    FROM
      bootcamp.actors_films
    WHERE
      year = 2022
  )
SELECT
  COALESCE(ly.actor, cy.actor) AS actor,
  COALESCE(ly.actor_id, cy.actor_id) AS actor_id,
  COALESCE(ly.quality_class, cy.quality_class) AS quality_class,
  CASE
    WHEN cy.film IS NULL THEN ly.films
    WHEN cy.film IS NOT NULL
    AND ly.films IS NULL THEN ARRAY[
      ROW (
        cy.film,
        cy.votes,
        cy.rating,
        cy.film_id,
      )
    ]
    WHEN cy.film IS NOT NULL
    AND ly.films IS NOT NULL THEN ARRAY[
      ROW (
          cy.film,
        cy.votes,
        cy.rating,
        cy.film_id,
      )
    ] || ly.film
  END AS years,
  cy.films IS NOT NULL AS is_active,
  CASE
    WHEN cy.film IS NOT NULL THEN 0
    ELSE films_since_last_active + 1
  END AS films_since_last_active,
  COALESCE(cy.film, ly.current_film + 1) AS current_film
FROM
  last_film
  FULL OUTER JOIN this_film cy ON ly.actor = cy.actor
