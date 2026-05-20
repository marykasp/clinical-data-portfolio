-- ============================================
-- Practice: Aggregating by Date
-- ============================================
-- Combining date extraction with GROUP BY lets you
-- summarise data by time period — by year, by month,
-- or by any date-derived grouping.
--
-- The key pattern:
--   GROUP BY strftime('%Y', date_column)
--   GROUP BY strftime('%Y-%m', date_column)
--
-- Because strftime returns TEXT, the groups sort
-- correctly when the format is year-first (ISO order).
--
-- Also useful here:
--   MIN(date_col)  → earliest date in a group
--   MAX(date_col)  → most recent date in a group
--
-- Date columns in this database:
--   trials.start_date
--   patients.enrollment_date
--   visits.visit_date
-- ============================================

-- -----------------------
-- Counting by Year
-- -----------------------

-- Exercise 1
-- How many patients enrolled each year?
-- Show year and enrollment count, ordered by year.
-- Table: patients
SELECT strftime('%Y', enrollment_date) AS year,
  COUNT(*) AS no_patiients_enrolled
FROM patients
GROUP BY 1
ORDER BY 1 DESC;

-- Exercise 2
-- How many visits occurred each year?
-- Show year and visit count, ordered by year.
-- Table: visits
SELECT strftime('%Y', visit_date) AS visit_year,
  COUNT(*) AS visits_per_year
FROM visits
GROUP BY 1
ORDER BY 1 DESC;

-- Exercise 3
-- How many trials started each year?
-- Show year and trial count, ordered by year.
-- Table: trials
SELECT strftime('%Y', start_date) AS start_year,
  COUNT(*) AS no_trials_opened
FROM trials
GROUP BY 1
ORDER BY 1 DESC;

-- -----------------------
-- Counting by Month
-- -----------------------

-- Exercise 4
-- How many visits occurred in each month across all years?
-- Show month number and visit count.
-- This reveals whether visit activity is evenly distributed
-- across the calendar or concentrated in certain months.
-- Table: visits
SELECT strftime('%m', visit_date) AS month,
  COUNT(*) AS visits_per_month
FROM visits
GROUP BY 1;

-- Exercise 5
-- How many patients enrolled in each month number (1–12)?
-- Show month number and count, ordered by month.
-- Table: patients
SELECT strftime('%m', enrollment_date) AS month,
  COUNT(*) AS patients_enrolled_month
FROM patients
GROUP BY 1
ORDER BY 1;

-- -----------------------
-- Counting by Year-Month
-- -----------------------

-- Exercise 6
-- How many visits occurred in each calendar month (year + month)?
-- Show year-month and visit count, ordered chronologically.
-- e.g. 2024-01 → 12 visits, 2024-02 → 9 visits
-- Table: visits
SELECT strftime('%Y-%m', visit_date) AS calendar_month,
  COUNT(*) AS visit_count
FROM visits
GROUP BY 1
ORDER BY 1;

-- Exercise 7
-- How many patients enrolled in each calendar month?
-- Show year-month and enrollment count, ordered chronologically.
-- A spike in a particular month may reflect a recruitment push.
-- Table: patients
SELECT strftime('%Y-%m', enrollment_date) AS calendar_month,
  COUNT(*) no_patients
FROM patients
GROUP BY 1
ORDER BY 1;

-- -----------------------
-- MIN and MAX Dates
-- -----------------------

-- Exercise 8
-- For each trial, what is the earliest and most recent
-- patient enrollment date?
-- Tables: patients, trials
SELECT trials.trial_id,
  trial_name,
  MIN(enrollment_date),
  MAX(enrollment_date)
FROM trials
JOIN patients
  ON trials.trial_id = patients.trial_id
GROUP BY trial_name;

-- Exercise 9
-- For each trial, what is the date of the first visit ever recorded?
-- Tables: visits, patients, trials
SELECT  trial_name,
  MIN(visit_date) AS first_visit
FROM trials
JOIN patients
  ON trials.trial_id = patients.trial_id
JOIN visits
  ON patients.patient_id = visits.patient_id
GROUP BY trial_name;

-- Exercise 10
-- For each patient, what are their first and most recent visit dates?
-- Patients with a wide gap between first and last visit
-- are the longest-tenured in the program.
-- Table: visits
SELECT patient_id,
  MIN(visit_date),
  MAX(visit_date)
FROM visits
GROUP BY patient_id;

-- -----------------------
-- Aggregation with Date Filtering
-- -----------------------

-- Exercise 11
-- How many patients enrolled per year, but only for patients
-- with Active status?
-- Table: patients
SELECT strftime('%Y', enrollment_date) AS enrollment_year,
  COUNT(*) AS num_patients_active
FROM patients
WHERE status = 'Active'
GROUP BY 1;

-- Exercise 12
-- How many visits occurred per year-month in 2024 only?
-- Show year-month and count, ordered chronologically.
-- Table: visits
SELECT strftime('%Y-%m', visit_date) AS year_month,
  COUNT(*) AS num_visits
FROM visits
WHERE strftime('%Y', visit_date) = '2024'
GROUP BY 1;

-- Exercise 13
-- For each trial phase, what is the earliest trial start date
-- and the most recent trial start date?
-- Table: trials
SELECT phase,
  MIN(start_date),
  MAX(start_date)
FROM trials
GROUP BY phase;

-- -----------------------
-- Date Aggregation with JOIN
-- -----------------------

-- Exercise 14
-- For each department, how many patient enrollments have occurred
-- per year? Show department name, year, and count.
-- Tables: patients, trials, departments

-- Exercise 15
-- For each trial, show the trial name, year it started,
-- total patients enrolled, and the date of the most recent enrollment.
-- Trials with no recent enrollment activity may have
-- stalled recruitment.
-- Tables: trials, patients
