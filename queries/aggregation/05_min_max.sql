-- ============================================
-- Aggregation Practice: MIN and MAX
-- ============================================
-- MIN() returns the smallest value in a group.
-- MAX() returns the largest value in a group.
-- Works on numbers, dates, and text (alphabetical order for text).
-- ============================================

-- Exercise 1
-- What are the youngest and oldest patient ages in the program?
-- Table: patients
SELECT MIN(age) as youngest,
  MAX(age) AS oldest
FROM patients;

-- Exercise 2
-- What is the youngest and oldest patient age per trial?
-- Table: patients
SELECT trial_id,
  MIN(age) AS youngest,
  MAX(age) AS oldest
FROM patients
GROUP BY trial_id;

-- Exercise 3
-- What are the lightest and heaviest patient weights (kg) enrolled per trial?
-- Table: patients
SELECT trial_id,
  MIN(weight_kg) AS lightest_patient,
  MAX(weight_kg) AS heviest_patient
FROM patients
GROUP BY trial_id;

-- Exercise 4
-- What is the shortest and longest visit duration recorded across the program?
-- Table: visits
SELECT MIN(duration_minutes) AS shortest_visit,
  MAX(duration_minutes) AS longest_vist
FROM visits;

-- Exercise 5
-- What is the shortest and longest visit duration per timepoint?
-- Helps flag unexpectedly brief or extended visits that may need review.
-- Table: visits
SELECT visit_timepoint,
  MIN(duration_minutes) AS shortest_visit,
  MAX(duration_minutes) AS longest_visit
FROM visits
GROUP BY visit_timepoint;

-- Exercise 6
-- What is the lowest and highest recorded result value for BNP?
-- BNP is a cardiac stress marker — a high max signals a severe patient.
-- Table: lab_results
SELECT MIN(result_value) AS lowest_bnp,
  MAX(result_value) AS highest_bnp
FROM lab_results
WHERE test_name = "BNP";

-- Exercise 7
-- What is the lowest and highest result value recorded per test name?
-- Table: lab_results
SELECT test_name,
  MIN(result_value) AS lowest,
  MAX(result_value) AS highest
FROM lab_results
GROUP BY test_name;

-- Exercise 8
-- What is the earliest and latest trial start date per department?
-- Table: trials
SELECT department_name,
  MIN(start_date) AS earliest,
  MAX(start_date) AS latest
FROM trials
JOIN departments
  ON trials.department_id = departments.department_id
GROUP BY department_name;

-- Exercise 9
-- Which trial has the highest target enrollment?
-- Table: trials
SELECT trial_name,
  MAX(target_enrollment) AS highest_target_enrollment
FROM trials
GROUP BY trial_name;
