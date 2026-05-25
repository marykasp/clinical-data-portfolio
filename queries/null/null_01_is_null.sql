-- ============================================
-- Practice: IS NULL and IS NOT NULL
-- ============================================
-- NULL represents a missing or unknown value.
-- It is NOT the same as zero, an empty string,
-- or any other value — it means "no data".
--
-- NULL cannot be tested with = or !=.
-- These always return NULL (unknown), not TRUE:
--   WHERE column = NULL    ← never works
--   WHERE column != NULL   ← never works
--
-- The correct operators are:
--   WHERE column IS NULL        ← row has no value
--   WHERE column IS NOT NULL    ← row has a value
--
-- Nullable columns in this database:
--   trials.department_id   — trial 120 has no department assigned
--   trials.end_date        — NULL means the trial is still active
--   adverse_events.visit_id       — NULL means reported between visits
--   adverse_events.resolution_date — NULL means the AE is still ongoing
--   visits (via LEFT JOIN)  — patients with no visits return NULL
-- ============================================

-- -----------------------
-- Basic IS NULL
-- -----------------------

-- Exercise 1
-- Which trials have no department assigned?
-- A NULL department_id means the trial has not yet been
-- allocated to a department — a setup gap worth flagging.
-- Table: trials
SELECT trial_name,
  trial_id
FROM trials
WHERE department_id IS NULL;

-- Exercise 2
-- Which trials are still active (no end date recorded)?
-- Table: trials
-- Hint: WHERE end_date IS NULL
SELECT trial_name,
  trial_id
FROM trials
WHERE end_date IS NULL;

-- Exercise 3
-- Which adverse events were reported between visits
-- (not linked to a specific visit)?
-- Table: adverse_events
-- Hint: WHERE visit_id IS NULL
SELECT ae_id,
  ae_term
FROM adverse_events
WHERE visit_id IS NULL;

-- Exercise 4
-- Which adverse events are still ongoing
-- (no resolution date recorded)?
-- These are open safety events that require monitoring.
-- Table: adverse_events
-- Hint: WHERE resolution_date IS NULL
SELECT ae_id,
  ae_term
FROM adverse_events
WHERE resolution_date IS NULL;

-- -----------------------
-- Basic IS NOT NULL
-- -----------------------

-- Exercise 5
-- Which trials have a recorded end date?
-- These are the trials that have formally closed.
-- Table: trials
SELECT trial_id,
  trial_name
FROM trials
WHERE end_date IS NOT NULL;

-- Exercise 6
-- Which adverse events have been resolved?
-- Show the ae_term, onset_date, and resolution_date.
-- Table: adverse_events
-- Hint: WHERE resolution_date IS NOT NULL
SELECT ae_id,
  ae_term
FROM adverse_events
WHERE resolution_date IS NOT NULL;

-- Exercise 7
-- Which adverse events were captured at a specific visit
-- (visit_id is not null)?
-- Table: adverse_events
SELECT ae_id,
  ae_term
FROM adverse_events
WHERE visit_id IS NOT NULL;

-- Exercise 8
-- Which trials have a department assigned?
-- Table: trials
SELECT trial_id,
  trial_name
FROM trials
WHERE department_id IS NOT NULL;

-- -----------------------
-- IS NULL with a LEFT JOIN
-- -----------------------
-- The LEFT JOIN + IS NULL pattern is the standard way
-- to find rows on the left side with NO match on the right.
-- ============================================

-- Exercise 9
-- Which patients have no visits recorded at all?
-- These are likely newly enrolled patients awaiting
-- their baseline appointment.
-- Tables: patients, visits
-- Hint: FROM patients LEFT JOIN visits ... WHERE visits.visit_id IS NULL
SELECT patients.patient_id
FROM patients
LEFT JOIN visits
  ON patients.patient_id = visits.patient_id
WHERE visits.visit_id IS NULL;

-- SELECT patients.patient_id,
--   visits.visit_id
-- FROM patients
-- LEFT JOIN visits
--   ON patients.patient_id = visits.patient_id;

-- Exercise 10
-- Which trials have no patients enrolled yet?
-- Tables: trials, patients
-- Hint: FROM trials LEFT JOIN patients ... WHERE patients.patient_id IS NULL
SELECT trials.trial_name,
  trials.trial_id
FROM trials
LEFT JOIN patients
  ON trials.trial_id = patients.trial_id
WHERE patients.patient_id IS NULL;

-- Exercise 11
-- Which trials have no adverse events reported across any of their patients?
-- Tables: trials, patients, adverse_events
-- Hint: LEFT JOIN patients, then LEFT JOIN adverse_events,
--       WHERE adverse_events.ae_id IS NULL
SELECT trials.trial_name,
  trials.trial_id
FROM trials
LEFT JOIN patients
  ON trials.trial_id = patients.trial_id
LEFT JOIN adverse_events
  ON patients.patient_id = adverse_events.patient_id
WHERE adverse_events.ae_id IS NULL;

-- -----------------------
-- IS NULL with Aggregation
-- -----------------------

-- Exercise 12
-- How many adverse events are still ongoing (unresolved)?
-- Table: adverse_events
-- Hint: COUNT(*) WHERE resolution_date IS NULL
SELECT COUNT(*) AS no_adverse_events
FROM adverse_events
WHERE resolution_date IS NULL;

-- Exercise 13
-- For each trial, how many patients have no visits yet?
-- Show trial name and the count of visit-less patients.
-- Tables: trials, patients, visits
SELECT COUNT(*) AS patients_no_visits,
  trials.trial_name
FROM trials
JOIN patients
  ON trials.trial_id = patients.trial_id
LEFT JOIN visits
  ON patients.patient_id = visits.patient_id
WHERE visits.visit_id IS NULL
GROUP BY trials.trial_name;

-- Exercise 14
-- How many adverse events were reported between visits
-- vs. linked to a specific visit?
-- Show both counts side by side.
-- Table: adverse_events
-- Hint: COUNT(visit_id) counts non-NULLs only;
--       COUNT(*) - COUNT(visit_id) gives the NULL count
SELECT 
  COUNT(visit_id) AS linked_to_visit,
  COUNT(*) - COUNT(visit_id) AS not_linked_to_visit,
  visit_id
FROM adverse_events
GROUP BY visit_id
