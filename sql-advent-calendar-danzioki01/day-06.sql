-- SQL Advent Calendar - Day 6
-- Title: Ski Resort Snowfall Rankings
-- Difficulty: hard
--
-- Question:
-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?
--
-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?
--

-- Table Schema:
-- Table: resort_monthly_snowfall
--   resort_id: INT
--   resort_name: VARCHAR
--   snow_month: INT
--   snowfall_inches: DECIMAL
--

-- My Solution:

WITH RESORT_tl_snowfall AS(
SELECT resort_name, SUM(snowfall_inches) AS Total_Snowfall 
from resort_monthly_snowfall GROUP BY resort_name
)
SELECT resort_name,Total_Snowfall,NTILE(4) OVER(
  ORDER BY Total_Snowfall
)AS SnowfallQuartile FROM RESORT_tl_snowfall 
ORDER BY SnowfallQuartile,Total_Snowfall;
