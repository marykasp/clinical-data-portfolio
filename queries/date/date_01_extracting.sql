-- ============================================
-- Practice: Extracting Date Parts
-- ============================================
-- SQLite uses strftime() to pull individual parts
-- out of a date value. It always returns TEXT.
--
-- Common format codes:
--   %Y  →  four-digit year           e.g. '2024'
--   %m  →  month number as 01–12     e.g. '03'
--   %d  →  day of month as 01–31     e.g. '15'
--   %w  →  day of week (0=Sun–6=Sat) e.g. '2'
--   %j  →  day of year as 001–366    e.g. '075'
--
-- Pattern:
--   SELECT strftime('%Y', date_column) AS year
--   FROM table
--
-- Date columns in this database:
--   trials.start_date
--   patients.enrollment_date
--   visits.visit_date
-- ============================================

-- -----------------------
-- Extracting Year
-- -----------------------

-- Exercise 1
-- Show each trial name alongside the year it started.
-- Table: trials
SELECT trial_name,
  strftime('%Y', start_date) AS start_year
FROM trials;

-- Exercise 2
-- Show each patient_id alongside the year they enrolled in the program.
-- Table: patients
SELECT patient_id,
  strftime('%Y', enrollment_date) AS enrollment_year
FROM patients;

-- Exercise 3
-- Show each visit_id alongside the year the visit took place.
-- Table: visits
SELECT visit_id,
  strftime('%Y', visit_date) AS year_of_visit
FROM visits

-- -----------------------
-- Extracting Month
-- -----------------------

-- Exercise 4
-- Show each patient_id alongside the month number of their enrollment date.
-- Month is returned as '01'–'12'.
-- Table: patients

-- Exercise 5
-- Show each visit alongside the month number it occurred in.
-- Table: visits

-- Exercise 6
-- Show each trial name alongside the month number it started.
-- Trials starting mid-year may have had delayed regulatory approvals.
-- Table: trials

-- -----------------------
-- Extracting Day
-- -----------------------

-- Exercise 7
-- Show each visit alongside the day of the month it took place.
-- Table: visits

-- Exercise 8
-- Show each patient_id and enrollment date alongside
-- the day of the month they were enrolled.
-- Table: patients

-- -----------------------
-- Year-Month Combined
-- -----------------------
-- strftime('%Y-%m', date_col) produces a sortable string like '2024-03'.
-- Useful for grouping or displaying by calendar month.
-- ============================================

-- Exercise 9
-- Show each visit alongside its year-month.
-- A visit on 2024-03-15 should display '2024-03'.
-- Table: visits

-- Exercise 10
-- Show each patient_id alongside their enrollment year-month.
-- Table: patients

-- -----------------------
-- Day of Week
-- -----------------------
-- strftime('%w', date_col) returns '0' for Sunday through '6' for Saturday.
-- ============================================

-- Exercise 11
-- Show each visit alongside the numeric day of the week it occurred on.
-- Table: visits

-- Exercise 12
-- Show each visit alongside a readable day name instead of a number.
-- 0 → 'Sunday', 1 → 'Monday', ..., 6 → 'Saturday'
-- Table: visits
-- Hint: CASE strftime('%w', visit_date) WHEN '0' THEN 'Sunday' ... END

-- -----------------------
-- Extracting Date Parts with a JOIN
-- -----------------------

-- Exercise 13
-- Show each patient's enrollment year alongside their trial name and phase.
-- Tables: patients, trials

-- Exercise 14
-- Show each visit's year and month alongside the name of the
-- trial the patient is enrolled in.
-- Tables: visits, patients, trials

-- Exercise 15
-- Show each trial name, its start year, and its department name.
-- Tables: trials, departments
