create database hospital;
use hospital;


CREATE TABLE Departments (
    Dept_ID VARCHAR(10) PRIMARY KEY,
    Dept_name VARCHAR(10) NOT NULL,
    Dept_fee INT NOT NULL,
    Dept_Symptoms VARCHAR(255)
);


CREATE TABLE Doctor (
	Doct_ID INT AUTO_INCREMENT PRIMARY KEY,
    Doct_name VARCHAR(100) NOT NULL,
    Doct_gender VARCHAR(10) NOT NULL,
    Doct_Contact VARCHAR(15) NOT NULL,
    Doct_Email VARCHAR(100) NOT NULL,
    Dept_ID VARCHAR(10),
    Doctor_Experience INT,
    FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);


CREATE TABLE Patient_details (
Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
Patient_Name VARCHAR(25),
Patient_Contacts VARCHAR(15),
Patient_Gender VARCHAR(10) NOT NULL,
Patient_Age INT NOT NULL,
BloogGrp VARCHAR(5) NOT NULL
);



CREATE TABLE Patient_arrival_Info (
Pat_ID INT NOT NULL,
Arrival_Date DATE,
Symptoms VARCHAR(255),
FOREIGN KEY (Pat_ID) REFERENCES Patient_details(Patient_ID)
);
# change column name Patient_ID to Pat_ID because same column name is in Patient_details table
ALTER TABLE Patient_arrival_Info
CHANGE Patient_ID Pat_ID INT NOT NULL;



CREATE TABLE Appointment (
Appointment_ID INT PRIMARY KEY,
Patient_ID INT NOT NULL,
Doctor_ID INT NOT NULL,
Date_time DATETIME NOT NULL,
Status ENUM('Scheduled', 'Completed', 'Cancelled'),
FOREIGN KEY (Patient_ID) REFERENCES Patient_details(Patient_ID),
FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doct_ID)
);

select * from appointment;
CREATE TABLE Patient_Prescription_History (
Appt_ID INT NOT NULL,
Diagnosis VARCHAR(255),
Prescription VARCHAR(255),
FOREIGN KEY (Appt_ID) REFERENCES Appointment(Appointment_ID)
);
# change column name Appoint_ID to Appt_ID because same column name is in Billing table
ALTER TABLE Patient_Prescription_History
CHANGE Appoint_ID Appt_ID INT NOT NULL;


CREATE TABLE Billing (
Bill_id INT PRIMARY KEY,
Bill_date_time DATE,
Appoint_ID INT NOT NULL,
FOREIGN KEY (Appoint_ID) REFERENCES Appointment(Appointment_ID)
);

# Modifications 
# 1. increasing the limit for length of Dept_name in Departments table
ALTER TABLE Departments
MODIFY Dept_name VARCHAR(20);

# 2. setting Bill_id as auto incremented in Billing table
ALTER TABLE Billing
MODIFY COLUMN Bill_id INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Billing
AUTO_INCREMENT = 319;

# 3. setting Appointment_ID as auto incremented in Appointment table
ALTER TABLE Patient_Prescription_History
DROP FOREIGN KEY patient_prescription_history_ibfk_1;
ALTER TABLE Billing
DROP FOREIGN KEY billing_ibfk_1;
ALTER TABLE Appointment
MODIFY COLUMN Appointment_ID INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Appointment
AUTO_INCREMENT = 121;
ALTER TABLE Patient_Prescription_History
ADD CONSTRAINT patient_prescription_history_ibfk_1
FOREIGN KEY (Appt_ID) REFERENCES Appointment(Appointment_ID);
ALTER TABLE Billing
ADD CONSTRAINT billing_ibfk_1
FOREIGN KEY (Appoint_ID) REFERENCES Appointment(Appointment_ID);


# Entring data into tables
INSERT INTO Departments (Dept_ID, Dept_name, Dept_fee, Dept_Symptoms) VALUES
('DPT001', 'Cardiology', 5000, 'Chest pain, palpitations, dizziness'),
('DPT002', 'Neurology', 4500, 'Headaches, seizures, numbness'),
('DPT003', 'Orthopedics', 4000, 'Joint pain, fractures, back pain'),
('DPT004', 'Pediatrics', 3000, 'Fever, cough in children, rashes'),
('DPT005', 'Dermatology', 2500, 'Skin rashes, acne, eczema'),
('DPT006', 'ENT', 2000, 'Ear pain, sore throat, hearing loss'),
('DPT007', 'Gynecology', 3500, 'Irregular periods, pelvic pain'),
('DPT008', 'Psychiatry', 5000, 'Anxiety, depression, mood swings'),
('DPT009', 'Gastroenterology', 4000, 'Stomach pain, bloating, nausea'),
('DPT010', 'Urology', 3800, 'Urine infection, kidney pain');


INSERT INTO Doctor (Doct_name, Doct_gender, Doct_Contact, Doct_Email, Dept_id, Doctor_Experience) VALUES
('Dr. Arjun Mehta', 'Male', '9876543210', 'arjun.mehta@hospital.com', 'DPT001', 15),
('Dr. Neha Sharma', 'Female', '9123456780', 'neha.sharma@hospital.com', 'DPT002', 10),
('Dr. Rahul Kapoor', 'Male', '9345678901', 'rahul.kapoor@hospital.com', 'DPT003', 12),
('Dr. Anjali Nair', 'Female', '9456789012', 'anjali.nair@hospital.com', 'DPT004', 8),
('Dr. Rohan Das', 'Male', '9567890123', 'rohan.das@hospital.com', 'DPT005', 6),
('Dr. Isha Verma', 'Female', '9678901234', 'isha.verma@hospital.com', 'DPT006', 9),
('Dr. Priya Menon', 'Female', '9789012345', 'priya.menon@hospital.com', 'DPT007', 11),
('Dr. Aman Sinha', 'Male', '9890123456', 'aman.sinha@hospital.com', 'DPT008', 14),
('Dr. Kavita Rao', 'Female', '9901234567', 'kavita.rao@hospital.com', 'DPT009', 7),
('Dr. Sameer Khan', 'Male', '9012345678', 'sameer.khan@hospital.com', 'DPT010', 13);

INSERT INTO Doctor (Doct_name, Doct_gender, Doct_Contact, Doct_Email, Dept_ID, Doctor_Experience) VALUES
('Dr. Arjun Mehta', 'Male', '9876543210', 'arjun@hospital.com', 'DPT001', 15),
('Dr. Neha Sharma', 'Female', '9123456780', 'neha@hospital.com', 'DPT002', 10),
('Dr. Rahul Kapoor', 'Male', '9345678901', 'rahul@hospital.com', 'DPT003', 12),
('Dr. Anjali Nair', 'Female', '9456789012', 'anjali@hospital.com', 'DPT004', 8),
('Dr. Rohan Das', 'Male', '9567890123', 'rohan@hospital.com', 'DPT005', 6),
('Dr. Isha Verma', 'Female', '9678901234', 'isha@hospital.com', 'DPT006', 9),
('Dr. Priya Menon', 'Female', '9789012345', 'priya@hospital.com', 'DPT007', 11),
('Dr. Aman Sinha', 'Male', '9890123456', 'aman@hospital.com', 'DPT008', 14),
('Dr. Kavita Rao', 'Female', '9901234567', 'kavita@hospital.com', 'DPT009', 7),
('Dr. Sameer Khan', 'Male', '9012345678', 'sameer@hospital.com', 'DPT010', 13),
('Dr. Alok Bhat', 'Male', '9341112223', 'alok@hospital.com', 'DPT001', 9),
('Dr. Tanya Roy', 'Female', '9322113344', 'tanya@hospital.com', 'DPT002', 10),
('Dr. Devika Sharma', 'Female', '9388881111', 'devika@hospital.com', 'DPT003', 8),
('Dr. Tarun Patel', 'Male', '9444112233', 'tarun@hospital.com', 'DPT004', 6),
('Dr. Meenakshi Iyer', 'Female', '9555223344', 'meenakshi@hospital.com', 'DPT005', 7),
('Dr. Siddharth Jain', 'Male', '9666334455', 'siddharth@hospital.com', 'DPT006', 11),
('Dr. Aarti Saxena', 'Female', '9777445566', 'aarti@hospital.com', 'DPT007', 13),
('Dr. Vikram Oberoi', 'Male', '9888556677', 'vikram@hospital.com', 'DPT008', 12),
('Dr. Seema Agarwal', 'Female', '9999667788', 'seema@hospital.com', 'DPT009', 10),
('Dr. Yash Malhotra', 'Male', '9000111222', 'yash@hospital.com', 'DPT010', 15);


INSERT INTO Patient_details (Patient_Contacts, Patient_Gender, Patient_Age, BloogGrp) VALUES
('9871112233', 'Male', 45, 'A+'),
('9122223344', 'Female', 32, 'B+'),
('9343334455', 'Female', 28, 'O+'),
('9454445566', 'Male', 50, 'AB+'),
('9565556677', 'Female', 38, 'A-'),
('9676667788', 'Male', 60, 'B-'),
('9787778899', 'Female', 41, 'O-'),
('9898889900', 'Male', 35, 'A+'),
('9909990011', 'Female', 29, 'AB-'),
('9010001122', 'Male', 47, 'B+'),
('9121112233', 'Female', 52, 'O+'),
('9232223344', 'Male', 36, 'A-'),
('9343334455', 'Female', 40, 'B-'),
('9454445566', 'Male', 31, 'AB+'),
('9565556677', 'Female', 26, 'O-'),
('9676667788', 'Male', 55, 'A+'),
('9787778899', 'Female', 33, 'B+'),
('9898889900', 'Male', 46, 'O+'),
('9909990011', 'Female', 48, 'AB-'),
('9010001122', 'Male', 30, 'A+');

# select * from Patient_details;

INSERT INTO Patient_arrival_Info (Pat_ID, Arrival_Date, Symptoms) VALUES
(1, '2025-06-20', 'Chest pain'),
(2, '2025-06-20', 'Headache'),
(3, '2025-06-21', 'Back pain'),
(4, '2025-06-21', 'Fever and cough'),
(5, '2025-06-22', 'Skin irritation'),
(6, '2025-06-22', 'Ear pain'),
(7, '2025-06-23', 'Depression symptoms'),
(8, '2025-06-23', 'Urine infection'),
(9, '2025-06-24', 'Abdominal pain'),
(10, '2025-06-24', 'Pelvic cramps'),
(11, '2025-06-25', 'High BP'),
(12, '2025-06-25', 'Migraine'),
(13, '2025-06-26', 'Joint stiffness'),
(14, '2025-06-26', 'Cough'),
(15, '2025-06-27', 'Acne breakout'),
(16, '2025-06-27', 'Ear blockage'),
(17, '2025-06-28', 'Mood swings'),
(18, '2025-06-28', 'Kidney pain'),
(19, '2025-06-29', 'Bloating'),
(20, '2025-06-29', 'Menstrual cramps');

INSERT INTO Appointment (Appointment_ID, Patient_ID, Doctor_ID, Date_time, Status) VALUES
(101, 1, 1, '2025-06-20 09:00:00', 'Completed'),
(102, 2, 2, '2025-06-20 10:00:00', 'Completed'),
(103, 3, 3, '2025-06-21 11:00:00', 'Completed'),
(104, 4, 4, '2025-06-21 12:30:00', 'Completed'),
(105, 5, 5, '2025-06-22 14:00:00', 'Completed'),
(106, 6, 6, '2025-06-22 15:30:00', 'Completed'),
(107, 7, 7, '2025-06-23 10:15:00', 'Completed'),
(108, 8, 8, '2025-06-23 16:00:00', 'Completed'),
(109, 9, 9, '2025-06-24 09:45:00', 'Completed'),
(110, 10, 10, '2025-06-24 11:30:00', 'Completed'),
(111, 11, 11, '2025-06-25 10:00:00', 'Completed'),
(112, 12, 12, '2025-06-25 11:30:00', 'Completed'),
(113, 13, 13, '2025-06-26 13:00:00', 'Completed'),
(114, 14, 14, '2025-06-26 14:45:00', 'Completed'),
(115, 15, 15, '2025-06-27 15:15:00', 'Completed'),
(116, 16, 16, '2025-06-27 16:00:00', 'Completed'),
(117, 17, 17, '2025-06-28 09:00:00', 'Completed'),
(118, 18, 18, '2025-06-28 10:30:00', 'Completed'),
(119, 19, 19, '2025-06-29 11:00:00', 'Scheduled'),
(120, 20, 20, '2025-06-29 13:00:00', 'Cancelled');

INSERT INTO Patient_Prescription_History (Appt_ID, Diagnosis, Prescription) VALUES
(101, 'Hypertension', 'Amlodipine 5mg daily'),
(102, 'Migraine', 'Sumatriptan 50mg PRN'),
(103, 'Lower back pain', 'Ibuprofen 400mg BID'),
(104, 'Fever & viral infection', 'Paracetamol + Rest'),
(105, 'Eczema', 'Topical Hydrocortisone'),
(106, 'Otitis Media', 'Ciprofloxacin ear drops'),
(107, 'Depression', 'Sertraline 50mg OD'),
(108, 'UTI', 'Nitrofurantoin 100mg BID'),
(109, 'Gastritis', 'Pantoprazole 40mg before food'),
(110, 'Menstrual cramps', 'Mefenamic acid 500mg'),
(111, 'Hypertension', 'Lifestyle mod. + ACE inhibitor'),
(112, 'Migraine', 'Avoid triggers + pain relief'),
(113, 'Arthritis', 'Diclofenac gel + hot compress'),
(114, 'Common Cold', 'Antihistamine + warm fluids'),
(115, 'Acne Vulgaris', 'Benzoyl peroxide 2.5% cream'),
(116, 'Earwax buildup', 'Olive oil ear drops'),
(117, 'Anxiety Disorder', 'Cognitive therapy sessions'),
(118, 'Kidney stone', 'Tamsulosin + hydration');

INSERT INTO Billing (Bill_id, Bill_date_time, Appoint_ID) VALUES
(301, '2025-06-20', 101),
(302, '2025-06-20', 102),
(303, '2025-06-21', 103),
(304, '2025-06-21', 104),
(305, '2025-06-22', 105),
(306, '2025-06-22', 106),
(307, '2025-06-23', 107),
(308, '2025-06-23', 108),
(309, '2025-06-24', 109),
(310, '2025-06-24', 110),
(311, '2025-06-25', 111),
(312, '2025-06-25', 112),
(313, '2025-06-26', 113),
(314, '2025-06-26', 114),
(315, '2025-06-27', 115),
(316, '2025-06-27', 116),
(317, '2025-06-28', 117),
(318, '2025-06-28', 118);



# Verify GetDepartmentBySymptom Function
SELECT GetDepartmentBySymptom('Joint pain, fractures, back pain');

# Verify Calculate_Discount Procedure
# case1 : patient visited one year (or >30 days) ago
update Patient_arrival_Info
set Arrival_Date = '2024-06-29'
where Pat_ID = 1;
set @disc_val = -1;
call Calculate_Discount(1, @disc_val);
select @disc_val as Discount0;

# case2 : patient visited within 30 days
update Patient_arrival_Info
set Arrival_Date = '2025-06-15'
where Pat_ID = 1;
call Calculate_Discount(1, @disc_val);
select @disc_val as Discount20;




# Verify Increase_Dept_Fee_Annually Procedure
# initial department fee
select * from Departments;
# updating department fee after one year
set SQL_SAFE_UPDATES = 0;
call Increase_Dept_Fee_Annually();
set SQL_SAFE_UPDATES = 1;
# updated deparment fee
select * from Departments;

# 
call UpdateAppointmentStatuses();

-- Now insert the appointment
INSERT INTO appointment (Patient_ID, Doctor_ID, Date_time, Status)
VALUES (22, 1, '2025-06-20 11:00:00', 'Scheduled');

UPDATE Appointment
SET Status = 'Completed'
WHERE Appointment_ID = 120; 

SELECT * FROM Billing WHERE Appoint_ID = 120;

SELECT * FROM Billing WHERE Appoint_ID = 119;


SHOW TRIGGERS LIKE 'Billing';
INSERT INTO Billing (Bill_date_time, Appoint_ID) VALUES
('2025-06-20', 120);
select * from Billing;
DELETE FROM Billing
WHERE Appoint_ID = 120;

select * from Appointment;
call Generate_Hospital_Bill(102);

select * from patient_details;
select * from patient_arrival_info;
select * from departments


