SELECT * FROM country_wise_latest;

PRAGMA table_info(country_wise_latest);

SELECT COUNT(*) FROM country_wise_latest;

CREATE TABLE covid_clean AS
SELECT 
  field1 AS country,
  CAST(field2 AS INTEGER) AS confirmed,
  CAST(field3 AS INTEGER) AS deaths,
  CAST(field4 AS INTEGER) AS recovered,
  CAST(field5 AS INTEGER) AS active
FROM country_wise_latest
WHERE field2 IS NOT NULL;

SELECT * FROM covid_clean;

SELECT country, confirmed
FROM covid_clean
ORDER BY confirmed DESC
LIMIT 5;

SELECT country, deaths
FROM covid_clean
ORDER BY deaths DESC
LIMIT 5;

SELECT 
  SUM(confirmed) AS total_confirmed,
  SUM(deaths) AS total_deaths,
  SUM(recovered) AS total_recovered,
  SUM(active) AS total_active
FROM covid_clean;

SELECT country,
       deaths,
       confirmed,
       ROUND(deaths * 100.0 / confirmed, 2) AS death_rate
FROM covid_clean
WHERE confirmed > 0
ORDER BY death_rate DESC
LIMIT 5;

SELECT country,
       recovered,
       confirmed,
       ROUND(recovered * 100.0 / confirmed, 2) AS recovery_rate
FROM covid_clean
WHERE confirmed > 0
ORDER BY recovery_rate DESC
LIMIT 5;
