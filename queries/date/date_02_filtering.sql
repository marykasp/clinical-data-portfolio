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

-- Exercise 7
-- Show all trials that started before 2023-01-01.
-- These are the longest-running trials in the program.
-- Table: trials

-- Exercise 8
-- Show all visits that occurred between 2024-01-01 and 2024-06-30.
-- This covers the first half of 2024.
-- Table: visits
-- Hint: BETWEEN '2024-01-01' AND '2024-06-30'

-- Exercise 9
-- Show all patients who enrolled between 2023-07-01 and 2023-12-31
-- (the second half of 2023).
-- Table: patients

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

-- Exercise 11
-- Show all trials that have not started yet
-- (start_date is in the future).
-- Table: trials

-- Exercise 12
-- Show all patients who enrolled within the last 180 days.
-- In a real program these are patients in early treatment phases.
-- Table: patients
-- Hint: enrollment_date >= date('now', '-180 days')

-- Exercise 13
-- Show all visits that occurred in the last 90 days.
-- Table: visits

-- -----------------------
-- Date Filtering with a JOIN
-- -----------------------

-- Exercise 14
-- Show all patients who enrolled in 2024, alongside their trial name.
-- Tables: patients, trials

-- Exercise 15
-- Show all visits that occurred in the second half of 2023
-- (July through December), alongside the visit timepoint
-- and the name of the trial the patient is enrolled in.
-- Tables: visits, patients, trials
