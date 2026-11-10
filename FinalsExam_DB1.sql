-- CREATE FIRST DATABASE
CREATE DATABASE CompanyDB1;

USE CompanyDB1;

-- CREATE PROFILE TABLE
CREATE TABLE Profile (
    Profile_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Age INT,
    Department VARCHAR(100),
    Position VARCHAR(100)
);

-- INSERT FIVE RECORDS
INSERT INTO Profile VALUES
(1, 'John Smith', 'Makati City', 25, 'IT', 'Programmer'),
(2, 'Mary Johnson', 'Manila City', 28, 'HR', 'HR Manager'),
(3, 'Robert Brown', 'Pasig City', 30, 'Finance', 'Accountant'),
(4, 'Sarah Davis', 'Quezon City', 26, 'Marketing', 'Marketing Officer'),
(5, 'Michael Wilson', 'Taguig City', 32, 'IT', 'System Administrator');

-- DISPLAY ALL RECORDS
SELECT * FROM Profile;