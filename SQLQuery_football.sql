use Football

------------1
select SUM(country_1_score+country_2_score) as Total_Goals
from Match

------------2
select id ,(country_1_score+country_2_score) / 2 as Average_Goals 
from Match

------------3
select id,country_1_score,country_2_score,country_1_score+country_2_score AS Total_goals
from Match
ORDER BY total_goals DESC

------------4
select SUM(attendance) AS Total_attendance
from Match

------------5
select AVG(attendance) AS Average_attendance
from Match

------------6

SELECT Name, total_goals
FROM (
    SELECT p.Name, SUM(gol.goal_scored) AS total_goals,
           ROW_NUMBER() OVER (ORDER BY SUM(gol.goal_scored) DESC) AS row_num
    FROM players p
    JOIN Goal gol ON p.ID = gol.id
    GROUP BY p.ID, p.Name
) AS ranked_players
WHERE row_num > 5;