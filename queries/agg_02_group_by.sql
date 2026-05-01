-- ============================================
-- Aggregation Practice: GROUP BY
-- ============================================
-- GROUP BY collapses rows that share the same value
-- in a column into a single row, so aggregate functions
-- like COUNT() can be applied to each group separately.
-- ============================================

-- Exercise 1
-- How many patients are enrolled in each trial?
-- Tables: patients
SELECT trial_id, 
       COUNT(*) AS num_patients
FROM patients
GROUP BY trial_id;

-- Exercise 2
-- How many patients have each enrollment status (Active, Completed, Withdrawn, Screen Failure)?
-- Tables: patients
SELECT status,
       COUNT(*) AS num_patients
FROM patients
GROUP BY status;

-- Exercise 3
-- How many trials does each department run?
-- Tables: trials
SELECT department_id, 
       COUNT(*) AS num_trials
FROM trials
GROUP BY department_id;

-- Exercise 4
-- How many visits occurred at each timepoint (Baseline, Week 4, EOT, etc.)?
-- Tables: visits
SELECT visit_timepoint, 
       COUNT(*) AS num_visits
FROM visits
GROUP BY visit_timepoint; 

-- Exercise 5
-- How many trials are in each phase (Phase I, Phase II, Phase III)?
-- Tables: trials
SELECT phase, 
       COUNT(*) AS num_trials_in_phase
FROM trials
GROUP BY phase;

-- Exercise 6
-- How many patients were enrolled each month?
-- Tables: patients
SELECT strftime('%Y-%m', enrollment_date),
        COUNT(*) AS num_patients
FROM patients
GROUP BY strftime('%Y-%m', enrollment_date);

-- Exercise 7
-- How many visits occurred each month across all trials?
-- Tables: visits
SELECT strftime('%Y-%m', visit_date) AS year_month,
       COUNT(*) AS num_visits
FROM visits
GROUP BY  year_month;
