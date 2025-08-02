-- Drop and recreating the database
DROP DATABASE IF EXISTS school_db;
CREATE DATABASE school_db;
USE school_db;

DROP TABLE IF EXISTS student_audit;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    email VARCHAR(100),
    grade DECIMAL(5,2),
    performance_score INT
);

CREATE TABLE student_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    old_grade DECIMAL(5,2),
    new_grade DECIMAL(5,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO students (name, gender, age, email, grade, performance_score) VALUES
('Sid', 'Male', 24, 'sid@email.com', 9.8, 98),
('Sneha', 'Female', 20, 'sneha@email.com', 8.5, 88),
('Ami', 'Male', 21, 'ami@email.com', 9.1, 90),
('Sharma', 'Female', 19, 'sharma@email.com', 8.3, 88);

DELIMITER //

CREATE TRIGGER log_grade_update
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    IF OLD.grade <> NEW.grade THEN
        INSERT INTO student_audit (student_id, old_grade, new_grade)
        VALUES (OLD.id, OLD.grade, NEW.grade);
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE update_grades()
BEGIN
    SET SQL_SAFE_UPDATES = 0;

    UPDATE students
    SET grade = CASE
        WHEN performance_score >= 90 THEN 9.5
        WHEN performance_score >= 80 THEN 8.5
        WHEN performance_score >= 70 THEN 7.5
        ELSE 6.0
    END;

    SET SQL_SAFE_UPDATES = 1;

    SELECT 'Grades updated successfully' AS message;
END;
//

DELIMITER ;

CALL update_grades();

SELECT * FROM students;

SELECT * FROM student_audit;
