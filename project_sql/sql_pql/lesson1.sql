-- The SELECT command

-- Question 1. Display the name and area from table world.
SELECT name, area FROM world;

-- Question 2. Calculate the "per capita gdp"; gdp/population, for each
            -- country where the area is over 5,000,000 km2.
SELECT name, gdp/population
  FROM world
  WHERE area > 5000000;

-- Question 3. Show the name and region where the area is less then 
            -- 2,000 km2 and the gdp is more than $5,000,000,000.
SELECT name, region
  FROM world
  WHERE area < 2000
    AND gdp > 5000000000;

-- Question 4. Show the name and population for 'China', 'Vietnam', 'Japan'.
SELECT name, population
  FROM world
  WHERE name IN ('China', 'Vietnam', 'Japan');

-- Question 5A. Show only the name of the countries that begins with 'S'.
             -- Don't forget to get use % as the wildcard.
SELECT name FROM world
  WHERE name LIKE 'S%';

-- Question 5B. Show the name and region of countries that begins with
             -- 'T' and ends with a 'n'.
SELECT name, region
  FROM world
  WHERE name LIKE 'T%n';

-- Question 6A. Lets find all the small countries where the area is between
             -- 10,000 km2 and 50,000 km2. List the name and population.
SELECT name, population
  FROM world
  WHERE area BETWEEN 10000 AND 50000;

-- Question 6B. List the country's name and population where the
             -- population is BETWEEN 35 million and 75 million. 
             -- Display the population in millions please.
SELECT name, population/1000000
  FROM world
  WHERE population BETWEEN 35000000 AND 75000000;

-- Question 7. Create a query where the name column is renamed as country
            -- and the population is called "Number of people"
SELECT name AS country, population AS "Number of people"
  FROM world;
