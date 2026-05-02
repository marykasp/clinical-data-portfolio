-- ============================================
-- Aggregation Practice: Combining Multiple Aggregate Functions
-- ============================================
-- You can use multiple aggregate functions in one SELECT.
-- Each function collapses the group independently.
-- Common pattern: COUNT + MIN + MAX gives you
-- volume, start, and end of activity in one query.
-- ============================================

-- ============================================
-- Exercise 1
-- For each trial, show the total number of patients enrolled,
-- the date of first enrollment, and the date of most recent enrollment.
-- Tables: patients
-- ============================================
SELECT trial_name,
  MIN(enrollment_date) AS first_enrollment,
  MAX(enrollment_date) AS recent_enrollment,
  COUNT(*) AS total_patients
FROM patients
JOIN trials
  ON patients.trial_id = trials.trial_id
GROUP BY trial_name;


-- Exercise 2
-- For each patient, show their total number of visits,
-- their first visit date, and their most recent visit date.
-- Tables: visits
SELECT patient_id,
  COUNT(*) AS total_visits,
  MIN(visit_date) AS first_date,
  MAX(visit_date) AS recent_visit_date
FROM visits
GROUP BY patient_id;

-- Exercise 3
-- For each department, show how many trials they are running
-- and the date their earliest trial started.
-- Tables: trials
SELECT department_name,
  COUNT(*) AS total_trials,
  MIN(start_date) AS earliest_trial_start
FROM trials
JOIN departments
  ON trials.department_id = departments.department_id
GROUP BY department_name;

-- Exercise 4
-- For each trial phase, show the number of trials,
-- the number of distinct departments involved,
-- and the date of the earliest trial start.
-- Tables: trials
SELECT phase,
  COUNT(DISTINCT department_id) AS num_of_departments,
  MIN(start_date) AS earliest_trial_start,
  COUNT(*) AS num_of_trials
FROM trials
GROUP BY phase;

-- Exercise 5
-- For each enrollment status, show the count of patients
-- and the earliest and latest enrollment dates for that group.
-- Tables: patients
SELECT status,
  COUNT(*) AS total_patients,
  MIN(enrollment_date) AS earliest_enrollment_date,
  MAX(enrollment_date) AS recent_enrollment_date
FROM patients
GROUP BY status;

-- Exercise 6
-- For each visit timepoint, show how many times it has occurred
-- and the date range it spans (earliest to latest visit date).
-- Tables: visits
SELECT visit_timepoint,
  COUNT(*) AS num_visits,
  MIN(visit_date) AS earliest,
  MAX(visit_date) AS latest
FROM visits
GROUP BY visit_timepoint;

-- Exercise 7
-- Show a full patient visit summary: for each patient,
-- the total visits, first visit, last visit, and number of
-- distinct timepoints they have completed.
-- Tables: visits
SELECT patient_id,
  COUNT(*) AS total_visits,
  MIN(visit_date) AS first_visit,
  MAX(visit_date) AS last_visit,
  COUNT(DISTINCT visit_timepoint) AS num_timepoints
FROM visits
GROUP BY patient_id;
