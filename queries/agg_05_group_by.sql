-- ============================================
-- Aggregation Practice: GROUP BY
-- ============================================
-- GROUP BY collapses rows that share the same value
-- into one row per group so aggregate functions can
-- be applied to each group separately.
--
-- Key rule: every column in SELECT must either be
-- inside an aggregate function OR appear in GROUP BY.
-- ============================================

-- Exercise 1
-- How many patients are enrolled in each trial?
-- Table: patients
SELECT trial_name,
  COUNT(*) AS total_patients
FROM patients
JOIN trials
  ON patients.trial_id = trials.trial_id
GROUP BY trial_name;

-- Exercise 2
-- How many patients have each enrollment status?
-- Table: patients
SELECT status,
  COUNT(*) AS total_patients
FROM patients
GROUP BY status;

-- Exercise 3
-- How many trials are in each phase?
-- Table: trials
SELECT phase,
  COUNT(*) AS total_trials
FROM trials
GROUP BY phase;

-- Exercise 4
-- How many visits have occurred at each timepoint?
-- Table: visits
SELECT visit_timepoint,
  COUNT(*) AS total_visits
FROM visits
GROUP BY visit_timepoint;

-- Exercise 5
-- How many lab results have been collected per test name?
-- Table: lab_results
SELECT test_name,
  COUNT(*) AS lab_results
FROM lab_results
GROUP BY test_name;

-- Exercise 6
-- How many patients were enrolled each month across the program?
-- Table: patients
SELECT strftime('%Y-%m', enrollment_date) AS enrollment_month,
  COUNT(*) AS num_of_patients
FROM patients
GROUP BY enrollment_month;

-- Exercise 7
-- What is the total visit time in minutes logged per patient?
-- Table: visits
SELECT patient_id,
  SUM(duration_minutes) AS total_vist_minutes 
FROM visits
GROUP BY patient_id;

-- Exercise 8
-- How many trials does each department run, and what is their
-- combined target enrollment?
-- Table: trials
SELECT department_name,
  COUNT(*) AS total_num_trials,
  SUM(target_enrollment) AS total_target_enrollment
FROM trials
JOIN departments
  ON trials.department_id = departments.department_id
GROUP BY department_name;
