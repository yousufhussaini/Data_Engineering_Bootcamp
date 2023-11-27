Create Table yousufh23.actors( 
	actor VARCHAR, 
	actor_id INTEGER,
	film VARCHAR,
	year VARCHAR ,
	votes VARCHAR ,
	rating VARCHAR,  
	film_id INTEGER,
	CASE
        WHEN AVG(rating) > 8 THEN 'star'
        WHEN AVG(rating) > 7 THEN 'good'
        WHEN AVG(rating) > 6 THEN 'average'
        ELSE 'bad'
    END AS quality_class
	films ARRAY(ROW ( 
	film VARCHAR ,
	votes VARCHAR ,
	rating VARCHAR ,
	film_id INTEGER, 
)), 



	is_active BOOLEAN, 
	making_films_this_year INTEGER, 
	current_year INTEGER 
	

)

WITH ( 
Format = ‘PARQUET’ , 
Partitioning = ARRAY[‘current_year’]
