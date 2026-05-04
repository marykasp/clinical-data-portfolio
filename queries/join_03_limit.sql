-- ============================================
-- Practice: LIMIT
-- ============================================
-- LIMIT restricts how many rows are returned.
-- Almost always paired with ORDER BY — without it,
-- the rows returned are arbitrary and the result
-- is not meaningful.
--
-- Pattern:
--   SELECT columns
--   FROM table
--   ORDER BY column DESC
--   LIMIT n
--
-- LIMIT runs last in the execution order:
--   FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
-- ============================================

-- -----------------------
-- Single Table
-- -----------------------

-- Exercise 1
-- Which 5 patients were enrolled most recently?
-- Table: patients
SELECT patient_id,
  enrollment_date
FROM patients
ORDER BY enrollment_date DESC
LIMIT 5;

-- Exercise 2
-- Which 3 patients are the oldest in the program?
-- Table: patients
SELECT patient_id,
  age
FROM patients
ORDER BY age DESC
LIMIT 3;

-- Exercise 3
-- What were the 5 longest visits ever recorded?
-- Table: visits
SELECT visit_id,
  duration_minutes
FROM visits
ORDER BY duration_minutes DESC
LIMIT 5;


-- Exercise 4
-- What is the single most recent visit in the entire program?
-- Table: visits
SELECT visit_id,
  visit_date
FROM visits
ORDER BY visit_date DESC
LIMIT 1;

-- Exercise 5
-- Which trial has the highest target enrollment?
-- Table: trials
SELECT trial_id,
  trial_name,
  target_enrollment
FROM trials
ORDER BY target_enrollment DESC
LIMIT 1;

-- Exercise 6
-- Which 5 lab results have the highest CRP values recorded?
-- CRP is an inflammation marker — the top values flag the most
-- acutely inflamed patients in the dataset.
-- Table: lab_results
SELECT result_value,
  test_name
FROM lab_results
WHERE test_name = "CRP"
ORDER BY result_value DESC
LIMIT 5;

-- -----------------------
-- LIMIT with a JOIN
-- -----------------------

-- Exercise 7
-- Show the 5 most recently enrolled patients along with their trial name.
-- Tables: patients, trials
-- Hint: JOIN trials, ORDER BY enrollment_date DESC, LIMIT 5

-- Exercise 8
-- Show the 3 longest visits along with the patient's trial name
-- and visit timepoint.
-- Tables: visits, patients, trials
-- Hint: JOIN patients and trials, ORDER BY duration_minutes DESC, LIMIT 3

-- Exercise 9
-- Show the single highest BNP result recorded, along with the
-- patient's age, trial name, and the visit timepoint it was taken at.
-- BNP is a cardiac stress marker — the highest value identifies
-- the most at-risk cardiac patient in the dataset.
-- Tables: lab_results, patients, trials, visits
-- Hint: WHERE test_name = 'BNP', JOIN all relevant tables,
--       ORDER BY result_value DESC, LIMIT 1

-- Exercise 10
-- Show the 5 earliest trials to start, along with their department name.
-- Tables: trials, departments
-- Hint: JOIN departments, ORDER BY start_date ASC, LIMIT 5
