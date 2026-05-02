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
-- target_enrollment reflects realistic Phase I/II/III sizes
INSERT INTO trials (trial_id, trial_name, phase, department_id, start_date, target_enrollment)
VALUES
  (101, 'ONC-201 Immunotherapy Study',                    'Phase II',  1, '2024-01-15', 40),
  (105, 'ONC-301 Targeted Therapy Study',                 'Phase I',   1, '2023-06-01', 15),
  (106, 'ONC-401 Combination Chemotherapy Trial',         'Phase III', 1, '2022-11-01', 120),
  (102, 'NeuroCognitive Decline Trial',                   'Phase III', 2, '2023-09-01', 80),
  (107, 'NEURO-101 Early ALS Biomarker Study',            'Phase I',   2, '2024-04-01', 12),
  (108, 'NEURO-205 MS Remission Trial',                   'Phase II',  2, '2023-07-01', 50),
  (103, 'CardioRisk Reduction Study',                     'Phase II',  3, '2024-03-10', 45),
  (109, 'CARDIO-102 Heart Failure Management Study',      'Phase III', 3, '2023-01-15', 150),
  (104, 'AutoImmune Response Trial',                      'Phase I',   4, '2024-06-01', 18),
  (110, 'IMM-301 Systemic Lupus Treatment Study',         'Phase II',  4, '2024-02-01', 40),
  (111, 'HEME-201 AML Remission Induction Study',         'Phase II',  5, '2023-08-01', 35),
  (112, 'HEME-301 CLL Maintenance Trial',                 'Phase III', 5, '2022-09-01', 100),
  (113, 'NEUROONC-101 Glioblastoma Immunotherapy Study',  'Phase I',   6, '2024-05-01', 10),
  (114, 'NEUROONC-201 Brain Metastasis Response Trial',   'Phase II',  6, '2023-10-01', 30),
  (115, 'CARDIONC-101 Cardiac Safety in Oncology Study',  'Phase II',  7, '2024-01-01', 25),
  (116, 'RHEUM-201 RA Biologic Dose Study',               'Phase II',  8, '2023-05-01', 45),
  (117, 'RHEUM-301 Psoriatic Arthritis Maintenance Trial','Phase III', 8, '2022-08-01', 90);

-- =========================
-- Patients
-- =========================
-- age: years at enrollment  |  weight_kg: body weight at screening
-- Oncology/Heme/Neuro-Onc skew older (45-80); Immunology/Rheum/MS skew younger (25-55)
INSERT INTO patients (patient_id, trial_id, enrollment_date, status, age, weight_kg)
VALUES
  -- Trial 101: ONC-201 Immunotherapy Study
  (1001, 101, '2024-02-01', 'Active',         52, 78.4),
  (1002, 101, '2024-02-12', 'Active',         61, 82.1),
  (1003, 101, '2024-03-05', 'Withdrawn',      47, 65.3),
  (1011, 101, '2024-02-20', 'Active',         58, 91.2),
  (1012, 101, '2024-03-01', 'Active',         44, 70.5),
  (1013, 101, '2024-02-10', 'Completed',      67, 74.8),
  (1014, 101, '2024-03-10', 'Withdrawn',      55, 88.0),
  (1015, 101, '2024-03-15', 'Screen Failure', 49, 62.4),
  (1016, 101, '2024-04-01', 'Active',         63, 79.6),
  -- Trial 102: NeuroCognitive Decline Trial
  (1004, 102, '2023-10-15', 'Completed',      72, 68.2),
  (1005, 102, '2023-11-20', 'Active',         65, 75.9),
  (1006, 102, '2024-01-05', 'Active',         78, 61.4),
  (1017, 102, '2023-10-01', 'Completed',      70, 83.5),
  (1018, 102, '2023-09-15', 'Completed',      68, 71.3),
  (1019, 102, '2024-02-01', 'Active',         74, 66.8),
  (1020, 102, '2023-12-15', 'Withdrawn',      61, 77.4),
  (1021, 102, '2024-02-15', 'Active',         80, 59.2),
  (1022, 102, '2024-03-01', 'Screen Failure', 56, 84.1),
  (1023, 102, '2023-11-01', 'Completed',      73, 69.7),
  -- Trial 103: CardioRisk Reduction Study
  (1007, 103, '2024-03-20', 'Active',         62, 95.3),
  (1008, 103, '2024-04-02', 'Screen Failure', 58, 102.4),
  (1024, 103, '2024-03-25', 'Active',         71, 88.7),
  (1025, 103, '2024-04-10', 'Active',         55, 76.2),
  (1026, 103, '2024-03-18', 'Completed',      67, 83.9),
  (1027, 103, '2024-04-15', 'Withdrawn',      60, 91.5),
  (1028, 103, '2024-04-20', 'Active',         74, 79.1),
  -- Trial 104: AutoImmune Response Trial
  (1009, 104, '2024-06-10', 'Active',         34, 61.8),
  (1010, 104, '2024-06-18', 'Active',         42, 68.3),
  (1029, 104, '2024-06-22', 'Active',         29, 55.4),
  (1030, 104, '2024-07-01', 'Withdrawn',      38, 72.6),
  (1031, 104, '2024-07-08', 'Active',         51, 64.9),
  (1032, 104, '2024-07-15', 'Screen Failure', 27, 58.2),
  (1033, 104, '2024-07-20', 'Active',         45, 66.7),
  -- Trial 105: ONC-301 Targeted Therapy Study
  (1034, 105, '2023-07-01', 'Active',         57, 80.2),
  (1035, 105, '2023-07-15', 'Completed',      64, 73.5),
  (1036, 105, '2023-08-01', 'Screen Failure', 51, 69.8),
  (1037, 105, '2023-08-20', 'Withdrawn',      60, 85.4),
  -- Trial 106: ONC-401 Combination Chemotherapy Trial
  (1038, 106, '2023-01-05', 'Completed',      54, 76.3),
  (1039, 106, '2023-01-20', 'Completed',      69, 81.7),
  (1040, 106, '2023-02-10', 'Active',         48, 72.4),
  (1041, 106, '2023-03-01', 'Withdrawn',      62, 90.1),
  (1042, 106, '2023-03-15', 'Active',         57, 67.9),
  -- Trial 107: NEURO-101 Early ALS Biomarker Study
  (1043, 107, '2024-05-01', 'Active',         45, 74.6),
  (1044, 107, '2024-05-15', 'Active',         52, 81.3),
  (1045, 107, '2024-06-01', 'Screen Failure', 38, 65.2),
  (1046, 107, '2024-06-10', 'Active',         61, 77.8),
  -- Trial 108: NEURO-205 MS Remission Trial
  (1047, 108, '2023-08-01', 'Completed',      36, 62.1),
  (1048, 108, '2023-08-20', 'Completed',      42, 70.4),
  (1049, 108, '2023-09-10', 'Active',         29, 57.9),
  (1050, 108, '2023-10-01', 'Withdrawn',      48, 75.6),
  (1051, 108, '2023-10-20', 'Active',         33, 63.8),
  -- Trial 109: CARDIO-102 Heart Failure Management Study
  (1052, 109, '2023-02-01', 'Completed',      65, 88.4),
  (1053, 109, '2023-02-15', 'Completed',      72, 79.2),
  (1054, 109, '2023-03-01', 'Active',         58, 96.7),
  (1055, 109, '2023-03-20', 'Active',         68, 84.3),
  (1056, 109, '2023-04-01', 'Withdrawn',      61, 91.8),
  (1057, 109, '2023-04-15', 'Screen Failure', 74, 73.6),
  -- Trial 110: IMM-301 Systemic Lupus Treatment Study
  (1058, 110, '2024-02-15', 'Active',         32, 58.4),
  (1059, 110, '2024-03-01', 'Active',         27, 52.7),
  (1060, 110, '2024-03-20', 'Withdrawn',      44, 66.3),
  (1061, 110, '2024-04-01', 'Active',         38, 61.9),
  -- Trial 111: HEME-201 AML Remission Induction Study
  (1062, 111, '2023-09-01', 'Completed',      58, 77.2),
  (1063, 111, '2023-09-15', 'Active',         65, 82.5),
  (1064, 111, '2023-10-01', 'Withdrawn',      71, 68.9),
  (1065, 111, '2023-10-20', 'Active',         54, 74.6),
  (1066, 111, '2023-11-01', 'Screen Failure', 49, 80.3),
  -- Trial 112: HEME-301 CLL Maintenance Trial
  (1067, 112, '2022-10-01', 'Completed',      68, 79.4),
  (1068, 112, '2022-10-15', 'Completed',      74, 71.8),
  (1069, 112, '2022-11-01', 'Active',         61, 85.2),
  (1070, 112, '2022-11-20', 'Active',         77, 66.5),
  (1071, 112, '2022-12-01', 'Withdrawn',      63, 78.9),
  -- Trial 113: NEUROONC-101 Glioblastoma Immunotherapy Study
  (1072, 113, '2024-05-15', 'Active',         55, 82.1),
  (1073, 113, '2024-06-01', 'Active',         47, 75.4),
  (1074, 113, '2024-06-15', 'Screen Failure', 62, 68.7),
  (1075, 113, '2024-07-01', 'Active',         51, 79.8),
  -- Trial 114: NEUROONC-201 Brain Metastasis Response Trial
  (1076, 114, '2023-11-01', 'Completed',      59, 73.6),
  (1077, 114, '2023-11-15', 'Active',         64, 80.9),
  (1078, 114, '2023-12-01', 'Withdrawn',      48, 67.3),
  (1079, 114, '2024-01-10', 'Active',         53, 76.4),
  -- Trial 115: CARDIONC-101 Cardiac Safety in Oncology Study
  (1080, 115, '2024-01-15', 'Active',         56, 81.7),
  (1081, 115, '2024-02-01', 'Active',         63, 76.2),
  (1082, 115, '2024-02-15', 'Withdrawn',      49, 69.4),
  (1083, 115, '2024-03-01', 'Active',         58, 87.3),
  -- Trial 116: RHEUM-201 RA Biologic Dose Study
  (1084, 116, '2023-06-01', 'Completed',      46, 65.8),
  (1085, 116, '2023-06-20', 'Active',         52, 71.4),
  (1086, 116, '2023-07-10', 'Withdrawn',      38, 60.2),
  (1087, 116, '2023-07-25', 'Active',         61, 77.9),
  (1088, 116, '2023-08-15', 'Screen Failure', 29, 56.3),
  -- Trial 117: RHEUM-301 Psoriatic Arthritis Maintenance Trial
  (1089, 117, '2022-09-01', 'Completed',      43, 82.6),
  (1090, 117, '2022-09-20', 'Completed',      51, 75.3),
  (1091, 117, '2022-10-05', 'Active',         37, 68.9),
  (1092, 117, '2022-10-25', 'Active',         48, 79.4),
  (1093, 117, '2022-11-10', 'Withdrawn',      55, 84.1),
  -- Newly enrolled patients — no visits scheduled yet
  -- These rows demonstrate LEFT JOIN vs INNER JOIN:
  -- a LEFT JOIN from patients will show these with NULL visit columns;
  -- an INNER JOIN will silently exclude them.
  (1094, 101, '2024-10-15', 'Active',         56, 83.2),  -- ONC-201: awaiting baseline
  (1095, 103, '2024-10-22', 'Active',         64, 87.4),  -- CardioRisk: awaiting baseline
  (1096, 104, '2024-11-01', 'Active',         33, 63.1),  -- AutoImmune: awaiting baseline
  (1097, 107, '2024-11-08', 'Active',         48, 76.9),  -- NEURO-101 ALS: awaiting baseline
  (1098, 110, '2024-11-12', 'Active',         30, 57.8),  -- IMM-301 Lupus: awaiting baseline
  (1099, 113, '2024-11-20', 'Active',         60, 81.3),  -- GBM Immunotherapy: awaiting baseline
  (1100, 116, '2024-12-01', 'Active',         44, 68.5),  -- RHEUM-201 RA: awaiting baseline
  (1101, 101, '2024-12-10', 'Active',         50, 77.6);  -- ONC-201: awaiting baseline

-- =========================
-- Visits
-- =========================
-- duration_minutes reflects visit type:
--   Baseline:          90-120 min (extensive assessments)
--   Cycle Day 1:       150-180 min (treatment + monitoring)
--   Later cycles:      90-120 min
--   Weekly check-ins:  30-45 min
--   Monthly follow-up: 45-75 min
--   EOT:               60-90 min
--   Follow-up:         30-45 min
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
-- Tests grouped by disease area:
--   Oncology/Neuro-Onc:      CBC (WBC, Hemoglobin, Platelets), CEA, LDH
--   Hematology-Oncology:     CBC with differential (WBC, Hemoglobin, Platelets, Neutrophils, LDH)
--   Cardiology/Cardio-Onc:   BNP, Troponin I, LDL, HDL, Creatinine
--   Neurology:               WBC, Creatinine, ALT
--   Immunology/Rheumatology: CRP, ESR, ANA Titer, RF, anti-CCP
-- Reference ranges noted in comments
INSERT INTO lab_results (lab_id, patient_id, visit_id, test_name, result_value, unit)
VALUES
  -- Patient 1001 | Trial 101 Oncology | Visit 1 Baseline
  -- WBC normal 4.5-11.0, Hgb normal 12.0-16.0, Plt normal 150-400
  (1,  1001, 1,   'WBC',         5.2,  'K/uL'),
  (2,  1001, 1,   'Hemoglobin',  13.1, 'g/dL'),
  (3,  1001, 1,   'Platelets',   210.0,'K/uL'),
  -- Patient 1001 | Visit 2 Cycle 1 Day 1 — slight CBC drop expected post-treatment
  (4,  1001, 2,   'WBC',         4.1,  'K/uL'),
  (5,  1001, 2,   'Hemoglobin',  12.4, 'g/dL'),
  -- Patient 1001 | Visit 12 Cycle 2 Day 1
  (6,  1001, 12,  'WBC',         3.8,  'K/uL'),
  (7,  1001, 12,  'Hemoglobin',  11.9, 'g/dL'),

  -- Patient 1004 | Trial 102 Neurology | Visit 4 Baseline
  (8,  1004, 4,   'WBC',         6.1,  'K/uL'),
  (9,  1004, 4,   'Creatinine',  0.9,  'mg/dL'),
  (10, 1004, 4,   'ALT',         22.0, 'U/L'),
  -- Patient 1004 | Visit 35 Week 12
  (11, 1004, 35,  'WBC',         5.8,  'K/uL'),
  (12, 1004, 35,  'Creatinine',  1.0,  'mg/dL'),

  -- Patient 1018 | Trial 102 Neurology | Visit 46 Baseline
  (13, 1018, 46,  'WBC',         5.8,  'K/uL'),
  (14, 1018, 46,  'Creatinine',  0.8,  'mg/dL'),
  (15, 1018, 46,  'ALT',         18.0, 'U/L'),

  -- Patient 1007 | Trial 103 Cardiology | Visit 8 Baseline
  -- BNP elevated in heart failure (normal <100 pg/mL); LDL high
  (16, 1007, 8,   'BNP',         210.0,'pg/mL'),
  (17, 1007, 8,   'LDL',         142.0,'mg/dL'),
  (18, 1007, 8,   'Creatinine',  1.1,  'mg/dL'),
  -- Patient 1007 | Visit 9 Month 1 — BNP improving
  (19, 1007, 9,   'BNP',         175.0,'pg/mL'),
  (20, 1007, 9,   'LDL',         128.0,'mg/dL'),

  -- Patient 1024 | Trial 103 Cardiology | Visit 66 Baseline
  (21, 1024, 66,  'BNP',         185.0,'pg/mL'),
  (22, 1024, 66,  'LDL',         158.0,'mg/dL'),
  (23, 1024, 66,  'HDL',          42.0,'mg/dL'),
  (24, 1024, 66,  'Troponin I',    0.02,'ng/mL'),
  -- Patient 1024 | Visit 68 Month 3
  (25, 1024, 68,  'BNP',         140.0,'pg/mL'),
  (26, 1024, 68,  'LDL',         131.0,'mg/dL'),

  -- Patient 1009 | Trial 104 Immunology | Visit 10 Baseline
  -- CRP elevated in autoimmune (normal <5 mg/L); ESR normal <20 mm/hr
  (27, 1009, 10,  'CRP',          18.4,'mg/L'),
  (28, 1009, 10,  'ESR',          42.0,'mm/hr'),
  -- Patient 1009 | Visit 82 Week 4 — inflammation reducing
  (29, 1009, 82,  'CRP',          11.2,'mg/L'),
  (30, 1009, 82,  'ESR',          31.0,'mm/hr'),

  -- Patient 1029 | Trial 104 Immunology | Visit 86 Baseline
  (31, 1029, 86,  'CRP',          24.1,'mg/L'),
  (32, 1029, 86,  'ESR',          55.0,'mm/hr'),
  (33, 1029, 86,  'ANA Titer',   160.0,'titer'),

  -- Patient 1038 | Trial 106 Oncology Phase III | Visit 107 Baseline
  (34, 1038, 107, 'WBC',          6.4, 'K/uL'),
  (35, 1038, 107, 'Hemoglobin',  13.8, 'g/dL'),
  (36, 1038, 107, 'Platelets',   235.0,'K/uL'),
  (37, 1038, 107, 'CEA',          8.2, 'ng/mL'),
  -- Patient 1038 | Visit 109 Cycle 2 Day 1 — expected myelosuppression
  (38, 1038, 109, 'WBC',          2.9, 'K/uL'),
  (39, 1038, 109, 'Hemoglobin',  10.8, 'g/dL'),
  (40, 1038, 109, 'Platelets',   118.0,'K/uL'),

  -- Patient 1052 | Trial 109 Cardiology Phase III | Visit 157 Baseline
  (41, 1052, 157, 'BNP',         312.0,'pg/mL'),
  (42, 1052, 157, 'LDL',         168.0,'mg/dL'),
  (43, 1052, 157, 'Troponin I',    0.04,'ng/mL'),
  -- Patient 1052 | Visit 160 Month 12 — BNP improving with treatment
  (44, 1052, 160, 'BNP',         198.0,'pg/mL'),
  (45, 1052, 160, 'LDL',         112.0,'mg/dL'),

  -- Patient 1062 | Trial 111 Hematology-Oncology AML | Visit 192 Baseline
  -- AML: high WBC (blasts), low Hgb, low Plt, elevated LDH
  (46, 1062, 192, 'WBC',          18.5,'K/uL'),
  (47, 1062, 192, 'Hemoglobin',    9.2,'g/dL'),
  (48, 1062, 192, 'Platelets',     42.0,'K/uL'),
  (49, 1062, 192, 'LDH',         420.0,'U/L'),
  -- Patient 1062 | Visit 194 Cycle 2 Day 1 — response to induction
  (50, 1062, 194, 'WBC',           4.8,'K/uL'),
  (51, 1062, 194, 'Hemoglobin',   10.1,'g/dL'),
  (52, 1062, 194, 'Platelets',    89.0,'K/uL'),

  -- Patient 1067 | Trial 112 Hematology-Oncology CLL | Visit 207 Baseline
  -- CLL: markedly elevated WBC (lymphocytes), low Hgb, low Plt
  (53, 1067, 207, 'WBC',          42.0,'K/uL'),
  (54, 1067, 207, 'Hemoglobin',   10.8,'g/dL'),
  (55, 1067, 207, 'Platelets',     98.0,'K/uL'),
  (56, 1067, 207, 'LDH',         285.0,'U/L'),
  -- Patient 1067 | Visit 210 Month 12 — CLL suppressed on maintenance
  (57, 1067, 210, 'WBC',          12.4,'K/uL'),
  (58, 1067, 210, 'Hemoglobin',   12.1,'g/dL'),
  (59, 1067, 210, 'Platelets',   142.0,'K/uL'),

  -- Patient 1076 | Trial 114 Neuro-Oncology | Visit 241 Baseline
  (60, 1076, 241, 'WBC',           5.9,'K/uL'),
  (61, 1076, 241, 'Hemoglobin',   12.4,'g/dL'),
  (62, 1076, 241, 'LDH',         310.0,'U/L'),

  -- Patient 1058 | Trial 110 Lupus | Visit 179 Baseline
  -- SLE: elevated CRP, ESR, ANA positive
  (63, 1058, 179, 'CRP',          28.7,'mg/L'),
  (64, 1058, 179, 'ESR',          61.0,'mm/hr'),
  (65, 1058, 179, 'ANA Titer',   640.0,'titer'),
  -- Patient 1058 | Visit 181 Week 12 — partial response
  (66, 1058, 181, 'CRP',          14.3,'mg/L'),
  (67, 1058, 181, 'ESR',          38.0,'mm/hr'),

  -- Patient 1084 | Trial 116 Rheumatology RA | Visit 264 Baseline
  -- RA: elevated CRP, ESR, RF, anti-CCP
  (68, 1084, 264, 'CRP',          32.5,'mg/L'),
  (69, 1084, 264, 'ESR',          68.0,'mm/hr'),
  (70, 1084, 264, 'RF',           85.0,'IU/mL'),
  (71, 1084, 264, 'anti-CCP',    112.0,'U/mL'),
  -- Patient 1084 | Visit 266 Week 24 — biologic response
  (72, 1084, 266, 'CRP',           8.1,'mg/L'),
  (73, 1084, 266, 'ESR',          28.0,'mm/hr'),
  (74, 1084, 266, 'RF',           52.0,'IU/mL'),

  -- Patient 1089 | Trial 117 Rheumatology PsA | Visit 279 Baseline
  (75, 1089, 279, 'CRP',          21.4,'mg/L'),
  (76, 1089, 279, 'ESR',          48.0,'mm/hr'),
  -- Patient 1089 | Visit 281 Month 12
  (77, 1089, 281, 'CRP',           6.8,'mg/L'),
  (78, 1089, 281, 'ESR',          22.0,'mm/hr');
