-- ============================================
-- Practice: Searched CASE WHEN
-- ============================================
-- Searched CASE evaluates a separate condition
-- for each WHEN clause, not just a single column.
-- This makes it more powerful than simple CASE —
-- you can use any comparison, range check, or
-- combination of conditions.
--
-- Pattern:
--   CASE
--     WHEN condition_a THEN 'result_a'
--     WHEN condition_b THEN 'result_b'
--     ELSE 'default'
--   END
--
-- Use when:
--   - You need range-based bucketing (age groups, weight bands)
--   - Your condition involves multiple columns
--   - You need operators like >, <, BETWEEN, LIKE, IS NULL
--
-- Important: WHEN clauses are evaluated in order —
-- the first match wins and the rest are skipped.
-- Put the most specific conditions first.
-- ============================================

-- -----------------------
-- Single-column range bucketing
-- -----------------------

-- Exercise 1
-- Assign each patient to an age group:
--   Under 40       → 'Young Adult'
--   40 to 64       → 'Middle-Aged'
--   65 and older   → 'Older Adult'
-- Show patient_id, age, and the age group label.
-- Table: patients
SELECT patient_id,
  age,
  CASE
    WHEN age < 40 THEN 'Young Adult'
    WHEN age BETWEEN 40 AND 64 THEN 'Middle_Aged'
    WHEN age >= 65 THEN 'Older Adult'
  END AS age_group
FROM patients;

-- Exercise 2
-- Assign each patient to a weight category:
--   Under 60 kg    → 'Low Weight'
--   60 to 89.9 kg  → 'Normal Weight'
--   90 kg or over  → 'High Weight'
-- Table: patients
SELECT patient_id,
  CASE
    WHEN weight_kg < 60 THEN 'Low Weight'
    WHEN weight_kg BETWEEN 60 AND 89.9 THEN 'Normal Weight'
    WHEN weight_kg >= 90 THEN 'High Weight'
  END AS weight_category
FROM patients;

-- Exercise 3
-- Classify each visit by duration:
--   Under 45 min   → 'Brief'
--   45 to 90 min   → 'Standard'
--   Over 90 min    → 'Extended'
-- Show visit_id, visit_timepoint, duration_minutes, and the category.
-- Table: visits
SELECT visit_id,
  visit_timepoint,
  duration_minutes,
  CASE
    WHEN duration_minutes < 45 THEN 'Brief'
    WHEN duration_minutes BETWEEN 45 AND 90 THEN 'Standard'
    WHEN duration_minutes >= 90 THEN 'Extended'
  END AS category
FROM visits;

-- Exercise 4
-- Classify each trial by how far into enrollment it is,
-- based on days since start_date:
--   Under 180 days → 'Early Stage'
--   180 to 365 days → 'Mid Stage'
--   Over 365 days  → 'Mature'
-- Table: trials
-- Hint: CASE WHEN julianday('now') - julianday(start_date) < 180 ...
SELECT trial_name,
  CASE
    WHEN julianday('now') - julianday(start_date) < 180 THEN 'Early Stage'
    WHEN julianday('now') - julianday(start_date) BETWEEN 180 AND 365 THEN 'Mid Stage'
    WHEN julianday('now') - julianday(start_date) > 365 THEN 'Mature'
  END AS classified
FROM trials;

-- Exercise 5
-- Classify each trial by its target_enrollment size:
--   Under 20       → 'Small (Phase I)'
--   20 to 60       → 'Medium (Phase II)'
--   Over 60        → 'Large (Phase III)'
-- Table: trials
SELECT trial_name,
  CASE
    WHEN target_enrollment < 20 THEN 'Small (Phase I)'
    WHEN target_enrollment BETWEEN 20 AND 60 THEN 'Medium (Phase II)'
    WHEN target_enrollment > 60 THEN 'Large (Phase III)'
  END AS target_enrollment_size
FROM trials;

-- -----------------------
-- NULL-aware conditions
-- -----------------------

-- Exercise 6
-- For each trial, classify its current activity:
--   end_date IS NOT NULL          → 'Closed'
--   start_date > date('now')      → 'Not Yet Started'
--   ELSE                          → 'Active'
-- Table: trials
SELECT trial_name,
  CASE
    WHEN end_date IS NOT NULL THEN 'Closed'
    WHEN start_date > date('now') THEN 'Not Yet Started'
    ELSE 'Active'
  END AS trial_current_status
FROM trials;

-- Exercise 7
-- For each adverse event, classify its resolution state:
--   resolution_date IS NULL AND
--     onset_date < date('now', '-90 days')  → 'Long-Running — Review Required'
--   resolution_date IS NULL                 → 'Ongoing'
--   ELSE                                    → 'Resolved'
-- Table: adverse_events
SELECT ae_id,
  CASE
    WHEN resolution_date IS NULL AND onset_date < date('now', '-90 days') THEN 'Long-Running - Review Required'
    WHEN resolution_date IS NULL THEN 'Ongoing'
    ELSE 'Resolved'
  END AS resolution_state
FROM adverse_events;

-- Exercise 8 -- For each patient, classify their visit history:
--   No visits at all (use LEFT JOIN)    → 'Pre-Baseline'
--   Only one visit                      → 'Baseline Only'
--   More than one visit                 → 'In Treatment'
-- Tables: patients, visits
SELECT patients.patient_id,
  CASE
    WHEN COUNT(visit_id) = 0 THEN 'Pre-Baseline'
    WHEN COUNT(visit_id) = 1 THEN 'Baseline Only'
    ELSE 'In Treatment'
  END AS visit_history
FROM patients
LEFT JOIN visits
  ON patients.patient_id = visits.patient_id
GROUP BY patients.patient_id;


-- -----------------------
-- Multi-column conditions
-- -----------------------

-- Exercise 9
-- Classify each patient's enrollment risk level
-- using both age and status:
--   age >= 75 AND status = 'Active'    → 'High Risk — Elderly Active'
--   age >= 65 AND status = 'Active'    → 'Elevated Risk — Senior Active'
--   status = 'Withdrawn'               → 'Dropout'
--   status = 'Screen Failure'          → 'Not Enrolled'
--   ELSE                               → 'Standard'
-- Table: patients
SELECT patient_id,
  CASE
    WHEN age >= 75 AND status = 'Active' THEN 'High Risk - Elderly Active'
    WHEN age >= 65 AND status = 'Active' THEN 'Elevated Risk - Senior Active'
    WHEN status = 'Withdrawn' THEN 'Dropout'
    WHEN status = 'Screen Failure' THEN 'Not Enrolled'
    ELSE 'Standard'
  END AS enrollment_risk_level
FROM patients;

-- Exercise 10
-- Classify each adverse event's urgency level
-- using both severity and the serious flag:
--   serious = 1                          → 'URGENT — SAE'
--   severity IN ('Grade 3', 'Grade 4')   → 'High Priority'
--   severity = 'Grade 2'                 → 'Monitor Closely'
--   ELSE                                 → 'Routine'
-- Table: adverse_events
SELECT ae_id,
  patient_id,
  severity,
  serious,
  CASE
    WHEN serious = 1 THEN 'URGENT-SAE'
    WHEN severity IN ('Grade 3', 'Grade 4') THEN 'High Priority'
    WHEN severity = 'Grade 2' THEN 'Monitor Closely'
    ELSE 'Routine'
  END AS urgency_level
FROM adverse_events;

-- Exercise 11
-- Classify each lab result's clinical interpretation
-- using result_value compared to the reference range:
--   result_value < reference_range_low * 0.5     → 'Critically Low'
--   result_value < reference_range_low            → 'Below Normal'
--   result_value > reference_range_high * 1.5    → 'Critically High'
--   result_value > reference_range_high           → 'Above Normal'
--   ELSE                                          → 'Within Range'
-- Table: lab_results
SELECT result_value,
  test_name,
  CASE
    WHEN result_value < reference_range_low * 0.5 THEN 'Critically Low'
    WHEN result_value < reference_range_low THEN 'Below Normal'
    WHEN result_value > reference_range_high * 0.5 THEN 'Critically High'
    WHEN result_value > reference_range_high THEN 'Above Normal'
    ELSE 'Within Range'
  END AS clinical_interpretation
FROM lab_results;

-- -----------------------
-- Searched CASE with JOIN
-- -----------------------

-- Exercise 12
-- Show each patient with their age group label and their trial name.
-- Only include Active patients.
-- Tables: patients, trials
SELECT patient_id,
trial_name,
  CASE 
    WHEN age < 40 THEN 'Young Adult'
    WHEN age BETWEEN 40 AND 64 THEN 'Middle_Aged'
    WHEN age >= 65 THEN 'Older Adult'
  END AS age_group
FROM patients
JOIN trials
  ON patients.trial_id = trials.trial_id;

-- Exercise 13
-- Show each adverse event with its urgency label (from Exercise 10)
-- alongside the patient's trial name and arm name.
-- Tables: adverse_events, patients, trials, trial_arms
SELECT ae_id,
  trial_name,
  arm_name,
  CASE
    WHEN serious = 1 THEN 'URGENT-SAE'
    WHEN severity IN ('Grade 3', 'Grade 4') THEN 'High Priority'
    WHEN severity = 'Grade 2' THEN 'Monitor Closely'
    ELSE 'Routine'
  END AS urgency_label
FROM adverse_events
JOIN patients
  ON adverse_events.patient_id = patients.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id
JOIN trial_arms
  ON trials.trial_id = trial_arms.trial_id;

-- -----------------------
-- Searched CASE with ORDER BY
-- -----------------------
-- CASE WHEN in ORDER BY lets you define a custom sort order
-- that doesn't follow alphabetical or numeric rules.
-- ============================================

-- Exercise 14
-- List all adverse events ordered by severity from most to least severe:
--   Grade 4 first, then Grade 3, Grade 2, Grade 1, anything else last.
-- Show ae_term, severity, and onset_date.
-- Table: adverse_events
-- Hint: ORDER BY CASE severity WHEN 'Grade 4' THEN 1 WHEN 'Grade 3' THEN 2 ...

-- Exercise 15
-- List all trials ordered by status priority:
--   On Hold first (most urgent),
--   then Enrolling,
--   then Not Yet Open,
--   then Completed last.
-- Show trial name and status.
-- Table: trials
