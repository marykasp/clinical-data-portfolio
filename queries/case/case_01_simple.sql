-- ============================================
-- Practice: Simple CASE WHEN
-- ============================================
-- Simple CASE evaluates a single column against
-- a list of fixed values, like a lookup table.
--
-- Pattern:
--   CASE column
--     WHEN 'value_a' THEN 'result_a'
--     WHEN 'value_b' THEN 'result_b'
--     ELSE 'default'
--   END
--
-- Use when:
--   - You are matching one column to exact values
--   - You want to relabel or translate coded values
--   - Every possible value is known in advance
--
-- The ELSE clause is optional but recommended —
-- without it, unmatched rows return NULL silently.
-- ============================================

-- -----------------------
-- Translating coded values into readable labels
-- -----------------------

-- Exercise 1
-- Show each patient with their status translated into
-- a plain-English description:
--   Active         → 'Currently Participating'
--   Completed      → 'Finished Protocol'
--   Withdrawn      → 'Left Study Early'
--   Screen Failure → 'Did Not Qualify'
-- Table: patients
SELECT patient_id,
  CASE status
    WHEN 'Active' THEN 'Currently Participating'
    WHEN 'Completed' THEN 'Finished Protocol'
    WHEN 'Withdrawn' THEN 'Left Study Early'
    WHEN 'Screen Failure' THEN 'Did Not Qualify'
  END
FROM patients;

-- Exercise 2
-- Show each adverse event with the serious column (0 or 1)
-- translated into a readable label:
--   1 → 'SAE — Regulatory Reporting Required'
--   0 → 'Non-Serious'
-- Table: adverse_events
SELECT ae_id,
  ae_term,
  CASE serious
    WHEN 1 THEN 'SAE - Regulatory Reporting Required'
    WHEN 0 THEN 'Non-Serious'
  END
FROM adverse_events;

-- Exercise 3
-- Show each adverse event with the related_to_drug value
-- translated into a short clinical interpretation:
--   Yes      → 'Drug-Related'
--   No       → 'Unrelated'
--   Possibly → 'Possibly Drug-Related'
--   Unknown  → 'Causality Under Review'
-- Table: adverse_events
SELECT ae_id,
  ae_term,
  CASE related_to_drug
    WHEN 'Yes' THEN 'Drug-Related'
    WHEN 'No' THEN 'Unrelated'
    WHEN 'Possibly' THEN 'Possibly Drug-Related'
    WHEN 'Unknown' THEN 'Causality Under Review'
  END
FROM adverse_events;

-- Exercise 4
-- Show each trial arm with its arm_type translated into
-- a description of what the arm receives:
--   Treatment          → 'Receives experimental drug'
--   Placebo            → 'Receives inert comparator'
--   Active Comparator  → 'Receives standard of care'
--   Observational      → 'Monitored without intervention'
-- Table: trial_arms
SELECT arm_id,
  arm_name,
  CASE arm_type
    WHEN 'Treatment' THEN 'Receives experimental drug'
    WHEN 'Placebo' THEN 'Receives inert comparator'
    WHEN 'Active Comparator' THEN 'Receives standard of care'
    WHEN 'Observational' THEN 'Monitored without intervention'
  END
FROM trial_arms;

-- Exercise 5
-- Show each trial with its phase translated into
-- a short description of the phase goal:
--   Phase I   → 'Safety & Dosing'
--   Phase II  → 'Efficacy & Side Effects'
--   Phase III → 'Confirmatory Efficacy'
-- Table: trials
SELECT trial_id,
  trial_name,
  CASE phase
    WHEN 'Phase I' THEN 'Safety & Dosing'
    WHEN 'Phase II' THEN 'Efficacy & Side Effects'
    WHEN 'Phase III' THEN 'Confirmatory Efficacy'
  END
FROM trials;

-- Exercise 6
-- Show each trial with its status translated into
-- an operational description:
--   Enrolling     → 'Open — Accepting Patients'
--   Completed     → 'Closed — Data Lock'
--   On Hold       → 'Paused — Under Review'
--   Not Yet Open  → 'Pending Activation'
-- Table: trials
SELECT trial_id,
  trial_name,
  CASE status
    WHEN 'Enrolling' THEN 'Open - Accepting Patients'
    WHEN 'Completed' THEN 'Closed - Data Lock'
    WHEN 'On Hold' THEN 'Paused - Under Review'
    WHEN 'Not Yet Open' THEN 'Pending Activation'
  END
FROM trials;

-- -----------------------
-- Simple CASE with JOIN
-- -----------------------

-- Exercise 7
-- Show each patient alongside a translated status label
-- and the name of the trial they are enrolled in.
-- Tables: patients, trials
SELECT patients.patient_id,
  trial_name,
  CASE patients.status
    WHEN 'Active' THEN 'Currently Participating'
    WHEN 'Completed' THEN 'Finished Protocol'
    WHEN 'Withdrawn' THEN 'Left Study Early'
    WHEN 'Screen Failure' THEN 'Did Not Qualify'
  END
FROM patients
JOIN trials
  ON patients.trial_id = trials.trial_id;

-- Exercise 8
-- Show each adverse event with the translated serious label
-- and the name of the trial the patient is enrolled in.
-- Tables: adverse_events, patients, trials
SELECT ae_id,
  ae_term,
  trial_name,
  CASE serious
    WHEN 1 THEN 'SAE - Regulatory Reporting Required'
    WHEN 0 THEN 'Non-Serious'
  END
FROM adverse_events
JOIN patients
  ON adverse_events.patient_id = patients.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id;

-- Exercise 9
-- Show each lab result with the flag translated into
-- a display symbol:
--   Normal   → 'OK'
--   Low      → '↓ Below Range'
--   High     → '↑ Above Range'
--   Critical → '!! Critical'
-- Include the test name, result value, and unit.
-- Table: lab_results
SELECT result_value,
  test_name,
  CASE flag
    WHEN 'Normal' THEN 'OK'
    WHEN 'Low' THEN '↓ Below Range'
    WHEN 'High' THEN '↑ Above Range'
    WHEN 'Critical' THEN '!! Critical'
  END
FROM lab_results;

-- -----------------------
-- Simple CASE with Aggregation
-- -----------------------

-- Exercise 10
-- For each trial, count how many patients fall into
-- each status category. Show the trial name alongside
-- counts for Active, Completed, Withdrawn, and Screen Failure.
-- Hint: SUM(CASE status WHEN 'Active' THEN 1 ELSE 0 END)
-- Tables: patients, trials
SELECT trial_name,
  SUM(CASE p.status WHEN 'Active' THEN 1 ELSE 0 END),
  SUM(CASE p.status WHEN 'Completed' THEN 1 ELSE 0 END),
  SUM(CASE p.status WHEN 'Withdrawn' THEN 1 ELSE 0 END),
  SUM(CASE p.status WHEN 'Screen Failure' THEN 1 ELSE 0 END)
FROM trials
JOIN patients AS p
  ON trials.trial_id = p.trial_id
GROUP BY trial_name;

-- Exercise 11
-- Count how many adverse events are SAEs vs non-serious,
-- grouped by trial.
-- Hint: SUM(CASE serious WHEN 1 THEN 1 ELSE 0 END) AS sae_count
-- Tables: adverse_events, patients, trials
SELECT trial_name,
  SUM(CASE WHEN serious = 1 THEN 1 ELSE 0 END) AS sae_count,
  SUM(CASE WHEN serious = 0 THEN 1 ELSE 0 END) AS non_serious_count
FROM adverse_events
JOIN patients
  ON adverse_events.patient_id = patients.patient_id
JOIN trials
  ON patients.trial_id = trials.trial_id
GROUP BY trial_name;

-- Exercise 12 -- For each lab result flag value, count how many results
-- carry that flag, using a translated label as the group name.
-- Show: flag label, count
-- Table: lab_results
SELECT flag,
  CASE flag
    WHEN 'Normal'   THEN 'Within Normal Range'
    WHEN 'Low'      THEN '↓ Below Normal Range'
    WHEN 'High'     THEN '↑ Above Normal Range'
    WHEN 'Critical' THEN '!! Critical Value'
    ELSE 'Unknown'
  END          AS flag_label,
  COUNT(*) AS result_count
FROM lab_results
GROUP BY flag;
