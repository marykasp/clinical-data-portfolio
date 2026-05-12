-- ============================================
-- Practice: INITCAP
-- ============================================
-- INITCAP(column) capitalizes the first letter
-- of each word and lowercases the rest.
-- e.g. 'cardiology' → 'Cardiology'
--      'PHASE III'  → 'Phase Iii'
--      'phase iii'  → 'Phase Iii'
--
-- SQLite compatibility note:
-- INITCAP is NOT built into SQLite.
-- It is available natively in:
--   PostgreSQL  →  INITCAP(column)
--   Oracle      →  INITCAP(column)
--
-- In SQLite, a single-word approximation can be built with:
--   UPPER(SUBSTR(column, 1, 1)) || LOWER(SUBSTR(column, 2))
--   -- capitalizes the first character, lowercases the rest
--   -- only works correctly for single words or the first word
--
-- The exercises below are written as they would be used in
-- PostgreSQL, where INITCAP() is fully supported.
-- Exercises 12-14 show the SQLite workaround for single-word columns.
-- ============================================

-- -----------------------
-- Basic INITCAP
-- -----------------------

-- Exercise 1
-- Show all department names using INITCAP to ensure
-- consistent title-case formatting.
-- Table: departments
SELECT initcap(department_name)
FROM departments;

-- Exercise 2
-- Show all trial phases using INITCAP.
-- This corrects any all-caps or all-lowercase phase values
-- into a consistent display format (e.g. 'Phase Ii' → shown as-is).
-- Table: trials
SELECT initcap(phase)
FROM trials;

-- Exercise 3
-- Show all patient statuses using INITCAP.
-- Ensures 'ACTIVE', 'active', or 'Active' all display consistently.
-- Table: patients
SELECT initcap(status)
FROM patients;

-- Exercise 4
-- Show all test names using INITCAP.
-- Table: lab_results
SELECT initcap(test_name)
FROM lab_results;

-- -----------------------
-- INITCAP with Concatenation
-- -----------------------

-- Exercise 5
-- Show each trial formatted as 'Phase Ii | Oncology > Cardioric Reduction Study'
-- by applying INITCAP to both phase and trial_name.
-- Table: trials
SELECT initcap(phase) || ' | ' || initcap(trial_name)
FROM trials;

-- Exercise 6
-- Build a patient label in title case:
-- 'Patient 1001 — Active'
-- where the status is passed through INITCAP.
-- Table: patients
SELECT 'Patient ' || patient_id || ' - ' || initcap(status)
FROM patients;

-- Exercise 7
-- Show each lab result as:
-- 'Bnp: 210.0 Pg/Ml'
-- with INITCAP applied to test_name and unit.
-- Table: lab_results
SELECT initcap(test_name) || ': ' || result_value || ' ' || initcap(unit)
FROM lab_results;

-- -----------------------
-- INITCAP with JOIN
-- -----------------------

-- Exercise 8
-- Show each trial with its department name,
-- both formatted using INITCAP.
-- Tables: trials, departments
SELECT initcap(trial_name),
  initcap(department_name)
FROM trials
JOIN departements
ON trials.department_id = departments.department_id;

-- Exercise 9
-- Show each patient's status (INITCAP) and their trial name (INITCAP).
-- Tables: patients, trials
SELECT initcap(status),
  initcap(trial_name)
FROM patients
JOIN trials
ON patients.trial_id = trials.trial_id;

-- Exercise 10
-- Show each lab result with:
-- - test_name in INITCAP
-- - result_value
-- - unit in INITCAP
-- - visit_timepoint in INITCAP
-- Tables: lab_results, visits
SELECT initcap(test_name),
  result_value,
  initcap(unit),
  initcap(visit_timepoint)
FROM lab_results
JOIN visits
ON lab_results.visit_id = visits.visit_id;

-- -----------------------
-- INITCAP with Aggregation
-- -----------------------

-- Exercise 11
-- Show the count of patients per status,
-- with the status displayed using INITCAP.
-- Table: patients
SELECT COUNT(patient_id) AS num_patients,
  initcap(status)
FROM patients
GROUP BY initcap(status);

-- -----------------------
-- SQLite Workaround (single-word columns)
-- -----------------------
-- UPPER(SUBSTR(col, 1, 1)) || LOWER(SUBSTR(col, 2))
-- capitalizes the first letter of the entire value.
-- This only works cleanly for single-word values.
-- Multi-word values like 'phase iii' will produce 'Phase iii' (not 'Phase Iii').
-- ============================================

-- Exercise 12
-- Using the SQLite workaround, show each patient status
-- with its first letter capitalized and the rest lowercased.
-- Table: patients
-- Hint: UPPER(SUBSTR(status, 1, 1)) || LOWER(SUBSTR(status, 2))

-- Exercise 13
-- Using the SQLite workaround, show each test name
-- with first-letter capitalization.
-- Table: lab_results

-- Exercise 14
-- Using the SQLite workaround, show each department name
-- with first-letter capitalization.
-- Compare the result to Exercise 1 — note where multi-word values
-- are not fully title-cased by the workaround.
-- Table: departments
