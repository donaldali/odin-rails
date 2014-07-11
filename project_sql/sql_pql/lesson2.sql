-- Lets SUM, COUNT, MAX and more!

-- Question 1A. Find out the total gdp of the world. This is how much
             -- product value is produced per year around the world!
SELECT SUM(gdp) FROM world;

-- Question 1B. Display the total land mass; area, of the region
             -- 'Asia-Pacific'.
SELECT SUM(area)
  FROM world
  WHERE region = 'Asia-Pacific';

-- Question 2A. Find the total number of countries in the region
             -- 'North America' and 'South America'.
SELECT count(name)
  FROM world
  WHERE region = 'North America'
     OR region = 'South America';

-- Question 2B. Count the number of countries that have an area of
             -- at least 1,000,000 km2.
SELECT COUNT(name)
  FROM world
  WHERE area >= 1000000;
-- NOTE: Website incorrectly uses 'WHERE area > 1000000'

-- Question 3. Lets find the largest land mass; area, in 'Europe' by
            -- using the Max SQL command.
SELECT MAX(area)
  FROM world
  WHERE region = 'Europe';

-- Question 4.
   -- NO QUESTION 4

-- Question 5A. Lets find the total population of each region! 
             -- Use the SUM function to add up each country's 
             -- population and remember to GROUP BY region.
SELECT region, SUM(population)
  FROM world
  GROUP BY region;

-- Question 5B. For each region, COUNT the number of countries that
             -- have a population greater than 100 million.
SELECT region, COUNT(name)
  FROM world
  WHERE population > 100000000
  GROUP BY region;

-- Question 6A. Write a query that will show all the regions with at least
             -- 30 countries. Hint: use HAVING and COUNT to filter in 
             -- regions that have greater than or equal to 30 names.
SELECT region, COUNT(*)
  FROM world
  GROUP BY region
  HAVING COUNT(*) >= 30;

-- Question 6B. 
   -- NO QUESTION 6B
