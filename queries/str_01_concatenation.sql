-- ============================================
-- Practice: Concatenation
-- ============================================
-- Concatenation joins two or more text values
-- into a single string.
--
-- SQLite uses the || operator (not CONCAT):
--   'Label: ' || column
--   column_a || ' - ' || column_b
--
-- Common uses in clinical data:
--   - Building readable labels for reports
--   - Combining ID + status into one display field
--   - Formatting test results with their units
--
-- Pattern:
--   SELECT 'prefix ' || column || ' suffix' AS alias
--   FROM table
-- ============================================

-- -----------------------
-- Single Column Labels
-- -----------------------

-- Exercise 1
-- Add the label 'Trial: ' before each trial name
-- so the output reads e.g. 'Trial: CardioRisk Reduction Study'.
-- Table: trials
SELECT 'Trial: ' || trial_name
FROM trials;

-- Exercise 2
-- Add the label 'Department: ' before each department name.
-- Table: departments
SELECT 'Department: ' || department_name
FROM departments;

-- Exercise 3
-- Add the label 'Status: ' before each patient's status field.
-- Table: patients
SELECT 'Status: ' || status
FROM patients;

-- Exercise 4
-- Show each visit timepoint with the word 'Timepoint: ' in front.
-- Table: visits
SELECT 'Timepoint: ' || visit_timepoint
FROM visits;

-- -----------------------
-- Combining Two Columns
-- -----------------------

-- Exercise 5
-- Show each trial's name and phase combined into one column,
-- separated by ' | ', e.g. 'CardioRisk Reduction Study | Phase II'.
-- Table: trials

-- Exercise 6
-- Show each lab result as 'test_name (unit)',
-- e.g. 'WBC (K/uL)' or 'BNP (pg/mL)'.
-- Table: lab_results

-- Exercise 7
-- Show each patient as 'Patient 1001 - Active'
-- by combining the patient_id and status columns.
-- Note: patient_id is an integer — wrap it with CAST(patient_id AS TEXT)
-- or SQLite will concatenate it correctly using || directly.
-- Table: patients

-- -----------------------
-- Combining Three or More Columns
-- -----------------------

-- Exercise 8
-- Build a full lab result display string:
-- 'WBC: 5.2 K/uL' by combining test_name, result_value, and unit.
-- Table: lab_results

-- Exercise 9
-- Show each trial as 'Phase II | ONC-201 Immunotherapy Study (Dept 1)'
-- by combining phase, trial_name, and department_id.
-- Table: trials

-- Exercise 10
-- Show each visit as a single label:
-- 'Visit 1 | Patient 1001 | Baseline'
-- combining visit_id, patient_id, and visit_timepoint.
-- Table: visits

-- -----------------------
-- Concatenation with a JOIN
-- -----------------------

-- Exercise 11
-- Show each trial alongside its department, formatted as:
-- 'Oncology > ONC-201 Immunotherapy Study'
-- Tables: trials, departments

-- Exercise 12
-- For each lab result, show:
-- 'Patient 1001 | BNP: 210.0 pg/mL'
-- combining patient_id, test_name, result_value, and unit.
-- Table: lab_results

-- Exercise 13
-- Show each patient with their trial name in the format:
-- 'Patient 1001 enrolled in ONC-201 Immunotherapy Study (Active)'
-- combining patient_id, trial_name, and status.
-- Tables: patients, trials

-- -----------------------
-- Concatenation with Aggregation
-- -----------------------

-- Exercise 14
-- For each trial, show the trial name and total patient count as:
-- 'ONC-201 Immunotherapy Study: 9 patients'
-- Hint: COUNT() returns an integer — cast it using CAST(... AS TEXT)
-- or concatenate directly (SQLite handles the conversion).
-- Tables: trials, patients

-- Exercise 15
-- For each test name, show the test and its average result formatted as:
-- 'BNP avg: 209.3 pg/mL'
-- Hint: use ROUND(AVG(result_value), 1) for a clean number.
-- Table: lab_results
