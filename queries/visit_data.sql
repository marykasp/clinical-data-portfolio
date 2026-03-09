-- total visits per patient
SELECT
  patient_id,
  COUNT(*) AS total_visits
FROM
  visits
GROUP BY
  patient_id
ORDER BY
  total_visits DESC;

-- total visits per timepoint
SELECT
  visit_timepoint,
  COUNT(*) AS total_visits
FROM
  visits
GROUP BY
  visit_timepoint
ORDER BY
  total_visits DESC;

-- visits per month
SELECT
  strftime('%Y-%m', visit_date) AS month,
  COUNT(*) AS total_visits
FROM
  visits
GROUP BY
  month
ORDER BY
  month;
