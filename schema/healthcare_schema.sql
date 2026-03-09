CREATE TABLE departments (
  department_id INTEGER PRIMARY KEY,
  department_name TEXT
);

CREATE TABLE trials (
  trial_id INTEGER PRIMARY KEY,
  trial_name TEXT,
  phase TEXT,
  department_id INTEGER,
  start_date DATE,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE patients (
  patient_id INTEGER PRIMARY KEY,
  trial_id INTEGER,
  enrollment_date DATE,
  status TEXT,
  FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
);

CREATE TABLE visits(
  visit_id INTEGER PRIMARY KEY,
  patient_id INTEGER,
  visit_date DATE,
  visit_timepoint TEXT,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
