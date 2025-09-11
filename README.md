🎓 School Management Database (SchManagementDB)
📌 Overview

The School Management Database is a relational database system designed to manage and organize academic and administrative data in a school environment.
It supports student enrollment, teacher assignments, courses, attendance tracking, grading, library borrowing, and fee payments.

This project was developed as part of the Database Design & Normalization Assignment.

🗂️ Database Schema

The database schema is built with MySQL and follows best practices of normalization (up to 3NF).
It includes well-structured tables, constraints, and relationships.

Key Features:

✅ Normalized schema (1NF → 3NF) to eliminate redundancy.

✅ Primary & Foreign Keys to enforce referential integrity.

✅ Indexes for performance optimization.

✅ Relationships:

One-to-Many (Departments → Students, Teachers, Courses).

Many-to-Many (Students ↔ Courses via Enrollments).

One-to-Many (Courses → Classes → Attendance).

One-to-Many (Students → Payments, Borrowing).

🏗️ Tables

The schema consists of the following tables:

Departments → Stores academic departments.

Students → Student personal & academic data.

Teachers → Teacher records with department associations.

Courses → Course details linked to teachers & departments.

Enrollments → Junction table linking students and courses.

Grades → Stores student scores & final grades.

Classes → Course sessions with schedules.

Attendance → Tracks student presence/absence.

Payments → Student tuition/fee payments.

LibraryBooks → Records of available books.

Borrowing → Tracks student book borrowing & returns.

🔐 Constraints & Optimization

PRIMARY KEY on all tables for unique identification.

FOREIGN KEY constraints to maintain relationships.

NOT NULL & UNIQUE applied where appropriate.

ENUM used for controlled values (e.g., gender, payment methods, attendance status).

CHECK constraint on course credits.

Indexes added on frequently queried columns for optimization.

🚀 How to Use

Clone the repository:

git clone <your-repo-link>
cd <repo-folder>


Open MySQL Workbench or CLI.

Run the provided schema.sql file:

source schema.sql;


The database SchManagementDB will be created with all tables and constraints.

📅 Project Info

Module: Database Design & Normalization

Assignment: Week 8 – Building a Complete Database Management System

Student: Elvis