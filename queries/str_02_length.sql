-- ============================================
-- Practice: LENGTH
-- ============================================
-- LENGTH(column) returns the number of characters
-- in a text value.
--
-- Useful for:
--   - Finding unusually short or long values
--   - Sorting by string length
--   - Data quality checks (e.g. truncated names)
--   - Combining with other string functions
--
-- Pattern:
--   SELECT column, LENGTH(column) AS name_length
--   FROM table
--   ORDER BY LENGTH(column) DESC
--
-- NULL values: LENGTH(NULL) returns NULL.
-- Empty strings: LENGTH('') returns 0.
-- ============================================

-- -----------------------
-- Basic LENGTH
-- -----------------------

-- Exercise 1
-- Show each trial name alongside the number of characters in it.
-- Table: trials
SELECT trial_name,
  length(trial_name) AS character_count
FROM trials;

-- Exercise 2
-- Show each department name alongside its character count.
-- Table: departments
SELECT department_name,
  length(department_name) AS character_count
FROM departments;

-- Exercise 3
-- Show each distinct visit timepoint alongside its character count.
-- Table: visits
SELECT DISTINCT visit_timepoint,
  length(visit_timepoint) AS character_count
FROM visits;

-- Exercise 4
-- Show each distinct test name alongside its character count.
-- Table: lab_results
SELECT test_name,
  length(test_name) AS character_count
FROM lab_results;

-- -----------------------
-- ORDER BY LENGTH
-- -----------------------

-- Exercise 5
-- List all trial names ordered from longest to shortest.
-- Table: trials
SELECT trial_name
FROM trials
ORDER BY length(trial_name) DESC;

-- Exercise 6
-- List all visit timepoints ordered from shortest to longest.
-- Helps identify abbreviated timepoints vs fully written out ones.
-- Table: visits
SELECT DISTINCT visit_timepoint
FROM visits
ORDER BY length(visit_timepoint);

-- Exercise 7
-- List all test names ordered from shortest to longest.
-- Table: lab_results
SELECT test_name
FROM lab_results
ORDER BY length(test_name) ASC;

-- -----------------------
-- Filtering with LENGTH
-- -----------------------

-- Exercise 8
-- Find any trial names that are fewer than 20 characters long.
-- These may be placeholder names or abbreviated entries worth reviewing.
-- Table: trials

-- Exercise 9
-- Find any visit timepoints longer than 10 characters.
-- Table: visits

-- Exercise 10
-- Find test names that are exactly 3 characters long.
-- Table: lab_results

-- -----------------------
-- LENGTH with Aggregation
-- -----------------------

-- Exercise 11
-- What is the longest trial name in the database?
-- Return the maximum character count.
-- Table: trials

-- Exercise 12
-- What is the average character length of all trial names?
-- Round to one decimal place.
-- Table: trials

-- Exercise 13
-- Show the longest and shortest trial name lengths, grouped by phase.
-- Table: trials

-- -----------------------
-- LENGTH with JOIN
-- -----------------------

-- Exercise 14
-- Show each trial name, its character length, and its department name —
-- ordered by trial name length descending.
-- Tables: trials, departments

-- Exercise 15
-- For each department, what is the average character length
-- of the trial names it runs?
-- Departments with long trial names may have more complex naming conventions.
-- Tables: trials, departments
