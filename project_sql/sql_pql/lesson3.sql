-- 3. Subqueries, SELECT inception

-- Question 1A. Lets find all the contries that have a land mass area,
             -- larger than 'Brazil'. Hint: Use a subquery to find the
             -- area of 'Brazil' first. Display the region, name, area.
SELECT region, name, area
  FROM world
  WHERE area > (SELECT area
                  FROM world
                  WHERE name = 'Brazil');

-- Question 1B. Find the gdp of countries that have a population smaller
             -- than Samoa. List the name and gdp, please.
SELECT name, gdp
  FROM world
  WHERE population < (SELECT population
                        FROM world
                        WHERE name = 'Samoa');

-- Question 2. List the all countries in the same region as 'Taiwan' and
            -- 'Egypt'. Hint: use the IN SQL command to help you solve this.
            -- Display region and name. You can do it!
SELECT region, name
  FROM world
  WHERE region IN (SELECT region
                     FROM world
                     WHERE name IN ('Taiwan', 'Egypt'));

-- Question 2A. Find all the countries in 'North America' that have a per
             -- capita GDP greater than 'South Korea'. Just display the name.
SELECT name
  FROM world
  WHERE region = 'North America'
    AND gdp/population > (SELECT gdp/population
                            FROM world
                            WHERE name = 'South Korea');

-- Question 2B.
   -- NO QUESTION 2B

-- Question 3.
   -- NO QUESTION 3

-- Question 4.
   -- NO QUESTION 4

-- Question 5A.
   -- NO QUESTION 5A

-- Question 5B.
   -- NO QUESTION 5B

-- Question 6A.
   -- NO QUESTION 6A

-- Question 6B.
   -- NO QUESTION 6B


-- *****  LAST CHECKED: 10JUL2014  *****
