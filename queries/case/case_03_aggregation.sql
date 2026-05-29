-- ============================================
-- Practice: CASE WHEN Inside Aggregate Functions
-- ============================================
-- Wrapping CASE WHEN inside COUNT or SUM lets you
-- aggregate selectively — counting or summing only
-- the rows that meet a condition, while keeping all
-- groups in a single query.
--
-- Two common patterns:
--
-- 1. Conditional COUNT:
--    COUNT(CASE WHEN condition THEN 1 END)
--    → counts rows where condition is true
--    → NULL (unmatched) rows are ignored by COUNT
--    → returns 0 for groups with no matches
--
-- 2. Conditional SUM:
--    SUM(CASE WHEN condition THEN value ELSE 0 END)
--    → sums a value only for rows meeting the condition
--    → ELSE 0 ensures other rows contribute 0, not NULL
--
-- Why not use WHERE instead?
--   WHERE filters out rows before grouping.
--   CASE inside an aggregate keeps all groups visible —
--   a trial with zero active patients still appears
--   with a count of 0, rather than being dropped.
-- ============================================

-- -----------------------
-- Conditional COUNT
-- -----------------------

-- Exercise 1
-- For each trial, show how many patients fall into each status:
--   active_count, completed_count, withdrawn_count, screen_failure_count
-- All four counts should appear as separate columns in one row per trial.
-- Tables: patients, trials
-- Hint: COUNT(CASE WHEN status = 'Active' THEN 1 END) AS active_count
SELECT trial_name,
  COUNT(CASE WHEN p.status = 'Active' THEN 1 END) AS active_count,
  COUNT(CASE WHEN p.status = 'Completed' THEN 1 END) AS completed_count,
  COUNT(CASE WHEN p.status = 'Withdrawn' THEN 1 END) AS withdrawn_count,
  COUNT(CASE WHEN p.status = 'Screen Failure' THEN 1 END) AS screen_failure_cont
FROM patients AS p
JOIN trials
  ON p.trial_id = trials.trial_id
GROUP BY trial_name;

-- Exercise 2
-- For each trial, show the total number of adverse events
-- and break them out by serious vs non-serious in the same row.
-- Tables: adverse_events, patients, trials
SELECT trial_name,
  COUNT(ae_id) AS total_adverse_events,
  COUNT(CASE WHEN serious = 1 THEN 1 END) AS serious_count,
  COUNT(CASE WHEN serious = 0 THEN 1 END) AS non_serious_count
FROM adverse_events
JOIN patients
  ON adverse_events.patient_id = patients.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id
GROUP BY trial_name;

-- Exercise 3
-- For each trial, count how many patients are in a Treatment arm
-- vs a Placebo arm vs an Active Comparator arm.
-- Tables: patients, trial_arms, trials
SELECT trial_name,
  COUNT(CASE WHEN arm_name = 'Treatment' THEN 1 END) AS treatment_count,
  COUNT(CASE WHEN arm_name = 'Placebo' THEN 1 END) AS placebo_count,
  COUNT(CASE WHEN arm_name = 'Activve Comparator' THEN 1 END) AS active_comparator_count
FROM patients
JOIN trial_arms
  ON patients.arm_id = trial_arms.arm_id
JOIN trials
  ON trial_arms.trial_id = trials.trial_id
GROUP BY trial_name;
  

-- Exercise 4
-- For each trial, count how many lab results are flagged
-- Normal, Low, High, and Critical — all in one row per trial.
-- Tables: lab_results, patients, trials
SELECT trial_name,
  COUNT(CASE WHEN flag = 'Normal' THEN 1 END) AS normal_count,
  COUNT(CASE WHEN flag = 'Low' THEN 1 END) AS low_count,
  COUNT(CASE WHEN flag = 'High' THEN 1 END) AS high_count,
  COUNT(CASE WHEN flag = 'Critical' THEN 1 END) AS critical_count
FROM lab_results
JOIN patients
  ON lab_results.patient_id = patients.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id
GROUP BY trial_name;

-- Exercise 5
-- For each department, count how many trials are Enrolling
-- vs Completed vs Not Yet Open.
-- Tables: trials, departments
SELECT department_name,
  COUNT(CASE WHEN status = 'Enrolling' THEN 1 END) AS enrolling_count,
  COUNT(CASE WHEN status = 'Completed' THEN 1 END) AS completed_count,
  COUNT(CASE WHEN status = 'Not Yet Open' THEN 1 END) AS not_yet_open_count
FROM trials
JOIN departments
  ON trials.department_id = departments.department_id
GROUP BY department_name;

-- -----------------------
-- Conditional SUM
-- -----------------------

-- Exercise 6
-- For each patient, show total visit time split into two columns:
--   - minutes spent at Baseline visits
--   - minutes spent at all other visits
-- Table: visits
-- Hint: SUM(CASE WHEN visit_timepoint = 'Baseline' THEN duration_minutes ELSE 0 END)
SELECT patient_id,
  SUM(CASE WHEN visit_timepoint = 'Baseline' THEN duration_minutes ELSE 0 END) AS visit_time_baseline,
  SUM(CASE WHEN visit_timepoint != 'Baseline' THEN duration_minutes ELSE 0 END) AS other_visit_time
FROM visits
GROUP BY patient_id;

-- Exercise 7
-- For each trial, show the total visit duration (minutes) split by
-- visits that are treatment visits (Cycle Day 1, Day 8, Day 28, Week 2, etc.)
-- vs all other visit types.
-- Use LIKE to catch the variety of treatment timepoint names.
-- Tables: visits, patients, trials

-- Exercise 8
-- For each trial, show the sum of lab result values for High-flagged
-- results vs Normal-flagged results.
-- This gives a rough picture of how far above normal patients' values are.
-- Tables: lab_results, patients, trials

-- -----------------------
-- Conditional COUNT with HAVING
-- -----------------------

-- Exercise 9
-- Which trials have more than 2 active patients?
-- Use conditional COUNT inside HAVING.
-- Tables: patients, trials
-- Hint: HAVING COUNT(CASE WHEN status = 'Active' THEN 1 END) > 2

-- Exercise 10
-- Which trials have at least one unresolved adverse event?
-- Tables: adverse_events, patients, trials
-- Hint: HAVING COUNT(CASE WHEN resolution_date IS NULL THEN 1 END) >= 1

-- Exercise 11
-- Which patients have more than 2 visits flagged as Extended
-- (duration over 90 minutes)?
-- Table: visits

-- -----------------------
-- Combining Conditional COUNT and SUM
-- -----------------------

-- Exercise 12
-- For each trial, produce a full enrollment summary showing:
--   - trial name and phase
--   - target_enrollment
--   - total patients enrolled
--   - active count
--   - completed count
--   - withdrawn count
--   - screen failure count
--   - enrollment fill rate %
-- Tables: trials, patients

-- Exercise 13
-- For each trial, produce a safety summary showing:
--   - trial name
--   - total adverse events
--   - SAE count (serious = 1)
--   - Grade 3 or higher count
--   - ongoing (unresolved) AE count
--   - resolved AE count
-- Order by SAE count descending so highest-risk trials appear first.
-- Tables: adverse_events, patients, trials

-- Exercise 14
-- For each department, produce a lab result quality summary:
--   - department name
--   - total lab results
--   - normal count
--   - abnormal count (Low + High + Critical combined)
--   - critical count
--   - abnormal rate as a percentage of total
-- Tables: lab_results, patients, trials, departments
