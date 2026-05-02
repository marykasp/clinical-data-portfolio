-- ============================================
-- Aggregation Practice: AVG
-- ============================================
-- AVG() returns the mean of non-NULL numeric values.
-- Use it on: age, weight_kg (patients),
--            duration_minutes (visits),
--            result_value (lab_results),
--            target_enrollment (trials)
-- ============================================

-- ============================================
-- Exercise 1
-- What is the average age of patients enrolled across the entire program?
-- Table: patients
-- ============================================
SELECT ROUND(AVG(age), 1) AS average_age
FROM patients;

-- ============================================
-- Exercise 2
-- What is the average age of patients per trial?
-- Helps identify whether a trial is skewing younger or older
-- than expected for the disease area.
-- Table: patients
-- Hint: GROUP BY trial_id, AVG(age)
-- ============================================
SELECT trial_name,
  ROUND(AVG(age), 1) AS average_age
FROM patients
JOIN trials
  ON patients.trial_id = trials.trial_id
GROUP BY trial_name;

-- ============================================
-- Exercise 3
-- What is the average body weight (kg) of patients in each trial?
-- Table: patients
-- Hint: GROUP BY trial_id, AVG(weight_kg)
SELECT trial_id,
  AVG(weight_kg) AS average_weight
FROM patients
GROUP BY trial_id;
-- ============================================

-- ============================================
-- Exercise 4
-- What is the average visit duration in minutes per visit timepoint?
-- A long average Baseline duration vs a short Week 4 check-in
-- reflects how demanding different visit types are for patients.
-- Table: visits
-- Hint: GROUP BY visit_timepoint, AVG(duration_minutes)
SELECT visit_timepoint, 
  AVG(duration_minutes)
FROM visits
GROUP BY visit_timepoint;
-- ============================================

-- ============================================
-- Exercise 5
-- What is the average result value for WBC tests across all patients?
-- Table: lab_results
SELECT AVG(result_value) AS average_WBC_result
FROM lab_results
WHERE test_name = 'WBC';
-- ============================================

-- ============================================
-- Exercise 6
-- What is the average result value per test name?
-- Useful to spot which tests are trending above or below normal range.
SELECT test_name,
  AVG(result_value) AS average_result
FROM lab_results
GROUP BY test_name;
-- ============================================

-- ============================================
-- Exercise 7
-- What is the average target enrollment per trial phase?
SELECT phase,
  AVG(target_enrollment) AS average_target_enrollment
FROM trials
GROUP BY phase;
-- ============================================


-- ============================================
-- Exercise 8V
-- What is the average number of visits per patient?
SELECT ROUND(AVG(visit_count), 1) AS avg_visits_per_patient
FROM (
  SELECT patient_id,
    COUNT(*) AS visit_count
  FROM visits
  GROUP BY patient_id
);
-- ============================================


