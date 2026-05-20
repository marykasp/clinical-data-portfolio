-- =========================
-- Departments
-- =========================
INSERT INTO departments (department_id, department_name)
VALUES
  (1, 'Oncology'),
  (2, 'Neurology'),
  (3, 'Cardiology'),
  (4, 'Immunology'),
  (5, 'Hematology-Oncology'),
  (6, 'Neuro-Oncology'),
  (7, 'Cardio-Oncology'),
  (8, 'Rheumatology');

-- =========================
-- Trials
-- =========================
INSERT INTO trials (trial_id, trial_name, phase, status, department_id, principal_investigator, sponsor, start_date, end_date, target_enrollment)
VALUES
  (101, 'ONC-201 Immunotherapy Study',                    'Phase II',  'Enrolling',     1, 'Dr. Sarah Chen',        'Novagen Therapeutics',         '2024-01-15', NULL,         40),
  (105, 'ONC-301 Targeted Therapy Study',                 'Phase I',   'Completed',     1, 'Dr. Sarah Chen',        'Novagen Therapeutics',         '2023-06-01', '2024-08-15', 15),
  (106, 'ONC-401 Combination Chemotherapy Trial',         'Phase III', 'Enrolling',     1, 'Dr. Marcus Williams',   'Vektris Oncology',             '2022-11-01', NULL,         120),
  (102, 'NeuroCognitive Decline Trial',                   'Phase III', 'Enrolling',     2, 'Dr. James Park',        'NeurAlign Sciences',           '2023-09-01', NULL,         80),
  (107, 'NEURO-101 Early ALS Biomarker Study',            'Phase I',   'Enrolling',     2, 'Dr. James Park',        'NeurAlign Sciences',           '2024-04-01', NULL,         12),
  (108, 'NEURO-205 MS Remission Trial',                   'Phase II',  'Enrolling',     2, 'Dr. Rachel Cohen',      'NeurAlign Sciences',           '2023-07-01', NULL,         50),
  (103, 'CardioRisk Reduction Study',                     'Phase II',  'Enrolling',     3, 'Dr. Michael Torres',    'CardioForte Pharmaceuticals',  '2024-03-10', NULL,         45),
  (109, 'CARDIO-102 Heart Failure Management Study',      'Phase III', 'Enrolling',     3, 'Dr. Michael Torres',    'CardioForte Pharmaceuticals',  '2023-01-15', NULL,         150),
  (104, 'AutoImmune Response Trial',                      'Phase I',   'Enrolling',     4, 'Dr. David Kim',         'Praxis Immunology',            '2024-06-01', NULL,         18),
  (110, 'IMM-301 Systemic Lupus Treatment Study',         'Phase II',  'Enrolling',     4, 'Dr. David Kim',         'Praxis Immunology',            '2024-02-01', NULL,         40),
  (111, 'HEME-201 AML Remission Induction Study',         'Phase II',  'Enrolling',     5, 'Dr. Patricia Anderson', 'Vektris Oncology',             '2023-08-01', NULL,         35),
  (112, 'HEME-301 CLL Maintenance Trial',                 'Phase III', 'Enrolling',     5, 'Dr. Patricia Anderson', 'Vektris Oncology',             '2022-09-01', NULL,         100),
  (113, 'NEUROONC-101 Glioblastoma Immunotherapy Study',  'Phase I',   'Enrolling',     6, 'Dr. Thomas Wright',     'NeurAlign Sciences',           '2024-05-01', NULL,         10),
  (114, 'NEUROONC-201 Brain Metastasis Response Trial',   'Phase II',  'Enrolling',     6, 'Dr. Thomas Wright',     'NeurAlign Sciences',           '2023-10-01', NULL,         30),
  (115, 'CARDIONC-101 Cardiac Safety in Oncology Study',  'Phase II',  'Enrolling',     7, 'Dr. Jennifer Liu',      'CardioForte Pharmaceuticals',  '2024-01-01', NULL,         25),
  (116, 'RHEUM-201 RA Biologic Dose Study',               'Phase II',  'Enrolling',     8, 'Dr. Amanda Foster',     'Celantis Biologics',           '2023-05-01', NULL,         45),
  (117, 'RHEUM-301 Psoriatic Arthritis Maintenance Trial','Phase III', 'Enrolling',     8, 'Dr. Amanda Foster',     'Celantis Biologics',           '2022-08-01', NULL,         90),
  (118, 'ONC-601 Novel CAR-T Pilot Study',               'Phase I',   'Not Yet Open',  1, 'Dr. Sarah Chen',        'Novagen Therapeutics',         '2025-03-01', NULL,         8),
  (119, 'RHEUM-401 Juvenile Arthritis Biologic Study',   'Phase II',  'Not Yet Open',  8, 'Dr. Amanda Foster',     'Celantis Biologics',           '2025-04-15', NULL,         30),
  (120, 'PILOT-001 Cross-Departmental Biomarker Study',  'Phase I',   'Not Yet Open',  NULL, 'Dr. Elena Rodriguez', 'Astellar Biosciences',         '2025-05-01', NULL,         12);

-- =========================
-- Trial Arms
-- =========================
-- Arms define the treatment groups within each trial.
-- Patients are assigned to one arm at randomization.
INSERT INTO trial_arms (arm_id, trial_id, arm_name, arm_type)
VALUES
  -- Trial 101: ONC-201 Immunotherapy (Phase II, 2 arms)
  (1,  101, 'Immunotherapy Monotherapy', 'Treatment'),
  (2,  101, 'Placebo',                   'Placebo'),
  -- Trial 102: NeuroCognitive Decline (Phase III, 2 arms)
  (3,  102, 'Active Treatment',          'Treatment'),
  (4,  102, 'Placebo',                   'Placebo'),
  -- Trial 103: CardioRisk Reduction (Phase II, 2 arms)
  (5,  103, 'Intervention',              'Treatment'),
  (6,  103, 'Standard Care',             'Active Comparator'),
  -- Trial 104: AutoImmune Response (Phase I, 2 arms)
  (7,  104, 'Experimental Biologic',     'Treatment'),
  (8,  104, 'Placebo',                   'Placebo'),
  -- Trial 105: ONC-301 Targeted Therapy (Phase I, 2 dose cohorts)
  (9,  105, 'Cohort A — Low Dose',       'Treatment'),
  (10, 105, 'Cohort B — High Dose',      'Treatment'),
  -- Trial 106: ONC-401 Combination Chemo (Phase III, 2 arms)
  (11, 106, 'Experimental Combination',  'Treatment'),
  (12, 106, 'Standard Chemotherapy',     'Active Comparator'),
  -- Trial 107: NEURO-101 ALS (Phase I, single arm)
  (13, 107, 'Single Arm',                'Treatment'),
  -- Trial 108: NEURO-205 MS (Phase II, 3 arms)
  (14, 108, 'High Dose',                 'Treatment'),
  (15, 108, 'Low Dose',                  'Treatment'),
  (16, 108, 'Placebo',                   'Placebo'),
  -- Trial 109: CARDIO-102 Heart Failure (Phase III, 3 arms)
  (17, 109, 'Drug A',                    'Treatment'),
  (18, 109, 'Drug B',                    'Treatment'),
  (19, 109, 'Placebo',                   'Placebo'),
  -- Trial 110: IMM-301 Lupus (Phase II, 2 arms)
  (20, 110, 'Treatment',                 'Treatment'),
  (21, 110, 'Placebo',                   'Placebo'),
  -- Trial 111: HEME-201 AML (Phase II, 2 arms)
  (22, 111, 'Experimental Regimen',              'Treatment'),
  (23, 111, 'Standard Induction Chemotherapy',   'Active Comparator'),
  -- Trial 112: HEME-301 CLL (Phase III, 2 arms)
  (24, 112, 'Maintenance Treatment',     'Treatment'),
  (25, 112, 'Observation',               'Active Comparator'),
  -- Trial 113: NEUROONC-101 GBM (Phase I, 2 dose levels)
  (26, 113, 'Dose Level 1',              'Treatment'),
  (27, 113, 'Dose Level 2',              'Treatment'),
  -- Trial 114: NEUROONC-201 Brain Mets (Phase II, 2 arms)
  (28, 114, 'Combination Therapy',       'Treatment'),
  (29, 114, 'Standard Therapy',          'Active Comparator'),
  -- Trial 115: CARDIONC-101 (Phase II, 2 observational arms)
  (30, 115, 'Observation Arm A',         'Observational'),
  (31, 115, 'Observation Arm B',         'Observational'),
  -- Trial 116: RHEUM-201 RA (Phase II, 3 arms)
  (32, 116, 'High Dose Biologic',        'Treatment'),
  (33, 116, 'Low Dose Biologic',         'Treatment'),
  (34, 116, 'Placebo',                   'Placebo'),
  -- Trial 117: RHEUM-301 PsA (Phase III, 3 arms)
  (35, 117, 'Biologic Therapy',          'Treatment'),
  (36, 117, 'Conventional DMARD',        'Active Comparator'),
  (37, 117, 'Placebo',                   'Placebo'),
  -- Trial 118: ONC-601 CAR-T (Phase I, single arm)
  (38, 118, 'Single Arm',                'Treatment'),
  -- Trial 119: RHEUM-401 (Phase II, 2 arms)
  (39, 119, 'Treatment',                 'Treatment'),
  (40, 119, 'Placebo',                   'Placebo'),
  -- Trial 120: PILOT-001 Cross-Departmental (Phase I, observational)
  (41, 120, 'Observational',             'Observational');

-- =========================
-- Patients
-- =========================
-- age: years at enrollment  |  weight_kg: body weight at screening
-- date_of_birth: derived from age and enrollment year
-- sex: Male | Female | Other
-- race: White | Black or African American | Hispanic or Latino | Asian | More Than One Race
-- arm_id: links to the trial arm the patient is assigned to
INSERT INTO patients (patient_id, trial_id, arm_id, enrollment_date, status, age, date_of_birth, sex, race, weight_kg)
VALUES
  -- Trial 101: ONC-201 Immunotherapy Study (arms 1=Immunotherapy, 2=Placebo)
  (1001, 101, 1, '2024-02-01', 'Active',         52, '1971-08-14', 'Female', 'White',                       78.4),
  (1002, 101, 2, '2024-02-12', 'Active',         61, '1962-11-20', 'Male',   'White',                       82.1),
  (1003, 101, 1, '2024-03-05', 'Withdrawn',      47, '1977-01-05', 'Female', 'Hispanic or Latino',          65.3),
  (1011, 101, 2, '2024-02-20', 'Active',         58, '1966-09-18', 'Male',   'Black or African American',   91.2),
  (1012, 101, 1, '2024-03-01', 'Active',         44, '1980-05-11', 'Female', 'White',                       70.5),
  (1013, 101, 2, '2024-02-10', 'Completed',      67, '1957-11-28', 'Male',   'White',                       74.8),
  (1014, 101, 1, '2024-03-10', 'Withdrawn',      55, '1969-04-07', 'Female', 'Asian',                       88.0),
  (1015, 101, 1, '2024-03-15', 'Screen Failure', 49, '1975-08-20', 'Male',   'White',                       62.4),
  (1016, 101, 2, '2024-04-01', 'Active',         63, '1961-02-14', 'Female', 'White',                       79.6),
  -- Trial 102: NeuroCognitive Decline Trial (arms 3=Active Treatment, 4=Placebo)
  (1004, 102, 3, '2023-10-15', 'Completed',      72, '1951-05-08', 'Male',   'White',                       68.2),
  (1005, 102, 4, '2023-11-20', 'Active',         65, '1958-10-15', 'Female', 'White',                       75.9),
  (1006, 102, 3, '2024-01-05', 'Active',         78, '1946-03-27', 'Male',   'Black or African American',   61.4),
  (1017, 102, 3, '2023-10-01', 'Completed',      70, '1953-07-14', 'Female', 'White',                       83.5),
  (1018, 102, 4, '2023-09-15', 'Completed',      68, '1955-12-03', 'Male',   'White',                       71.3),
  (1019, 102, 3, '2024-02-01', 'Active',         74, '1950-02-19', 'Female', 'White',                       66.8),
  (1020, 102, 4, '2023-12-15', 'Withdrawn',      61, '1962-08-11', 'Male',   'Hispanic or Latino',          77.4),
  (1021, 102, 3, '2024-02-15', 'Active',         80, '1944-04-22', 'Female', 'Asian',                       59.2),
  (1022, 102, 4, '2024-03-01', 'Screen Failure', 56, '1968-01-09', 'Male',   'White',                       84.1),
  (1023, 102, 3, '2023-11-01', 'Completed',      73, '1950-09-17', 'Female', 'White',                       69.7),
  -- Trial 103: CardioRisk Reduction Study (arms 5=Intervention, 6=Standard Care)
  (1007, 103, 5, '2024-03-20', 'Active',         62, '1962-01-25', 'Male',   'White',                       95.3),
  (1008, 103, 6, '2024-04-02', 'Screen Failure', 58, '1966-05-13', 'Male',   'Black or African American',  102.4),
  (1024, 103, 5, '2024-03-25', 'Active',         71, '1953-08-06', 'Male',   'White',                       88.7),
  (1025, 103, 6, '2024-04-10', 'Active',         55, '1969-03-28', 'Female', 'White',                       76.2),
  (1026, 103, 5, '2024-03-18', 'Completed',      67, '1957-11-02', 'Male',   'Hispanic or Latino',          83.9),
  (1027, 103, 6, '2024-04-15', 'Withdrawn',      60, '1964-07-18', 'Male',   'White',                       91.5),
  (1028, 103, 5, '2024-04-20', 'Active',         74, '1950-10-31', 'Female', 'White',                       79.1),
  -- Trial 104: AutoImmune Response Trial (arms 7=Experimental Biologic, 8=Placebo)
  (1009, 104, 7, '2024-06-10', 'Active',         34, '1990-06-03', 'Female', 'White',                       61.8),
  (1010, 104, 8, '2024-06-18', 'Active',         42, '1982-02-17', 'Female', 'Hispanic or Latino',          68.3),
  (1029, 104, 7, '2024-06-22', 'Active',         29, '1995-04-25', 'Female', 'White',                       55.4),
  (1030, 104, 8, '2024-07-01', 'Withdrawn',      38, '1986-09-14', 'Male',   'White',                       72.6),
  (1031, 104, 7, '2024-07-08', 'Active',         51, '1973-01-08', 'Female', 'Asian',                       64.9),
  (1032, 104, 8, '2024-07-15', 'Screen Failure', 27, '1997-07-22', 'Female', 'White',                       58.2),
  (1033, 104, 7, '2024-07-20', 'Active',         45, '1979-11-30', 'Female', 'Black or African American',   66.7),
  -- Trial 105: ONC-301 Targeted Therapy Study (arms 9=Cohort A Low, 10=Cohort B High)
  (1034, 105, 9,  '2023-07-01', 'Active',         57, '1966-06-20', 'Male',   'White',                       80.2),
  (1035, 105, 10, '2023-07-15', 'Completed',      64, '1959-03-11', 'Female', 'White',                       73.5),
  (1036, 105, 9,  '2023-08-01', 'Screen Failure', 51, '1972-08-04', 'Male',   'Asian',                       69.8),
  (1037, 105, 10, '2023-08-20', 'Withdrawn',      60, '1963-10-29', 'Male',   'White',                       85.4),
  -- Trial 106: ONC-401 Combination Chemotherapy Trial (arms 11=Experimental, 12=Standard)
  (1038, 106, 11, '2023-01-05', 'Completed',      54, '1969-01-07', 'Female', 'White',                       76.3),
  (1039, 106, 12, '2023-01-20', 'Completed',      69, '1954-04-16', 'Male',   'Black or African American',   81.7),
  (1040, 106, 11, '2023-02-10', 'Active',         48, '1975-02-25', 'Female', 'White',                       72.4),
  (1041, 106, 12, '2023-03-01', 'Withdrawn',      62, '1961-03-02', 'Male',   'White',                       90.1),
  (1042, 106, 11, '2023-03-15', 'Active',         57, '1966-08-19', 'Female', 'Hispanic or Latino',          67.9),
  -- Trial 107: NEURO-101 Early ALS Biomarker Study (arm 13=Single Arm)
  (1043, 107, 13, '2024-05-01', 'Active',         45, '1979-05-03', 'Male',   'White',                       74.6),
  (1044, 107, 13, '2024-05-15', 'Active',         52, '1972-04-18', 'Female', 'White',                       81.3),
  (1045, 107, 13, '2024-06-01', 'Screen Failure', 38, '1986-06-09', 'Male',   'Black or African American',   65.2),
  (1046, 107, 13, '2024-06-10', 'Active',         61, '1963-06-12', 'Male',   'White',                       77.8),
  -- Trial 108: NEURO-205 MS Remission Trial (arms 14=High Dose, 15=Low Dose, 16=Placebo)
  (1047, 108, 14, '2023-08-01', 'Completed',      36, '1987-08-03', 'Female', 'White',                       62.1),
  (1048, 108, 15, '2023-08-20', 'Completed',      42, '1981-08-18', 'Female', 'Hispanic or Latino',          70.4),
  (1049, 108, 16, '2023-09-10', 'Active',         29, '1994-09-12', 'Female', 'White',                       57.9),
  (1050, 108, 14, '2023-10-01', 'Withdrawn',      48, '1975-10-03', 'Male',   'White',                       75.6),
  (1051, 108, 15, '2023-10-20', 'Active',         33, '1990-10-22', 'Female', 'Asian',                       63.8),
  -- Trial 109: CARDIO-102 Heart Failure Management Study (arms 17=Drug A, 18=Drug B, 19=Placebo)
  (1052, 109, 17, '2023-02-01', 'Completed',      65, '1958-02-03', 'Male',   'White',                       88.4),
  (1053, 109, 18, '2023-02-15', 'Completed',      72, '1951-02-17', 'Male',   'White',                       79.2),
  (1054, 109, 19, '2023-03-01', 'Active',         58, '1965-03-03', 'Male',   'Black or African American',   96.7),
  (1055, 109, 17, '2023-03-20', 'Active',         68, '1955-03-22', 'Female', 'White',                       84.3),
  (1056, 109, 18, '2023-04-01', 'Withdrawn',      61, '1962-04-03', 'Male',   'Hispanic or Latino',          91.8),
  (1057, 109, 19, '2023-04-15', 'Screen Failure', 74, '1949-04-17', 'Female', 'White',                       73.6),
  -- Trial 110: IMM-301 Systemic Lupus Treatment Study (arms 20=Treatment, 21=Placebo)
  (1058, 110, 20, '2024-02-15', 'Active',         32, '1992-02-17', 'Female', 'White',                       58.4),
  (1059, 110, 21, '2024-03-01', 'Active',         27, '1997-03-03', 'Female', 'Asian',                       52.7),
  (1060, 110, 20, '2024-03-20', 'Withdrawn',      44, '1980-03-22', 'Female', 'Hispanic or Latino',          66.3),
  (1061, 110, 21, '2024-04-01', 'Active',         38, '1986-04-03', 'Female', 'Black or African American',   61.9),
  -- Trial 111: HEME-201 AML Remission Induction Study (arms 22=Experimental, 23=Standard)
  (1062, 111, 22, '2023-09-01', 'Completed',      58, '1965-09-03', 'Male',   'White',                       77.2),
  (1063, 111, 23, '2023-09-15', 'Active',         65, '1958-09-17', 'Female', 'White',                       82.5),
  (1064, 111, 22, '2023-10-01', 'Withdrawn',      71, '1952-10-03', 'Male',   'Black or African American',   68.9),
  (1065, 111, 23, '2023-10-20', 'Active',         54, '1969-10-22', 'Female', 'White',                       74.6),
  (1066, 111, 22, '2023-11-01', 'Screen Failure', 49, '1974-11-03', 'Male',   'Asian',                       80.3),
  -- Trial 112: HEME-301 CLL Maintenance Trial (arms 24=Maintenance, 25=Observation)
  (1067, 112, 24, '2022-10-01', 'Completed',      68, '1954-10-03', 'Male',   'White',                       79.4),
  (1068, 112, 25, '2022-10-15', 'Completed',      74, '1948-10-17', 'Female', 'White',                       71.8),
  (1069, 112, 24, '2022-11-01', 'Active',         61, '1961-11-03', 'Male',   'Hispanic or Latino',          85.2),
  (1070, 112, 25, '2022-11-20', 'Active',         77, '1945-11-22', 'Male',   'White',                       66.5),
  (1071, 112, 24, '2022-12-01', 'Withdrawn',      63, '1959-12-03', 'Female', 'White',                       78.9),
  -- Trial 113: NEUROONC-101 Glioblastoma Immunotherapy Study (arms 26=Dose Level 1, 27=Dose Level 2)
  (1072, 113, 26, '2024-05-15', 'Active',         55, '1969-05-17', 'Male',   'White',                       82.1),
  (1073, 113, 27, '2024-06-01', 'Active',         47, '1977-06-03', 'Female', 'White',                       75.4),
  (1074, 113, 26, '2024-06-15', 'Screen Failure', 62, '1962-06-17', 'Male',   'Black or African American',   68.7),
  (1075, 113, 27, '2024-07-01', 'Active',         51, '1973-07-03', 'Male',   'White',                       79.8),
  -- Trial 114: NEUROONC-201 Brain Metastasis Response Trial (arms 28=Combination, 29=Standard)
  (1076, 114, 28, '2023-11-01', 'Completed',      59, '1964-11-03', 'Female', 'White',                       73.6),
  (1077, 114, 29, '2023-11-15', 'Active',         64, '1959-11-17', 'Male',   'White',                       80.9),
  (1078, 114, 28, '2023-12-01', 'Withdrawn',      48, '1975-12-03', 'Female', 'Hispanic or Latino',          67.3),
  (1079, 114, 29, '2024-01-10', 'Active',         53, '1971-01-12', 'Male',   'White',                       76.4),
  -- Trial 115: CARDIONC-101 Cardiac Safety in Oncology Study (arms 30=Arm A, 31=Arm B)
  (1080, 115, 30, '2024-01-15', 'Active',         56, '1968-01-17', 'Male',   'White',                       81.7),
  (1081, 115, 31, '2024-02-01', 'Active',         63, '1961-02-03', 'Female', 'White',                       76.2),
  (1082, 115, 30, '2024-02-15', 'Withdrawn',      49, '1975-02-17', 'Male',   'Black or African American',   69.4),
  (1083, 115, 31, '2024-03-01', 'Active',         58, '1966-03-03', 'Male',   'White',                       87.3),
  -- Trial 116: RHEUM-201 RA Biologic Dose Study (arms 32=High Dose, 33=Low Dose, 34=Placebo)
  (1084, 116, 32, '2023-06-01', 'Completed',      46, '1977-06-03', 'Female', 'White',                       65.8),
  (1085, 116, 33, '2023-06-20', 'Active',         52, '1971-06-22', 'Female', 'White',                       71.4),
  (1086, 116, 34, '2023-07-10', 'Withdrawn',      38, '1985-07-12', 'Female', 'Hispanic or Latino',          60.2),
  (1087, 116, 32, '2023-07-25', 'Active',         61, '1962-07-27', 'Male',   'White',                       77.9),
  (1088, 116, 33, '2023-08-15', 'Screen Failure', 29, '1994-08-17', 'Female', 'Asian',                       56.3),
  -- Trial 117: RHEUM-301 Psoriatic Arthritis Maintenance Trial (arms 35=Biologic, 36=DMARD, 37=Placebo)
  (1089, 117, 35, '2022-09-01', 'Completed',      43, '1979-09-03', 'Female', 'White',                       82.6),
  (1090, 117, 36, '2022-09-20', 'Completed',      51, '1971-09-22', 'Male',   'White',                       75.3),
  (1091, 117, 37, '2022-10-05', 'Active',         37, '1985-10-07', 'Female', 'Hispanic or Latino',          68.9),
  (1092, 117, 35, '2022-10-25', 'Active',         48, '1974-10-27', 'Male',   'White',                       79.4),
  (1093, 117, 36, '2022-11-10', 'Withdrawn',      55, '1967-11-12', 'Female', 'White',                       84.1),
  -- Newly enrolled patients — no visits scheduled yet
  (1094, 101, 1, '2024-10-15', 'Active',         56, '1968-06-30', 'Male',   'Hispanic or Latino',          83.2),
  (1095, 103, 6, '2024-10-22', 'Active',         64, '1960-04-08', 'Male',   'White',                       87.4),
  (1096, 104, 7, '2024-11-01', 'Active',         33, '1991-10-05', 'Female', 'White',                       63.1),
  (1097, 107, 13,'2024-11-08', 'Active',         48, '1976-11-06', 'Female', 'White',                       76.9),
  (1098, 110, 20,'2024-11-12', 'Active',         30, '1994-11-14', 'Female', 'White',                       57.8),
  (1099, 113, 26,'2024-11-20', 'Active',         60, '1964-11-22', 'Male',   'White',                       81.3),
  (1100, 116, 34,'2024-12-01', 'Active',         44, '1980-12-03', 'Female', 'White',                       68.5),
  (1101, 101, 2, '2024-12-10', 'Active',         50, '1974-09-12', 'Female', 'White',                       77.6);

-- =========================
-- Visits
-- =========================
INSERT INTO visits (visit_id, patient_id, visit_date, visit_timepoint, duration_minutes)
VALUES
  -- Trial 101: ONC-201 Immunotherapy Study
  (1,   1001, '2024-02-05', 'Baseline',       105),
  (2,   1001, '2024-02-20', 'Cycle 1 Day 1',  165),
  (12,  1001, '2024-03-12', 'Cycle 2 Day 1',  120),
  (13,  1001, '2024-04-02', 'Cycle 3 Day 1',  115),
  (3,   1002, '2024-02-18', 'Baseline',        95),
  (14,  1002, '2024-03-04', 'Cycle 1 Day 1',  170),
  (15,  1002, '2024-03-25', 'Cycle 2 Day 1',  125),
  (16,  1003, '2024-03-10', 'Baseline',       100),
  (17,  1011, '2024-02-25', 'Baseline',       110),
  (18,  1011, '2024-03-10', 'Cycle 1 Day 1',  160),
  (19,  1011, '2024-03-31', 'Cycle 2 Day 1',  130),
  (20,  1011, '2024-04-21', 'Cycle 3 Day 1',  120),
  (21,  1012, '2024-03-06', 'Baseline',        90),
  (22,  1012, '2024-03-21', 'Cycle 1 Day 1',  175),
  (23,  1013, '2024-02-15', 'Baseline',       115),
  (24,  1013, '2024-03-01', 'Cycle 1 Day 1',  155),
  (25,  1013, '2024-03-22', 'Cycle 2 Day 1',  120),
  (26,  1013, '2024-04-12', 'Cycle 3 Day 1',  110),
  (27,  1013, '2024-05-03', 'EOT',             75),
  (28,  1014, '2024-03-15', 'Baseline',        95),
  (29,  1014, '2024-03-30', 'Cycle 1 Day 1',  160),
  (30,  1015, '2024-03-20', 'Baseline',        85),
  (31,  1016, '2024-04-06', 'Baseline',       100),
  (32,  1016, '2024-04-21', 'Cycle 1 Day 1',  165),
  (33,  1016, '2024-05-12', 'Cycle 2 Day 1',  120),
  -- Trial 102: NeuroCognitive Decline Trial
  (4,   1004, '2023-10-20', 'Baseline',       120),
  (34,  1004, '2023-11-17', 'Week 4',          50),
  (35,  1004, '2024-01-12', 'Week 12',         55),
  (36,  1004, '2024-04-05', 'Week 24',         50),
  (37,  1004, '2024-05-10', 'EOT',             80),
  (38,  1004, '2024-06-07', 'Follow-up',       40),
  (5,   1005, '2023-11-25', 'Baseline',       115),
  (39,  1005, '2023-12-23', 'Week 4',          45),
  (40,  1005, '2024-02-17', 'Week 12',         50),
  (6,   1006, '2024-01-10', 'Baseline',       110),
  (7,   1006, '2024-01-24', 'EOT',             70),
  (41,  1017, '2023-10-06', 'Baseline',       120),
  (42,  1017, '2023-11-03', 'Week 4',          45),
  (43,  1017, '2023-12-29', 'Week 12',         55),
  (44,  1017, '2024-03-23', 'Week 24',         50),
  (45,  1017, '2024-04-27', 'EOT',             75),
  (46,  1018, '2023-09-20', 'Baseline',       120),
  (47,  1018, '2023-10-18', 'Week 4',          50),
  (48,  1018, '2023-12-13', 'Week 12',         55),
  (49,  1018, '2024-03-07', 'Week 24',         45),
  (50,  1018, '2024-04-11', 'EOT',             80),
  (51,  1018, '2024-05-09', 'Follow-up',       35),
  (52,  1019, '2024-02-07', 'Baseline',       115),
  (53,  1019, '2024-03-06', 'Week 4',          45),
  (54,  1020, '2023-12-20', 'Baseline',       110),
  (55,  1021, '2024-02-20', 'Baseline',       120),
  (56,  1021, '2024-03-19', 'Week 4',          50),
  (57,  1021, '2024-05-14', 'Week 12',         55),
  (58,  1022, '2024-03-06', 'Baseline',        90),
  (59,  1023, '2023-11-06', 'Baseline',       120),
  (60,  1023, '2023-12-04', 'Week 4',          50),
  (61,  1023, '2024-01-29', 'Week 12',         55),
  (62,  1023, '2024-04-24', 'Week 24',         50),
  (63,  1023, '2024-05-29', 'EOT',             80),
  -- Trial 103: CardioRisk Reduction Study
  (8,   1007, '2024-03-25', 'Baseline',       100),
  (9,   1007, '2024-04-10', 'Month 1',         60),
  (64,  1007, '2024-06-10', 'Month 3',         65),
  (65,  1008, '2024-04-07', 'Baseline',        85),
  (66,  1024, '2024-03-30', 'Baseline',       110),
  (67,  1024, '2024-04-30', 'Month 1',         60),
  (68,  1024, '2024-06-30', 'Month 3',         65),
  (69,  1024, '2024-09-30', 'Month 6',         60),
  (70,  1025, '2024-04-15', 'Baseline',        95),
  (71,  1025, '2024-05-15', 'Month 1',         55),
  (72,  1026, '2024-03-23', 'Baseline',       105),
  (73,  1026, '2024-04-23', 'Month 1',         60),
  (74,  1026, '2024-06-23', 'Month 3',         65),
  (75,  1026, '2024-09-23', 'Month 6',         60),
  (76,  1026, '2024-10-23', 'EOT',             75),
  (77,  1027, '2024-04-20', 'Baseline',        90),
  (78,  1028, '2024-04-25', 'Baseline',       100),
  (79,  1028, '2024-05-25', 'Month 1',         60),
  (80,  1028, '2024-07-25', 'Month 3',         65),
  -- Trial 104: AutoImmune Response Trial
  (10,  1009, '2024-06-15', 'Baseline',        95),
  (81,  1009, '2024-06-29', 'Week 2',          35),
  (82,  1009, '2024-07-13', 'Week 4',          40),
  (11,  1010, '2024-06-22', 'Baseline',       100),
  (83,  1010, '2024-07-06', 'Week 2',          35),
  (84,  1010, '2024-07-20', 'Week 4',          40),
  (85,  1010, '2024-08-17', 'Week 8',          45),
  (86,  1029, '2024-06-27', 'Baseline',        90),
  (87,  1029, '2024-07-11', 'Week 2',          35),
  (88,  1029, '2024-07-25', 'Week 4',          40),
  (89,  1030, '2024-07-06', 'Baseline',        85),
  (90,  1031, '2024-07-13', 'Baseline',        95),
  (91,  1031, '2024-07-27', 'Week 2',          35),
  (92,  1032, '2024-07-20', 'Baseline',        80),
  (93,  1033, '2024-07-25', 'Baseline',        95),
  (94,  1033, '2024-08-08', 'Week 2',          35),
  (95,  1033, '2024-08-22', 'Week 4',          40),
  (96,  1033, '2024-09-19', 'Week 8',          45),
  -- Trial 105: ONC-301 Targeted Therapy Study
  (97,  1034, '2023-07-06', 'Baseline',       100),
  (98,  1034, '2023-07-14', 'Day 8',           30),
  (99,  1034, '2023-07-21', 'Day 15',          35),
  (100, 1035, '2023-07-20', 'Baseline',       110),
  (101, 1035, '2023-07-28', 'Day 8',           30),
  (102, 1035, '2023-08-04', 'Day 15',          30),
  (103, 1035, '2023-08-25', 'EOT',             65),
  (104, 1036, '2023-08-06', 'Baseline',        85),
  (105, 1037, '2023-08-25', 'Baseline',        95),
  (106, 1037, '2023-09-02', 'Day 8',           30),
  -- Trial 106: ONC-401 Combination Chemotherapy Trial
  (107, 1038, '2023-01-10', 'Baseline',       120),
  (108, 1038, '2023-01-24', 'Cycle 1 Day 1',  180),
  (109, 1038, '2023-02-14', 'Cycle 2 Day 1',  150),
  (110, 1038, '2023-03-07', 'Cycle 3 Day 1',  145),
  (111, 1038, '2023-03-28', 'Cycle 4 Day 1',  140),
  (112, 1038, '2023-04-18', 'EOT',             85),
  (113, 1038, '2023-05-16', 'Follow-up',       40),
  (114, 1039, '2023-01-25', 'Baseline',       115),
  (115, 1039, '2023-02-08', 'Cycle 1 Day 1',  175),
  (116, 1039, '2023-03-01', 'Cycle 2 Day 1',  145),
  (117, 1039, '2023-03-22', 'Cycle 3 Day 1',  140),
  (118, 1039, '2023-04-12', 'Cycle 4 Day 1',  135),
  (119, 1039, '2023-05-03', 'EOT',             80),
  (120, 1039, '2023-05-31', 'Follow-up',       45),
  (121, 1040, '2023-02-15', 'Baseline',       110),
  (122, 1040, '2023-03-01', 'Cycle 1 Day 1',  170),
  (123, 1040, '2023-03-22', 'Cycle 2 Day 1',  145),
  (124, 1040, '2023-04-12', 'Cycle 3 Day 1',  140),
  (125, 1041, '2023-03-05', 'Baseline',        95),
  (126, 1041, '2023-03-19', 'Cycle 1 Day 1',  165),
  (127, 1042, '2023-03-20', 'Baseline',       105),
  (128, 1042, '2023-04-03', 'Cycle 1 Day 1',  170),
  (129, 1042, '2023-04-24', 'Cycle 2 Day 1',  145),
  -- Trial 107: NEURO-101 Early ALS Biomarker Study
  (130, 1043, '2024-05-06', 'Baseline',       110),
  (131, 1043, '2024-05-20', 'Week 2',          40),
  (132, 1043, '2024-06-03', 'Week 4',          40),
  (133, 1044, '2024-05-20', 'Baseline',       115),
  (134, 1044, '2024-06-03', 'Week 2',          40),
  (135, 1045, '2024-06-06', 'Baseline',        80),
  (136, 1046, '2024-06-15', 'Baseline',       105),
  (137, 1046, '2024-06-29', 'Week 2',          40),
  (138, 1046, '2024-07-13', 'Week 4',          45),
  -- Trial 108: NEURO-205 MS Remission Trial
  (139, 1047, '2023-08-06', 'Baseline',       110),
  (140, 1047, '2023-10-29', 'Week 12',         50),
  (141, 1047, '2024-01-21', 'Week 24',         55),
  (142, 1047, '2024-07-07', 'Week 48',         50),
  (143, 1047, '2024-08-04', 'EOT',             75),
  (144, 1048, '2023-08-25', 'Baseline',       115),
  (145, 1048, '2023-11-17', 'Week 12',         50),
  (146, 1048, '2024-02-10', 'Week 24',         55),
  (147, 1048, '2024-08-04', 'Week 48',         50),
  (148, 1048, '2024-09-01', 'EOT',             70),
  (149, 1049, '2023-09-15', 'Baseline',       105),
  (150, 1049, '2023-12-08', 'Week 12',         50),
  (151, 1049, '2024-03-02', 'Week 24',         55),
  (152, 1050, '2023-10-06', 'Baseline',       100),
  (153, 1050, '2023-12-29', 'Week 12',         45),
  (154, 1051, '2023-10-25', 'Baseline',       110),
  (155, 1051, '2024-01-17', 'Week 12',         50),
  (156, 1051, '2024-04-11', 'Week 24',         55),
  -- Trial 109: CARDIO-102 Heart Failure Management Study
  (157, 1052, '2023-02-06', 'Baseline',       120),
  (158, 1052, '2023-05-06', 'Month 3',         70),
  (159, 1052, '2023-08-06', 'Month 6',         65),
  (160, 1052, '2024-02-06', 'Month 12',        70),
  (161, 1052, '2024-03-05', 'EOT',             80),
  (162, 1052, '2024-04-02', 'Follow-up',       45),
  (163, 1053, '2023-02-20', 'Baseline',       115),
  (164, 1053, '2023-05-20', 'Month 3',         70),
  (165, 1053, '2023-08-20', 'Month 6',         65),
  (166, 1053, '2024-02-20', 'Month 12',        70),
  (167, 1053, '2024-03-19', 'EOT',             80),
  (168, 1053, '2024-04-16', 'Follow-up',       40),
  (169, 1054, '2023-03-06', 'Baseline',       110),
  (170, 1054, '2023-06-06', 'Month 3',         65),
  (171, 1054, '2023-09-06', 'Month 6',         65),
  (172, 1055, '2023-03-25', 'Baseline',       120),
  (173, 1055, '2023-06-25', 'Month 3',         70),
  (174, 1055, '2023-09-25', 'Month 6',         65),
  (175, 1055, '2024-03-25', 'Month 12',        70),
  (176, 1056, '2023-04-06', 'Baseline',       100),
  (177, 1056, '2023-07-06', 'Month 3',         65),
  (178, 1057, '2023-04-20', 'Baseline',        85),
  -- Trial 110: IMM-301 Systemic Lupus Treatment Study
  (179, 1058, '2024-02-20', 'Baseline',       100),
  (180, 1058, '2024-03-19', 'Week 4',          45),
  (181, 1058, '2024-05-14', 'Week 12',         50),
  (182, 1058, '2024-08-06', 'Week 24',         50),
  (183, 1059, '2024-03-06', 'Baseline',        95),
  (184, 1059, '2024-04-03', 'Week 4',          45),
  (185, 1059, '2024-05-29', 'Week 12',         50),
  (186, 1060, '2024-03-25', 'Baseline',        90),
  (187, 1060, '2024-04-22', 'Week 4',          40),
  (188, 1061, '2024-04-06', 'Baseline',       100),
  (189, 1061, '2024-05-04', 'Week 4',          45),
  (190, 1061, '2024-06-29', 'Week 12',         50),
  (191, 1061, '2024-09-21', 'Week 24',         50),
  -- Trial 111: HEME-201 AML Remission Induction Study
  (192, 1062, '2023-09-06', 'Baseline',       120),
  (193, 1062, '2023-09-20', 'Cycle 1 Day 1',  180),
  (194, 1062, '2023-10-11', 'Cycle 2 Day 1',  150),
  (195, 1062, '2023-11-22', 'Cycle 4 Day 1',  145),
  (196, 1062, '2023-12-20', 'EOT',             90),
  (197, 1063, '2023-09-20', 'Baseline',       115),
  (198, 1063, '2023-10-04', 'Cycle 1 Day 1',  175),
  (199, 1063, '2023-10-25', 'Cycle 2 Day 1',  150),
  (200, 1064, '2023-10-06', 'Baseline',       100),
  (201, 1064, '2023-10-20', 'Cycle 1 Day 1',  165),
  (202, 1065, '2023-10-25', 'Baseline',       110),
  (203, 1065, '2023-11-08', 'Cycle 1 Day 1',  175),
  (204, 1065, '2023-11-29', 'Cycle 2 Day 1',  150),
  (205, 1065, '2024-01-10', 'Cycle 4 Day 1',  140),
  (206, 1066, '2023-11-06', 'Baseline',        85),
  -- Trial 112: HEME-301 CLL Maintenance Trial
  (207, 1067, '2022-10-06', 'Baseline',       120),
  (208, 1067, '2023-01-06', 'Month 3',         65),
  (209, 1067, '2023-04-06', 'Month 6',         65),
  (210, 1067, '2023-10-06', 'Month 12',        70),
  (211, 1067, '2024-04-06', 'Month 18',        70),
  (212, 1067, '2024-05-04', 'EOT',             85),
  (213, 1067, '2024-06-01', 'Follow-up',       40),
  (214, 1068, '2022-10-20', 'Baseline',       115),
  (215, 1068, '2023-01-20', 'Month 3',         65),
  (216, 1068, '2023-04-20', 'Month 6',         65),
  (217, 1068, '2023-10-20', 'Month 12',        70),
  (218, 1068, '2024-04-20', 'Month 18',        70),
  (219, 1068, '2024-05-18', 'EOT',             85),
  (220, 1068, '2024-06-15', 'Follow-up',       40),
  (221, 1069, '2022-11-06', 'Baseline',       115),
  (222, 1069, '2023-02-06', 'Month 3',         65),
  (223, 1069, '2023-05-06', 'Month 6',         65),
  (224, 1069, '2023-11-06', 'Month 12',        70),
  (225, 1070, '2022-11-25', 'Baseline',       120),
  (226, 1070, '2023-02-25', 'Month 3',         65),
  (227, 1070, '2023-05-25', 'Month 6',         65),
  (228, 1070, '2023-11-25', 'Month 12',        70),
  (229, 1070, '2024-05-25', 'Month 18',        70),
  (230, 1071, '2022-12-06', 'Baseline',       110),
  (231, 1071, '2023-03-06', 'Month 3',         65),
  -- Trial 113: NEUROONC-101 Glioblastoma Immunotherapy Study
  (232, 1072, '2024-05-20', 'Baseline',       120),
  (233, 1072, '2024-06-03', 'Day 14',          35),
  (234, 1072, '2024-06-17', 'Day 28',          40),
  (235, 1073, '2024-06-06', 'Baseline',       115),
  (236, 1073, '2024-06-20', 'Day 14',          35),
  (237, 1074, '2024-06-20', 'Baseline',        85),
  (238, 1075, '2024-07-06', 'Baseline',       110),
  (239, 1075, '2024-07-20', 'Day 14',          35),
  (240, 1075, '2024-08-03', 'Day 28',          40),
  -- Trial 114: NEUROONC-201 Brain Metastasis Response Trial
  (241, 1076, '2023-11-06', 'Baseline',       120),
  (242, 1076, '2023-11-20', 'Cycle 1 Day 1',  165),
  (243, 1076, '2023-12-11', 'Cycle 2 Day 1',  140),
  (244, 1076, '2024-01-01', 'Cycle 3 Day 1',  135),
  (245, 1076, '2024-01-22', 'EOT',             80),
  (246, 1077, '2023-11-20', 'Baseline',       115),
  (247, 1077, '2023-12-04', 'Cycle 1 Day 1',  160),
  (248, 1077, '2023-12-25', 'Cycle 2 Day 1',  140),
  (249, 1078, '2023-12-06', 'Baseline',       100),
  (250, 1078, '2023-12-20', 'Cycle 1 Day 1',  155),
  (251, 1079, '2024-01-15', 'Baseline',       110),
  (252, 1079, '2024-01-29', 'Cycle 1 Day 1',  160),
  (253, 1079, '2024-02-19', 'Cycle 2 Day 1',  140),
  (254, 1079, '2024-03-11', 'Cycle 3 Day 1',  135),
  -- Trial 115: CARDIONC-101 Cardiac Safety in Oncology Study
  (255, 1080, '2024-01-20', 'Baseline',       110),
  (256, 1080, '2024-03-16', 'Week 8',          55),
  (257, 1080, '2024-05-11', 'Week 16',         55),
  (258, 1081, '2024-02-06', 'Baseline',       105),
  (259, 1081, '2024-04-02', 'Week 8',          55),
  (260, 1082, '2024-02-20', 'Baseline',        90),
  (261, 1083, '2024-03-06', 'Baseline',       110),
  (262, 1083, '2024-04-30', 'Week 8',          55),
  (263, 1083, '2024-06-25', 'Week 16',         55),
  -- Trial 116: RHEUM-201 RA Biologic Dose Study
  (264, 1084, '2023-06-06', 'Baseline',       100),
  (265, 1084, '2023-08-29', 'Week 12',         50),
  (266, 1084, '2023-11-22', 'Week 24',         55),
  (267, 1084, '2024-05-15', 'Week 52',         55),
  (268, 1084, '2024-06-12', 'EOT',             75),
  (269, 1085, '2023-06-25', 'Baseline',        95),
  (270, 1085, '2023-09-17', 'Week 12',         50),
  (271, 1085, '2023-12-11', 'Week 24',         55),
  (272, 1086, '2023-07-15', 'Baseline',        90),
  (273, 1086, '2023-10-07', 'Week 12',         45),
  (274, 1087, '2023-07-30', 'Baseline',       100),
  (275, 1087, '2023-10-22', 'Week 12',         50),
  (276, 1087, '2024-01-15', 'Week 24',         55),
  (277, 1087, '2024-07-08', 'Week 52',         55),
  (278, 1088, '2023-08-20', 'Baseline',        80),
  -- Trial 117: RHEUM-301 Psoriatic Arthritis Maintenance Trial
  (279, 1089, '2022-09-06', 'Baseline',       105),
  (280, 1089, '2023-03-06', 'Month 6',         60),
  (281, 1089, '2023-09-06', 'Month 12',        65),
  (282, 1089, '2024-03-06', 'Month 18',        65),
  (283, 1089, '2024-09-06', 'Month 24',        65),
  (284, 1089, '2024-10-04', 'EOT',             75),
  (285, 1089, '2024-11-01', 'Follow-up',       40),
  (286, 1090, '2022-09-25', 'Baseline',       100),
  (287, 1090, '2023-03-25', 'Month 6',         60),
  (288, 1090, '2023-09-25', 'Month 12',        65),
  (289, 1090, '2024-03-25', 'Month 18',        65),
  (290, 1090, '2024-09-25', 'Month 24',        65),
  (291, 1090, '2024-10-23', 'EOT',             75),
  (292, 1090, '2024-11-20', 'Follow-up',       40),
  (293, 1091, '2022-10-10', 'Baseline',       100),
  (294, 1091, '2023-04-10', 'Month 6',         60),
  (295, 1091, '2023-10-10', 'Month 12',        65),
  (296, 1092, '2022-10-30', 'Baseline',       105),
  (297, 1092, '2023-04-30', 'Month 6',         60),
  (298, 1092, '2023-10-30', 'Month 12',        65),
  (299, 1092, '2024-04-30', 'Month 18',        65),
  (300, 1093, '2022-11-15', 'Baseline',        95),
  (301, 1093, '2023-05-15', 'Month 6',         60);

-- =========================
-- Lab Results
-- =========================
-- reference_range_low / reference_range_high: lab-specific normal limits
-- flag: Normal | Low | High | Critical
--   Critical thresholds: WBC <2.0 or >30.0, Platelets <50, ANA Titer >320
-- Tests by disease area:
--   Oncology/Neuro-Onc:      WBC, Hemoglobin, Platelets, CEA, LDH
--   Hematology-Oncology:     WBC, Hemoglobin, Platelets, LDH
--   Cardiology/Cardio-Onc:   BNP, Troponin I, LDL, HDL, Creatinine
--   Neurology:               WBC, Creatinine, ALT
--   Immunology/Rheumatology: CRP, ESR, ANA Titer, RF, anti-CCP
INSERT INTO lab_results (lab_id, patient_id, visit_id, test_name, result_value, unit, reference_range_low, reference_range_high, flag)
VALUES
  -- Patient 1001 | Trial 101 Oncology | Visit 1 Baseline
  (1,  1001, 1,   'WBC',        5.2,  'K/uL',  4.5,  11.0, 'Normal'),
  (2,  1001, 1,   'Hemoglobin', 13.1, 'g/dL',  12.0, 16.0, 'Normal'),
  (3,  1001, 1,   'Platelets',  210.0,'K/uL',  150.0,400.0, 'Normal'),
  -- Patient 1001 | Visit 2 Cycle 1 Day 1 — slight CBC drop expected post-treatment
  (4,  1001, 2,   'WBC',        4.1,  'K/uL',  4.5,  11.0, 'Low'),
  (5,  1001, 2,   'Hemoglobin', 12.4, 'g/dL',  12.0, 16.0, 'Normal'),
  -- Patient 1001 | Visit 12 Cycle 2 Day 1
  (6,  1001, 12,  'WBC',        3.8,  'K/uL',  4.5,  11.0, 'Low'),
  (7,  1001, 12,  'Hemoglobin', 11.9, 'g/dL',  12.0, 16.0, 'Low'),

  -- Patient 1004 | Trial 102 Neurology | Visit 4 Baseline
  (8,  1004, 4,   'WBC',        6.1,  'K/uL',  4.5,  11.0, 'Normal'),
  (9,  1004, 4,   'Creatinine', 0.9,  'mg/dL', 0.6,  1.2,  'Normal'),
  (10, 1004, 4,   'ALT',        22.0, 'U/L',   7.0,  56.0, 'Normal'),
  -- Patient 1004 | Visit 35 Week 12
  (11, 1004, 35,  'WBC',        5.8,  'K/uL',  4.5,  11.0, 'Normal'),
  (12, 1004, 35,  'Creatinine', 1.0,  'mg/dL', 0.6,  1.2,  'Normal'),

  -- Patient 1018 | Trial 102 Neurology | Visit 46 Baseline
  (13, 1018, 46,  'WBC',        5.8,  'K/uL',  4.5,  11.0, 'Normal'),
  (14, 1018, 46,  'Creatinine', 0.8,  'mg/dL', 0.6,  1.2,  'Normal'),
  (15, 1018, 46,  'ALT',        18.0, 'U/L',   7.0,  56.0, 'Normal'),

  -- Patient 1007 | Trial 103 Cardiology | Visit 8 Baseline
  (16, 1007, 8,   'BNP',        210.0,'pg/mL', 0.0,  100.0,'High'),
  (17, 1007, 8,   'LDL',        142.0,'mg/dL', 0.0,  100.0,'High'),
  (18, 1007, 8,   'Creatinine', 1.1,  'mg/dL', 0.6,  1.2,  'Normal'),
  -- Patient 1007 | Visit 9 Month 1 — BNP improving
  (19, 1007, 9,   'BNP',        175.0,'pg/mL', 0.0,  100.0,'High'),
  (20, 1007, 9,   'LDL',        128.0,'mg/dL', 0.0,  100.0,'High'),

  -- Patient 1024 | Trial 103 Cardiology | Visit 66 Baseline
  (21, 1024, 66,  'BNP',        185.0,'pg/mL', 0.0,  100.0,'High'),
  (22, 1024, 66,  'LDL',        158.0,'mg/dL', 0.0,  100.0,'High'),
  (23, 1024, 66,  'HDL',         42.0,'mg/dL', 40.0, 60.0, 'Normal'),
  (24, 1024, 66,  'Troponin I',  0.02,'ng/mL', 0.0,  0.04, 'Normal'),
  -- Patient 1024 | Visit 68 Month 3
  (25, 1024, 68,  'BNP',        140.0,'pg/mL', 0.0,  100.0,'High'),
  (26, 1024, 68,  'LDL',        131.0,'mg/dL', 0.0,  100.0,'High'),

  -- Patient 1009 | Trial 104 Immunology | Visit 10 Baseline
  (27, 1009, 10,  'CRP',         18.4,'mg/L',  0.0,  5.0,  'High'),
  (28, 1009, 10,  'ESR',         42.0,'mm/hr', 0.0,  20.0, 'High'),
  -- Patient 1009 | Visit 82 Week 4 — inflammation reducing
  (29, 1009, 82,  'CRP',         11.2,'mg/L',  0.0,  5.0,  'High'),
  (30, 1009, 82,  'ESR',         31.0,'mm/hr', 0.0,  20.0, 'High'),

  -- Patient 1029 | Trial 104 Immunology | Visit 86 Baseline
  (31, 1029, 86,  'CRP',         24.1,'mg/L',  0.0,  5.0,  'High'),
  (32, 1029, 86,  'ESR',         55.0,'mm/hr', 0.0,  20.0, 'High'),
  (33, 1029, 86,  'ANA Titer',  160.0,'titer', 0.0,  40.0, 'High'),

  -- Patient 1038 | Trial 106 Oncology Phase III | Visit 107 Baseline
  (34, 1038, 107, 'WBC',         6.4, 'K/uL',  4.5,  11.0, 'Normal'),
  (35, 1038, 107, 'Hemoglobin', 13.8, 'g/dL',  12.0, 16.0, 'Normal'),
  (36, 1038, 107, 'Platelets',  235.0,'K/uL',  150.0,400.0, 'Normal'),
  (37, 1038, 107, 'CEA',         8.2, 'ng/mL', 0.0,  2.5,  'High'),
  -- Patient 1038 | Visit 109 Cycle 2 Day 1 — myelosuppression
  (38, 1038, 109, 'WBC',         2.9, 'K/uL',  4.5,  11.0, 'Low'),
  (39, 1038, 109, 'Hemoglobin', 10.8, 'g/dL',  12.0, 16.0, 'Low'),
  (40, 1038, 109, 'Platelets',  118.0,'K/uL',  150.0,400.0, 'Low'),

  -- Patient 1052 | Trial 109 Cardiology Phase III | Visit 157 Baseline
  (41, 1052, 157, 'BNP',        312.0,'pg/mL', 0.0,  100.0,'High'),
  (42, 1052, 157, 'LDL',        168.0,'mg/dL', 0.0,  100.0,'High'),
  (43, 1052, 157, 'Troponin I',  0.04,'ng/mL', 0.0,  0.04, 'Normal'),
  -- Patient 1052 | Visit 160 Month 12 — BNP improving with treatment
  (44, 1052, 160, 'BNP',        198.0,'pg/mL', 0.0,  100.0,'High'),
  (45, 1052, 160, 'LDL',        112.0,'mg/dL', 0.0,  100.0,'High'),

  -- Patient 1062 | Trial 111 Hematology-Oncology AML | Visit 192 Baseline
  (46, 1062, 192, 'WBC',         18.5,'K/uL',  4.5,  11.0, 'High'),
  (47, 1062, 192, 'Hemoglobin',   9.2,'g/dL',  12.0, 16.0, 'Low'),
  (48, 1062, 192, 'Platelets',   42.0,'K/uL',  150.0,400.0, 'Critical'),
  (49, 1062, 192, 'LDH',        420.0,'U/L',   140.0,280.0, 'High'),
  -- Patient 1062 | Visit 194 Cycle 2 Day 1 — response to induction
  (50, 1062, 194, 'WBC',          4.8,'K/uL',  4.5,  11.0, 'Normal'),
  (51, 1062, 194, 'Hemoglobin',  10.1,'g/dL',  12.0, 16.0, 'Low'),
  (52, 1062, 194, 'Platelets',   89.0,'K/uL',  150.0,400.0, 'Low'),

  -- Patient 1067 | Trial 112 Hematology-Oncology CLL | Visit 207 Baseline
  (53, 1067, 207, 'WBC',         42.0,'K/uL',  4.5,  11.0, 'Critical'),
  (54, 1067, 207, 'Hemoglobin',  10.8,'g/dL',  12.0, 16.0, 'Low'),
  (55, 1067, 207, 'Platelets',   98.0,'K/uL',  150.0,400.0, 'Low'),
  (56, 1067, 207, 'LDH',        285.0,'U/L',   140.0,280.0, 'High'),
  -- Patient 1067 | Visit 210 Month 12 — CLL suppressed on maintenance
  (57, 1067, 210, 'WBC',         12.4,'K/uL',  4.5,  11.0, 'High'),
  (58, 1067, 210, 'Hemoglobin',  12.1,'g/dL',  12.0, 16.0, 'Normal'),
  (59, 1067, 210, 'Platelets',  142.0,'K/uL',  150.0,400.0, 'Low'),

  -- Patient 1076 | Trial 114 Neuro-Oncology | Visit 241 Baseline
  (60, 1076, 241, 'WBC',          5.9,'K/uL',  4.5,  11.0, 'Normal'),
  (61, 1076, 241, 'Hemoglobin',  12.4,'g/dL',  12.0, 16.0, 'Normal'),
  (62, 1076, 241, 'LDH',        310.0,'U/L',   140.0,280.0, 'High'),

  -- Patient 1058 | Trial 110 Lupus | Visit 179 Baseline
  (63, 1058, 179, 'CRP',         28.7,'mg/L',  0.0,  5.0,  'High'),
  (64, 1058, 179, 'ESR',         61.0,'mm/hr', 0.0,  20.0, 'High'),
  (65, 1058, 179, 'ANA Titer',  640.0,'titer', 0.0,  40.0, 'Critical'),
  -- Patient 1058 | Visit 181 Week 12 — partial response
  (66, 1058, 181, 'CRP',         14.3,'mg/L',  0.0,  5.0,  'High'),
  (67, 1058, 181, 'ESR',         38.0,'mm/hr', 0.0,  20.0, 'High'),

  -- Patient 1084 | Trial 116 Rheumatology RA | Visit 264 Baseline
  (68, 1084, 264, 'CRP',         32.5,'mg/L',  0.0,  5.0,  'High'),
  (69, 1084, 264, 'ESR',         68.0,'mm/hr', 0.0,  20.0, 'High'),
  (70, 1084, 264, 'RF',          85.0,'IU/mL', 0.0,  14.0, 'High'),
  (71, 1084, 264, 'anti-CCP',   112.0,'U/mL',  0.0,  20.0, 'High'),
  -- Patient 1084 | Visit 266 Week 24 — biologic response
  (72, 1084, 266, 'CRP',          8.1,'mg/L',  0.0,  5.0,  'High'),
  (73, 1084, 266, 'ESR',         28.0,'mm/hr', 0.0,  20.0, 'High'),
  (74, 1084, 266, 'RF',          52.0,'IU/mL', 0.0,  14.0, 'High'),

  -- Patient 1089 | Trial 117 Rheumatology PsA | Visit 279 Baseline
  (75, 1089, 279, 'CRP',         21.4,'mg/L',  0.0,  5.0,  'High'),
  (76, 1089, 279, 'ESR',         48.0,'mm/hr', 0.0,  20.0, 'High'),
  -- Patient 1089 | Visit 281 Month 12
  (77, 1089, 281, 'CRP',          6.8,'mg/L',  0.0,  5.0,  'High'),
  (78, 1089, 281, 'ESR',         22.0,'mm/hr', 0.0,  20.0, 'High');

-- =========================
-- Adverse Events
-- =========================
-- severity: Grade 1 (mild) → Grade 5 (fatal)
-- related_to_drug: Yes | No | Possibly | Unknown
-- serious: 1 = SAE (requires regulatory reporting), 0 = non-serious
-- resolution_date NULL = ongoing at time of data entry
INSERT INTO adverse_events (ae_id, patient_id, visit_id, ae_term, severity, onset_date, resolution_date, related_to_drug, serious)
VALUES
  -- Oncology (Trial 101) — immunotherapy-related toxicities
  (1,  1001, 2,   'Nausea',                'Grade 2', '2024-02-22', '2024-03-08', 'Possibly', 0),
  (2,  1001, 2,   'Fatigue',               'Grade 2', '2024-02-22', '2024-04-15', 'Possibly', 0),
  (3,  1002, 14,  'Nausea',                'Grade 1', '2024-03-06', '2024-03-18', 'Yes',       0),
  (4,  1011, 18,  'Neutropenia',           'Grade 3', '2024-03-12', '2024-04-01', 'Yes',       0),
  -- Oncology (Trial 106) — chemotherapy toxicities
  (5,  1038, 108, 'Neutropenia',           'Grade 4', '2023-01-28', '2023-03-10', 'Yes',       1),
  (6,  1038, 109, 'Anemia',                'Grade 3', '2023-02-16', '2023-03-20', 'Yes',       0),
  (7,  1039, 115, 'Nausea',                'Grade 2', '2023-02-10', '2023-02-24', 'Yes',       0),
  (8,  1039, 116, 'Thrombocytopenia',      'Grade 3', '2023-03-03', '2023-03-24', 'Yes',       0),
  (9,  1040, NULL,'Alopecia',              'Grade 2', '2023-03-20', NULL,          'Yes',       0),
  -- Hematology-Oncology (Trial 111) — AML induction toxicity
  (10, 1062, 193, 'Febrile Neutropenia',   'Grade 3', '2023-09-24', '2023-10-06', 'Possibly',  1),
  -- Cardiology (Trial 103)
  (11, 1007, 9,   'Hypotension',           'Grade 2', '2024-04-12', '2024-04-18', 'Possibly',  0),
  -- Cardiology (Trial 109)
  (12, 1052, NULL,'Peripheral Edema',      'Grade 2', '2023-05-10', NULL,          'Possibly',  0),
  -- Immunology (Trial 104) — biologic injection reactions
  (13, 1009, 81,  'Injection Site Reaction','Grade 1','2024-06-30', '2024-07-05', 'Yes',       0),
  (14, 1029, 87,  'Rash',                  'Grade 2', '2024-07-13', '2024-07-27', 'Yes',       0),
  -- Lupus (Trial 110)
  (15, 1058, 180, 'Headache',              'Grade 1', '2024-03-21', '2024-03-28', 'Possibly',  0),
  -- Rheumatology (Trial 116) — infection risk with biologics
  (16, 1084, 265, 'Upper Respiratory Infection','Grade 2','2023-09-03','2023-09-17','Possibly', 0),
  -- Neurology (Trial 108) — MS trial
  (17, 1047, 139, 'Headache',              'Grade 1', '2023-08-09', '2023-08-16', 'Possibly',  0),
  -- Neurology (Trial 102)
  (18, 1005, 39,  'Dizziness',             'Grade 1', '2023-12-26', '2024-01-03', 'Possibly',  0),
  -- Neuro-Oncology (Trial 114)
  (19, 1076, 242, 'Fatigue',               'Grade 2', '2023-11-22', '2023-12-12', 'Possibly',  0),
  -- CLL (Trial 112) — long-term maintenance fatigue
  (20, 1067, 208, 'Fatigue',               'Grade 2', '2023-01-10', '2023-02-05', 'Possibly',  0);
