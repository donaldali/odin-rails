-- More JOIN operations (Movie Database)

-- 1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962;

-- 2. Give year of 'Citizen Kane'.
SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane';

-- 3. List all of the Star Trek movies, include the id, title and yr (all of
   -- these movies include the words Star Trek in the title). Order results
   -- by year.
SELECT id, title, yr
  FROM movie
  WHERE title LIKE '%Star Trek%'
  ORDER BY yr;

-- 4. What are the titles of the films with id 11768, 11955, 21191
SELECT title
  FROM movie
  WHERE id IN (11768, 11955, 21191);

-- 5. What id number does the actor 'Glenn Close' have?
SELECT id
  FROM actor
  WHERE name = 'Glenn Close';

-- 6. What is the id of the film 'Casablanca'
SELECT id
  FROM movie
  WHERE title = 'Casablanca';

-- 7. Obtain the cast list for 'Casablanca'. Use the id value that
   -- you obtained in the previous question.
SELECT actor.name
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE movie.title = 'Casablanca';

-- 8. Obtain the cast list for the film 'Alien'
SELECT actor.name
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE movie.title = 'Alien';

-- 9. List the films in which 'Harrison Ford' has appeared
SELECT movie.title
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE actor.name = 'Harrison Ford';

-- 10. List the films where 'Harrison Ford' has appeared - but not in the
    -- star role. [Note: the ord field of casting gives the position of the
    -- actor. If ord=1 then this actor is in the starring role]
SELECT movie.title
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE actor.name = 'Harrison Ford'
    AND casting.ord <> 1;

-- 11. List the films together with the leading star for all 1962 films.
SELECT movie.title, actor.name
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE casting.ord = 1
    AND movie.yr = 1962;

-- 12. Which were the busiest years for 'John Travolta', show the year and
    -- the number of movies he made each year for any year in which he made
    -- more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
);

-- 13. List the film title and the leading actor for all of the films
    -- 'Julie Andrews' played in.
SELECT movie.title, actor.name
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE casting.ord = 1
    AND movie.title IN
      (SELECT movie.title
         FROM (movie JOIN casting
         ON movie.id = casting.movieid) JOIN actor
           ON casting.actorid = actor.id
         WHERE actor.name = 'Julie Andrews');

-- 14. Obtain a list in alphabetical order of actors who've had at least
    -- 30 starring roles.
SELECT actor.name
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE casting.ord = 1
  GROUP BY actor.name
  HAVING COUNT(*) >= 30
  ORDER BY actor.name;

-- 15. List the 1978 films by order of cast list size.
-- SAME RESULT, DIFFERENT ORDERING
SELECT movie.title, COUNT(*)
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE movie.yr = 1978
  GROUP BY movie.title
  ORDER BY COUNT(*) DESC;

-- 16. List all the people who have worked with 'Art Garfunkel'.
SELECT actor.name
  FROM (movie JOIN casting
  ON movie.id = casting.movieid) JOIN actor
    ON casting.actorid = actor.id
  WHERE actor.name <> 'Art Garfunkel'
    AND movie.title IN
      (SELECT movie.title
         FROM (movie JOIN casting
         ON movie.id = casting.movieid) JOIN actor
           ON casting.actorid = actor.id
         WHERE actor.name = 'Art Garfunkel');


-- JOIN Quiz 2
1. C
2. E
3. C
4. Table-B
5. D
6. D -- INCORRECT ON SQL ZOO
7. Table-B
