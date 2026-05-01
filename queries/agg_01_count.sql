-- ============================================
-- Aggregation Practice: COUNT
-- ============================================
-- COUNT(*) — counts every row, including NULLs
-- COUNT(column) — counts only non-NULL values in that column
-- COUNT(DISTINCT column) — counts unique values only
-- ============================================

-- Exercise 1
-- How many patients are registered in the program in total?
-- !Table: patients -> TOTAL: 93
SELECT COUNT(*) AS total_patients
FROM patients;

-- Exercise 2
-- How many patients currently have a status of 'Active'?
-- Table: patients
-- Hint: use WHERE to filter before counting
-- !Result: active_patients = 47
SELECT COUNT(*) AS active_patients
FROM patients
WHERE status = "Active";

-- Exercise 3
-- How many trials are in the system?
-- Table: trials
-- !total trials = 17
SELECT COUNT(*) AS total_trials
FROM trials;

-- Exercise 4
-- How many distinct lab test types exist across all lab results?
-- Table: lab_results
-- Hint: COUNT(DISTINCT test_name)
-- !lab tests = 16
SELECT COUNT(DISTINCT test_name) AS lab_test
FROM lab_results;

-- Exercise 5
-- How many visits have been recorded at the 'Baseline' timepoint?
-- Table: visits
-- Hint: use WHERE visit_timepoint = 'Baseline'
-- !93 baseline visits
SELECT COUNT(*) AS baseline_visits
FROM visits
WHERE visit_timepoint = "Baseline";

-- Exercise 6
-- How many lab results are recorded per test name?
-- Table: lab_results
-- Hint: GROUP BY test_name
SELECT test_name,
       COUNT(*) AS num_lab_results
FROM lab_results
GROUP BY test_name;

-- Exercise 7
-- How many distinct patients have had at least one lab result collected?
-- Table: lab_results
-- Hint: COUNT(DISTINCT patient_id)
-- !15 distinct patients with lab results
SELECT COUNT(DISTINCT patient_id)
FROM lab_results;

-- Exercise 8
-- How many patients in each trial have a status of 'Screen Failure'?
-- Table: patients
-- Hint: WHERE status = 'Screen Failure', then GROUP BY trial_id
SELECT trial_id, 
       COUNT(*) AS screen_failed
FROM patients
WHERE status = 'Screen Failure'
GROUP BY trial_id;
