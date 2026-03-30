-- ============================================
-- Query: Patients With More Than 2 Visits
-- Author: Mary Kasparian
-- Date: 2026-03-30
-- ============================================
-- Business Question:
--   Which patients have attended more than 2 study visits?
--
-- Clinical Relevance:
--   Identifying high-engagement patients helps coordinators
--   confirm adherence to the visit schedule and flag any
--   unexpected extra visits that may need review.
--
-- Clauses practiced:
--   GROUP BY  - aggregate visits per patient
--   HAVING    - filter groups after aggregation (vs WHERE, which filters rows before)
--   ORDER BY  - sort results for easy review
-- ============================================
SELECT
  patient_id,
  COUNT(*) as total_visits
FROM
  visits
GROUP BY
  patient_id
WHERE
  total_visits > 2
ORDER BY
  total_visits DESC;
