-- ============================================
-- Practice: UPPER
-- ============================================
-- UPPER(column) converts all characters in a
-- text value to uppercase.
--
-- Common uses in clinical data:
--   - Standardizing output for reports
--   - Case-insensitive comparisons in WHERE clauses
--   - Combining with other string functions
--
-- Pattern:
--   SELECT UPPER(column) AS column_upper
--   FROM table
--
-- Case-insensitive filter pattern:
--   WHERE UPPER(column) = 'ACTIVE'
--   -- matches 'Active', 'active', 'ACTIVE', etc.
--
-- SQLite note: UPPER() only handles ASCII characters.
-- Non-ASCII letters (accented characters) are not uppercased.
-- ============================================

-- -----------------------
-- Basic UPPER
-- -----------------------

-- Exercise 1
-- Show all department names in uppercase.
-- Table: departments
SELECT upper(department_name)
FROM departments;

-- Exercise 2
-- Show all trial names in uppercase.
-- Table: trials
SELECT upper(trial_name)
FROM trials;

-- Exercise 3
-- Show all patient statuses in uppercase.
-- Useful for confirming all status values are standardized.
-- Table: patients
SELECT upper(status)
FROM patients;

-- Exercise 4
-- Show all visit timepoints in uppercase.
-- Table: visits
SELECT upper(visit_timepoint)
FROM visits;

-- Exercise 5
-- Show all test names from lab_results in uppercase.
-- Table: lab_results
SELECT upper(test_name)
FROM lab_results;

-- -----------------------
-- UPPER in WHERE Clauses
-- -----------------------
-- Using UPPER in a filter makes the comparison case-insensitive,
-- protecting against inconsistently entered data.
-- ============================================

-- Exercise 6
-- Find all patients whose status is 'active',
-- written in a case-insensitive way using UPPER.
-- Table: patients
-- Hint: WHERE UPPER(status) = 'ACTIVE'
SELECT patient_id
FROM patients
WHERE upper(status) = 'ACTIVE';

-- Exercise 7
-- Find all visits where the timepoint contains the word 'BASELINE'
-- using a case-insensitive LIKE filter.
-- Table: visits
-- Hint: WHERE UPPER(visit_timepoint) LIKE '%BASELINE%'
SELECT visit_id
FROM visits
WHERE upper(visit_timepoint) LIKE '%BASELINE';

-- Exercise 8
-- Find all lab results for the test 'bnp' (entered in any case)
-- using a case-insensitive filter.
-- Table: lab_results
SELECT result_value
FROM lab_results
WHERE upper(test_name) = 'BNP';

-- -----------------------
-- UPPER with Concatenation
-- -----------------------

-- Exercise 9
-- Show each trial as 'PHASE II | CardioRisk Reduction Study'
-- with the phase in uppercase and the trial name in its original case.
-- Table: trials
SELECT upper(phase) || ' | ' || trial_name
FROM trials;

-- Exercise 10
-- Show each patient status and patient_id formatted as:
-- 'ACTIVE — Patient 1001'
-- with the status uppercased.
-- Table: patients
SELECT upper(status) || ' - ' || 'Patient ' || patient_id
FROM patients;
-- -----------------------
-- UPPER with JOIN
-- -----------------------

-- Exercise 11
-- Show each trial with its department name in uppercase.
-- The report consumer wants departments to stand out visually.
-- Tables: trials, departments
SELECT trial_name,
  upper(department_name)
FROM trials
JOIN departments
  ON trials.department_id = departments.department_id;

-- Exercise 12
-- Show each lab result with:
-- - test_name in uppercase
-- - result_value
-- - unit
-- - the visit timepoint in its original case
-- Tables: lab_results, visits
SELECT upper(test_name),
  result_value,
  unit,
  visit_timepoint
FROM lab_results
JOIN visits
  ON lab_results.visit_id = visits.visit_id;

-- -----------------------
-- UPPER with Aggregation
-- -----------------------

-- Exercise 13
-- Show the count of patients per status,
-- with the status displayed in uppercase.
-- Table: patients
SELECT upper(status),
  COUNT(*) AS num_of_patients
FROM patients
GROUP BY status;

-- Exercise 14
-- For each test name (displayed in uppercase),
-- show the average result value rounded to one decimal.
-- Table: lab_results
SELECT upper(test_name),
  ROUND(AVG(result_value), 1) AS average_result
FROM lab_results
GROUP BY test_name;
