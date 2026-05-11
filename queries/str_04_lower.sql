-- ============================================
-- Practice: LOWER
-- ============================================
-- LOWER(column) converts all characters in a
-- text value to lowercase.
--
-- Common uses in clinical data:
--   - Normalizing values before comparison or export
--   - Case-insensitive filtering (mirror of UPPER)
--   - Preparing data for systems that expect lowercase
--   - Detecting duplicate entries that differ only in case
--
-- Pattern:
--   SELECT LOWER(column) AS column_lower
--   FROM table
--
-- Case-insensitive filter pattern:
--   WHERE LOWER(column) = 'active'
--   -- same effect as UPPER, just preference
--
-- SQLite note: LOWER() only handles ASCII characters.
-- ============================================

-- -----------------------
-- Basic LOWER
-- -----------------------

-- Exercise 1
-- Show all patient statuses in lowercase.
-- Table: patients
SELECT lower(status)
FROM patients;

-- Exercise 2
-- Show all trial phases in lowercase.
-- Useful to check that phase values are consistent before export.
-- Table: trials
SELECT lower(phase)
FROM trials;

-- Exercise 3
-- Show all test names in lowercase.
-- Table: lab_results
SELECT lower(test_name)
FROM lab_results;

-- Exercise 4
-- Show all department names in lowercase.
-- Table: departments
SELECT lower(department_name)
FROM departments;

-- -----------------------
-- LOWER in WHERE Clauses
-- -----------------------

-- Exercise 5
-- Find all patients with 'withdrawn' status,
-- using a case-insensitive LOWER filter.
-- Table: patients
SELECT patient_id
FROM patients
WHERE lower(status) = 'withdrawn';

-- Exercise 6
-- Find all trials in phase 'phase i' using LOWER,
-- regardless of how the phase text was originally entered.
-- Table: trials
SELECT trial_id
FROM trials
WHERE lower(phase) = 'phase 1';

-- Exercise 7
-- Find all lab results for the test 'crp' using a case-insensitive filter.
-- Table: lab_results
SELECT result_value
FROM lab_results
WHERE lower(test_name) = 'crp';

-- Exercise 8
-- Find all visits whose timepoint contains the word 'follow'
-- using a case-insensitive LOWER + LIKE.
-- These are post-treatment follow-up visits.
-- Table: visits
SELECT visit_id
FROM visits
WHERE lower(visit_timepoint) LIKE '%follow%';

-- -----------------------
-- LOWER with Concatenation
-- -----------------------

-- Exercise 9
-- Build a system-safe trial identifier by combining the trial_id
-- and a lowercased, space-replaced trial name:
-- e.g. '101_onc-201 immunotherapy study'
-- Hint: LOWER(trial_name) — SQLite does not have REPLACE() in scope here,
-- so just lowercase the name and combine with trial_id.
-- Table: trials
SELECT trial_id || ' ' || lower(trial_name)
FROM trials;

-- Exercise 10
-- Show each patient's record in a normalized format:
-- 'patient_id: 1001 | status: active'
-- with the status lowercased.
-- Table: patients
SELECT 'patient_id: ' || patient_id || ' | ' || 'status: ' || lower(status)
FROM patients;

-- -----------------------
-- LOWER with JOIN
-- -----------------------

-- Exercise 11
-- Show each trial name (in lowercase) alongside its department name (in lowercase).
-- Tables: trials, departments
SELECT lower(trial_name), lower(department_name)
FROM trials
JOIN departments
ON trials.department_id = departments.department_id;

-- Exercise 12
-- Show each lab result with test_name in lowercase,
-- the result value, unit in lowercase, and the visit timepoint.
-- Useful for preparing data for a case-sensitive downstream system.
-- Tables: lab_results, visits
SELECT result_value, 
  lower(test_name), 
  lower(unit), 
  visit_timepoint
FROM lab_results
JOIN visits
ON lab_results.visit_id = visits.visit_id;
-- -----------------------
-- LOWER with Aggregation
-- -----------------------

-- Exercise 13
-- Show the count of patients per status, with the status in lowercase.
-- Compare the output to str_03_upper.sql Exercise 13.
-- Table: patients

-- Exercise 14
-- For each phase (displayed in lowercase),
-- show the number of trials and the average target enrollment.
-- Table: trials

-- Exercise 15
-- For each test name (in lowercase),
-- show the minimum and maximum result value recorded.
-- Table: lab_results
