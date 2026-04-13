-- =========================
-- Departments
-- =========================
INSERT INTO
  departments (department_id, department_name)
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
-- Multiple trials per department; cross-disciplinary teams reflect
-- how disease areas overlap in real clinical research programs.
INSERT INTO
  trials (
    trial_id,
    trial_name,
    phase,
    department_id,
    start_date
  )
VALUES
  -- Oncology: 3 trials across Phase I–III
  (
    101,
    'ONC-201 Immunotherapy Study',
    'Phase II',
    1,
    '2024-01-15'
  ),
  (
    105,
    'ONC-301 Targeted Therapy Study',
    'Phase I',
    1,
    '2023-06-01'
  ),
  (
    106,
    'ONC-401 Combination Chemotherapy Trial',
    'Phase III',
    1,
    '2022-11-01'
  ),
  -- Neurology: 3 trials
  (
    102,
    'NeuroCognitive Decline Trial',
    'Phase III',
    2,
    '2023-09-01'
  ),
  (
    107,
    'NEURO-101 Early ALS Biomarker Study',
    'Phase I',
    2,
    '2024-04-01'
  ),
  (
    108,
    'NEURO-205 MS Remission Trial',
    'Phase II',
    2,
    '2023-07-01'
  ),
  -- Cardiology: 2 trials
  (
    103,
    'CardioRisk Reduction Study',
    'Phase II',
    3,
    '2024-03-10'
  ),
  (
    109,
    'CARDIO-102 Heart Failure Management Study',
    'Phase III',
    3,
    '2023-01-15'
  ),
  -- Immunology: 2 trials
  (
    104,
    'AutoImmune Response Trial',
    'Phase I',
    4,
    '2024-06-01'
  ),
  (
    110,
    'IMM-301 Systemic Lupus Treatment Study',
    'Phase II',
    4,
    '2024-02-01'
  ),
  -- Hematology-Oncology: 2 trials
  (
    111,
    'HEME-201 AML Remission Induction Study',
    'Phase II',
    5,
    '2023-08-01'
  ),
  (
    112,
    'HEME-301 CLL Maintenance Trial',
    'Phase III',
    5,
    '2022-09-01'
  ),
  -- Neuro-Oncology: 2 trials
  (
    113,
    'NEUROONC-101 Glioblastoma Immunotherapy Study',
    'Phase I',
    6,
    '2024-05-01'
  ),
  (
    114,
    'NEUROONC-201 Brain Metastasis Response Trial',
    'Phase II',
    6,
    '2023-10-01'
  ),
  -- Cardio-Oncology: 1 trial
  (
    115,
    'CARDIONC-101 Cardiac Safety in Oncology Study',
    'Phase II',
    7,
    '2024-01-01'
  ),
  -- Rheumatology: 2 trials
  (
    116,
    'RHEUM-201 RA Biologic Dose Study',
    'Phase II',
    8,
    '2023-05-01'
  ),
  (
    117,
    'RHEUM-301 Psoriatic Arthritis Maintenance Trial',
    'Phase III',
    8,
    '2022-08-01'
  );

-- =========================
-- Patients
-- =========================
INSERT INTO
  patients (patient_id, trial_id, enrollment_date, status)
VALUES
  -- Trial 101: ONC-201 Immunotherapy Study (Oncology, Phase II)
  (1001, 101, '2024-02-01', 'Active'),
  (1002, 101, '2024-02-12', 'Active'),
  (1003, 101, '2024-03-05', 'Withdrawn'),
  (1011, 101, '2024-02-20', 'Active'),
  (1012, 101, '2024-03-01', 'Active'),
  (1013, 101, '2024-02-10', 'Completed'),
  (1014, 101, '2024-03-10', 'Withdrawn'),
  (1015, 101, '2024-03-15', 'Screen Failure'),
  (1016, 101, '2024-04-01', 'Active'),
  -- Trial 102: NeuroCognitive Decline Trial (Neurology, Phase III)
  (1004, 102, '2023-10-15', 'Completed'),
  (1005, 102, '2023-11-20', 'Active'),
  (1006, 102, '2024-01-05', 'Active'),
  (1017, 102, '2023-10-01', 'Completed'),
  (1018, 102, '2023-09-15', 'Completed'),
  (1019, 102, '2024-02-01', 'Active'),
  (1020, 102, '2023-12-15', 'Withdrawn'),
  (1021, 102, '2024-02-15', 'Active'),
  (1022, 102, '2024-03-01', 'Screen Failure'),
  (1023, 102, '2023-11-01', 'Completed'),
  -- Trial 103: CardioRisk Reduction Study (Cardiology, Phase II)
  (1007, 103, '2024-03-20', 'Active'),
  (1008, 103, '2024-04-02', 'Screen Failure'),
  (1024, 103, '2024-03-25', 'Active'),
  (1025, 103, '2024-04-10', 'Active'),
  (1026, 103, '2024-03-18', 'Completed'),
  (1027, 103, '2024-04-15', 'Withdrawn'),
  (1028, 103, '2024-04-20', 'Active'),
  -- Trial 104: AutoImmune Response Trial (Immunology, Phase I)
  (1009, 104, '2024-06-10', 'Active'),
  (1010, 104, '2024-06-18', 'Active'),
  (1029, 104, '2024-06-22', 'Active'),
  (1030, 104, '2024-07-01', 'Withdrawn'),
  (1031, 104, '2024-07-08', 'Active'),
  (1032, 104, '2024-07-15', 'Screen Failure'),
  (1033, 104, '2024-07-20', 'Active'),
  -- Trial 105: ONC-301 Targeted Therapy Study (Oncology, Phase I)
  (1034, 105, '2023-07-01', 'Active'),
  (1035, 105, '2023-07-15', 'Completed'),
  (1036, 105, '2023-08-01', 'Screen Failure'),
  (1037, 105, '2023-08-20', 'Withdrawn'),
  -- Trial 106: ONC-401 Combination Chemotherapy Trial (Oncology, Phase III)
  (1038, 106, '2023-01-05', 'Completed'),
  (1039, 106, '2023-01-20', 'Completed'),
  (1040, 106, '2023-02-10', 'Active'),
  (1041, 106, '2023-03-01', 'Withdrawn'),
  (1042, 106, '2023-03-15', 'Active'),
  -- Trial 107: NEURO-101 Early ALS Biomarker Study (Neurology, Phase I)
  (1043, 107, '2024-05-01', 'Active'),
  (1044, 107, '2024-05-15', 'Active'),
  (1045, 107, '2024-06-01', 'Screen Failure'),
  (1046, 107, '2024-06-10', 'Active'),
  -- Trial 108: NEURO-205 MS Remission Trial (Neurology, Phase II)
  (1047, 108, '2023-08-01', 'Completed'),
  (1048, 108, '2023-08-20', 'Completed'),
  (1049, 108, '2023-09-10', 'Active'),
  (1050, 108, '2023-10-01', 'Withdrawn'),
  (1051, 108, '2023-10-20', 'Active'),
  -- Trial 109: CARDIO-102 Heart Failure Management Study (Cardiology, Phase III)
  (1052, 109, '2023-02-01', 'Completed'),
  (1053, 109, '2023-02-15', 'Completed'),
  (1054, 109, '2023-03-01', 'Active'),
  (1055, 109, '2023-03-20', 'Active'),
  (1056, 109, '2023-04-01', 'Withdrawn'),
  (1057, 109, '2023-04-15', 'Screen Failure'),
  -- Trial 110: IMM-301 Systemic Lupus Treatment Study (Immunology, Phase II)
  (1058, 110, '2024-02-15', 'Active'),
  (1059, 110, '2024-03-01', 'Active'),
  (1060, 110, '2024-03-20', 'Withdrawn'),
  (1061, 110, '2024-04-01', 'Active'),
  -- Trial 111: HEME-201 AML Remission Induction Study (Hematology-Oncology, Phase II)
  (1062, 111, '2023-09-01', 'Completed'),
  (1063, 111, '2023-09-15', 'Active'),
  (1064, 111, '2023-10-01', 'Withdrawn'),
  (1065, 111, '2023-10-20', 'Active'),
  (1066, 111, '2023-11-01', 'Screen Failure'),
  -- Trial 112: HEME-301 CLL Maintenance Trial (Hematology-Oncology, Phase III)
  (1067, 112, '2022-10-01', 'Completed'),
  (1068, 112, '2022-10-15', 'Completed'),
  (1069, 112, '2022-11-01', 'Active'),
  (1070, 112, '2022-11-20', 'Active'),
  (1071, 112, '2022-12-01', 'Withdrawn'),
  -- Trial 113: NEUROONC-101 Glioblastoma Immunotherapy Study (Neuro-Oncology, Phase I)
  (1072, 113, '2024-05-15', 'Active'),
  (1073, 113, '2024-06-01', 'Active'),
  (1074, 113, '2024-06-15', 'Screen Failure'),
  (1075, 113, '2024-07-01', 'Active'),
  -- Trial 114: NEUROONC-201 Brain Metastasis Response Trial (Neuro-Oncology, Phase II)
  (1076, 114, '2023-11-01', 'Completed'),
  (1077, 114, '2023-11-15', 'Active'),
  (1078, 114, '2023-12-01', 'Withdrawn'),
  (1079, 114, '2024-01-10', 'Active'),
  -- Trial 115: CARDIONC-101 Cardiac Safety in Oncology Study (Cardio-Oncology, Phase II)
  (1080, 115, '2024-01-15', 'Active'),
  (1081, 115, '2024-02-01', 'Active'),
  (1082, 115, '2024-02-15', 'Withdrawn'),
  (1083, 115, '2024-03-01', 'Active'),
  -- Trial 116: RHEUM-201 RA Biologic Dose Study (Rheumatology, Phase II)
  (1084, 116, '2023-06-01', 'Completed'),
  (1085, 116, '2023-06-20', 'Active'),
  (1086, 116, '2023-07-10', 'Withdrawn'),
  (1087, 116, '2023-07-25', 'Active'),
  (1088, 116, '2023-08-15', 'Screen Failure'),
  -- Trial 117: RHEUM-301 Psoriatic Arthritis Maintenance Trial (Rheumatology, Phase III)
  (1089, 117, '2022-09-01', 'Completed'),
  (1090, 117, '2022-09-20', 'Completed'),
  (1091, 117, '2022-10-05', 'Active'),
  (1092, 117, '2022-10-25', 'Active'),
  (1093, 117, '2022-11-10', 'Withdrawn');

-- =========================
-- Visits
-- =========================
-- Timepoints by trial type:
--   Oncology cycles (101, 105, 106):         Baseline, Cycle 1 Day 1, Cycle 2 Day 1, Cycle 3 Day 1, Cycle 4 Day 1, EOT, Follow-up
--   Phase I short-duration (105, 107, 113):  Baseline, Day 8 / Day 14, Day 15 / Day 28, EOT
--   Neurology weekly (102, 108):             Baseline, Week 4/12, Week 12/24, Week 24/48, EOT, Follow-up
--   Cardiology monthly (103, 109):           Baseline, Month 1/3, Month 3/6, Month 6/12, EOT, Follow-up
--   Immunology (104, 110):                   Baseline, Week 2/4, Week 4/12, Week 8/24, EOT
--   Hematology (111, 112):                   Baseline, Cycle 1 Day 1, Cycle 2 Day 1, Cycle 4 Day 1, Month 3/6/12/18, EOT, Follow-up
--   Neuro-Oncology (113, 114):               Baseline, Day 14/Cycle 1, Day 28/Cycle 2, Cycle 3, EOT
--   Cardio-Oncology (115):                   Baseline, Week 8, Week 16, EOT
--   Rheumatology (116, 117):                 Baseline, Week 12/Month 6, Week 24/Month 12, Week 52/Month 18, Month 24, EOT, Follow-up
INSERT INTO
  visits (
    visit_id,
    patient_id,
    visit_date,
    visit_timepoint
  )
VALUES
  -- Trial 101: ONC-201 Immunotherapy Study
  (1, 1001, '2024-02-05', 'Baseline'),
  (2, 1001, '2024-02-20', 'Cycle 1 Day 1'),
  (12, 1001, '2024-03-12', 'Cycle 2 Day 1'),
  (13, 1001, '2024-04-02', 'Cycle 3 Day 1'),
  (3, 1002, '2024-02-18', 'Baseline'),
  (14, 1002, '2024-03-04', 'Cycle 1 Day 1'),
  (15, 1002, '2024-03-25', 'Cycle 2 Day 1'),
  (16, 1003, '2024-03-10', 'Baseline'),
  (17, 1011, '2024-02-25', 'Baseline'),
  (18, 1011, '2024-03-10', 'Cycle 1 Day 1'),
  (19, 1011, '2024-03-31', 'Cycle 2 Day 1'),
  (20, 1011, '2024-04-21', 'Cycle 3 Day 1'),
  (21, 1012, '2024-03-06', 'Baseline'),
  (22, 1012, '2024-03-21', 'Cycle 1 Day 1'),
  (23, 1013, '2024-02-15', 'Baseline'),
  (24, 1013, '2024-03-01', 'Cycle 1 Day 1'),
  (25, 1013, '2024-03-22', 'Cycle 2 Day 1'),
  (26, 1013, '2024-04-12', 'Cycle 3 Day 1'),
  (27, 1013, '2024-05-03', 'EOT'),
  (28, 1014, '2024-03-15', 'Baseline'),
  (29, 1014, '2024-03-30', 'Cycle 1 Day 1'),
  (30, 1015, '2024-03-20', 'Baseline'),
  (31, 1016, '2024-04-06', 'Baseline'),
  (32, 1016, '2024-04-21', 'Cycle 1 Day 1'),
  (33, 1016, '2024-05-12', 'Cycle 2 Day 1'),
  -- Trial 102: NeuroCognitive Decline Trial
  (4, 1004, '2023-10-20', 'Baseline'),
  (34, 1004, '2023-11-17', 'Week 4'),
  (35, 1004, '2024-01-12', 'Week 12'),
  (36, 1004, '2024-04-05', 'Week 24'),
  (37, 1004, '2024-05-10', 'EOT'),
  (38, 1004, '2024-06-07', 'Follow-up'),
  (5, 1005, '2023-11-25', 'Baseline'),
  (39, 1005, '2023-12-23', 'Week 4'),
  (40, 1005, '2024-02-17', 'Week 12'),
  (6, 1006, '2024-01-10', 'Baseline'),
  (7, 1006, '2024-01-24', 'EOT'),
  (41, 1017, '2023-10-06', 'Baseline'),
  (42, 1017, '2023-11-03', 'Week 4'),
  (43, 1017, '2023-12-29', 'Week 12'),
  (44, 1017, '2024-03-23', 'Week 24'),
  (45, 1017, '2024-04-27', 'EOT'),
  (46, 1018, '2023-09-20', 'Baseline'),
  (47, 1018, '2023-10-18', 'Week 4'),
  (48, 1018, '2023-12-13', 'Week 12'),
  (49, 1018, '2024-03-07', 'Week 24'),
  (50, 1018, '2024-04-11', 'EOT'),
  (51, 1018, '2024-05-09', 'Follow-up'),
  (52, 1019, '2024-02-07', 'Baseline'),
  (53, 1019, '2024-03-06', 'Week 4'),
  (54, 1020, '2023-12-20', 'Baseline'),
  (55, 1021, '2024-02-20', 'Baseline'),
  (56, 1021, '2024-03-19', 'Week 4'),
  (57, 1021, '2024-05-14', 'Week 12'),
  (58, 1022, '2024-03-06', 'Baseline'),
  (59, 1023, '2023-11-06', 'Baseline'),
  (60, 1023, '2023-12-04', 'Week 4'),
  (61, 1023, '2024-01-29', 'Week 12'),
  (62, 1023, '2024-04-24', 'Week 24'),
  (63, 1023, '2024-05-29', 'EOT'),
  -- Trial 103: CardioRisk Reduction Study
  (8, 1007, '2024-03-25', 'Baseline'),
  (9, 1007, '2024-04-10', 'Month 1'),
  (64, 1007, '2024-06-10', 'Month 3'),
  (65, 1008, '2024-04-07', 'Baseline'),
  (66, 1024, '2024-03-30', 'Baseline'),
  (67, 1024, '2024-04-30', 'Month 1'),
  (68, 1024, '2024-06-30', 'Month 3'),
  (69, 1024, '2024-09-30', 'Month 6'),
  (70, 1025, '2024-04-15', 'Baseline'),
  (71, 1025, '2024-05-15', 'Month 1'),
  (72, 1026, '2024-03-23', 'Baseline'),
  (73, 1026, '2024-04-23', 'Month 1'),
  (74, 1026, '2024-06-23', 'Month 3'),
  (75, 1026, '2024-09-23', 'Month 6'),
  (76, 1026, '2024-10-23', 'EOT'),
  (77, 1027, '2024-04-20', 'Baseline'),
  (78, 1028, '2024-04-25', 'Baseline'),
  (79, 1028, '2024-05-25', 'Month 1'),
  (80, 1028, '2024-07-25', 'Month 3'),
  -- Trial 104: AutoImmune Response Trial
  (10, 1009, '2024-06-15', 'Baseline'),
  (81, 1009, '2024-06-29', 'Week 2'),
  (82, 1009, '2024-07-13', 'Week 4'),
  (11, 1010, '2024-06-22', 'Baseline'),
  (83, 1010, '2024-07-06', 'Week 2'),
  (84, 1010, '2024-07-20', 'Week 4'),
  (85, 1010, '2024-08-17', 'Week 8'),
  (86, 1029, '2024-06-27', 'Baseline'),
  (87, 1029, '2024-07-11', 'Week 2'),
  (88, 1029, '2024-07-25', 'Week 4'),
  (89, 1030, '2024-07-06', 'Baseline'),
  (90, 1031, '2024-07-13', 'Baseline'),
  (91, 1031, '2024-07-27', 'Week 2'),
  (92, 1032, '2024-07-20', 'Baseline'),
  (93, 1033, '2024-07-25', 'Baseline'),
  (94, 1033, '2024-08-08', 'Week 2'),
  (95, 1033, '2024-08-22', 'Week 4'),
  (96, 1033, '2024-09-19', 'Week 8'),
  -- Trial 105: ONC-301 Targeted Therapy Study (Phase I)
  (97, 1034, '2023-07-06', 'Baseline'),
  (98, 1034, '2023-07-14', 'Day 8'),
  (99, 1034, '2023-07-21', 'Day 15'),
  (100, 1035, '2023-07-20', 'Baseline'),
  (101, 1035, '2023-07-28', 'Day 8'),
  (102, 1035, '2023-08-04', 'Day 15'),
  (103, 1035, '2023-08-25', 'EOT'),
  (104, 1036, '2023-08-06', 'Baseline'),
  (105, 1037, '2023-08-25', 'Baseline'),
  (106, 1037, '2023-09-02', 'Day 8'),
  -- Trial 106: ONC-401 Combination Chemotherapy Trial (Phase III)
  (107, 1038, '2023-01-10', 'Baseline'),
  (108, 1038, '2023-01-24', 'Cycle 1 Day 1'),
  (109, 1038, '2023-02-14', 'Cycle 2 Day 1'),
  (110, 1038, '2023-03-07', 'Cycle 3 Day 1'),
  (111, 1038, '2023-03-28', 'Cycle 4 Day 1'),
  (112, 1038, '2023-04-18', 'EOT'),
  (113, 1038, '2023-05-16', 'Follow-up'),
  (114, 1039, '2023-01-25', 'Baseline'),
  (115, 1039, '2023-02-08', 'Cycle 1 Day 1'),
  (116, 1039, '2023-03-01', 'Cycle 2 Day 1'),
  (117, 1039, '2023-03-22', 'Cycle 3 Day 1'),
  (118, 1039, '2023-04-12', 'Cycle 4 Day 1'),
  (119, 1039, '2023-05-03', 'EOT'),
  (120, 1039, '2023-05-31', 'Follow-up'),
  (121, 1040, '2023-02-15', 'Baseline'),
  (122, 1040, '2023-03-01', 'Cycle 1 Day 1'),
  (123, 1040, '2023-03-22', 'Cycle 2 Day 1'),
  (124, 1040, '2023-04-12', 'Cycle 3 Day 1'),
  (125, 1041, '2023-03-05', 'Baseline'),
  (126, 1041, '2023-03-19', 'Cycle 1 Day 1'),
  (127, 1042, '2023-03-20', 'Baseline'),
  (128, 1042, '2023-04-03', 'Cycle 1 Day 1'),
  (129, 1042, '2023-04-24', 'Cycle 2 Day 1'),
  -- Trial 107: NEURO-101 Early ALS Biomarker Study (Phase I)
  (130, 1043, '2024-05-06', 'Baseline'),
  (131, 1043, '2024-05-20', 'Week 2'),
  (132, 1043, '2024-06-03', 'Week 4'),
  (133, 1044, '2024-05-20', 'Baseline'),
  (134, 1044, '2024-06-03', 'Week 2'),
  (135, 1045, '2024-06-06', 'Baseline'),
  (136, 1046, '2024-06-15', 'Baseline'),
  (137, 1046, '2024-06-29', 'Week 2'),
  (138, 1046, '2024-07-13', 'Week 4'),
  -- Trial 108: NEURO-205 MS Remission Trial (Phase II)
  (139, 1047, '2023-08-06', 'Baseline'),
  (140, 1047, '2023-10-29', 'Week 12'),
  (141, 1047, '2024-01-21', 'Week 24'),
  (142, 1047, '2024-07-07', 'Week 48'),
  (143, 1047, '2024-08-04', 'EOT'),
  (144, 1048, '2023-08-25', 'Baseline'),
  (145, 1048, '2023-11-17', 'Week 12'),
  (146, 1048, '2024-02-10', 'Week 24'),
  (147, 1048, '2024-08-04', 'Week 48'),
  (148, 1048, '2024-09-01', 'EOT'),
  (149, 1049, '2023-09-15', 'Baseline'),
  (150, 1049, '2023-12-08', 'Week 12'),
  (151, 1049, '2024-03-02', 'Week 24'),
  (152, 1050, '2023-10-06', 'Baseline'),
  (153, 1050, '2023-12-29', 'Week 12'),
  (154, 1051, '2023-10-25', 'Baseline'),
  (155, 1051, '2024-01-17', 'Week 12'),
  (156, 1051, '2024-04-11', 'Week 24'),
  -- Trial 109: CARDIO-102 Heart Failure Management Study (Phase III)
  (157, 1052, '2023-02-06', 'Baseline'),
  (158, 1052, '2023-05-06', 'Month 3'),
  (159, 1052, '2023-08-06', 'Month 6'),
  (160, 1052, '2024-02-06', 'Month 12'),
  (161, 1052, '2024-03-05', 'EOT'),
  (162, 1052, '2024-04-02', 'Follow-up'),
  (163, 1053, '2023-02-20', 'Baseline'),
  (164, 1053, '2023-05-20', 'Month 3'),
  (165, 1053, '2023-08-20', 'Month 6'),
  (166, 1053, '2024-02-20', 'Month 12'),
  (167, 1053, '2024-03-19', 'EOT'),
  (168, 1053, '2024-04-16', 'Follow-up'),
  (169, 1054, '2023-03-06', 'Baseline'),
  (170, 1054, '2023-06-06', 'Month 3'),
  (171, 1054, '2023-09-06', 'Month 6'),
  (172, 1055, '2023-03-25', 'Baseline'),
  (173, 1055, '2023-06-25', 'Month 3'),
  (174, 1055, '2023-09-25', 'Month 6'),
  (175, 1055, '2024-03-25', 'Month 12'),
  (176, 1056, '2023-04-06', 'Baseline'),
  (177, 1056, '2023-07-06', 'Month 3'),
  (178, 1057, '2023-04-20', 'Baseline'),
  -- Trial 110: IMM-301 Systemic Lupus Treatment Study (Phase II)
  (179, 1058, '2024-02-20', 'Baseline'),
  (180, 1058, '2024-03-19', 'Week 4'),
  (181, 1058, '2024-05-14', 'Week 12'),
  (182, 1058, '2024-08-06', 'Week 24'),
  (183, 1059, '2024-03-06', 'Baseline'),
  (184, 1059, '2024-04-03', 'Week 4'),
  (185, 1059, '2024-05-29', 'Week 12'),
  (186, 1060, '2024-03-25', 'Baseline'),
  (187, 1060, '2024-04-22', 'Week 4'),
  (188, 1061, '2024-04-06', 'Baseline'),
  (189, 1061, '2024-05-04', 'Week 4'),
  (190, 1061, '2024-06-29', 'Week 12'),
  (191, 1061, '2024-09-21', 'Week 24'),
  -- Trial 111: HEME-201 AML Remission Induction Study (Phase II)
  (192, 1062, '2023-09-06', 'Baseline'),
  (193, 1062, '2023-09-20', 'Cycle 1 Day 1'),
  (194, 1062, '2023-10-11', 'Cycle 2 Day 1'),
  (195, 1062, '2023-11-22', 'Cycle 4 Day 1'),
  (196, 1062, '2023-12-20', 'EOT'),
  (197, 1063, '2023-09-20', 'Baseline'),
  (198, 1063, '2023-10-04', 'Cycle 1 Day 1'),
  (199, 1063, '2023-10-25', 'Cycle 2 Day 1'),
  (200, 1064, '2023-10-06', 'Baseline'),
  (201, 1064, '2023-10-20', 'Cycle 1 Day 1'),
  (202, 1065, '2023-10-25', 'Baseline'),
  (203, 1065, '2023-11-08', 'Cycle 1 Day 1'),
  (204, 1065, '2023-11-29', 'Cycle 2 Day 1'),
  (205, 1065, '2024-01-10', 'Cycle 4 Day 1'),
  (206, 1066, '2023-11-06', 'Baseline'),
  -- Trial 112: HEME-301 CLL Maintenance Trial (Phase III)
  (207, 1067, '2022-10-06', 'Baseline'),
  (208, 1067, '2023-01-06', 'Month 3'),
  (209, 1067, '2023-04-06', 'Month 6'),
  (210, 1067, '2023-10-06', 'Month 12'),
  (211, 1067, '2024-04-06', 'Month 18'),
  (212, 1067, '2024-05-04', 'EOT'),
  (213, 1067, '2024-06-01', 'Follow-up'),
  (214, 1068, '2022-10-20', 'Baseline'),
  (215, 1068, '2023-01-20', 'Month 3'),
  (216, 1068, '2023-04-20', 'Month 6'),
  (217, 1068, '2023-10-20', 'Month 12'),
  (218, 1068, '2024-04-20', 'Month 18'),
  (219, 1068, '2024-05-18', 'EOT'),
  (220, 1068, '2024-06-15', 'Follow-up'),
  (221, 1069, '2022-11-06', 'Baseline'),
  (222, 1069, '2023-02-06', 'Month 3'),
  (223, 1069, '2023-05-06', 'Month 6'),
  (224, 1069, '2023-11-06', 'Month 12'),
  (225, 1070, '2022-11-25', 'Baseline'),
  (226, 1070, '2023-02-25', 'Month 3'),
  (227, 1070, '2023-05-25', 'Month 6'),
  (228, 1070, '2023-11-25', 'Month 12'),
  (229, 1070, '2024-05-25', 'Month 18'),
  (230, 1071, '2022-12-06', 'Baseline'),
  (231, 1071, '2023-03-06', 'Month 3'),
  -- Trial 113: NEUROONC-101 Glioblastoma Immunotherapy Study (Phase I)
  (232, 1072, '2024-05-20', 'Baseline'),
  (233, 1072, '2024-06-03', 'Day 14'),
  (234, 1072, '2024-06-17', 'Day 28'),
  (235, 1073, '2024-06-06', 'Baseline'),
  (236, 1073, '2024-06-20', 'Day 14'),
  (237, 1074, '2024-06-20', 'Baseline'),
  (238, 1075, '2024-07-06', 'Baseline'),
  (239, 1075, '2024-07-20', 'Day 14'),
  (240, 1075, '2024-08-03', 'Day 28'),
  -- Trial 114: NEUROONC-201 Brain Metastasis Response Trial (Phase II)
  (241, 1076, '2023-11-06', 'Baseline'),
  (242, 1076, '2023-11-20', 'Cycle 1 Day 1'),
  (243, 1076, '2023-12-11', 'Cycle 2 Day 1'),
  (244, 1076, '2024-01-01', 'Cycle 3 Day 1'),
  (245, 1076, '2024-01-22', 'EOT'),
  (246, 1077, '2023-11-20', 'Baseline'),
  (247, 1077, '2023-12-04', 'Cycle 1 Day 1'),
  (248, 1077, '2023-12-25', 'Cycle 2 Day 1'),
  (249, 1078, '2023-12-06', 'Baseline'),
  (250, 1078, '2023-12-20', 'Cycle 1 Day 1'),
  (251, 1079, '2024-01-15', 'Baseline'),
  (252, 1079, '2024-01-29', 'Cycle 1 Day 1'),
  (253, 1079, '2024-02-19', 'Cycle 2 Day 1'),
  (254, 1079, '2024-03-11', 'Cycle 3 Day 1'),
  -- Trial 115: CARDIONC-101 Cardiac Safety in Oncology Study (Phase II)
  (255, 1080, '2024-01-20', 'Baseline'),
  (256, 1080, '2024-03-16', 'Week 8'),
  (257, 1080, '2024-05-11', 'Week 16'),
  (258, 1081, '2024-02-06', 'Baseline'),
  (259, 1081, '2024-04-02', 'Week 8'),
  (260, 1082, '2024-02-20', 'Baseline'),
  (261, 1083, '2024-03-06', 'Baseline'),
  (262, 1083, '2024-04-30', 'Week 8'),
  (263, 1083, '2024-06-25', 'Week 16'),
  -- Trial 116: RHEUM-201 RA Biologic Dose Study (Phase II)
  (264, 1084, '2023-06-06', 'Baseline'),
  (265, 1084, '2023-08-29', 'Week 12'),
  (266, 1084, '2023-11-22', 'Week 24'),
  (267, 1084, '2024-05-15', 'Week 52'),
  (268, 1084, '2024-06-12', 'EOT'),
  (269, 1085, '2023-06-25', 'Baseline'),
  (270, 1085, '2023-09-17', 'Week 12'),
  (271, 1085, '2023-12-11', 'Week 24'),
  (272, 1086, '2023-07-15', 'Baseline'),
  (273, 1086, '2023-10-07', 'Week 12'),
  (274, 1087, '2023-07-30', 'Baseline'),
  (275, 1087, '2023-10-22', 'Week 12'),
  (276, 1087, '2024-01-15', 'Week 24'),
  (277, 1087, '2024-07-08', 'Week 52'),
  (278, 1088, '2023-08-20', 'Baseline'),
  -- Trial 117: RHEUM-301 Psoriatic Arthritis Maintenance Trial (Phase III)
  (279, 1089, '2022-09-06', 'Baseline'),
  (280, 1089, '2023-03-06', 'Month 6'),
  (281, 1089, '2023-09-06', 'Month 12'),
  (282, 1089, '2024-03-06', 'Month 18'),
  (283, 1089, '2024-09-06', 'Month 24'),
  (284, 1089, '2024-10-04', 'EOT'),
  (285, 1089, '2024-11-01', 'Follow-up'),
  (286, 1090, '2022-09-25', 'Baseline'),
  (287, 1090, '2023-03-25', 'Month 6'),
  (288, 1090, '2023-09-25', 'Month 12'),
  (289, 1090, '2024-03-25', 'Month 18'),
  (290, 1090, '2024-09-25', 'Month 24'),
  (291, 1090, '2024-10-23', 'EOT'),
  (292, 1090, '2024-11-20', 'Follow-up'),
  (293, 1091, '2022-10-10', 'Baseline'),
  (294, 1091, '2023-04-10', 'Month 6'),
  (295, 1091, '2023-10-10', 'Month 12'),
  (296, 1092, '2022-10-30', 'Baseline'),
  (297, 1092, '2023-04-30', 'Month 6'),
  (298, 1092, '2023-10-30', 'Month 12'),
  (299, 1092, '2024-04-30', 'Month 18'),
  (300, 1093, '2022-11-15', 'Baseline'),
  (301, 1093, '2023-05-15', 'Month 6');
