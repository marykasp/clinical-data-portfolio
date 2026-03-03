-- =========================
-- Departments
-- =========================
INSERT INTO
  departments (department_id, department_name)
VALUES
  (1, 'Oncology'),
  (2, 'Neurology'),
  (3, 'Cardiology'),
  (4, 'Immunology');

-- =========================
-- Trials
-- =========================
INSERT INTO
  trials (
    trial_id,
    trial_name,
    phase,
    department_id,
    start_date
  )
VALUES
  (
    101,
    'ONC-201 Immunotherapy Study',
    'Phase II',
    1,
    '2024-01-15'
  ),
  (
    102,
    'NeuroCognitive Decline Trial',
    'Phase III',
    2,
    '2023-09-01'
  ),
  (
    103,
    'CardioRisk Reduction Study',
    'Phase II',
    3,
    '2024-03-10'
  ),
  (
    104,
    'AutoImmune Response Trial',
    'Phase I',
    4,
    '2024-06-01'
  );

-- =========================
-- Patients
-- =========================
INSERT INTO
  patients (patient_id, trial_id, enrollment_date, status)
VALUES
  (1001, 101, '2024-02-01', 'Active'),
  (1002, 101, '2024-02-12', 'Active'),
  (1003, 101, '2024-03-05', 'Withdrawn'),
  (1004, 102, '2023-10-15', 'Completed'),
  (1005, 102, '2023-11-20', 'Active'),
  (1006, 102, '2024-01-05', 'Active'),
  (1007, 103, '2024-03-20', 'Active'),
  (1008, 103, '2024-04-02', 'Screen Failure'),
  (1009, 104, '2024-06-10', 'Active'),
  (1010, 104, '2024-06-18', 'Active');

-- =========================
-- Visits
-- =========================
INSERT INTO
  visits (
    visit_id,
    patient_id,
    visit_date,
    visit_timepoint
  )
VALUES
  -- Oncology Trial Visits
  (1, 1001, '2024-02-05', 'Baseline'),
  (2, 1001, '2024-02-20', 'Cycle 1 Day 1'),
  (3, 1002, '2024-02-18', 'Baseline'),
  -- Neurology Trial Visits
  (4, 1004, '2023-10-20', 'Baseline'),
  (5, 1005, '2023-11-25', 'Baseline'),
  (6, 1006, '2024-01-10', 'Baseline'),
  (7, 1006, '2024-01-24', 'EOT'),
  -- Cardiology Trial Visits
  (8, 1007, '2024-03-25', 'Baseline'),
  (9, 1007, '2024-04-10', 'Cyle 1 Day 1'),
  -- Immunology Trial Visits
  (10, 1009, '2024-06-15', 'Baseline'),
  (11, 1010, '2024-06-22', 'Baseline');
