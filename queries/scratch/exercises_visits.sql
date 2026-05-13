-- ============================================
-- Aggregation Practice Exercises: visits
-- Table columns: visit_id, patient_id, visit_date, visit_timepoint
-- ============================================

-- Exercise 1
-- Count the total number of visits across all patients.
-- Hint: use COUNT(*)

-- Exercise 2
-- Count visits per visit_timepoint (e.g. Baseline, Week 4, Week 8).
-- Hint: GROUP BY visit_timepoint

-- Exercise 3
-- Find the patient with the most visits.
-- Hint: GROUP BY patient_id, ORDER BY COUNT(*) DESC, LIMIT 1

-- Exercise 4
-- List patients who have attended more than 2 visits.
-- Hint: GROUP BY patient_id, then use HAVING with COUNT(*)

-- Exercise 5
-- Count the number of visits that occurred each month.
-- Hint: use strftime('%Y-%m', visit_date) and GROUP BY

-- Exercise 6
-- Find the earliest and latest visit date recorded in the table.
-- Hint: use MIN() and MAX() on visit_date

-- Exercise 7
-- Count visits per patient per timepoint.
-- Hint: GROUP BY patient_id, visit_timepoint
