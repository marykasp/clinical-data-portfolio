-- ============================================
-- Aggregation Practice Exercises: departments
-- Table columns: department_id, department_name
-- ============================================
-- ============================================
-- Exercise 1
-- Count the total number of departments.
-- ============================================
SELECT
  COUNT(*) AS total_departments
FROM
  departments;

-- ============================================
-- Exercise 2
-- List each department name alongside the number of trials it contains.
-- Hint: join departments to trials, then GROUP BY department_name
-- ============================================
SELECT
  departments.department_name,
  COUNT(*) AS total_trials
FROM
  departments
  JOIN trials ON departments.department_id = trials.department_id
GROUP BY
  departments.department_name;

-- ============================================
-- Exercise 3
-- Find departments that have more than 1 trial.
-- Hint: use HAVING after grouping
-- ============================================
SELECT
  departments.department_name,
  COUNT(*) AS total_trials
FROM
  departments
  JOIN trials ON departments.department_id = trials.department_id
GROUP BY
  departments.department_name
HAVING
  COUNT(*) > 2;

-- ============================================
-- Exercise 4
-- Show only the department with the highest number of trials.
-- Hint: combine ORDER BY and LIMIT
-- ============================================
SELECT
  departments.department_name,
  COUNT(*) AS total_trials
FROM
  departments
  JOIN trials ON departments.department_id = trials.department_id
GROUP BY
  departments.department_name
ORDER BY
  COUNT(*) ASC
LIMIT
  1;
