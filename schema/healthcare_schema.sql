CREATE TABLE departments (
  department_id   INTEGER PRIMARY KEY,
  department_name TEXT
);

CREATE TABLE trials (
  trial_id           INTEGER PRIMARY KEY,
  trial_name         TEXT,
  phase              TEXT,
  department_id      INTEGER,
  start_date         DATE,
  target_enrollment  INTEGER,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE patients (
  patient_id      INTEGER PRIMARY KEY,
  trial_id        INTEGER,
  enrollment_date DATE,
  status          TEXT,
  age             INTEGER,
  weight_kg       REAL,
  FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
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
  lab_id       INTEGER PRIMARY KEY,
  patient_id   INTEGER,
  visit_id     INTEGER,
  test_name    TEXT,
  result_value REAL,
  unit         TEXT,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (visit_id)   REFERENCES visits(visit_id)
);

