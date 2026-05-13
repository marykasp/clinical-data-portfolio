-- ============================================
-- Practice: JOINs
-- ============================================
-- JOIN connects rows from two tables using a
-- shared column (the foreign key relationship).
-- INNER JOIN (default) returns only rows where
-- a match exists in both tables.
--
-- Pattern:
--   SELECT columns
--   FROM table_a
--   JOIN table_b ON table_a.shared_id = table_b.shared_id
--
-- Foreign key map in this database:
--   trials.department_id    → departments.department_id
--   patients.trial_id       → trials.trial_id
--   visits.patient_id       → patients.patient_id
--   lab_results.patient_id  → patients.patient_id
--   lab_results.visit_id    → visits.visit_id
-- ============================================

-- -----------------------
-- 2-Table Joins
-- -----------------------

-- Exercise 1
-- Show each patient alongside the name of the trial they are enrolled in.
-- Without a JOIN, you only see trial_id — the name lives in trials.
-- Tables: patients, trials
SELECT patient_id,
  trials.trial_name
FROM patients
JOIN trials
  ON patients.trial_id = trials.trial_id;

-- Exercise 2
-- Show each trial alongside its department name.
-- Tables: trials, departments
SELECT trial_name,
  department_name
FROM trials
JOIN departments
  ON trials.department_id = departments.department_id;

-- Exercise 3
-- Show every visit alongside the enrollment status of the patient who attended.
-- Useful for filtering out Screen Failure visits from analysis.
-- Tables: visits, patients
SELECT visit_id,
  patients.status AS enrollment_status
FROM visits
JOIN patients
  ON visits.patient_id = patients.patient_id;

-- Exercise 4
-- Show each lab result alongside the patient's age and weight_kg.
-- add in test name, and units to better understand the lab result value displayed
-- Tables: lab_results, patients
SELECT result_value,
  lab_results.test_name,
  lab_results.unit,
  patients.age AS patient_age,
  patients.weight_kg AS patient_weight
FROM lab_results
JOIN patients
  ON lab_results.patient_id = patients.patient_id;


-- Exercise 5
-- Show each lab result alongside the visit timepoint it was collected at.
-- Tables: lab_results, visits
SELECT result_value,
  lab_results.test_name,
  visits.visit_timepoint
FROM lab_results
JOIN visits
  ON lab_results.visit_id = visits.visit_id;

-- -----------------------
-- 3-Table Joins
-- -----------------------

-- Exercise 6
-- Show each patient with their trial name and the department running it.
-- Tables: patients, trials, departments
SELECT patients.patient_id AS patient,
  trials.trial_name,
  departments.department_name
FROM patients
JOIN trials
  ON patients.trial_id = trials.trial_id
JOIN departments
  ON departments.department_id = trials.department_id;

-- Exercise 7
-- Show each visit alongside the patient's age and the name of their trial.
-- Coordinators use this to check whether visit activity aligns with
-- expected patient demographics per study.
-- Tables: visits, patients, trials
SELECT visit_timepoint,
  patients.age AS patients_age,
  trials.trial_name
FROM visits
JOIN patients
  ON patients.patient_id = visits.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id;

-- Exercise 8
-- Show each lab result with the test name, result value, the visit
-- timepoint it was collected at, and the patient's enrollment status.
-- Tables: lab_results, visits, patients
SELECT result_value,
  lab_results.test_name,
  visits.visit_timepoint,
  patients.status AS enrollment_status
FROM lab_results
JOIN visits
  ON lab_results.visit_id = visits.visit_id
JOIN patients
  ON visits.patient_id = patients.patient_id;

-- -----------------------
-- 4-Table Joins
-- -----------------------

-- Exercise 9
-- Show each lab result with: test name, result value, unit,
-- visit timepoint, patient status, and the trial name.
-- This is the kind of combined view a clinical data manager would
-- use to audit lab data in context.
-- Tables: lab_results, visits, patients, trials
SELECT lab_results.result_value,
  lab_results.test_name,
  lab_results.unit,
  visits.visit_timepoint,
  patients.status,
  trials.trial_name
FROM lab_results
JOIN visits
  ON lab_results.visit_id = visits.visit_id
JOIN patients
  ON visits.patient_id = patients.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id;

-- Exercise 10
-- Show each lab result with: test name, result value, visit timepoint,
-- patient age, trial name, and department name.
-- Tables: lab_results, visits, patients, trials, departments
SELECT 
  lab_results.test_name,
  lab_results.result_value,
  visits.visit_timepoint,
  patients.age,
  trials.trial_name,
  departments.department_name
FROM lab_results
JOIN visits
  ON lab_results.visit_id = visits.visit_id
JOIN patients
  ON visits.patient_id = patients.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id
JOIN departments
  ON trials.department_id = departments.department_id;
