-- ============================================
-- Aggregation Practice: SUM
-- ============================================
-- SUM() adds up all numeric values in a column.
-- Use it on: duration_minutes (visits), weight_kg (patients),
--            target_enrollment (trials), result_value (lab_results)
-- ============================================

-- ============================================
-- Exercise 1
-- What is the total number of minutes all patients in the program
-- have spent on study visits combined?
-- Table: visits
-- Hint: SUM(duration_minutes)
-- ============================================
SELECT SUM(duration_minutes) AS total_minutes
FROM visits;


-- ============================================
-- Exercise 2
-- What is the total target enrollment across all Phase III trials?
-- A program director might use this to understand the overall
-- patient commitment required for late-stage studies.
-- Table: trials
-- Hint: SUM(target_enrollment) with WHERE phase = 'Phase III'
-- ============================================
SELECT SUM(target_enrollment) AS total_target_enrollment
FROM trials
WHERE phase = 'Phase III';


-- ============================================
-- Exercise 3
-- What is the total visit time (in minutes) logged per trial?
-- Helps coordinators estimate site burden per study.
-- Tables: visits, patients
-- Hint: JOIN visits to patients on patient_id, then SUM(duration_minutes) GROUP BY trial_id
-- ============================================
SELECT trial_id, 
  SUM(duration_minutes) AS total_visit_time
FROM visits
JOIN patients
ON visits.patient_id = patients.patient_id
GROUP BY trial_id;

-- ============================================
-- Exercise 4
-- What is the total target enrollment per department?
-- Tables: trials, departments
-- Hint: JOIN trials to departments, then SUM(target_enrollment) GROUP BY department_name
-- ============================================
SELECT department_name,
  SUM(target_enrollment) AS total_target_enrollment
FROM trials
JOIN departments
ON trials.department_id = departments.department_id
GROUP BY department_name;

-- ============================================
-- Exercise 5
-- What is the total number of minutes spent on Baseline visits
-- versus Cycle 1 Day 1 visits across the whole program?
-- Table: visits
-- Hint: GROUP BY visit_timepoint, SUM(duration_minutes)
-- ============================================
SELECT visit_timepoint,
  SUM(duration_minutes) AS total_minutes
FROM visits
GROUP BY visit_timepoint;

-- ============================================
-- Exercise 6
-- What is the combined target enrollment for all Phase I and Phase II trials?
-- Table: trials
-- Hint: filter with WHERE phase IN (...), then SUM(target_enrollment)
-- ============================================
SELECT SUM(target_enrollment) AS total_target_enrollment
FROM trials
WHERE phase IN ('Phase I', 'Phase II');


-- ============================================
-- Round 2: SUM on lab_results.result_value
-- ============================================
-- These exercises use result_value from lab_results
-- and require joining to patients, visits, or trials
-- to apply clinical filters.
--
-- Clinically, summing result values is useful for
-- measuring total disease burden recorded across a
-- cohort — e.g. total inflammatory load (CRP), total
-- cardiac stress (BNP), or cumulative tumor marker
-- exposure (LDH) — rather than looking at a single
-- point in time.
-- ============================================

-- Exercise 7
-- What is the total CRP measured across all patients
-- who are currently Active in the program?
-- High total CRP across the active cohort indicates
-- ongoing systemic inflammation that may need monitoring.
-- Tables: lab_results, patients
-- Hint: JOIN on patient_id, WHERE test_name = 'CRP'
--       AND status = 'Active', then SUM(result_value)
SELECT SUM(result_value) AS total_CRP
FROM lab_results
JOIN patients
  ON lab_results.patient_id = patients.patient_id
WHERE status = 'Active' AND test_name = "CRP";

-- Exercise 8
-- What is the total LDH recorded per patient across all their visits?
-- LDH is a marker of tissue breakdown and tumor burden — patients
-- with a high cumulative LDH sum may have had more aggressive disease.
-- Table: lab_results
-- Hint: WHERE test_name = 'LDH', GROUP BY patient_id, SUM(result_value)

-- Exercise 9
-- What is the total BNP recorded across all Baseline visits?
-- Summing BNP at Baseline gives a picture of how much collective
-- cardiac stress the cardiology cohort entered the trial with.
-- Tables: lab_results, visits
-- Hint: JOIN on visit_id, WHERE test_name = 'BNP'
--       AND visit_timepoint = 'Baseline', then SUM(result_value)

-- Exercise 10
-- What is the total CRP and total ESR recorded per patient,
-- across all their visits combined?
-- Patients with high sums for both are likely the ones with
-- the most persistent inflammatory disease activity.
-- Table: lab_results
-- Hint: you will need two separate WHERE filters — consider
--       running this as two queries, or use conditional SUM:
--       SUM(CASE WHEN test_name = 'CRP' THEN result_value ELSE 0 END)

-- Exercise 11
-- What is the total LDL recorded per trial?
-- Trials with a higher total LDL across patients may indicate
-- the cardiology department is enrolling a higher-risk lipid cohort.
-- Tables: lab_results, patients
-- Hint: JOIN lab_results to patients on patient_id,
--       WHERE test_name = 'LDL', GROUP BY trial_id, SUM(result_value)

-- Exercise 12
-- Compare the total Hemoglobin recorded at Baseline versus
-- at Cycle 2 Day 1 across all oncology patients.
-- A lower total at Cycle 2 Day 1 reflects expected myelosuppression
-- from chemotherapy — the cells being killed include red blood cells.
-- Tables: lab_results, visits
-- Hint: JOIN on visit_id, WHERE test_name = 'Hemoglobin',
--       GROUP BY visit_timepoint, SUM(result_value)

-- Exercise 13
-- What is the total result_value for all inflammatory markers
-- (CRP, ESR, RF) collected from patients enrolled in Phase II trials only?
-- This gives the combined inflammatory burden across the mid-stage
-- immunology and rheumatology studies.
-- Tables: lab_results, patients, trials
-- Hint: JOIN lab_results → patients → trials,
--       WHERE test_name IN ('CRP', 'ESR', 'RF')
--       AND phase = 'Phase II', then SUM(result_value)

