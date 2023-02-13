USE 507_final_proj;

DROP TABLE IF EXISTS population;

/*__________________________*/
CREATE TABLE population
(pop_id SMALLINT UNSIGNED AUTO_INCREMENT,
pop_rank VARCHAR(30),
iso_3166_1_a3 VARCHAR(30),
country VARCHAR(100),
capital VARCHAR(100),
continent VARCHAR(100),
pop_2022 VARCHAR(100),
pop_2020 VARCHAR(100),
pop_2015 VARCHAR(100),
pop_2010 VARCHAR(100),
pop_2000 VARCHAR(100),
pop_1990 VARCHAR(100),
pop_1980 VARCHAR(100),
pop_1970 VARCHAR(100),
area VARCHAR(30),
density VARCHAR(30),
grow_rate VARCHAR(30),
pop_perc VARCHAR(30),
CONSTRAINT pk_pop_id PRIMARY KEY (pop_id)
);
DESC population;

/*__________________________*/
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/world_population.csv'
	INTO TABLE population
FIELDS TERMINATED BY ','
optionally enclosed by '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(pop_rank,
iso_3166_1_a3,
country,
capital,
continent,
pop_2022,
pop_2020,
pop_2015,
pop_2010,
pop_2000,
pop_1990,
pop_1980,
pop_1970,
area,
density,
grow_rate,
pop_perc
)
;

SELECT * FROM population
LIMIT 100000;

SELECT * FROM population
WHERE iso_3166_1_a3 = ''
LIMIT 100000;

UPDATE population
SET iso_3166_1_a3 = NULL
WHERE iso_3166_1_a3 = '';

SELECT *, COUNT(country) FROM population
WHERE iso_3166_1_a3 IS NULL
GROUP BY country
LIMIT 100000;

SELECT * FROM population
WHERE country IS NULL
LIMIT 100000;

SELECT country, iso_3166_1_a3, COUNT(iso_3166_1_a3) FROM population
GROUP BY country, iso_3166_1_a3
LIMIT 100000;

SELECT * FROM population
LIMIT 100000;
