-- Create the database
CREATE DATABASE IF NOT EXISTS studentmanager;
USE studentmanager;

-- Drop existing tables if needed
DROP TABLE IF EXISTS Enrolments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Student;

-- Create the Student table
CREATE TABLE IF NOT EXISTS Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    math_score INT,
    science_score INT,
    english_score INT
);

-- Insert data into the Student table
INSERT INTO Student(name, math_score, science_score, english_score)
VALUES
('Arjun', 98, 99, 92),
('Aadhya', 98, 90, 95),
('Raju', 78, 80, 82),
('Rani', 91, 88, 77),
('Sid', 99, 99, 99),
('Mahesh', 78, 79, 72),
('Qwer', 66, 69, 63),
('Bunny', 86, 85, 71),
('Asdf', 99, 99, 99),
('Sita', 93, 93, 92);

-- Top 5 students by total score
SELECT name, math_score, science_score, english_score,
       (math_score + science_score + english_score) AS total_score
FROM Student
ORDER BY total_score DESC
LIMIT 5;

-- Create Courses table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100)
);

-- Create Enrolments table
CREATE TABLE IF NOT EXISTS Enrolments (
    enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert sample courses
INSERT INTO Courses(course_name) VALUES 
('Mathematics'), 
('Science'), 
('English'), 
('Computer Science');

-- Insert enrolments
INSERT INTO Enrolments(student_id, course_id) VALUES
(1, 1), -- Arjun → Mathematics
(1, 2), -- Arjun → Science
(2, 1), -- Aadhya → Mathematics
(2, 3), -- Aadhya → English
(3, 1), -- Raju → Mathematics
(3, 4), -- Raju → CS
(4, 2), -- Rani → Science
(5, 1), -- Sid → Mathematics
(5, 2), -- Sid → Science
(5, 3); -- Sid → English

-- Task 1: Student name with course name
SELECT s.name AS student_name,
       c.course_name
FROM Student s
INNER JOIN Enrolments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- Task 2: Course-wise student count
SELECT 
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS number_of_students
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- Task 3: Students enrolled in more than one course
SELECT 
    s.student_id,
    s.name,
    COUNT(e.course_id) AS course_count
FROM Enrolments e
JOIN Student s ON e.student_id = s.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(e.course_id) > 1;

-- Task 4: Courses with no enrolments
SELECT 
    c.course_id,
    c.course_name
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;