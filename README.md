# 🏥 Hospital Management System

### 💻 MySQL Database Project

```{=html}
<p align="center">
```
`<strong>`{=html}Developed by Vishwas
Solanki`</strong>`{=html}`<br>`{=html} `<em>`{=html}Database Management
System (DBMS) • MySQL`</em>`{=html}
```{=html}
</p>
```

------------------------------------------------------------------------

## 📌 Project Overview

The **Hospital Management System** is a database project developed using
**MySQL** to organize and manage sample hospital records. It
demonstrates how patient information, doctor details, and appointment
records can be stored in related tables and queried efficiently.

This project showcases practical SQL concepts, from database design and
data manipulation to advanced queries and analytical functions.

## 🎯 Project Objectives

-   🗂️ Organize patient, doctor, and appointment information in a
    relational database.
-   🔗 Establish relationships between tables using primary keys and
    foreign keys.
-   🔎 Retrieve specific records using filtering and sorting.
-   📊 Summarize information using aggregate functions and grouping.
-   🧠 Practise joins, subqueries, window functions, and conditional
    logic.

## 🗄️ Database Design

**Database Name:** `Hospital_Management`

The database contains three related tables:

### 👤 1. `Patients`

Stores basic patient details.

  Column         Description
  -------------- -------------------------------------------------
  `patient_id`   Unique patient ID (Primary Key, Auto Increment)
  `name`         Patient name
  `age`          Patient age
  `gender`       Patient gender
  `phone`        Contact number
  `disease`      Recorded disease or condition

### 🩺 2. `Doctors`

Stores doctor details and specializations.

  Column             Description
  ------------------ ------------------------------------------------
  `doctor_id`        Unique doctor ID (Primary Key, Auto Increment)
  `name`             Doctor name
  `specialization`   Medical specialization
  `phone`            Contact number

### 📅 3. `Appointments`

Stores appointment information and connects patients with doctors.

  -----------------------------------------------------------------------
  Column                              Description
  ----------------------------------- -----------------------------------
  `appointment_id`                    Unique appointment ID (Primary Key,
                                      Auto Increment)

  `patient_id`                        References `Patients.patient_id`

  `doctor_id`                         References `Doctors.doctor_id`

  `appointment_date`                  Appointment date

  `diagnosis`                         Diagnosis recorded for the
                                      appointment

  `fee`                               Appointment fee

  `status`                            Appointment status, such as
                                      `Completed` or `Pending`
  -----------------------------------------------------------------------

**🔗 Relationships:** The `Appointments` table uses foreign keys to link
each appointment to a patient and a doctor.

## ⚙️ SQL Concepts Demonstrated

  --------------------------------------------------------------------------------
  Category                            Concepts
  ----------------------------------- --------------------------------------------
  🏗️ Database Design                  `CREATE DATABASE`, `USE`, `CREATE TABLE`

  ✍️ Data Manipulation                `INSERT`, `UPDATE`, `DELETE`

  🔍 Filtering                        `WHERE`, `AND`, `OR`, `NOT`

  ↕️ Sorting & Limiting               `ORDER BY`, `LIMIT`

  🧩 Grouping                         `GROUP BY`, `HAVING`

  📈 Aggregate Functions              `COUNT()`, `SUM()`, `AVG()`, `MAX()`,
                                      `MIN()`

  🔗 Joins                            `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`,
                                      `UNION`

  🔎 Subqueries                       Nested queries with `IN` and `NOT IN`

  🗓️ Date Functions                   `YEAR()`, `DATEDIFF()`, `DATE_FORMAT()`

  🔤 String Functions                 `UPPER()`, `LOWER()`, `TRIM()`, `CONCAT()`

  🧹 Null / Empty Handling            `COALESCE()`, `NULLIF()`

  🪟 Window Functions                 `RANK()`, `COUNT() OVER (...)`

  📊 Window Frames                    `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`

  🧠 Conditional Logic                `CASE` expressions
  --------------------------------------------------------------------------------

## 🛠️ Technologies & Requirements

-   🐬 **MySQL Server** --- MySQL 8.0 or a compatible version
    recommended for window functions.
-   🧰 **MySQL Workbench** or another MySQL-compatible SQL client.
-   📄 **SQL Script:** `final-exam.sql`

## 🚀 Setup & Execution

1.  Install and start MySQL Server.
2.  Open `final-exam.sql` in MySQL Workbench or another compatible SQL
    editor.
3.  Run the database and table creation statements first.
4.  Execute the sample data insertion statements.
5.  Run the queries individually or in suitable sections and inspect the
    results.

### 🔹 Initialize the Database

``` sql
CREATE DATABASE Hospital_Management;
USE Hospital_Management;
```

### 🔹 View Tables and Records

``` sql
SHOW TABLES;

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
```

## 📌 Important Execution Notes

-   ⚠️ The supplied `final-exam.sql` includes displayed query outputs
    and decorative separator lines in addition to SQL statements. These
    output blocks and separator lines are **not executable SQL**. To run
    the script as a whole, remove those sections first, or select and
    execute only the SQL statements.
-   ⚠️ Run table creation and sample data insertion before executing
    queries that depend on those tables and records.
-   ⚠️ The script includes `UPDATE` and `DELETE` examples that change
    data. Review them before execution.
-   🔐 This project uses sample data for learning and demonstration;
    avoid adding real patient information to a public repository.

## 📚 Learning Outcomes

By working through this project, learners can practise:

-   ✅ Creating relational tables and defining primary/foreign keys.
-   ✅ Performing CRUD operations.
-   ✅ Filtering, sorting, grouping, and summarizing records.
-   ✅ Combining related data using SQL joins.
-   ✅ Writing subqueries and using built-in date and string functions.
-   ✅ Applying window functions, window frames, and `CASE` expressions.

## 🌱 Future Enhancements

Potential improvements for a larger version of the project include:

-   🔒 User roles and access control.
-   🧾 Billing and payment records.
-   🏥 Department and staff management.
-   📅 Appointment availability and scheduling validation.
-   💾 Backup, recovery, and data-validation procedures.

## ⚠️ Project Scope

This is an **educational demonstration project**, not a complete
production-ready hospital information system. A real deployment would
require stronger validation, access controls, privacy safeguards,
backups, and additional operational features.

------------------------------------------------------------------------

## 👨‍💻 Author

**Vishwas Solanki**\
💻 *MySQL Database Project --- Hospital Management System*

⭐ Thank you for reviewing this project!
