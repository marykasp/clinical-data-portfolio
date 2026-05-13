-- ============================================
-- Aggregation Practice Exercises: patients
-- Table columns: patient_id, trial_id, enrollment_date, status
-- ============================================
-- Exercise 1
-- Count the number of patients per trial.
-- Hint: GROUP BY trial_id
-- Exercise 2
-- Count patients grouped by enrollment status.
-- Hint: GROUP BY status
-- Exercise 3
-- Find the earliest and latest enrollment dates across all patients.
-- Hint: use MIN() and MAX() on enrollment_date
-- Exercise 4
-- List trials that have enrolled more than 3 patients.
-- Hint: GROUP BY trial_id, then use HAVING with COUNT(*)
SELECT
  trial_id,
  COUNT(*) AS total_patients
FROM
  patients
GROUP BY
  trial_id
HAVING
  COUNT(*) > 3;

-- Exercise 5
-- Count how many patients have each status, ordered from most to least common.
-- Hint: GROUP BY status, ORDER BY COUNT(*) DESC
-- Exercise 6
-- Count the number of patients enrolled per month.
-- Hint: use strftime('%Y-%m', enrollment_date) to extract the month, then GROUP BY
