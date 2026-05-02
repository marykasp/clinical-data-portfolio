-- ============================================
-- Aggregation Practice: HAVING
-- ============================================
-- HAVING filters groups after aggregation, the way
-- WHERE filters rows before aggregation.
-- Rule: if your condition uses COUNT, SUM, AVG, MIN,
-- or MAX — use HAVING, not WHERE.
--
-- Execution order:
--   FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
-- ============================================

-- Exercise 1
-- Which trials have enrolled more than 5 patients?
-- Tables: patients
SELECT trial_id, 
  COUNT(*) As total_patients
FROM patients
GROUP BY trial_id
HAVING COUNT(*) > 5;

-- Exercise 2
-- Which patients have attended more than 3 visits?
-- Tables: visits
SELECT patient_id,
  COUNT(*) AS total_visits
FROM visits
GROUP BY patient_id
HAVING COUNT(*) > 3;

-- Exercise 3
-- Which departments are running more than 2 trials?
-- Tables: trials
SELECT department_id,
  COUNT(*) AS total_trials
FROM trials
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Exercise 4
-- Which enrollment months had more than 5 patients enrolled?
-- Tables: patients
SELECT strftime('%Y-%m', enrollment_date) AS enrollment_month,
  COUNT(*) AS patient_count
FROM patients
GROUP BY enrollment_month
HAVING COUNT(*) > 5;

-- Exercise 5
-- Which visit timepoints have been completed more than 20 times across all patients?
-- Tables: visits
SELECT visit_timepoint,
  COUNT(*) AS total_visits
FROM visits
GROUP BY visit_timepoint
HAVING COUNT(*) > 20;

-- Exercise 6
-- Which trials have fewer than 3 enrolled patients?
-- These may be underpowered and at risk of not meeting recruitment targets.
-- Tables: patients
SELECT trial_id,
  COUNT(*) AS total_patients
FROM patients
GROUP BY trial_id
HAVING COUNT(*) < 3;
