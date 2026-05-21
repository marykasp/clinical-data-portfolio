-- ============================================
-- Practice: Combining Date Concepts
-- ============================================
-- This file brings together extraction, filtering,
-- arithmetic, and aggregation in multi-step queries.
--
-- Reminder — execution order:
--   FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
--
-- Date functions used across these exercises:
--   strftime('%Y', col)           — extract year
--   strftime('%Y-%m', col)        — extract year-month
--   date('now')                   — today's date
--   date(col, '+N days/months')   — shift a date forward
--   julianday(a) - julianday(b)   — days between two dates
--   MIN(date_col) / MAX(date_col) — earliest / most recent date
-- ============================================

-- -----------------------
-- Extraction + Aggregation
-- -----------------------

-- Exercise 1
-- For each year, how many patients enrolled and how many visits occurred?
-- Show year, enrollment count, and visit count side by side.
-- Hint: this requires two separate aggregations — consider whether
-- a JOIN or subquery approach makes more sense.
-- Tables: patients, visits
SELECT
    e.year,
    e.enrollment_count,
    v.visit_count
FROM (
    SELECT
        strftime('%Y', enrollment_date) AS year,
        COUNT(*) AS enrollment_count
    FROM patients
    GROUP BY strftime('%Y', enrollment_date)
) AS e
LEFT JOIN (
    SELECT
        strftime('%Y', visit_date) AS year,
        COUNT(*) AS visit_count
    FROM visits
    GROUP BY strftime('%Y', visit_date)
) AS v
ON e.year = v.year
ORDER BY e.year;

-- Exercise 2
-- For each trial, show:
--   - trial name
--   - year the trial started
--   - number of patients enrolled
--   - date of most recent patient enrollment
-- Tables: trials, patients
SELECT trial_name,
  strftime('%Y', start_date) AS year,
  COUNT(*) AS num_patients,
  MAX(enrollment_date)
FROM trials
JOIN patients
  ON trials.trial_id = patients.trial_id
GROUP BY trial_name;

-- Exercise 3
-- For each year-month, how many patients enrolled?
-- Only show months with more than 2 enrollments.
-- Table: patients
-- Hint: GROUP BY strftime('%Y-%m', ...), HAVING COUNT(*) > 2
SELECT strftime('%Y-%m', enrollment_date) AS year_month,
  COUNT(*) AS patients_enrolled
FROM patients
GROUP BY 1
HAVING COUNT(*) > 2;

-- -----------------------
-- Arithmetic + Filtering
-- -----------------------

-- Exercise 4
-- Which active patients enrolled more than 1 year ago
-- and have had at least one visit?
-- Show patient_id, enrollment_date, days since enrollment,
-- and their most recent visit date.
-- Tables: patients, visits
SELECT patients.patient_id,
  enrollment_date,
  julianday(MAX(visit_date)) - julianday(enrollment_date) AS days_since_enrollment,
  MAX(visit_date)
FROM patients
JOIN visits
  ON patients.patient_id = visits.patient_id
WHERE status = 'Active'
GROUP BY patients.patient_id
HAVING COUNT(visit_id) > 1; 

-- Exercise 5
-- For each trial, how many days has it been running
-- (from start_date to today)?
-- Only show trials that have been running for more than 500 days.
-- Table: trials
SELECT trial_name,
  julianday('now') - julianday(start_date) AS days_running
FROM trials
GROUP BY trial_name;

-- Exercise 6
-- Which patients had their first visit more than 60 days
-- after enrolling?
-- A long delay to first visit may indicate a scheduling problem.
-- Show patient_id, enrollment_date, first visit date, and the gap in days.
-- Tables: patients, visits
SELECT patients.patient_id,
  enrollment_date,
  MIN(visit_date) AS first_visit_date,
  julianday(enrollment_date) - julianday(MIN(visit_date))
FROM patients
JOIN visits 
  ON patients.patient_id = visits.patient_id
GROUP BY patients.patient_id
HAVING MIN(visit_date) > 60; 

-- -----------------------
-- Filtering + Aggregation
-- -----------------------

-- Exercise 7
-- For each trial, how many patients enrolled in 2024?
-- Only show trials with at least 2 enrollments in 2024.
-- Tables: trials, patients
SELECT trial_name,
  COUNT(*) AS patients_enrolled
FROM trials
JOIN patients
  ON trials.trial_id = patients.trial_id
WHERE strftime('%Y', enrollment_date) = '2024'
GROUP BY trial_name
HAVING COUNT(*) > 2;

-- Exercise 8
-- Which months had the highest visit counts in 2023?
-- Show year-month and visit count, ordered from busiest to quietest.
-- Table: visits
SELECT strftime('%Y-%m', visit_date) AS visit_year_month,
  COUNT(*) AS visit_count
FROM visits
GROUP BY strftime('%m', visit_date)
ORDER BY COUNT(*) DESC;

-- Exercise 9
-- For each trial phase, what is the average number of days
-- between trial start and the first patient enrollment?
-- Tables: trials, patients
-- Hint: MIN(enrollment_date) per trial,
--       then julianday(MIN) - julianday(start_date)

-- -----------------------
-- Multi-Step Clinical Scenarios
-- -----------------------

-- Exercise 10
-- Build a trial status summary showing, for each trial:
--   - trial name
--   - phase
--   - department name
--   - days since trial started
--   - total patients enrolled
--   - most recent patient enrollment date
-- Order by days since start, descending.
-- Tables: trials, departments, patients

-- Exercise 11
-- Identify patients who may be overdue for a visit.
-- Show patients with Active status whose most recent visit
-- was more than 90 days ago (or who have never had a visit).
-- Include patient_id, trial name, most recent visit date,
-- and days since that visit.
-- Tables: patients, trials, visits
-- Hint: LEFT JOIN visits, GROUP BY patient, HAVING MAX(visit_date) < date('now', '-90 days')
--       or MAX(visit_date) IS NULL

-- Exercise 12
-- For each department, show a year-by-year enrollment breakdown:
--   - department name
--   - year
--   - number of patients enrolled that year
--   - cumulative total (hint: this is advanced — a subquery or
--     window function would be needed in other databases;
--     in SQLite without window functions, try a correlated subquery)
-- Tables: departments, trials, patients
