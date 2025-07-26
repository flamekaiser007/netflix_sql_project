-- NETFLIX PROJECT
CREATE DATABASE netflixdb;
USE netflixdb;

CREATE TABLE netflix (
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);

select * from netflix;


select count(*) as total_content from netflix;

select distinct type from netflix;

-- Count no. of movies and tv showes

select type,
count(*) as total_content from netflix
group by type;


-- Most common rating for Movies and TV showes

select type,rating,ranking
from
(SELECT type, rating, COUNT(*) AS total,
rank() over(partition by type order by count(*) desc) as ranking
FROM netflix
GROUP BY type, rating)as t1

where ranking = 1;

-- List all movies released in specific year
select * from  netflix

Where
 type = 'Movie'
and
release_year = 2020;

-- Find the top 5 countries with most content on netflix

SELECT country, COUNT(*) AS total_content
FROM netflix_normalized
GROUP BY country
ORDER BY total_content DESC;

-- identify the longest movie?

select * from netflix
where
type = 'Movie'
and
duration = (select max(duration)from netflix);

-- Find content launched in last five years

SELECT *
FROM netflix
WHERE STR_TO_DATE(date_added, '%M %d, %Y') >= CURDATE() - INTERVAL 5 YEAR;
SELECT CURDATE() - INTERVAL 5 YEAR;

-- Find all movies direcd by rajiv chilika
select * from netflix

where
director like '%Rajiv Chilaka%';

-- Select TV Showes with more then 5 seasons

select * from netflix
where
Type = 'TV Show'
and
duration >5;

-- Count the number of content items in each genere
select
unnest (String_to_array(listed_in, ',')) as gnere,
count (show_id) as total_content
from netflix
group_by 1;

-- Find each year and the average numbers of content release in India on netflix return top 5 year with highest avg content release!
SELECT 
    country,
    release_year,
    COUNT(show_id) AS total_release,
    ROUND(
        COUNT(show_id) / (
            SELECT COUNT(show_id) 
            FROM netflix 
            WHERE country = 'India'
        ) * 100, 2
    ) AS avg_release
FROM netflix
WHERE country = 'India'
GROUP BY country, release_year
ORDER BY avg_release DESC
LIMIT 5;

--  List All Movies that are Documentaries
SELECT * 
FROM netflix
WHERE listed_in LIKE '%Documentaries';

--  Find All Content Without a Director
SELECT * 
FROM netflix
WHERE director IS NULL;

--  Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years
SELECT * 
FROM netflix
WHERE casts LIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;
  
  -- Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords
SELECT 
    category,
    COUNT(*) AS content_count
FROM (
    SELECT 
        CASE 
            WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY category;
