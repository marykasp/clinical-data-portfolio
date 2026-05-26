-- ============================================
-- Practice: COALESCE
-- ============================================
-- COALESCE(value1, value2, ...) returns the first
-- non-NULL value from its argument list.
--
-- If value1 is not NULL → return value1
-- If value1 IS NULL and value2 is not NULL → return value2
-- If all arguments are NULL → return NULL
--
-- Most common use: replace NULLs with a readable default
-- so reports display meaningful text instead of blank cells.
--
-- Pattern:
--   COALESCE(column, 'default text')
--   COALESCE(column_a, column_b, 'fallback')
--
-- Nullable columns in this database:
--   trials.end_date          — NULL = still active
--   trials.department_id     — NULL = unassigned
--   adverse_events.visit_id        — NULL = between visits
--   adverse_events.resolution_date — NULL = ongoing
-- ============================================

-- -----------------------
-- Basic COALESCE — replacing NULL with a label
-- -----------------------

-- Exercise 1
-- Show all trials with their end date.
-- Where end_date is NULL, display 'Still Active' instead.
-- Table: trials
-- Hint: COALESCE(end_date, 'Still Active')
SELECT trial_name,
  COALESCE(end_date, 'Still Active')
FROM trials;

-- Exercise 2
-- Show all adverse events with their resolution date.
-- Where resolution_date is NULL, display 'Ongoing' instead.
-- This gives a cleaner safety report than showing blank cells.
-- Table: adverse_events
SELECT ae_id,
  ae_term,
  COALESCE(resolution_date, 'Ongoing')
FROM adverse_events;

-- Exercise 3
-- Show all adverse events with the visit_id they were reported at.
-- Where visit_id is NULL, display 'Between Visits'.
-- Table: adverse_events
-- Hint: COALESCE(CAST(visit_id AS TEXT), 'Between Visits')
--       visit_id is an integer, so cast it to TEXT first
SELECT ae_id,
  ae_term,
  COALESCE(CAST(visit_id AS TEXT), 'Between Visits')
FROM adverse_events;

-- Exercise 4
-- Show all trials with their department_id.
-- Where department_id is NULL, display 'Unassigned'.
-- Table: trials
-- Hint: COALESCE(CAST(department_id AS TEXT), 'Unassigned')
SELECT trial_name,
  COALESCE(CAST(department_id AS TEXT), 'Unassigned')
FROM trials;

-- -----------------------
-- COALESCE with a JOIN — replacing NULL from unmatched rows
-- -----------------------

-- Exercise 5
-- Show all patients with their most recent visit date.
-- For patients who have never had a visit, display 'No visits yet'.
-- Tables: patients, visits
-- Hint: LEFT JOIN visits, then COALESCE(MAX(visit_date), 'No visits yet')

-- Exercise 6
-- Show all trials with their department name.
-- For the trial with no department assigned, display 'Unassigned'.
-- Tables: trials, departments
-- Hint: LEFT JOIN departments, COALESCE(department_name, 'Unassigned')

-- Exercise 7
-- Show all trials with their total patient count.
-- For trials with no patients enrolled, display 0 instead of NULL.
-- Tables: trials, patients
-- Hint: COALESCE(COUNT(patients.patient_id), 0)
--       Note: COUNT on a column already returns 0 for no matches —
--       this exercise shows when COALESCE is and isn't needed here.

-- -----------------------
-- COALESCE with multiple fallback values
-- -----------------------
-- COALESCE can chain more than two options:
-- COALESCE(first_choice, second_choice, 'final default')
-- ============================================

-- Exercise 8
-- Show each adverse event's timing as clearly as possible:
-- Use the visit_id if available, otherwise the onset_date,
-- otherwise display 'No timing recorded'.
-- Table: adverse_events
-- Hint: COALESCE(CAST(visit_id AS TEXT), CAST(onset_date AS TEXT), 'No timing recorded')

-- Exercise 9
-- For each trial, show its end_date if it has one,
-- otherwise show its start_date as a reference point,
-- labelled as the 'key_date'.
-- Table: trials
-- Hint: COALESCE(end_date, start_date) AS key_date

-- -----------------------
-- COALESCE in calculations
-- -----------------------
-- NULLs propagate through arithmetic — any calculation
-- involving NULL returns NULL. COALESCE prevents this
-- by substituting a safe default before the calculation runs.
-- ============================================

-- Exercise 10
-- For each patient, calculate how many days have passed
-- since their last visit, or since enrollment if they
-- have no visits yet.
-- Show patient_id, and the days since last activity.
-- Tables: patients, visits
-- Hint: julianday('now') - julianday(COALESCE(MAX(visit_date), enrollment_date))

-- Exercise 11
-- For each trial, calculate how long it has been running in days.
-- Use end_date if the trial has closed, otherwise use today.
-- Table: trials
-- Hint: julianday(COALESCE(end_date, date('now'))) - julianday(start_date)

-- -----------------------
-- COALESCE with Aggregation and GROUP BY
-- -----------------------

-- Exercise 12
-- For each department (including unassigned), show the number of trials.
-- Display 'Unassigned' where department_name is NULL.
-- Tables: trials, departments
-- Hint: LEFT JOIN departments, GROUP BY COALESCE(department_name, 'Unassigned')

-- Exercise 13
-- For each trial, show the trial name, total adverse events reported,
-- and the number of those that are still ongoing.
-- Replace NULL resolution counts with 0.
-- Tables: trials, patients, adverse_events
