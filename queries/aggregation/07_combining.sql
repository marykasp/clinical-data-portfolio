-- ============================================
-- Aggregation Practice: Combining Multiple Aggregate Functions
-- ============================================
-- You can use COUNT, SUM, AVG, MIN, and MAX together
-- in a single SELECT. Each one operates independently
-- on the same group.
--
-- This is where aggregation becomes genuinely useful
-- for clinical reporting — one query can answer several
-- questions about a group at once.
-- ============================================

-- Exercise 1
-- For each trial, show:
--   - total patients enrolled
--   - average patient age
--   - average patient weight (kg)
--   - earliest enrollment date
--   - most recent enrollment date
-- Table: patients
SELECT trial_id,
  COUNT(*) AS total_patients,
  AVG(age) AS average_patient_age,
  AVG(weight_kg) AS average_weight_kg,
  MIN(enrollment_date) AS earliest_enrollment,
  MAX(enrollment_date) AS recent_enrollment
FROM patients
GROUP BY trial_id;

-- Exercise 2
-- For each patient, show a visit summary:
--   - total number of visits
--   - total time spent on visits (minutes)
--   - average visit duration
--   - date of first visit
--   - date of most recent visit
-- Table: visits
SELECT patient_id,
  COUNT(*) AS total_visits,
  SUM(duration_minutes) AS total_minutes,
  AVG(duration_minutes) AS average_visit_length,
  MIN(visit_date) AS first_visit,
  MAX(visit_date) AS recent_visit
FROM visits
GROUP BY patient_id;

-- Exercise 3
-- For each lab test, show a result summary:
--   - how many results have been collected
--   - average result value
--   - lowest result value
--   - highest result value
-- Useful for spotting tests where values are
-- consistently above or below normal range.
-- Table: lab_results
SELECT test_name,
  COUNT(*) AS total_results,
  AVG(result_value) AS avg_value,
  MIN(result_value) AS lowest_value,
  MAX(result_value) AS highest_value
FROM lab_results
GROUP BY test_name;

-- Exercise 4
-- For each trial phase, show:
--   - number of trials
--   - total target enrollment across all trials in that phase
--   - average target enrollment per trial
--   - earliest trial start date
-- Table: trials
SELECT phase,
  COUNT(*) AS num_of_trials,
  SUM(target_enrollment) AS target_enrollment,
  AVG(target_enrollment) AS avg_target_enrollment,
  MIN(start_date) AS earliest_start_date
FROM trials
GROUP BY phase;

-- Exercise 5
-- For each department, show:
--   - number of trials
--   - total target enrollment
--   - average age of all enrolled patients across their trials
-- Tables: departments, trials, patients
-- SELECT department_name,
--   COUNT(DISTINCT trials.trial_id) AS num_trials,
--   SUM(DISTINCT trials.target_enrollment) AS total_target_enrollment,
--   AVG(patients.age) AS average_age
-- FROM patients
-- JOIN trials
--   ON patients.trial_id = trials.trial_id
-- JOIN departments
--   ON trials.department_id = departments.department_id
-- GROUP BY department_name;

--- TODO: use subquery to fix the SUM(target_enrollment) problem with above question
-- 
/*
The subquery aggregates trials on its own — before touching patients — so SUM(target_enrollment) counts each trial exactly once. The result is a temporary table called trial_summary with one row per department and the correct totals already locked in. When patients are joined afterward to calculate AVG(age), those pre-aggregated values can't be inflated anymore because they live in their own column rather than being recalculated mid-join
*/
--
SELECT 
  departments.department_name,
  trial_summary.num_trials,
  trial_summary.total_target_enrollment,
  AVG(patients.age) AS average_age
FROM departments
JOIN (
  -- subquery will run first on trials only
  -- produces one clean row per department before any patient rows
  SELECT
    department_id,
    COUNT(*) AS num_trials,
    SUM(target_enrollment) AS total_target_enrollment
  FROM trials
  GROUP BY department_id
) AS trial_summary ON departments.department_id = trial_summary.department_id
JOIN trials ON departments.department_id = trials.department_id
JOIN patients ON trials.trial_id = patients.trial_id
GROUP BY
  departments.department_id,
  trial_summary.num_trials,
  trial_summary.total_target_enrollment;

-- Exercise 6
-- For each enrollment status, show:
--   - number of patients
--   - average age
--   - average weight (kg)
--   - earliest and latest enrollment date
-- This gives a demographic snapshot of who completes,
-- withdraws, or fails screening.
-- Table: patients
SELECT status,
  COUNT(*) AS num_patients,
  AVG(age) AS average_age,
  AVG(weight_kg) AS average_weight,
  MIN(enrollment_date) AS earliest_date,
  MAX(enrollment_date) AS latest_date
FROM patients
GROUP BY status;

-- Exercise 7
-- For each visit timepoint, show:
--   - how many visits occurred
--   - average duration
--   - shortest duration
--   - longest duration
-- Flag any timepoint where the min duration seems
-- suspiciously short (possible data entry error).
-- Table: visits
SELECT visit_timepoint,
  COUNT(*) AS total_visits,
  AVG(duration_minutes) AS avg_duration,
  MIN(duration_minutes) AS shortest_visit_time,
  MAX(duration_minutes) AS longest_visit_time
FROM visits
GROUP BY visit_timepoint;
