CREATE DATABASE Hospital_Management;
USE Hospital_Management;
=============================================
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    disease VARCHAR(100)
);
====================================================
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15)
);
=====================================================
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(100),
    fee DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
==============================================================
INSERT INTO Patients (name, age, gender, phone, disease)
VALUES
('Rahul Patel', 25, 'Male', '9876543210', 'Fever'),
('Priya Shah', 30, 'Female', '9876543211', 'Diabetes'),
('Amit Mehta', 40, 'Male', '9876543212', 'Blood Pressure'),
('Neha Desai', 22, 'Female', '9876543213', 'Cold'),
('Karan Joshi', 35, 'Male', '9876543214', 'Asthma');

SELECT * FROM Patients;
+------------+-------------+-----+--------+------------+---------------+
| patient_id | name        | age | gender | phone      | disease       |
+------------+-------------+-----+--------+------------+---------------+
| 1          | Rahul Patel | 25  | Male   | 9876543210 | Fever         |
| 2          | Priya Shah  | 30  | Female | 9876543211 | Diabetes      |
| 3          | Amit Mehta  | 40  | Male   | 9876543212 | Blood Pressure|
| 4          | Neha Desai  | 22  | Female | 9876543213 | Cold          |
| 5          | Karan Joshi | 35  | Male   | 9876543214 | Asthma        |
+------------+-------------+-----+--------+------------+---------------+

==============================================================================
INSERT INTO Doctors (name, specialization, phone)
VALUES
('Dr. Amit Shah', 'General Physician', '9000000001'),
('Dr. Neha Patel', 'Cardiologist', '9000000002'),
('Dr. Raj Mehta', 'Dermatologist', '9000000003');

SELECT * FROM Doctors;
+-----------+---------------+-------------------+------------+
| doctor_id | name          | specialization    | phone      |
+-----------+---------------+-------------------+------------+
| 1         | Dr. Amit Shah | General Physician | 9000000001 |
| 2         | Dr. Neha Patel| Cardiologist      | 9000000002 |
| 3         | Dr. Raj Mehta | Dermatologist     | 9000000003 |
+-----------+---------------+-------------------+------------+

=================================================================================
INSERT INTO Appointments
(patient_id, doctor_id, appointment_date, diagnosis, fee, status)
VALUES
(1, 1, '2026-01-10', 'Fever', 500, 'Completed'),
(2, 2, '2026-03-05', 'Diabetes', 800, 'Pending'),
(3, 2, '2026-05-10', 'Blood Pressure', 1000, 'Completed'),
(1, 3, '2026-06-15', 'Skin Allergy', 700, 'Completed'),
(4, 1, '2026-07-01', 'Cold', 500, 'Pending'),
(5, 3, '2026-08-12', 'Asthma', 900, 'Completed');

SELECT * FROM Appointments;
+----------------+------------+-----------+------------------+---------------+---------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | diagnosis     | fee     | status    |
+----------------+------------+-----------+------------------+---------------+---------+-----------+
| 1              | 1          | 1         | 2026-01-10       | Fever         | 500.00  | Completed |
| 2              | 2          | 2         | 2026-03-05       | Diabetes      | 800.00  | Pending   |
| 3              | 3          | 2         | 2026-05-10       | Blood Pressure| 1000.00 | Completed |
| 4              | 1          | 3         | 2026-06-15       | Skin Allergy  | 700.00  | Completed |
| 5              | 4          | 1         | 2026-07-01       | Cold          | 500.00  | Pending   |
| 6              | 5          | 3         | 2026-08-12       | Asthma        | 900.00  | Completed |
+----------------+------------+-----------+------------------+---------------+---------+-----------+
=========================================================================

INSERT INTO Patients (name, age, gender, phone, disease)
VALUES ('Jay Shah', 28, 'Male', '9876543215', 'Migraine');


UPDATE Patients
SET disease = 'Viral Fever'
WHERE patient_id = 1;


DELETE FROM Patients
WHERE patient_id = 6;



 SELECT * FROM Patients;
+------------+-------------+------+--------+------------+----------------+
| patient_id | name        | age  | gender | phone      | disease        |
+------------+-------------+------+--------+------------+----------------+
|          1 | Rahul Patel |   25 | Male   | 9876543210 | Viral Fever    |
|          2 | Priya Shah  |   30 | Female | 9876543211 | Diabetes       |
|          3 | Amit Mehta  |   40 | Male   | 9876543212 | Blood Pressure |
|          4 | Neha Desai  |   22 | Female | 9876543213 | Cold           |
|          5 | Karan Joshi |   35 | Male   | 9876543214 | Asthma         |
+------------+-------------+------+--------+------------+----------------+
5 rows in set (0.156 sec)

===========================================================================
SELECT *
FROM Patients
WHERE age > 25;

+------------+-------------+------+--------+------------+----------------+
| patient_id | name        | age  | gender | phone      | disease        |
+------------+-------------+------+--------+------------+----------------+
|          2 | Priya Shah  |   30 | Female | 9876543211 | Diabetes       |
|          3 | Amit Mehta  |   40 | Male   | 9876543212 | Blood Pressure |
|          5 | Karan Joshi |   35 | Male   | 9876543214 | Asthma         |
+------------+-------------+------+--------+------------+----------------+

===============================================================================
SELECT disease, COUNT(*) AS total_patients
FROM Patients
GROUP BY disease
HAVING COUNT(*) >= 1;
+----------------+----------------+
| disease        | total_patients |
+----------------+----------------+
| Viral Fever    |              1 |
| Diabetes       |              1 |
| Blood Pressure |              1 |
| Cold           |              1 |
| Asthma         |              1 |
+----------------+----------------+
5 rows in set (0.067 sec)

=================================================================================
SELECT *
FROM Appointments
ORDER BY fee DESC
LIMIT 5;
+----------------+------------+-----------+------------------+----------------+---------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | diagnosis      | fee     | status    |
+----------------+------------+-----------+------------------+----------------+---------+-----------+
|              3 |          3 |         2 | 2026-05-10       | Blood Pressure | 1000.00 | Completed |
|              6 |          5 |         3 | 2026-08-12       | Asthma         |  900.00 | Completed |
|              2 |          2 |         2 | 2026-03-05       | Diabetes       |  800.00 | Pending   |
|              4 |          1 |         3 | 2026-06-15       | Skin Allergy   |  700.00 | Completed |
|              1 |          1 |         1 | 2026-01-10       | Fever          |  500.00 | Completed |
+----------------+------------+-----------+------------------+----------------+---------+-----------+
5 rows in set (0.035 sec)

============================================================================================================
SELECT *
FROM Appointments
WHERE appointment_date > '2025-12-31';
+----------------+------------+-----------+------------------+----------------+---------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | diagnosis      | fee     | status    |
+----------------+------------+-----------+------------------+----------------+---------+-----------+
|              1 |          1 |         1 | 2026-01-10       | Fever          |  500.00 | Completed |
|              2 |          2 |         2 | 2026-03-05       | Diabetes       |  800.00 | Pending   |
|              3 |          3 |         2 | 2026-05-10       | Blood Pressure | 1000.00 | Completed |
|              4 |          1 |         3 | 2026-06-15       | Skin Allergy   |  700.00 | Completed |
|              5 |          4 |         1 | 2026-07-01       | Cold           |  500.00 | Pending   |
|              6 |          5 |         3 | 2026-08-12       | Asthma         |  900.00 | Completed |
+----------------+------------+-----------+------------------+----------------+---------+-----------+
6 rows in set (0.154 sec)

===================================================================================================================
SELECT *
FROM Patients
WHERE age > 25 AND gender = 'Male';
+------------+-------------+------+--------+------------+----------------+
| patient_id | name        | age  | gender | phone      | disease        |
+------------+-------------+------+--------+------------+----------------+
|          3 | Amit Mehta  |   40 | Male   | 9876543212 | Blood Pressure |
|          5 | Karan Joshi |   35 | Male   | 9876543214 | Asthma         |
+------------+-------------+------+--------+------------+----------------+
2 rows in set (0.163 sec)

==================================================================================================================
SELECT *
FROM Patients
WHERE disease = 'Fever' OR disease = 'Cold';
+------------+------------+------+--------+------------+---------+
| patient_id | name       | age  | gender | phone      | disease |
+------------+------------+------+--------+------------+---------+
|          4 | Neha Desai |   22 | Female | 9876543213 | Cold    |
+------------+------------+------+--------+------------+---------+
1 row in set (0.008 sec)

========================================================================================================================
SELECT *
FROM Appointments
WHERE NOT status = 'Completed';
+----------------+------------+-----------+------------------+-----------+--------+---------+
| appointment_id | patient_id | doctor_id | appointment_date | diagnosis | fee    | status  |
+----------------+------------+-----------+------------------+-----------+--------+---------+
|              2 |          2 |         2 | 2026-03-05       | Diabetes  | 800.00 | Pending |
|              5 |          4 |         1 | 2026-07-01       | Cold      | 500.00 | Pending |
+----------------+------------+-----------+------------------+-----------+--------+---------+
2 rows in set (0.010 sec)

========================================================================================================================
SELECT *
FROM Patients
ORDER BY name ASC;
+------------+-------------+------+--------+------------+----------------+
| patient_id | name        | age  | gender | phone      | disease        |
+------------+-------------+------+--------+------------+----------------+
|          3 | Amit Mehta  |   40 | Male   | 9876543212 | Blood Pressure |
|          5 | Karan Joshi |   35 | Male   | 9876543214 | Asthma         |
|          4 | Neha Desai  |   22 | Female | 9876543213 | Cold           |
|          2 | Priya Shah  |   30 | Female | 9876543211 | Diabetes       |
|          1 | Rahul Patel |   25 | Male   | 9876543210 | Viral Fever    |
+------------+-------------+------+--------+------------+----------------+
5 rows in set (0.145 sec)

================================================================================================================
SELECT d.name, COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name;
+----------------+--------------------+
| name           | total_appointments |
+----------------+--------------------+
| Dr. Amit Shah  |                  2 |
| Dr. Neha Patel |                  2 |
| Dr. Raj Mehta  |                  2 |
+----------------+--------------------+

===============================================================================
3 rows in set (0.031 sec)
SELECT disease, COUNT(*) AS total_patients
FROM Patients
GROUP BY disease;
+----------------+----------------+
| disease        | total_patients |
+----------------+----------------+
| Viral Fever    |              1 |
| Diabetes       |              1 |
| Blood Pressure |              1 |
| Cold           |              1 |
| Asthma         |              1 |
+----------------+----------------+

====================================================================================================
SELECT SUM(fee) AS total_fees
FROM Appointments;
+------------+
| total_fees |
+------------+
|    4400.00 |
+------------+
1 row in set (0.166 sec)

===================================================================================================
SELECT AVG(fee) AS average_fee
FROM Appointments;
+-------------+
| average_fee |
+-------------+
|  733.333333 |
+-------------+
1 row in set (0.014 sec)

====================================================================================================
SELECT MAX(fee) AS highest_fee
FROM Appointments;
+-------------+
| highest_fee |
+-------------+
|     1000.00 |
+-------------+
1 row in set (0.023 sec)

====================================================================================================
SELECT MIN(fee) AS lowest_fee
FROM Appointments;
+------------+
| lowest_fee |
+------------+
|     500.00 |
+------------+
1 row in set (0.013 sec)

====================================================================================================
SELECT COUNT(*) AS total_appointments
FROM Appointments;
+--------------------+
| total_appointments |
+--------------------+
|                  6 |
+--------------------+
1 row in set (0.014 sec)

====================================================================================================
SELECT doctor_id, SUM(fee) AS total_revenue
FROM Appointments
GROUP BY doctor_id;
+-----------+---------------+
| doctor_id | total_revenue |
+-----------+---------------+
|         1 |       1000.00 |
|         2 |       1800.00 |
|         3 |       1600.00 |
+-----------+---------------+
3 rows in set (0.149 sec)

====================================================================================================
SELECT
    p.patient_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    a.appointment_date
FROM Appointments a
JOIN Patients p
ON a.patient_id = p.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id;
+------------+--------------+----------------+------------------+
| patient_id | patient_name | doctor_name    | appointment_date |
+------------+--------------+----------------+------------------+
|          1 | Rahul Patel  | Dr. Amit Shah  | 2026-01-10       |
|          1 | Rahul Patel  | Dr. Raj Mehta  | 2026-06-15       |
|          2 | Priya Shah   | Dr. Neha Patel | 2026-03-05       |
|          3 | Amit Mehta   | Dr. Neha Patel | 2026-05-10       |
|          4 | Neha Desai   | Dr. Amit Shah  | 2026-07-01       |
|          5 | Karan Joshi  | Dr. Raj Mehta  | 2026-08-12       |
+------------+--------------+----------------+------------------+
6 rows in set (0.155 sec)

====================================================================================================
SELECT p.name, a.diagnosis
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id;
+-------------+----------------+
| name        | diagnosis      |
+-------------+----------------+
| Rahul Patel | Fever          |
| Priya Shah  | Diabetes       |
| Amit Mehta  | Blood Pressure |
| Rahul Patel | Skin Allergy   |
| Neha Desai  | Cold           |
| Karan Joshi | Asthma         |
+-------------+----------------+
6 rows in set (0.438 sec)

====================================================================================================
SELECT p.name, a.appointment_id
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id = a.patient_id;
+-------------+----------------+
| name        | appointment_id |
+-------------+----------------+
| Rahul Patel |              1 |
| Rahul Patel |              4 |
| Priya Shah  |              2 |
| Amit Mehta  |              3 |
| Neha Desai  |              5 |
| Karan Joshi |              6 |
+-------------+----------------+
6 rows in set (0.012 sec)

====================================================================================================
SELECT d.name, a.appointment_id
FROM Appointments a
RIGHT JOIN Doctors d
ON a.doctor_id = d.doctor_id;
+----------------+----------------+
| name           | appointment_id |
+----------------+----------------+
| Dr. Amit Shah  |              1 |
| Dr. Amit Shah  |              5 |
| Dr. Neha Patel |              2 |
| Dr. Neha Patel |              3 |
| Dr. Raj Mehta  |              4 |
| Dr. Raj Mehta  |              6 |
+----------------+----------------+
6 rows in set (0.038 sec)

====================================================================================================
SELECT p.patient_id, p.name, a.appointment_id
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id = a.patient_id

UNION

SELECT p.patient_id, p.name, a.appointment_id
FROM Patients p
RIGHT JOIN Appointments a
ON p.patient_id = a.patient_id;
+------------+-------------+----------------+
| patient_id | name        | appointment_id |
+------------+-------------+----------------+
|          1 | Rahul Patel |              1 |
|          1 | Rahul Patel |              4 |
|          2 | Priya Shah  |              2 |
|          3 | Amit Mehta  |              3 |
|          4 | Neha Desai  |              5 |
|          5 | Karan Joshi |              6 |
+------------+-------------+----------------+
6 rows in set (0.036 sec)

====================================================================================================
SELECT *
FROM Patients
WHERE patient_id IN (
    SELECT patient_id
    FROM Appointments
    WHERE fee > 500
);
+------------+-------------+------+--------+------------+----------------+
| patient_id | name        | age  | gender | phone      | disease        |
+------------+-------------+------+--------+------------+----------------+
|          1 | Rahul Patel |   25 | Male   | 9876543210 | Viral Fever    |
|          2 | Priya Shah  |   30 | Female | 9876543211 | Diabetes       |
|          3 | Amit Mehta  |   40 | Male   | 9876543212 | Blood Pressure |
|          5 | Karan Joshi |   35 | Male   | 9876543214 | Asthma         |
+------------+-------------+------+--------+------------+----------------+
4 rows in set (0.085 sec)

====================================================================================================
SELECT *
FROM Patients
WHERE patient_id IN (
    SELECT patient_id
    FROM Appointments
    GROUP BY patient_id
    HAVING COUNT(*) > 1
);
+------------+-------------+------+--------+------------+-------------+
| patient_id | name        | age  | gender | phone      | disease     |
+------------+-------------+------+--------+------------+-------------+
|          1 | Rahul Patel |   25 | Male   | 9876543210 | Viral Fever |
+------------+-------------+------+--------+------------+-------------+
1 row in set (0.077 sec)

====================================================================================================
SELECT *
FROM Doctors
WHERE doctor_id NOT IN (
    SELECT doctor_id
    FROM Appointments
);

Empty set (0.151 sec)

SELECT YEAR(appointment_date) AS appointment_year,
       COUNT(*) AS total_appointments
FROM Appointments
GROUP BY YEAR(appointment_date);
+------------------+--------------------+
| appointment_year | total_appointments |
+------------------+--------------------+
|             2026 |                  6 |
+------------------+--------------------+
1 row in set (0.174 sec)

====================================================================================================
SELECT appointment_id,
       DATEDIFF(CURDATE(), appointment_date) AS days_since_appointment
FROM Appointments;
+----------------+------------------------+
| appointment_id | days_since_appointment |
+----------------+------------------------+
|              1 |                    277 |
|              2 |                    223 |
|              3 |                    157 |
|              4 |                    121 |
|              5 |                    105 |
|              6 |                     63 |
+----------------+------------------------+
6 rows in set (0.067 sec)

====================================================================================================
SELECT appointment_id,
       DATE_FORMAT(appointment_date, '%d-%m-%Y') AS formatted_date
FROM Appointments;
+----------------+----------------+
| appointment_id | formatted_date |
+----------------+----------------+
|              1 | 10-01-2026     |
|              2 | 05-03-2026     |
|              3 | 10-05-2026     |
|              4 | 15-06-2026     |
|              5 | 01-07-2026     |
|              6 | 12-08-2026     |
+----------------+----------------+
6 rows in set (0.149 sec)

====================================================================================================
SELECT UPPER(name) AS patient_name
FROM Patients;
+--------------+
| patient_name |
+--------------+
| RAHUL PATEL  |
| PRIYA SHAH   |
| AMIT MEHTA   |
| NEHA DESAI   |
| KARAN JOSHI  |
+--------------+
5 rows in set (0.152 sec)

====================================================================================================
SELECT LOWER(name) AS lowercase_name
FROM Doctors;
+----------------+
| lowercase_name |
+----------------+
| dr. amit shah  |
| dr. neha patel |
| dr. raj mehta  |
+----------------+
3 rows in set (0.021 sec)

====================================================================================================
SELECT TRIM(name) AS cleaned_name
FROM Patients;
+--------------+
| cleaned_name |
+--------------+
| Rahul Patel  |
| Priya Shah   |
| Amit Mehta   |
| Neha Desai   |
| Karan Joshi  |
+--------------+
5 rows in set (0.022 sec)

====================================================================================================
SELECT CONCAT(name, ' - ', disease) AS patient_details
FROM Patients;
+-----------------------------+
| patient_details             |
+-----------------------------+
| Rahul Patel - Viral Fever   |
| Priya Shah - Diabetes       |
| Amit Mehta - Blood Pressure |
| Neha Desai - Cold           |
| Karan Joshi - Asthma        |
+-----------------------------+
5 rows in set (0.019 sec)

====================================================================================================
SELECT patient_id, COALESCE(NULLIF(TRIM(phone), ''), 'Not Provided') AS phone
FROM Patients;
+------------+------------+
| patient_id | phone      |
+------------+------------+
|          1 | 9876543210 |
|          2 | 9876543211 |
|          3 | 9876543212 |
|          4 | 9876543213 |
|          5 | 9876543214 |
+------------+------------+
5 rows in set (0.171 sec)

====================================================================================================
SELECT
    d.name AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments,
    RANK() OVER (
        ORDER BY COUNT(a.appointment_id) DESC
    ) AS doctor_rank
FROM Doctors d
LEFT JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name;
+----------------+--------------------+-------------+
| doctor_name    | total_appointments | doctor_rank |
+----------------+--------------------+-------------+
| Dr. Amit Shah  |                  2 |           1 |
| Dr. Neha Patel |                  2 |           1 |
| Dr. Raj Mehta  |                  2 |           1 |
+----------------+--------------------+-------------+
3 rows in set (0.198 sec)

====================================================================================================
SELECT
    patient_id,
    appointment_id,
    appointment_date,
    COUNT(*) OVER (
        PARTITION BY patient_id
        ORDER BY appointment_date, appointment_id
    ) AS cumulative_appointments
FROM Appointments;
+------------+----------------+------------------+-------------------------+
| patient_id | appointment_id | appointment_date | cumulative_appointments |
+------------+----------------+------------------+-------------------------+
|          1 |              1 | 2026-01-10       |                       1 |
|          1 |              4 | 2026-06-15       |                       2 |
|          2 |              2 | 2026-03-05       |                       1 |
|          3 |              3 | 2026-05-10       |                       1 |
|          4 |              5 | 2026-07-01       |                       1 |
|          5 |              6 | 2026-08-12       |                       1 |
+------------+----------------+------------------+-------------------------+
6 rows in set (0.031 sec)

====================================================================================================
SELECT
    appointment_date,
    COUNT(*) AS total_appointments,
    AVG(COUNT(*)) OVER (
        ORDER BY appointment_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average
FROM Appointments
GROUP BY appointment_date;
+------------------+--------------------+----------------+
| appointment_date | total_appointments | moving_average |
+------------------+--------------------+----------------+
| 2026-01-10       |                  1 |         1.0000 |
| 2026-03-05       |                  1 |         1.0000 |
| 2026-05-10       |                  1 |         1.0000 |
| 2026-06-15       |                  1 |         1.0000 |
| 2026-07-01       |                  1 |         1.0000 |
| 2026-08-12       |                  1 |         1.0000 |
+------------------+--------------------+----------------+
6 rows in set (0.030 sec)

====================================================================================================
SELECT
    patient_id,
    name,
    age,
    CASE
        WHEN age < 18 THEN 'Minor'
        WHEN age < 40 THEN 'Adult'
        ELSE 'Senior Adult'
    END AS age_category
FROM Patients;
+------------+-------------+------+--------------+
| patient_id | name        | age  | age_category |
+------------+-------------+------+--------------+
|          1 | Rahul Patel |   25 | Adult        |
|          2 | Priya Shah  |   30 | Adult        |
|          3 | Amit Mehta  |   40 | Senior Adult |
|          4 | Neha Desai  |   22 | Adult        |
|          5 | Karan Joshi |   35 | Adult        |
+------------+-------------+------+--------------+
5 rows in set (0.155 sec)

====================================================================================================
SELECT
    appointment_id,
    status,
    CASE
        WHEN status = 'Completed' THEN 'Finished'
        WHEN status = 'Pending' THEN 'Waiting'
        ELSE 'Other'
    END AS appointment_status
FROM Appointments;
+----------------+-----------+--------------------+
| appointment_id | status    | appointment_status |
+----------------+-----------+--------------------+
|              1 | Completed | Finished           |
|              2 | Pending   | Waiting            |
|              3 | Completed | Finished           |
|              4 | Completed | Finished           |
|              5 | Pending   | Waiting            |
|              6 | Completed | Finished           |
+----------------+-----------+--------------------+
6 rows in set (0.150 sec)

====================================================================================================
SHOW TABLES;

SELECT * FROM Patients;
+------------+-------------+------+--------+------------+----------------+
| patient_id | name        | age  | gender | phone      | disease        |
+------------+-------------+------+--------+------------+----------------+
|          1 | Rahul Patel |   25 | Male   | 9876543210 | Viral Fever    |
|          2 | Priya Shah  |   30 | Female | 9876543211 | Diabetes       |
|          3 | Amit Mehta  |   40 | Male   | 9876543212 | Blood Pressure |
|          4 | Neha Desai  |   22 | Female | 9876543213 | Cold           |
|          5 | Karan Joshi |   35 | Male   | 9876543214 | Asthma         |
+------------+-------------+------+--------+------------+----------------+
5 rows in set (0.010 sec)

====================================================================================================
SELECT * FROM Doctors;
+-----------+----------------+-------------------+------------+
| doctor_id | name           | specialization    | phone      |
+-----------+----------------+-------------------+------------+
|         1 | Dr. Amit Shah  | General Physician | 9000000001 |
|         2 | Dr. Neha Patel | Cardiologist      | 9000000002 |
|         3 | Dr. Raj Mehta  | Dermatologist     | 9000000003 |
+-----------+----------------+-------------------+------------+
3 rows in set (0.014 sec)

====================================================================================================
SELECT * FROM Appointments;
+----------------+------------+-----------+------------------+----------------+---------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | diagnosis      | fee     | status    |
+----------------+------------+-----------+------------------+----------------+---------+-----------+
|              1 |          1 |         1 | 2026-01-10       | Fever          |  500.00 | Completed |
|              2 |          2 |         2 | 2026-03-05       | Diabetes       |  800.00 | Pending   |
|              3 |          3 |         2 | 2026-05-10       | Blood Pressure | 1000.00 | Completed |
|              4 |          1 |         3 | 2026-06-15       | Skin Allergy   |  700.00 | Completed |
|              5 |          4 |         1 | 2026-07-01       | Cold           |  500.00 | Pending   |
|              6 |          5 |         3 | 2026-08-12       | Asthma         |  900.00 | Completed |
+----------------+------------+-----------+------------------+----------------+---------+-----------+
6 rows in set (0.015 sec)