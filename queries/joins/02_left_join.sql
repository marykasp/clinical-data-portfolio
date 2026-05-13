-- ============================================
-- Practice: LEFT JOIN
-- ============================================
-- LEFT JOIN returns ALL rows from the left table,
-- plus matching rows from the right table.
-- Where there is no match, the right table columns
-- return NULL.
--
-- Use it when you want to keep rows from the left
-- table even if they have no related data on the right.
-- INNER JOIN would silently drop those rows.
--
-- Pattern:
--   SELECT columns
--   FROM table_a
--   LEFT JOIN table_b ON table_a.id = table_b.id
--   -- rows from table_a with no match in table_b
--   -- still appear, with NULLs for table_b columns
--
-- Visual:
--   LEFT    RIGHT
--   [A  ] ← returns all of A
--   [A ∩ B] ← plus matched rows from B
-- ============================================

-- -----------------------
-- Basic LEFT JOIN
-- -----------------------

-- Exercise 1
-- Show all patients and their visits, including patients
-- who have not yet attended any visits.
-- In a real trial this flags enrolled patients who are
-- overdue for their first appointment.
-- Tables: patients, visits
SELECT patients.patient_id,
  patients.status,
  visits.visit_date,
  visits.visit_timepoint
FROM patients
LEFT JOIN visits
  ON patients.patient_id = visits.patient_id;

-- Exercise 2
-- Show all patients and any lab results they have had collected,
-- including patients with no lab results on record.
-- Patients with no labs may have been missed during a visit
-- or are still awaiting results.
-- Tables: patients, lab_results
SELECT patients.patient_id,
  lab_results.result_value,
  lab_results.test_name,
  lab_results.unit
FROM patients
LEFT JOIN lab_results
  ON patients.patient_id = lab_results.patient_id
ORDER BY lab_results.test_name IS NULL, patients.patient_id;

-- Exercise 3
-- Show all visits and any lab results recorded at that visit,
-- including visits where no labs were drawn.
-- Tables: visits, lab_results
SELECT visits.visit_id,
  visits.visit_date,
  visits.visit_timepoint,
  lab_results.result_value,
  lab_results.test_name
FROM visits
LEFT JOIN lab_results
  ON visits.visit_id = lab_results.visit_id;

-- Exercise 4
-- Show all trials and any patients enrolled in them,
-- including trials that currently have zero patients.
-- Tables: trials, patients
SELECT trials.trial_name,
  patients.patient_id
FROM trials
LEFT JOIN patients
  ON trials.trial_id = patients.trial_id;

-- Exercise 5
-- Show all departments and any trials they are running,
-- including departments with no trials assigned.
-- Tables: departments, trials
SELECT departments.department_name,
  trials.trial_name
FROM departments
LEFT JOIN trials
  ON departments.department_id = trials.department_id;

-- -----------------------
-- LEFT JOIN with aggregation
-- -----------------------
-- COUNT(right_table.id) is the key technique here.
-- Because NULLs are not counted, unmatched left rows
-- correctly return 0 rather than being excluded.
-- COUNT(*) would return 1 for unmatched rows — wrong.
-- ============================================

-- Exercise 6
-- Show all trials with the number of patients enrolled in each,
-- including trials that currently have zero patients.
-- Tables: trials, patients
-- use COUNT(column) - counts only NON-NULL values, returns 0 if patient_id is NULL
-- COUNT(*) counts the row itself returns 1 even if there is no patient
SELECT trials.trial_name,
  COUNT(patients.patient_id) AS patients_enrolled
FROM trials
LEFT JOIN patients
  ON trials.trial_id = patients.trial_id
GROUP BY trials.trial_name;

-- Exercise 7
-- Show all departments with the number of trials each is running,
-- including any departments that have no trials.
-- Tables: departments, trials
SELECT departments.department_name,
  COUNT(trials.trial_id) AS num_of_trials
FROM departments
LEFT JOIN trials
  ON departments.department_id = trials.department_id
GROUP BY departments.department_name;

-- Exercise 8
-- Show all patients with the total number of visits they have attended,
-- including patients who have had zero visits.
-- Tables: patients, visits
SELECT patients.patient_id,
  COUNT(visits.visit_id) AS total_visits
FROM patients
LEFT JOIN visits
  ON patients.patient_id = visits.visit_id
GROUP BY patients.patient_id;

-- -----------------------
-- LEFT JOIN to find missing data
-- -----------------------
-- The most clinically useful LEFT JOIN pattern:
-- LEFT JOIN + WHERE right_table.id IS NULL
-- returns only rows from the left table with NO match
-- in the right table — i.e. the data gaps.
-- ============================================

-- Exercise 9
-- Which patients have no visits recorded at all?
-- For Active patients this should never be true —
-- any result here is a data quality flag worth investigating.
-- Tables: patients, visits
SELECT patients.patient_id AS patients_with_no_visits,
  patients.status,
  patients.enrollment_date
FROM patients
LEFT JOIN visits
  ON patients.patient_id = visits.patient_id
WHERE visits.patient_id IS NULL;

-- Exercise 10
-- Which visits have no lab results recorded?
-- Visits that require a blood draw per protocol but show no
-- lab results may indicate a missed or incomplete procedure.
-- Tables: visits, lab_results
SELECT visits.visit_id,
  visits.visit_date
FROM visits
LEFT JOIN lab_results
  ON visits.visit_id = lab_results.visit_id
WHERE lab_results.visit_id IS NULL;

-- Exercise 11
-- Which trials currently have no patients enrolled?
-- A trial with zero enrollment may have just opened,
-- or may signal a recruitment problem that needs attention.
-- Tables: trials, patients
SELECT trials.trial_name,
  trials.phase
FROM trials
LEFT JOIN patients
  ON trials.trial_id = patients.trial_id
WHERE patients.patient_id IS NULL;
