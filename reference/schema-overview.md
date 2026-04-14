# Database Schema Overview

This database models a clinical research program with multiple trials across disease departments.
It contains 5 tables connected by foreign keys.

---

## Tables at a Glance

| Table | Rows (seed data) | Purpose |
|---|---|---|
| `departments` | 8 | Disease area teams that own trials |
| `trials` | 17 | Clinical studies, each owned by a department |
| `patients` | 93 | Enrolled participants, each assigned to one trial |
| `visits` | 301 | Study visits per patient |
| `lab_results` | 78 | Lab test results tied to a patient and visit |

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

| Column | Type | Notes |
|---|---|---|
| `trial_id` | INTEGER | Primary key |
| `trial_name` | TEXT | Full study name, e.g. ONC-201 Immunotherapy Study |
| `phase` | TEXT | Phase I, Phase II, or Phase III |
| `department_id` | INTEGER | Foreign key → departments |
| `start_date` | DATE | Date the trial opened for enrollment |
| `target_enrollment` | INTEGER | Planned number of patients (Phase I: 10–18, Phase II: 25–50, Phase III: 80–150) |

**Trials per department:**
- Oncology: 3 trials (Phase I, II, III)
- Neurology: 3 trials (Phase I, II, III)
- Cardiology: 2 trials
- Immunology: 2 trials
- Hematology-Oncology: 2 trials
- Neuro-Oncology: 2 trials
- Cardio-Oncology: 1 trial
- Rheumatology: 2 trials

---

### patients

Each patient is enrolled in exactly one trial.

| Column | Type | Notes |
|---|---|---|
| `patient_id` | INTEGER | Primary key (1001–1093) |
| `trial_id` | INTEGER | Foreign key → trials |
| `enrollment_date` | DATE | Date the patient was formally enrolled |
| `status` | TEXT | Active, Completed, Withdrawn, Screen Failure |
| `age` | INTEGER | Age in years at enrollment |
| `weight_kg` | REAL | Body weight in kilograms at screening |

**Status values:**
- `Active` — currently participating
- `Completed` — finished all protocol visits
- `Withdrawn` — left the study early
- `Screen Failure` — did not pass eligibility checks; never enrolled

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
| Neurology | Baseline, Week 4, Week 12, Week 24, Week 48, EOT, Follow-up |
| Cardiology | Baseline, Month 1, Month 3, Month 6, Month 12, EOT, Follow-up |
| Immunology | Baseline, Week 2, Week 4, Week 8, Week 24, EOT |
| Rheumatology | Baseline, Week 12, Week 24, Week 52, Month 6, Month 12, Month 18, Month 24, EOT, Follow-up |

**Typical durations:**
- Baseline: 90–120 min
- Treatment/cycle visits: 140–180 min
- Routine check-ins: 30–55 min
- EOT: 65–90 min
- Follow-up: 35–45 min

---

### lab_results

Each lab result is tied to both a patient and a specific visit.

| Column | Type | Notes |
|---|---|---|
| `lab_id` | INTEGER | Primary key |
| `patient_id` | INTEGER | Foreign key → patients |
| `visit_id` | INTEGER | Foreign key → visits |
| `test_name` | TEXT | Name of the lab test |
| `result_value` | REAL | Numeric result |
| `unit` | TEXT | Unit of measurement |

**Tests in the data by disease area:**

| Disease area | Tests |
|---|---|
| Oncology / Neuro-Oncology | WBC, Hemoglobin, Platelets, CEA, LDH |
| Hematology-Oncology | WBC, Hemoglobin, Platelets, LDH (AML blasts and CLL lymphocytes drive abnormal values) |
| Cardiology / Cardio-Oncology | BNP, Troponin I, LDL, HDL, Creatinine |
| Neurology | WBC, Creatinine, ALT |
| Immunology / Lupus | CRP, ESR, ANA Titer |
| Rheumatology | CRP, ESR, RF, anti-CCP |

**Reference ranges (normal values):**

| Test | Normal range | Unit |
|---|---|---|
| WBC | 4.5 – 11.0 | K/uL |
| Hemoglobin | 12.0 – 16.0 | g/dL |
| Platelets | 150 – 400 | K/uL |
| Creatinine | 0.6 – 1.2 | mg/dL |
| ALT | 7 – 40 | U/L |
| LDH | 140 – 280 | U/L |
| CEA | < 5.0 | ng/mL |
| BNP | < 100 | pg/mL |
| Troponin I | < 0.04 | ng/mL |
| LDL | < 130 | mg/dL |
| HDL | > 40 | mg/dL |
| CRP | < 5.0 | mg/L |
| ESR | < 20 | mm/hr |
| RF | < 14 | IU/mL |
| anti-CCP | < 20 | U/mL |

---

## Relationships

```
departments
    └── trials          (department_id)
            └── patients        (trial_id)
                    └── visits          (patient_id)
                    └── lab_results     (patient_id, visit_id)
```

- One department → many trials
- One trial → many patients
- One patient → many visits
- One patient → many lab results
- One visit → many lab results

---

## Rebuild the Database

```bash
rm -f clinical_data.db
sqlite3 clinical_data.db < schema/healthcare_schema.sql
sqlite3 clinical_data.db < seed_data/sample_data.sql
```
