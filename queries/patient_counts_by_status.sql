-- ============================================
-- Query: Patient Count by Enrollment Status
-- Author: Mary Kasparian
-- Date: 2025-03-30
-- ============================================
-- Business Question:
--   How many patients are currently active, withdrawn,
--   completed, or screened in the trial?
--
-- Clinical Relevance:
--   Monitoring enrollment status distribution helps
--   trial coordinators identify recruitment gaps and
--   flag trials at risk of under-enrollment.
--   Also is helpful to the lab teams who need to coordinate tracking of kits
--   available on site for specific timepoints.
-- ============================================
SELECT
  status,
  COUNT(*) as patient_count
FROM
  patients
GROUP BY
  status
ORDER BY
  patient_count DESC;
