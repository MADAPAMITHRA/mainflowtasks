-- Create and select the database
CREATE DATABASE IF NOT EXISTS employeedb;
USE employeedb;

-- Drop table if it already exists
DROP TABLE IF EXISTS Employees;

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert sample data
INSERT INTO Employees (EmployeeID, Name, Department) VALUES
(1, 'Sid', 'HR'),
(2, 'Raj', 'IT'),
(3, 'Sita', 'Finance'),
(4, 'Ramu', 'Worker');

-- Add new columns
ALTER TABLE Employees ADD COLUMN LastUpdated DATE;
ALTER TABLE Employees ADD COLUMN Status VARCHAR(10) DEFAULT 'Active';

-- Updating
UPDATE Employees
SET LastUpdated = '2025-07-10', Status = 'Inactive'
WHERE EmployeeID = 1;

UPDATE Employees
SET LastUpdated = '2024-07-10', Status = 'Inactive'
WHERE EmployeeID = 2;

UPDATE Employees
SET LastUpdated = '2023-07-10', Status = 'Inactive'
WHERE EmployeeID = 3;

UPDATE Employees
SET LastUpdated = '2022-07-10', Status = 'Inactive'
WHERE EmployeeID = 4;

-- Check data before deletion
SELECT * FROM Employees WHERE Status = 'Inactive';
SELECT * FROM Employees WHERE LastUpdated < '2024-01-01';

SET SQL_SAFE_UPDATES = 0;

-- Delete records where Status is 'Inactive' and LastUpdated is before '2025-05-01'
DELETE FROM Employees 
WHERE Status = 'Inactive' AND LastUpdated < '2024-05-01';

SET SQL_SAFE_UPDATES = 1;

-- Final check 
SELECT * FROM Employees;