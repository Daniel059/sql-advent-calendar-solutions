-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

WITH daily_message_counts AS (
  SELECT
    U.user_name,
    DATE(M.sent_at) AS message_date,
    COUNT(M.message_id) AS daily_total_messages
  FROM
    npn_users U
  JOIN
    npn_messages M ON U.user_id = M.sender_id
  GROUP BY
    U.user_name,
    DATE(M.sent_at)
),
max_daily_messages AS (
  SELECT
    message_date,
    MAX(daily_total_messages) AS max_messages_for_day
  FROM
    daily_message_counts
  GROUP BY
    message_date
)
SELECT
  dmc.user_name,
  dmc.message_date,
  dmc.daily_total_messages
FROM
  daily_message_counts dmc
JOIN
  max_daily_messages mdm ON dmc.message_date = mdm.message_date
WHERE
  dmc.daily_total_messages = mdm.max_messages_for_day
ORDER BY
  dmc.message_date, dmc.daily_total_messages DESC, dmc.user_name;
