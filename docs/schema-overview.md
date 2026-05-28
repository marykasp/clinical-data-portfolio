# Database Schema Overview

This database models a clinical research program with multiple trials across disease departments.
It contains 7 tables connected by foreign keys.

---

## Tables at a Glance

| Table | Rows (seed data) | Purpose |
|---|---|---|
| `departments` | 8 | Disease area teams that own trials |
| `trials` | 20 | Clinical studies, each owned by a department |
| `trial_arms` | 41 | Treatment groups defined within each trial |
| `patients` | 101 | Enrolled participants, each assigned to a trial and arm |
| `visits` | 301 | Study visits per patient |
| `lab_results` | 78 | Lab test results tied to a patient and visit |
| `adverse_events` | 20 | Safety events reported during the trial |

---

## Table Details

### departments

Lookup table. Each department represents a disease team.

| Column | Type | Notes |
|---|---|---|
| `department_id` | INTEGER | Primary key |
| `department_name` | TEXT | e.g. Oncology, Neurology, Rheumatology |

**Departments in the data:**
Oncology, Neurology, Cardiology, Immunology, Hematology-Oncology, Neuro-Oncology, Cardio-Oncology, Rheumatology

---

### trials

One trial belongs to one department. Multiple trials can share a department.
`department_id` is nullable — trial 120 (PILOT-001) has no department assigned.
`end_date` is nullable — NULL means the trial is still active.

| Column | Type | Notes |
|---|---|---|
| `trial_id` | INTEGER | Primary key |
| `trial_name` | TEXT | Full study name, e.g. ONC-201 Immunotherapy Study |
| `phase` | TEXT | Phase I, Phase II, or Phase III |
| `status` | TEXT | Enrolling \| Completed \| On Hold \| Not Yet Open |
| `department_id` | INTEGER | Foreign key → departments (nullable) |
| `principal_investigator` | TEXT | Lead physician running the trial |
| `sponsor` | TEXT | Funding organization, e.g. Novagen Therapeutics |
| `start_date` | DATE | Date the trial opened for enrollment |
| `end_date` | DATE | Date the trial closed; NULL if still active |
| `target_enrollment` | INTEGER | Planned number of patients (Phase I: 8–18, Phase II: 25–50, Phase III: 80–150) |

**Trials per department:**
- Oncology: 3 trials (Phase I, II, III) + 1 Phase I not yet open
- Neurology: 3 trials (Phase I, II, III)
- Cardiology: 2 trials
- Immunology: 2 trials
- Hematology-Oncology: 2 trials
- Neuro-Oncology: 2 trials
- Cardio-Oncology: 1 trial
- Rheumatology: 2 trials + 1 Phase II not yet open
- No department: 1 cross-departmental pilot (PILOT-001)

**Sponsors in the data:**
Novagen Therapeutics, Vektris Oncology, NeurAlign Sciences, CardioForte Pharmaceuticals, Praxis Immunology, Celantis Biologics, Astellar Biosciences

---

### trial_arms

Each trial defines one or more arms (treatment groups). Patients are assigned to exactly one arm at enrollment. Phase I trials typically have 1–2 dose cohorts; Phase II/III trials have 2–3 arms.

| Column | Type | Notes |
|---|---|---|
| `arm_id` | INTEGER | Primary key |
| `trial_id` | INTEGER | Foreign key → trials |
| `arm_name` | TEXT | e.g. Immunotherapy Monotherapy, Placebo, Cohort A — Low Dose |
| `arm_type` | TEXT | Treatment \| Placebo \| Active Comparator \| Observational |

**Arm types:**
- `Treatment` — receives the experimental intervention
- `Placebo` — receives an inert comparator
- `Active Comparator` — receives an existing standard-of-care treatment
- `Observational` — monitored without an assigned intervention

---

### patients

Each patient is enrolled in exactly one trial and assigned to exactly one arm.
8 patients (1094–1101) have no visits yet — they are newly enrolled and awaiting their baseline appointment.

| Column | Type | Notes |
|---|---|---|
| `patient_id` | INTEGER | Primary key (1001–1101) |
| `trial_id` | INTEGER | Foreign key → trials |
| `arm_id` | INTEGER | Foreign key → trial_arms |
| `enrollment_date` | DATE | Date the patient was formally enrolled |
| `status` | TEXT | Active \| Completed \| Withdrawn \| Screen Failure |
| `age` | INTEGER | Age in years at enrollment |
| `date_of_birth` | DATE | Patient date of birth |
| `sex` | TEXT | Male \| Female \| Other |
| `race` | TEXT | White \| Black or African American \| Hispanic or Latino \| Asian |
| `weight_kg` | REAL | Body weight in kilograms at screening |

**Status values:**
- `Active` — currently participating
- `Completed` — finished all protocol visits
- `Withdrawn` — left the study early
- `Screen Failure` — did not pass eligibility checks; never formally enrolled

---

### visits

Each visit belongs to one patient. A patient can have many visits.

| Column | Type | Notes |
|---|---|---|
| `visit_id` | INTEGER | Primary key |
| `patient_id` | INTEGER | Foreign key → patients |
| `visit_date` | DATE | Date the visit occurred |
| `visit_timepoint` | TEXT | Named point in the protocol schedule (see below) |
| `duration_minutes` | INTEGER | Length of the visit in minutes |

**Common timepoints by trial type:**

| Trial type | Timepoints |
|---|---|
| Oncology cycles | Baseline, Cycle 1 Day 1, Cycle 2 Day 1, Cycle 3 Day 1, Cycle 4 Day 1, EOT, Follow-up |
| Phase I short | Baseline, Day 8, Day 14, Day 15, Day 28, EOT |
| Neurology | Baseline, Week 2, Week 4, Week 12, Week 24, Week 48, EOT, Follow-up |
| Cardiology | Baseline, Month 1, Month 3, Month 6, Month 12, EOT, Follow-up |
| Immunology | Baseline, Week 2, Week 4, Week 8, Week 24, EOT |
| Rheumatology | Baseline, Week 12, Week 24, Week 52, Month 6, Month 12, Month 18, Month 24, EOT, Follow-up |

**Typical durations:**
- Baseline: 90–120 min
- Treatment / cycle visits: 140–180 min
- Routine check-ins: 30–55 min
- EOT: 65–90 min
- Follow-up: 35–45 min

---

### lab_results

Each lab result is tied to both a patient and a specific visit.
`reference_range_low` and `reference_range_high` define the normal limits for each test.
`flag` is derived from whether the result falls within, below, or above the reference range.

| Column | Type | Notes |
|---|---|---|
| `lab_id` | INTEGER | Primary key |
| `patient_id` | INTEGER | Foreign key → patients |
| `visit_id` | INTEGER | Foreign key → visits |
| `test_name` | TEXT | Name of the lab test |
| `result_value` | REAL | Numeric result |
| `unit` | TEXT | Unit of measurement |
| `reference_range_low` | REAL | Lower bound of the normal range |
| `reference_range_high` | REAL | Upper bound of the normal range |
| `flag` | TEXT | Normal \| Low \| High \| Critical |

**Flag definitions:**
- `Normal` — result falls within reference range
- `Low` — result is below reference_range_low
- `High` — result is above reference_range_high
- `Critical` — result is significantly outside range and clinically urgent (e.g. WBC > 30, Platelets < 50, ANA Titer > 320)

**Tests in the data by disease area:**

| Disease area | Tests |
|---|---|
| Oncology / Neuro-Oncology | WBC, Hemoglobin, Platelets, CEA, LDH |
| Hematology-Oncology | WBC, Hemoglobin, Platelets, LDH |
| Cardiology / Cardio-Oncology | BNP, Troponin I, LDL, HDL, Creatinine |
| Neurology | WBC, Creatinine, ALT |
| Immunology / Lupus | CRP, ESR, ANA Titer |
| Rheumatology | CRP, ESR, RF, anti-CCP |

**Reference ranges:**

| Test | Low | High | Unit | Critical threshold |
|---|---|---|---|---|
| WBC | 4.5 | 11.0 | K/uL | < 2.0 or > 30.0 |
| Hemoglobin | 12.0 | 16.0 | g/dL | < 7.0 |
| Platelets | 150 | 400 | K/uL | < 50 |
| Creatinine | 0.6 | 1.2 | mg/dL | > 4.0 |
| ALT | 7 | 56 | U/L | — |
| LDH | 140 | 280 | U/L | — |
| CEA | 0 | 2.5 | ng/mL | — |
| BNP | 0 | 100 | pg/mL | > 500 |
| Troponin I | 0 | 0.04 | ng/mL | — |
| LDL | 0 | 100 | mg/dL | — |
| HDL | 40 | 60 | mg/dL | — |
| CRP | 0 | 5.0 | mg/L | — |
| ESR | 0 | 20 | mm/hr | — |
| ANA Titer | 0 | 40 | titer | > 320 |
| RF | 0 | 14 | IU/mL | — |
| anti-CCP | 0 | 20 | U/mL | — |

---

### adverse_events

Tracks safety events reported by patients during the trial.
`visit_id` is nullable — an AE may be reported between visits.
`resolution_date` is nullable — NULL means the event is still ongoing at time of data entry.

| Column | Type | Notes |
|---|---|---|
| `ae_id` | INTEGER | Primary key |
| `patient_id` | INTEGER | Foreign key → patients |
| `visit_id` | INTEGER | Foreign key → visits (nullable — NULL if reported between visits) |
| `ae_term` | TEXT | Medical name of the event, e.g. Neutropenia, Nausea, Fatigue |
| `severity` | TEXT | Grade 1 \| Grade 2 \| Grade 3 \| Grade 4 \| Grade 5 |
| `onset_date` | DATE | Date the event first appeared |
| `resolution_date` | DATE | Date the event resolved; NULL if still ongoing |
| `related_to_drug` | TEXT | Yes \| No \| Possibly \| Unknown |
| `serious` | INTEGER | 1 = Serious Adverse Event (SAE), 0 = non-serious |

**Severity grades (NCI CTCAE scale):**
- `Grade 1` — Mild; no intervention required
- `Grade 2` — Moderate; minimal intervention required
- `Grade 3` — Severe; hospitalization may be required
- `Grade 4` — Life-threatening; urgent intervention required
- `Grade 5` — Fatal

**Serious Adverse Events (SAEs):** `serious = 1` triggers mandatory regulatory reporting. Two SAEs exist in the seed data: Grade 4 neutropenia (patient 1038, Trial 106) and febrile neutropenia (patient 1062, Trial 111).

---

## Relationships

```
departments
    └── trials              (department_id → departments.department_id)
            └── trial_arms  (trial_id → trials.trial_id)
            └── patients    (trial_id → trials.trial_id)
                    │           (arm_id → trial_arms.arm_id)
                    └── visits          (patient_id → patients.patient_id)
                    └── lab_results     (patient_id → patients.patient_id)
                    │                   (visit_id   → visits.visit_id)
                    └── adverse_events  (patient_id → patients.patient_id)
                                        (visit_id   → visits.visit_id, nullable)
```

**Summary:**
- One department → many trials
- One trial → many arms, many patients
- One arm → many patients (within that trial)
- One patient → many visits, many lab results, many adverse events
- One visit → many lab results, many adverse events

---

## Nullable Columns

| Table | Column | Meaning when NULL |
|---|---|---|
| `trials` | `department_id` | Trial not yet assigned to a department |
| `trials` | `end_date` | Trial is still active |
| `adverse_events` | `visit_id` | AE was reported between scheduled visits |
| `adverse_events` | `resolution_date` | AE is still ongoing |

---

## Rebuild the Database

```bash
rm -f clinical_data.db
sqlite3 clinical_data.db < schema/healthcare_schema.sql
sqlite3 clinical_data.db < seed_data/sample_data.sql
```
