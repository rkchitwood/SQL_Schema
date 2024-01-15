-- med center employs several doctors
-- doctors can see many patients
-- patient can be seen by many doctorspatient may have multiple diagnoses on visit

--design:
-- doctor table: id, name
-- patient table: id, name
-- diagnosis table: id, name
-- appointment table: id, ref dr_id, ref patient_id
-- visit table: id, ref appt_id, diagnosis_id

DROP DATABASE IF EXISTS med_center_db;
CREATE DATABASE med_center_db;

\c med_center_db;

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE appointments(
    id SERIAL PRIMARY KEY,
    dr_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL, 
    time_date TIMESTAMP NOT NULL
);

CREATE TABLE appointments_diagnoses(
    id SERIAL PRIMARY KEY,
    appointment_id INTEGER REFERENCES appointments ON DELETE SET NULL,
    diagnosis_id INTEGER REFERENCES diagnoses ON DELETE SET NULL
);