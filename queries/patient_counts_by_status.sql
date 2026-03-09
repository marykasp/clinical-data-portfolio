-- how many patients have each status?
SELECT
  status,
  COUNT(*) as patient_count
FROM
  patients
GROUP BY
  status
ORDER BY
  patient_count DESC;
