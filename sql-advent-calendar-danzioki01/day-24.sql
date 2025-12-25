-- SQL Advent Calendar - Day 24
-- Title: New Year Goals - User Type Analysis
-- Difficulty: hard
--
-- Question:
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--

-- Table Schema:
-- Table: user_goals
--   user_id: INT
--   user_type: VARCHAR
--   goal_id: INT
--   goal_status: VARCHAR
--

-- My Solution:

WITH completed_table AS (SELECT user_id,user_type,COUNT(goal_id) as Completed FROM user_goals 
where goal_status = 'Completed' GROUP by 
user_id,user_type) SELECT user_type, ROUND(AVG(Completed),2) as avg_Completed from completed_table
  GROUP BY user_type;
