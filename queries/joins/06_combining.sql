-- ============================================
-- Practice: Combining Joins with Aggregation, ORDER BY, and LIMIT
-- ============================================
-- This is where everything comes together.
-- The pattern is: JOIN to bring in context columns,
-- then GROUP BY + aggregate to summarise, then
-- ORDER BY to rank, and LIMIT to focus on the top results.
--
-- Reminder — execution order:
--   FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
-- ============================================

-- -----------------------
-- JOIN + GROUP BY
-- -----------------------

-- Exercise 1
-- How many patients are enrolled in each trial?
-- Show the trial name alongside the count — not just the trial_id.
-- Tables: patients, trials
-- Hint: JOIN trials, GROUP BY trial_name

-- Exercise 2
-- For each department, how many trials are they running?
-- Show the department name, not the department_id.
-- Tables: trials, departments
-- Hint: JOIN departments, GROUP BY department_name

-- Exercise 3
-- For each trial, what is the average age and average weight
-- of enrolled patients? Show the trial name.
-- Tables: patients, trials
-- Hint: JOIN trials, GROUP BY trial_name, AVG(age), AVG(weight_kg)

-- Exercise 4
-- For each patient, show their total visit time in minutes
-- alongside their trial name and enrollment status.
-- Tables: visits, patients, trials
-- Hint: JOIN patients and trials, GROUP BY patient_id,
--       SUM(duration_minutes)

-- Exercise 5
-- For each test name in lab_results, show the average result value
-- and the unit, grouped by test.
-- Tables: lab_results
-- Hint: GROUP BY test_name, AVG(result_value)

-- -----------------------
-- JOIN + GROUP BY + ORDER BY
-- -----------------------

-- Exercise 6
-- Which trials have the most patients enrolled?
-- Show trial name and patient count, sorted from most to fewest.
-- Tables: patients, trials
-- Hint: JOIN trials, GROUP BY trial_name, ORDER BY COUNT(*) DESC

-- Exercise 7
-- Which departments have the highest average patient age across all
-- their trials? Sort from oldest average to youngest.
-- Tables: patients, trials, departments
-- Hint: JOIN all three, GROUP BY department_name,
--       ORDER BY AVG(age) DESC

-- Exercise 8
-- List each visit timepoint with the average visit duration,
-- sorted from longest to shortest.
-- Helps identify which timepoints carry the heaviest patient burden.
-- Table: visits
-- Hint: GROUP BY visit_timepoint, ORDER BY AVG(duration_minutes) DESC

-- Exercise 9
-- For each test name in lab_results, show the average result value
-- sorted highest to lowest.
-- Flag which tests are trending above their normal reference range.
-- Table: lab_results
-- Hint: GROUP BY test_name, ORDER BY AVG(result_value) DESC

-- -----------------------
-- JOIN + GROUP BY + ORDER BY + LIMIT
-- -----------------------

-- Exercise 10
-- Which 3 trials have the most visits recorded?
-- Show the trial name and total visit count.
-- Tables: visits, patients, trials
-- Hint: JOIN patients and trials, GROUP BY trial_name,
--       ORDER BY COUNT(*) DESC, LIMIT 3

-- Exercise 11
-- Which single department has the highest average patient age?
-- Tables: patients, trials, departments
-- Hint: JOIN all three, GROUP BY department_name,
--       ORDER BY AVG(age) DESC, LIMIT 1

-- Exercise 12
-- Which 5 patients have the highest total time spent on visits?
-- Show patient_id, their trial name, and total minutes.
-- Tables: visits, patients, trials
-- Hint: JOIN patients and trials, GROUP BY patient_id,
--       SUM(duration_minutes), ORDER BY DESC, LIMIT 5

-- Exercise 13
-- Which 3 trials have the largest gap between their current enrolled
-- patient count and their target enrollment?
-- This tells the program team which trials are furthest behind on recruitment.
-- Tables: patients, trials
-- Hint: JOIN trials, GROUP BY trial_name and target_enrollment,
--       compute (target_enrollment - COUNT(*)) AS recruitment_gap,
--       ORDER BY recruitment_gap DESC, LIMIT 3
