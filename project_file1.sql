create database Library_ms;


--create table "branch"
CREATE TABLE branch
(
            branch_id VARCHAR(100) PRIMARY KEY,
            manager_id VARCHAR(100),
            branch_address VARCHAR(100),
            contact_no VARCHAR(50)
);


-- Create table "Employee"
CREATE TABLE employees
(
            emp_id VARCHAR(100) PRIMARY KEY,
            emp_name VARCHAR(100),
            position VARCHAR(50),
            salary DECIMAL(10,2),
            branch_id VARCHAR(100),
            FOREIGN KEY (branch_id) REFERENCES  branch(branch_id)
);


-- Create table "Members"
CREATE TABLE members
(
            member_id VARCHAR(100) PRIMARY KEY,
            member_name VARCHAR(50),
            member_address VARCHAR(50),
            reg_date DATE
);



-- Create table "Books"
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(100),
            category VARCHAR(100),
            rental_price DECIMAL(10,2),
            status VARCHAR(100),
            author VARCHAR(100),
            publisher VARCHAR(100)
);



-- Create table "IssueStatus"
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(100),
            issued_book_name VARCHAR(100),
            issued_date DATE,
            issued_book_isbn VARCHAR(100),
            issued_emp_id VARCHAR(100),
            FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
            FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
            FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn) 
);


-- Create table "ReturnStatus"
CREATE TABLE return_status
(
            return_id VARCHAR(100) PRIMARY KEY,
            issued_id VARCHAR(100),
            return_book_name VARCHAR(100),
            return_date DATE,
            return_book_isbn VARCHAR(100),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);




