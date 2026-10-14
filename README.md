# Hospital Management System --- MySQL Project

**Created by:** Vishwas Solanki\
**Project Type:** Database Management System (DBMS)\
**Database:** MySQL\
**SQL File:** `final-exam.sql`

------------------------------------------------------------------------

## Project Overview

The **Hospital Management System** is a MySQL database project designed
to organize basic hospital information and demonstrate commonly used SQL
operations. It stores patient details, doctor information, and
appointment records in related tables.

The project is intended for learning and demonstrating database design,
data manipulation, data retrieval, joins, aggregate functions,
subqueries, date and string functions, window functions, and conditional
logic.

## Database Structure

The database is named `Hospital_Management` and contains three tables:

### 1. `Patients`

Stores patient information.

  Column         Description
  -------------- -----------------------------------------------
  `patient_id`   Unique patient ID; auto-increment primary key
  `name`         Patient name
  `age`          Patient age
  `gender`       Patient gender
  `phone`        Contact number
  `disease`      Recorded disease or condition

### 2. `Doctors`

Stores doctor information.

  Column             Description
  ------------------ ----------------------------------------------
  `doctor_id`        Unique doctor ID; auto-increment primary key
  `name`             Doctor name
  `specialization`   Medical specialization
  `phone`            Contact number

### 3. `Appointments`

Stores appointment details and links patients with doctors.

  Column               Description
  -------------------- ------------------------------------------------------
  `appointment_id`     Unique appointment ID; auto-increment primary key
  `patient_id`         References `Patients.patient_id`
  `doctor_id`          References `Doctors.doctor_id`
  `appointment_date`   Appointment date
  `diagnosis`          Diagnosis recorded for the appointment
  `fee`                Appointment fee
  `status`             Appointment status, such as `Completed` or `Pending`

The `Appointments` table uses foreign keys to establish relationships
with the `Patients` and `Doctors` tables.

## Features Demonstrated

-   **Database and table creation** --- `CREATE DATABASE`, `USE`, and
    `CREATE TABLE`
-   **Data insertion and maintenance** --- `INSERT`, `UPDATE`, and
    `DELETE`
-   **Filtering and sorting** --- `WHERE`, `AND`, `OR`, `NOT`,
    `ORDER BY`, and `LIMIT`
-   **Grouping and filtering groups** --- `GROUP BY` and `HAVING`
-   **Aggregate functions** --- `COUNT()`, `SUM()`, `AVG()`, `MAX()`,
    and `MIN()`
-   **Table joins** --- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and
    `UNION`-based combined results
-   **Subqueries** --- nested queries using `IN` and `NOT IN`
-   **Date functions** --- `YEAR()`, `DATEDIFF()`, and `DATE_FORMAT()`
-   **String functions** --- `UPPER()`, `LOWER()`, `TRIM()`, and
    `CONCAT()`
-   **Null and empty-value handling** --- `COALESCE()` and `NULLIF()`
-   **Window functions** --- `RANK()` and `COUNT() OVER (...)`
-   **Window frame example** ---
    `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`
-   **Conditional logic** --- `CASE` expressions for age categories and
    appointment-status labels
-   **Result checking** --- sample query outputs are included in the SQL
    file

## Requirements

-   MySQL Server (MySQL 8.0 or a compatible version is recommended for
    window functions)
-   A MySQL client, such as MySQL Workbench or the MySQL command-line
    client
-   The file `final-exam.sql`

## Setup and Usage

1.  Install and start MySQL Server.
2.  Open `final-exam.sql` in MySQL Workbench or another SQL editor.
3.  Create/select the `Hospital_Management` database and create the
    tables.
4.  Insert the sample data.
5.  Run the queries individually or in suitable sections to explore the
    results.

The database and table setup begins with:

``` sql
CREATE DATABASE Hospital_Management;
USE Hospital_Management;
```

To inspect the available tables after setup, run:

``` sql
SHOW TABLES;
```

To view the stored records:

``` sql
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
```

## Important Execution Note

The supplied `final-exam.sql` file contains SQL statements **along with
displayed sample-output tables and separator lines**. Those output
blocks and separator lines are not executable SQL. If you want to run
the entire file as a script, remove the displayed output text and
decorative separator lines first, or select and execute only the SQL
statements. Run the table-creation and data-insertion sections before
running queries that depend on that data.

The script also contains `UPDATE` and `DELETE` examples. These modify
data, so review them before executing the relevant section.

## Learning Outcomes

By exploring this project, a learner can practise:

-   Designing related relational tables with primary and foreign keys
-   Performing basic CRUD operations
-   Retrieving and summarizing data for reports
-   Combining data across related tables
-   Writing subqueries and using built-in MySQL functions
-   Applying window functions and conditional expressions

## Project Scope

This is a **learning/demo project** using sample records. It
demonstrates SQL concepts and is not a complete production-ready
hospital system. Real-world deployment would require additional
validation, access control, privacy safeguards, backup procedures, and
broader operational features.

## Author

**Vishwas Solanki**\
*MySQL --- Hospital Management System Project*

------------------------------------------------------------------------

*Thank you for reviewing this project.*
