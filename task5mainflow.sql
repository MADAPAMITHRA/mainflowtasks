-- Step 1: Create the table
CREATE TABLE StudentScores (
    StudentID INT,
    TotalScore INT,
    MathScore INT,
    ScienceScore INT
);

-- Step 2: Insert sample data
INSERT INTO StudentScores (StudentID, TotalScore, MathScore, ScienceScore)
VALUES
(1, 95, 45, 50),
(2, 85, 35, 60),
(3, 75, 40, 30),
(4, 65, 25, 20);

-- Step 3: Combined Query - Assign Grade and Pass/Fail Status
SELECT 
    StudentID,
    TotalScore,
    MathScore,
    ScienceScore,

    -- Grade based on TotalScore
    CASE 
        WHEN TotalScore >= 90 THEN 'A'
        WHEN TotalScore >= 80 THEN 'B'
        WHEN TotalScore >= 70 THEN 'C'
        ELSE 'D (Fail)'
    END AS Grade,

    -- Math Pass/Fail
    CASE 
        WHEN MathScore >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS Math_Status,

    -- Science Pass/Fail
    CASE 
        WHEN ScienceScore >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS Science_Status

FROM StudentScores;