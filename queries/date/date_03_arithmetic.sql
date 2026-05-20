-- ============================================
-- Practice: Date Arithmetic
-- ============================================
-- SQLite has two main tools for date math:
--
-- 1. julianday() — converts a date to a decimal
--    day count. Subtracting two julianday values
--    gives the number of days between them.
--
--    CAST(julianday(date_a) - julianday(date_b) AS INTEGER)
--    → whole number of days between date_b and date_a
--
-- 2. date(col, modifier) — shifts a date forward
--    or backward by an interval.
--
--    date(col, '+30 days')   → 30 days after col
--    date(col, '-6 months')  → 6 months before col
--    date(col, '+1 year')    → 1 year after col
--    date('now', '-90 days') → 90 days ago
--
-- Date columns in this database:
--   trials.start_date
--   patients.enrollment_date
--   visits.visit_date
-- ============================================

-- -----------------------
-- Days Since a Date
-- -----------------------

-- Exercise 1
-- How many days ago did each trial start?
-- Show trial name and days since start_date, sorted from oldest to newest.
-- Table: trials
-- Hint: CAST(julianday('now') - julianday(start_date) AS INTEGER)
SELECT CAST(julianday('now') - julianday(start_date) AS INTEGER),
  trial_name,
  start_date
FROM trials
ORDER BY start_date ASC;

-- Exercise 2
-- How many days ago did each patient enroll?
-- Show patient_id, enrollment_date, and days since enrollment.
-- Table: patients
SELECT CAST(julianday('now') - julianday(enrollment_date) AS INTEGER) AS days_since_enrollment,
  patient_id,
  enrollment_date
FROM patients;

-- Exercise 3
-- How many days ago was each visit?
-- Show visit_id, visit_date, and days since the visit.
-- Table: visits
SELECT visit_id,
  visit_date,
  CAST(julianday('now') - julianday(visit_date) AS INTEGER) AS days_ago
FROM visits;

-- -----------------------
-- Days Between Two Dates
-- -----------------------

-- Exercise 4
-- For each visit, how many days after the patient's enrollment date
-- did the visit occur?
-- A very short gap may indicate the visit was a screening appointment.
-- A long gap may indicate a late-presenting patient.
-- Tables: visits, patients
-- Hint: julianday(visit_date) - julianday(enrollment_date)
SELECT enrollment_date,
  CAST(julianday(visit_date) - julianday(enrollment_date) AS INTEGER) AS days_after_enrollment
FROM patients
JOIN visits
  ON patients.patient_id = visits.patient_id;

-- Exercise 5
-- What is the earliest visit for each patient,
-- and how many days after enrollment did it occur?
-- Tables: visits, patients
-- Hint: MIN(visit_date) per patient, then compute the gap
SELECT patients.patient_id,
  enrollment_date,
  MIN(visit_date) AS first_visit_date,
  CAST(julianday(MIN(visit_date)) - julianday(enrollment_date) AS INTEGER) AS days_to_first_visit
FROM visits
JOIN patients
  ON visits.patient_id = patients.patient_id
GROUP BY patients.patient_id, enrollment_date
ORDER BY 4 DESC;

-- -----------------------
-- Adding and Subtracting Intervals
-- -----------------------

-- Exercise 6
-- For each trial, what date will be 6 months after its start date?
-- This approximates when a Phase I trial might expect first results.
-- Table: trials
-- Hint: date(start_date, '+6 months')
SELECT trial_id,
  trial_name,
  start_date,
  date(start_date, '+6 months') AS six_months_after_start
FROM trials;

-- Exercise 7
-- For each patient, what date is 30 days after their enrollment date?
-- In many protocols, the 30-day mark is when the first
-- post-baseline safety assessment is due.
-- Table: patients
SELECT patient_id,
  date(enrollment_date, '+30 days')
FROM patients;

-- Exercise 8
-- For each visit, what was the date 7 days before it?
-- This represents a pre-visit preparation window.
-- Table: visits
SELECT visit_id,
  date(visit_date, '-7 days') AS pre_visit_window
FROM visits;

-- Exercise 9
-- For each patient, what date is 1 year after their enrollment date?
-- Patients still active at this point would need annual protocol renewals.
-- Table: patients
SELECT patient_id,
  date(enrollment_date, '+1 year') AS one_year_active
FROM patients;

-- -----------------------
-- Identifying Overdue or Late Events
-- -----------------------

-- Exercise 10
-- Which patients enrolled more than 365 days ago but still have Active status?
-- These long-tenure active patients may need annual protocol reconsent.
-- Table: patients
-- Hint: julianday('now') - julianday(enrollment_date) > 365
--       AND status = 'Active'
SELECT patient_id
FROM patients
WHERE status = 'Active' AND julianday('now') - julianday(enrollment_date) > 365;

-- Exercise 11
-- Which trials started more than 2 years ago?
-- Long-running trials past their expected window may need
-- protocol amendments or recruitment reviews.
-- Table: trials
-- Hint: julianday('now') - julianday(start_date) > 730
SELECT trial_id,
  trial_name,
  start_date
FROM trials
WHERE start_date > date('now', '-2 years');

-- Exercise 12
-- Which patients enrolled more than 90 days ago but have no visits
-- recorded after the 90-day mark?
-- In a clinical trial, no activity after 90 days is a
-- potential data quality or patient retention issue.
-- Tables: patients, visits
-- Hint: LEFT JOIN visits, filter where julianday('now') - julianday(enrollment_date) > 90,
--       then look for patients where the MAX(visit_date) is close to enrollment

SELECT patients.patient_id,
  enrollment_date,
  visit_id
FROM patients
LEFT JOIN visits
  ON patients.patient_id = visits.patient_id
WHERE julianday('now') - julianday(enrollment_date) > 90;

-- -----------------------
-- Date Arithmetic with Aggregation
-- -----------------------

-- Exercise 13
-- For each trial, what is the average number of days between
-- patient enrollment and their first visit?
-- A long average gap may indicate scheduling delays at the site.
-- Tables: patients, visits
-- Hint: GROUP BY trial_id, average of (julianday(MIN visit_date) - julianday(enrollment_date))
--!IMPORTANT: fix arithmetic with aggregation not working for first visit date
-- SELECT trial_name,
--   julianday(MIN(visit_date)) - julianday(enrollment_date) AS days,
--   AVG(julianday(MIN(visit_date)) - julianday(enrollment_date)) AS average_no_days
-- FROM trials
-- JOIN patients
--   ON patients.trial_id = trials.trial_id
-- JOIN visits
--   ON patients.patient_id = visits.patient_id
-- GROUP BY trial_name;


-- Exercise 14
-- For each trial, show the earliest enrollment date and the latest enrollment date,
-- and calculate the total enrollment window in days.
-- A wide window means enrollment has been open for a long time.
-- Tables: patients, trials
-- Hint: julianday(MAX(enrollment_date)) - julianday(MIN(enrollment_date))
SELECT trials.trial_id,
  trial_name,
  MIN(enrollment_date) AS earliest_enrollment_date,
  MAX(enrollment_date) AS latest_enrollment_date,
  julianday(MAX(enrollment_date)) - julianday(MIN(enrollment_date)) AS total_enrollment_window
FROM trials
JOIN patients
  ON trials.trial_id = patients.trial_id
GROUP BY trials.trial_id, trial_name;
