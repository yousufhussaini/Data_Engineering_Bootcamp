WITH dedupe AS (
    SELECT * from bootcamp.nba_game_details JOIN on bootcamp.nba_games 
	ON bootcamp.nba_game_details .game_id =  bootcamp.nba_games.game_id
        ROW_NUMBER() OVER ((PARTITION BY game_id, team_id, player_id ORDER BY game_date_est) AS row_num
    FROM
        game_id
)

DELETE FROM dedupe WHERE row_num > 1;
