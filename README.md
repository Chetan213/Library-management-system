## Project Overview

The Library Management System is a relational database project built using PostgreSQL to manage library operations such as members, books, employees, book issues, and returns.
This project demonstrates strong understanding of database design, relationships, constraints, and SQL querying.

It covers real-world scenarios like book issuance, returns, availability tracking, and analytical reporting using SQL.

## Technologies Used

Database: PostgreSQL

Language: SQL

Tool: pgAdmin / PostgreSQL Query Tool

 ## Database Schema
The database consists of the following tables:

* branch – Stores branch details
* employees – Employee information linked to branches
* members – Registered library members
* books – Book inventory with availability status
* issued_status – Tracks issued books
* return_status – Tracks returned books

All tables are connected using Primary Keys and Foreign Keys to maintain data integrity.

## Database Design Features

* Proper normalization
* Primary & Foreign Key constraints
* One-to-Many relationships
* Realistic sample data
* Referential integrity maintained

## Functionalities & SQL Operations
🔹 Basic Queries

* View members, employees, branches, and books
* Filter data using WHERE, BETWEEN, ORDER BY
* Aggregate functions: COUNT, AVG, MAX

🔹 Intermediate Queries

* Book availability tracking
* Employee and branch-wise data analysis
* Member issue history
* Salary comparisons

🔹 Advanced Queries

* Most issued books
* Most active members
* Employees with maximum issues
* Books not returned
* Category-wise issue count
* Late return calculation
* Subqueries and joins

🧪 Sample Analytical Queries Covered

Members who issued more than one book

Employees issuing the highest number of books

Books never issued

Members who haven’t returned books

Category-wise issued books

Branch-wise total book issues

🚀 How to Run the Project

1. Install PostgreSQL
2. Create the database:

CREATE DATABASE Library_ms;

3.Run table creation scripts
4.Insert sample data
5.Execute practice queries (Step-4)

📂 Project Structure
Library-Management-System/
│
├── database_schema.sql
├── insert_data.sql
├── practice_queries.sql
├── ER_Diagram.png
└── README.md

🎯 Learning Outcomes

* Strong understanding of SQL Joins
* Hands-on experience with real-world relational data
* Ability to write complex analytical queries
* Database design & optimization skills

👤 Author

Chetan Sharma
📌 Aspiring Data Analyst / SQL Developer

🔗 GitHub: https://github.com/Chetan213
