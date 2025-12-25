-- SQL Advent Calendar - Day 20
-- Title: Hot Cocoa Break Logs
-- Difficulty: medium
--
-- Question:
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--

-- Table Schema:
-- Table: cocoa_logs
--   log_id: INT
--   break_id: INT
--   cocoa_id: INT
--
-- Table: break_schedule
--   break_id: INT
--   location_id: INT
--
-- Table: cocoa_types
--   cocoa_id: INT
--   cocoa_name: VARCHAR
--
-- Table: locations
--   location_id: INT
--   location_name: VARCHAR
--

-- My Solution:

SELECT cl.log_id,cl.break_id,cl.cocoa_id,bs.location_id,ct.cocoa_name,l.location_name 
FROM cocoa_logs cl 
INNER JOIN break_schedule bs ON cl.break_id = bs.break_id 
INNER JOIN cocoa_types ct ON cl.cocoa_id = ct.cocoa_id
INNER JOIN locations l ON bs.location_id = l.location_id 
ORDER BY cl.log_id;
