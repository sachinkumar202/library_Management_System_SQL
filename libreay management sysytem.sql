-- 1. Create the library management database
CREATE DATABASE library_management_db;
USE library_management_db;

-- 2. Create a table for books
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    genre VARCHAR(50),
    year_published INT,
    isbn VARCHAR(20),
    copies_available INT
);

-- 3. Create a table for authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- 4. Create a table for members
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    membership_date DATE,
    email VARCHAR(100),
    contact_number VARCHAR(15),
    address TEXT
);

-- 5. Create a table for transactions (book borrowing/return)
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    status ENUM('Borrowed', 'Returned'),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
