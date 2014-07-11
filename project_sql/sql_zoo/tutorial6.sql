-- The JOIN operation

-- 1. Show matchid and player name for all goals scored by Germany.
   -- teamid = 'GER'
SELECT matchid, player
  FROM goal
  WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for game 1012
SELECT id,stadium,team1,team2
  FROM game 
  WHERE id = 1012;

-- 3. Show the player, teamid and mdate and for every German goal. teamid='GER'
SELECT goal.player, goal.teamid, game.mdate
  FROM game JOIN goal 
  ON game.id = goal.matchid
  WHERE goal.teamid = 'GER';

-- 4. Show the team1, team2 and player for every goal scored by a player
   -- called Mario player LIKE 'Mario%'
SELECT game.team1, game.team2, goal.player
  FROM game JOIN goal 
  ON game.id = goal.matchid
  WHERE goal.player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first
   -- 10 minutes gtime<=10
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
  FROM goal JOIN eteam
  ON goal.teamid = eteam.id
  WHERE goal.gtime <= 10

-- 6. List the the dates of the matches and the name of the team in which
   -- 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname
  FROM game JOIN eteam
  ON game.team1 = eteam.id
  WHERE eteam.coach = 'Fernando Santos';

-- 7. List the player for every goal scored in a game where the stadium was
   -- 'National Stadium, Warsaw'
SELECT goal.player
  FROM game JOIN goal
  ON game.id = goal.matchid
  WHERE game.stadium = 'National Stadium, Warsaw';

-- 8. Show names of all players who scored a goal against Germany.
SELECT DISTINCT goal.player
  FROM game JOIN goal
  ON game.id = goal.matchid 
  WHERE (game.team1='GER' OR game.team2='GER')
    AND goal.teamid <> 'GER';

-- 9. Show teamname and the total number of goals scored.
SELECT eteam.teamname, COUNT(eteam.teamname)
  FROM goal JOIN eteam
  ON goal.teamid = eteam.id
  GROUP BY eteam.teamname;

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT game.stadium, COUNT(game.stadium)
  FROM game JOIN goal
  ON game.id = goal.matchid
  GROUP BY game.stadium;

-- 11. For every match involving 'POL', show the matchid, date and the
    -- number of goals scored.
SELECT goal.matchid, game.mdate, count(*) AS goals_scored
  FROM game JOIN goal
  ON game.id = goal.matchid
  WHERE game.team1='POL' OR game.team2='POL'
  GROUP BY game.id;

-- 12. For every match where 'GER' scored, show matchid, match date and
    -- the number of goals scored by 'GER'
SELECT goal.matchid, game.mdate, count(*) AS GER_goals
  FROM game JOIN goal
  ON game.id = goal.matchid
  WHERE goal.teamid = 'GER'
  GROUP BY game.id;

-- 13. List every match with the goals scored by each team.
    -- Sort your result by mdate, matchid, team1 and team2.
SELECT game.mdate, game.team1,
    SUM(CASE WHEN goal.teamid=game.team1 THEN 1 ELSE 0 END) score1,
    game.team2,
    SUM(CASE WHEN goal.teamid=game.team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON game.id = goal.matchid
  GROUP BY game.id
  ORDER BY game.mdate, goal.matchid, game.team1, game.team2


-- JOIN Quiz
1. D 
2. C
3. A
4. Table-A
5. Query-B
6. C
7. Table-B
