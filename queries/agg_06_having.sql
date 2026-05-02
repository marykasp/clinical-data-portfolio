-- ============================================
-- Aggregation Practice: HAVING
-- ============================================
-- HAVING filters groups after aggregation.
-- WHERE filters individual rows before aggregation.
--
-- Use WHERE when the condition is on a raw column value.
-- Use HAVING when the condition involves an aggregate
-- function (COUNT, SUM, AVG, MIN, MAX).
--
-- Execution order:
--   FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
-- ============================================



-- Exercise 3
-- Which patients have spent more than 200 total minutes on study visits?
-- Table: visits
SELECT patient_id,
  SUM(duration_minutes) AS total_visit_minutes
FROM visits
GROUP BY patient_id
HAVING SUM(duration_minutes) > 200;

-- Exercise 4
-- Which lab tests have an average result value above a meaningful
-- clinical threshold? Use CRP > 10 mg/L as the threshold
-- (CRP above 10 indicates significant inflammation).
-- Table: lab_results
SELECT test_name,
  AVG(result_value) AS average_value
FROM lab_results
GROUP BY test_name
HAVING AVG(result_value) > 10;

-- Exercise 5
-- Which departments are running more than 2 trials?
-- Table: trials
SELECT department_name,
  COUNT(*) AS num_of_trials
FROM trials
JOIN departments
  ON trials.department_id = departments.department_id
GROUP BY department_name
HAVING COUNT(*) > 2;

-- Exercise 6
-- Which trials have a total target enrollment greater than 50?
-- Table: trials
SELECT trial_id,
  trial_name,
  target_enrollment
FROM trials
WHERE target_enrollment > 50
GROUP BY trial_name;

-- Exercise 7
-- Which visit timepoints have an average duration longer than 90 minutes?
-- These are the most time-demanding visits for patients and site staff.
-- Table: visits
SELECT visit_timepoint,
  AVG(duration_minutes) AS average_visit_time
FROM visits
GROUP BY visit_timepoint
HAVING AVG(duration_minutes) > 90;

-- Exercise 8
-- Which patients have a maximum lab result value for WBC above 10.0 K/uL?
-- WBC above 10 may indicate infection or disease progression.
-- Table: lab_results
SELECT patient_id,
  MAX(result_value) AS maximum_value_WBC
FROM lab_results
WHERE test_name = 'WBC'
GROUP BY patient_id
HAVING MAX(result_value) > 10;
