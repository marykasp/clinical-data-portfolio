CREATE TABLE departments (
  department_id   INTEGER PRIMARY KEY,
  department_name TEXT
);

CREATE TABLE trials (
  trial_id                INTEGER PRIMARY KEY,
  trial_name              TEXT,
  phase                   TEXT,
  status                  TEXT,    -- Enrolling | Completed | On Hold | Not Yet Open
  department_id           INTEGER,
  principal_investigator  TEXT,
  sponsor                 TEXT,
  start_date              DATE,
  end_date                DATE,    -- NULL if still active
  target_enrollment       INTEGER,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Arms are defined per trial; patients are then assigned to one arm.
-- Phase I trials may have a single arm (dose escalation cohort).
-- Phase II/III trials typically have 2-3 arms (treatment vs placebo, etc.).
CREATE TABLE trial_arms (
  arm_id      INTEGER PRIMARY KEY,
  trial_id    INTEGER NOT NULL,
  arm_name    TEXT,
  arm_type    TEXT,   -- Treatment | Placebo | Active Comparator | Observational
  FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
);

CREATE TABLE patients (
  patient_id      INTEGER PRIMARY KEY,
  trial_id        INTEGER,
  arm_id          INTEGER,        -- which arm of the trial this patient is in
  enrollment_date DATE,
  status          TEXT,
  age             INTEGER,        -- age at enrollment
  date_of_birth   DATE,
  sex             TEXT,           -- Male | Female | Other
  race            TEXT,
  weight_kg       REAL,
  FOREIGN KEY (trial_id) REFERENCES trials(trial_id),
  FOREIGN KEY (arm_id)   REFERENCES trial_arms(arm_id)
);

CREATE TABLE visits (
  visit_id          INTEGER PRIMARY KEY,
  patient_id        INTEGER,
  visit_date        DATE,
  visit_timepoint   TEXT,
  duration_minutes  INTEGER,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE lab_results (
  lab_id                INTEGER PRIMARY KEY,
  patient_id            INTEGER,
  visit_id              INTEGER,
  test_name             TEXT,
  result_value          REAL,
  unit                  TEXT,
  reference_range_low   REAL,
  reference_range_high  REAL,
  flag                  TEXT,     -- Normal | Low | High | Critical
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (visit_id)   REFERENCES visits(visit_id)
);

CREATE TABLE adverse_events (
  ae_id            INTEGER PRIMARY KEY,
  patient_id       INTEGER,
  visit_id         INTEGER,  -- NULL if reported between visits
  ae_term          TEXT,
  severity         TEXT,     -- Grade 1 | Grade 2 | Grade 3 | Grade 4 | Grade 5
  onset_date       DATE,
  resolution_date  DATE,     -- NULL if ongoing
  related_to_drug  TEXT,     -- Yes | No | Possibly | Unknown
  serious          INTEGER,  -- 1 = Serious Adverse Event (SAE), 0 = non-serious
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (visit_id)   REFERENCES visits(visit_id)
);
