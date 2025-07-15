-- Step 1: Create and use the database
CREATE DATABASE IF NOT EXISTS studentdb;
USE studentdb;

-- Step 2: Drop the table if it already exists
DROP TABLE IF EXISTS Studentsss;

-- Step 3: Create the Students table
CREATE TABLE Studentsss (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    MathScore INT,
    TotalScore INT
);

-- Step 4: Insert sample data into the table
INSERT INTO Studentsss (Name, MathScore, TotalScore) VALUES
('Arjun', 98, 189),
('Aadhya', 98, 189),
('Raju', 78, 129),
('Rani', 91, 188),
('Sid', 99, 199),
('Mahesh', 78, 179),
('Qwer', 66, 169),
('Bunny', 86, 185),
('Asdf', 99, 199),
('Sita', 93, 193);

-- Step 5: Rank students by TotalScore using RANK()
SELECT 
    StudentID,
    Name,
    TotalScore,
    RANK() OVER (ORDER BY TotalScore DESC) AS Ranks
FROM Studentsss;

-- Step 6: Calculate running total of MathScore using SUM() OVER()
SELECT 
    StudentID,
    Name,
    MathScore,
    SUM(MathScore) OVER (ORDER BY StudentID) AS RunningTotal
FROM Studentsss;