-- ============================================
-- Practice: RIGHT JOIN
-- ============================================
-- RIGHT JOIN is the mirror of LEFT JOIN.
-- It returns ALL rows from the right table,
-- plus matching rows from the left table.
-- Where there is no match, the left table columns
-- return NULL.
--
-- Pattern:
--   SELECT columns
--   FROM table_a
--   RIGHT JOIN table_b ON table_a.id = table_b.id
--   -- all rows from table_b are returned
--   -- unmatched rows show NULLs for table_a columns
--
-- Visual:
--   LEFT    RIGHT
--         [  B] ← returns all of B
--   [A ∩ B]    ← plus matched rows from A
--
-- SQLite note: RIGHT JOIN is supported from
-- version 3.39.0 (July 2022). If you get a syntax
-- error, check your SQLite version with:
--   SELECT sqlite_version();
-- Any RIGHT JOIN can be rewritten as a LEFT JOIN
-- by swapping the table order:
--   FROM a RIGHT JOIN b  =  FROM b LEFT JOIN a
-- ============================================

-- -----------------------
-- Basic RIGHT JOIN
-- -----------------------

-- Exercise 1
-- Show all trials and any patients enrolled in them,
-- including trials with no patients yet.
-- Written as a RIGHT JOIN from the patients side.
-- Tables: patients, trials
SELECT trials.trial_name,
  patients.patient_id
FROM patients
RIGHT JOIN trials
  ON patients.trial_id = trials.trial_id;


-- Exercise 2
-- Show all patients and any visits they have attended,
-- written as a RIGHT JOIN so all patients appear
-- even if they have no visits on record.
-- Tables: visits, patients
SELECT patients.patient_id,
  visits.visit_date
FROM visits
RIGHT JOIN patients
  ON visits.patient_id = patients.patient_id;

-- Exercise 3
-- Show all visits and any lab results recorded at each visit,
-- written as a RIGHT JOIN so all visits appear
-- even if no labs were collected.
-- Tables: lab_results, visits
SELECT visits.visit_id,
  visits.visit_date,
  lab_results.result_value,
  lab_results.test_name
FROM lab_results
RIGHT JOIN visits
  ON lab_results.visit_id = visits.visit_id;


-- Exercise 4
-- Show all departments and any trials they are running,
-- written as a RIGHT JOIN from the trials side.
-- Tables: trials, departments
SELECT departments.department_name,
  trials.trial_name
FROM trials
RIGHT JOIN departments
  ON trials.department_id = departments.department_id;

-- -----------------------
-- Rewriting RIGHT JOIN as LEFT JOIN
-- -----------------------
-- In practice, most developers default to LEFT JOIN
-- and swap table order rather than writing RIGHT JOIN.
-- The exercises below ask you to write both versions
-- to make the equivalence clear.
-- ============================================

-- Exercise 5
-- Write a query that shows all trials with their enrolled patients.
-- Write it first as a RIGHT JOIN (patients RIGHT JOIN trials),
-- then rewrite it as a LEFT JOIN that returns the same result.
-- Tables: patients, trials
SELECT trials.trial_name,
  patients.patient_id
FROM patients
RIGHT JOIN trials
  ON trials.trial_id = patients.trial_id;

SELECT trials.trial_name,
  patients.patient_id
FROM patients
LEFT JOIN trials
  ON trials.trial_id = patients.trial_id;

-- Exercise 6
-- Write a query that shows all patients with their visit dates.
-- Write it first as a RIGHT JOIN (visits RIGHT JOIN patients),
-- then rewrite it as a LEFT JOIN that returns the same result.
-- Tables: visits, patients

-- -----------------------
-- RIGHT JOIN to find missing data
-- -----------------------

-- Exercise 7
-- Which trials have no patients enrolled?
-- Written as a RIGHT JOIN so all trials are preserved,
-- then filter for NULLs on the patients side.
-- Tables: patients, trials
-- Hint: FROM patients RIGHT JOIN trials ON patients.trial_id = trials.trial_id
--       WHERE patients.patient_id IS NULL
SELECT trials.trial_name
FROM patients
RIGHT JOIN trials
  ON patients.trial_id = trials.trial_id
WHERE patients.patient_id IS NULL;

-- Exercise 8
-- Which patients have no visits recorded?
-- Written as a RIGHT JOIN so all patients are preserved,
-- then filter for NULLs on the visits side.
-- Tables: visits, patients
-- Hint: FROM visits RIGHT JOIN patients ON visits.patient_id = patients.patient_id
--       WHERE visits.visit_id IS NULL
--       Compare to join_02_left_join.sql Exercise 9 — same result.
SELECT patients.patient_id AS patients_with_no_visits
FROM visits
RIGHT JOIN patients
  ON visits.patient_id = patients.patient_id
WHERE visits.patient_id IS NULL;
