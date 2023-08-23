CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR,
    PRIMARY KEY(id) 
);

CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR,
    name VARCHAR,
    PRIMARY KEY(id)
);

CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories_treatments(
    id INT GENERATED ALWAYS AS IDENTITY,
    medical_history_id INT NOT NULL,
    treatment_id INT NOT NULL,
    CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments (id),
    PRIMARY KEY (id)
);

CREATE INDEX patients_index ON medical_histories(patient_id);
CREATE INDEX invoice_items_index ON invoice_items(invoice_id);
CREATE INDEX treatment_index ON invoice_items(treatment_id); 
CREATE INDEX invoices_index ON invoices(medical_history_id);
CREATE INDEX medical_history_id_index ON  medical_histories_treatments(medical_history_id);
CREATE INDEX treatment_id_index ON  medical_histories_treatments(treatment_id);
