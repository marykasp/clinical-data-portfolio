-- ============================================
-- Practice: ORDER BY
-- ============================================
-- ORDER BY sorts the result set by one or more columns.
-- ASC  — ascending, smallest to largest (default)
-- DESC — descending, largest to smallest
--
-- Works on numbers, dates, and text (alphabetical).
-- You can sort by multiple columns:
--   ORDER BY column_a ASC, column_b DESC
-- The second column only breaks ties in the first.
-- ============================================

-- -----------------------
-- Single Table
-- -----------------------

-- Exercise 1
-- List all patients sorted from oldest to youngest.
-- Table: patients
SELECT *
FROM patients
ORDER BY age DESC;

-- Exercise 2
-- List all patients sorted by enrollment date, earliest first.
-- Useful for seeing who entered the program first.
-- Table: patients
SELECT *
FROM patients
ORDER BY enrollment_date;

-- Exercise 3
-- List all visits sorted by duration, longest first.
-- Helps identify which visit types are the most time-intensive.
-- Table: visits
SELECT *
FROM visits
ORDER BY duration_minutes DESC;

-- Exercise 4
-- List all trials sorted by target enrollment, largest first.
-- Table: trials
SELECT *
FROM trials
ORDER BY target_enrollment DESC;

-- Exercise 5
-- List all lab results for WBC sorted by result value, highest first.
-- Elevated WBC can indicate infection, inflammation, or malignancy.
-- Table: lab_results
SELECT *
FROM lab_results
WHERE test_name = "WBC"
ORDER BY result_value DESC;

-- -----------------------
-- Multi-Column Sort
-- -----------------------

-- Exercise 6
-- List all patients sorted first by status (alphabetically),
-- then by age descending within each status group.
-- Table: patients
-- Hint: ORDER BY status ASC, age DESC

-- Exercise 7
-- List all visits sorted by visit timepoint alphabetically,
-- then by visit date ascending within each timepoint.
-- Table: visits
-- Hint: ORDER BY visit_timepoint ASC, visit_date ASC

-- -----------------------
-- ORDER BY with a JOIN
-- -----------------------

-- Exercise 8
-- List all patients with their trial name,
-- sorted by trial name alphabetically, then by enrollment date.
-- Tables: patients, trials
-- Hint: JOIN trials, ORDER BY trial_name ASC, enrollment_date ASC

-- Exercise 9
-- List all lab results with the visit timepoint they were collected at,
-- sorted by test name alphabetically, then by result value descending.
-- Tables: lab_results, visits
-- Hint: JOIN visits, ORDER BY test_name ASC, result_value DESC

-- Exercise 10
-- List all visits with the patient's trial name and department name,
-- sorted by department name, then by visit date descending.
-- A department coordinator would use this to see their most recent
-- visit activity at a glance.
-- Tables: visits, patients, trials, departments
-- Hint: chain the joins, ORDER BY department_name ASC, visit_date DESC
