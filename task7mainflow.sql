-- Create and Use Database
CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

-- Drop Views 
DROP VIEW IF EXISTS average_scores;
DROP VIEW IF EXISTS passed_students;
DROP VIEW IF EXISTS student_scores;

-- Drop Tables if They Exist
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS students;

-- Create Tables
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE scores (
    score_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    score INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Insert Sample Data
INSERT INTO students (student_id, name) VALUES
(1, 'Sid'),
(2, 'Abc'),
(3, 'Rahul'),
(4, 'Def');

INSERT INTO scores (score_id, student_id, subject, score) VALUES
(101, 1, 'Math', 95),
(102, 1, 'Science', 98),
(103, 4, 'Math', 35),
(104, 2, 'Science', 42),
(105, 4, 'Math', 90),
(106, 3, 'Science', 88);

-- Student Scores
CREATE VIEW student_scores AS
SELECT s.student_id, s.name, sc.subject, sc.score
FROM students s
JOIN scores sc ON s.student_id = sc.student_id;

-- Students Who Passed All Subjects (score >= 40)
CREATE VIEW passed_students AS
SELECT student_id, name
FROM students
WHERE student_id NOT IN (
    SELECT student_id FROM scores WHERE score < 40
);

-- View for Average Scores
CREATE VIEW average_scores AS
SELECT s.student_id, s.name, AVG(sc.score) AS avg_score
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
GROUP BY s.student_id, s.name;

-- Check Output
SELECT * FROM student_scores;
SELECT * FROM passed_students;
SELECT * FROM average_scores;