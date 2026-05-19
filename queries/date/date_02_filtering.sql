-- ============================================
-- Practice: Filtering by Date
-- ============================================
-- Dates in SQLite are stored as text in ISO format:
-- YYYY-MM-DD (e.g. '2024-03-15').
-- Because this format is lexicographically sortable,
-- standard comparison operators work correctly:
--   >   >=   <   <=   =   BETWEEN
--
-- Pattern:
--   WHERE date_column >= '2024-01-01'
--   WHERE date_column BETWEEN '2024-01-01' AND '2024-06-30'
--   WHERE strftime('%Y', date_column) = '2024'
--
-- date('now') returns today's date as 'YYYY-MM-DD'.
-- Use it to write queries relative to the current date.
-- ============================================

-- -----------------------
-- Filtering by Exact Year or Month
-- -----------------------

-- Exercise 1
-- Show all patients who enrolled in 2024.
-- Table: patients
-- Hint: strftime('%Y', enrollment_date) = '2024'
SELECT patient_id AS patients_enrolled_2024
FROM patients
WHERE strftime('%Y', enrollment_date) = '2024';

-- Exercise 2
-- Show all visits that took place in 2023.
-- Table: visits
SELECT visit_id
FROM visits
WHERE strftime('%Y', visit_date) = '2023';

-- Exercise 3
-- Show all trials that started in 2022.
-- Table: trials
SELECT trial_name,
  trial_id
FROM trials
WHERE strftime('%Y', 2022);

-- Exercise 4
-- Show all visits that occurred in March (any year).
-- Useful for identifying seasonal visit patterns.
-- Table: visits
-- Hint: strftime('%m', visit_date) = '03'
SELECT visit_id
FROM visits
WHERE strftime('%m', visit_date) = '03';

-- Exercise 5
-- Show all patients who enrolled in the first quarter of any year
-- (January, February, or March).
-- Table: patients
-- Hint: strftime('%m', enrollment_date) IN ('01', '02', '03')
SELECT patient_id
FROM patients
WHERE strftime('%m', enrollment_date) IN ('01', '02', '03');

-- -----------------------
-- Filtering with Comparison Operators
-- -----------------------

-- Exercise 6
-- Show all patients who enrolled on or after 2024-06-01.
-- These are the most recently onboarded patients in the program.
-- Table: patients
SELECT patient_id AS patients_enrolled_after
FROM patients
WHERE enrollment_date >= '2024-06-01';

-- Exercise 7
-- Show all trials that started before 2023-01-01.
-- These are the longest-running trials in the program.
-- Table: trials
SELECT trial_name AS longest_running,
  trial_id
FROM trials
WHERE start_date < '2023-01-01';

-- Exercise 8
-- Show all visits that occurred between 2024-01-01 and 2024-06-30.
-- This covers the first half of 2024.
-- Table: visits
-- Hint: BETWEEN '2024-01-01' AND '2024-06-30'
SELECT visit_id
FROM visits
WHERE visit_date BETWEEN '2024-01-01' AND '2024-06-30';

-- Exercise 9
-- Show all patients who enrolled between 2023-07-01 and 2023-12-31
-- (the second half of 2023).
-- Table: patients
SELECT patient_id AS enrolled_second_half_2023
FROM patients
WHERE enrollment_date BETWEEN '2023-07-01' AND '2023-12-31';

-- -----------------------
-- Filtering Relative to Today
-- -----------------------
-- date('now') returns the current date.
-- date('now', '-90 days') returns 90 days ago.
-- Use these for rolling window filters.
-- ============================================

-- Exercise 10
-- Show all trials that have already started
-- (start_date is before or on today).
-- Table: trials
SELECT trial_id AS already_started
FROM trials
WHERE start_date <= date('now');

-- Exercise 11
-- Show all trials that have not started yet
-- (start_date is in the future).
-- Table: trials
SELECT trial_name AS trials_in_future
FROM trials
WHERE start_date > date('now');

-- Exercise 12
-- Show all patients who enrolled within the last 180 days.
-- In a real program these are patients in early treatment phases.
-- Table: patients
-- Hint: enrollment_date >= date('now', '-180 days')
SELECT patient_id
FROM patients
WHERE enrollment_date >= date('now', '-180 days');

-- Exercise 13
-- Show all visits that occurred in the last 90 days.
-- Table: visits
SELECT visit_id
FROM visits
WHERE visit_date >= date('now', '-90 days');

-- -----------------------
-- Date Filtering with a JOIN
-- -----------------------

-- Exercise 14
-- Show all patients who enrolled in 2024, alongside their trial name.
-- Tables: patients, trials
SELECT patients.patient_id,
  trial_name
FROM patients
JOIN trials
  ON patients.trial_id = trials.trial_id
WHERE strftime('%Y', enrollment_date) = '2024';

-- Exercise 15
-- Show all visits that occurred in the second half of 2023
-- (July through December), alongside the visit timepoint
-- and the name of the trial the patient is enrolled in.
-- Tables: visits, patients, trials
SELECT visit_id,
  visit_timepoint,
  trial_name
FROM visits
JOIN patients
  ON visits.patient_id = patients.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id
WHERE visit_date BETWEEN '2023-07-01' AND '2023-12-31';
