CREATE TABLE Students (                 -- Contains information about students, names, Id etc.
    student_id SERIAL PRIMARY KEY,    --Primary key for uniquely identifying students
    first_name VARCHAR(50) NOT NULL,   --Not NULL constraint for first name
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE,
    grade_level INT
);

CREATE TABLE Exams (                  -- contains information about exams, Mid term, final, quizzes.
    exam_id SERIAL PRIMARY KEY,
    exam_name VARCHAR(100) NOT NULL,
    exam_date DATE
);

CREATE TABLE Scores (              --Records the scores of students in exams.
    score_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),  -- Foreign key referencing Students table
    exam_id INT REFERENCES Exams(exam_id),  -- Foreign key referencing Exams table
    score INT  -- Score obtained by the student in the exam
);

CREATE TABLE Subjects (           --Contains different subject names.
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
);

-- Insert sample data into the Students table
INSERT INTO Students (first_name, last_name, birthdate, grade_level) VALUES
('John', 'Doe', '2005-03-15', 10),
('Jane', 'Smith', '2004-08-22', 11),
('Michael', 'Johnson', '2006-02-10', 9),
('Emily', 'Williams', '2005-07-18', 10),
('Daniel', 'Brown', '2004-11-30', 11);

-- Insert sample data into the Scores table
INSERT INTO Scores (student_id, exam_id, score) VALUES
(1, 1, 85),
(2, 1, 92),
(3, 1, 78),
(4, 1, 88),
(5, 1, 95),
(1, 2, 90),
(2, 2, 88),
(3, 2, 76),
(4, 2, 94),
(5, 2, 87),
(1, 3, 89),
(2, 3, 80),
(3, 3, 92),
(4, 3, 85),
(5, 3, 91),
(1, 4, 93),
(2, 4, 85),
(3, 4, 79),
(4, 4, 96),
(5, 4, 88);

-- Insert sample data into the Subjects table
INSERT INTO Subjects (subject_name) VALUES
('Mathematics'),
('English'),
('Science'),
('History'),
('Computer Science');

-- Insert sample data into the Exams table
INSERT INTO Exams (exam_name, exam_date) VALUES
    ('Midterm', '2024-03-01'),
    ('Final Exam', '2024-06-10'),
    ('Quiz 1', '2024-04-15'),
    ('Quiz 2', '2024-05-20');

-- Retrieve information about a specific student's scores
SELECT Students.first_name, Students.last_name, Exams.exam_name, Scores.score
FROM Students
JOIN Scores ON Students.student_id = Scores.student_id
JOIN Exams ON Exams.exam_id = Scores.exam_id
WHERE Students.first_name = 'John' AND Students.last_name = 'Doe';

-- Retrieve information about scores in a specific exam
SELECT Students.first_name, Students.last_name, Exams.exam_name, Scores.score
FROM Students
JOIN Scores ON Students.student_id = Scores.student_id
JOIN Exams ON Exams.exam_id = Scores.exam_id
WHERE Exams.exam_name = 'Midterm';

-- View to calculate the average score for each student:
CREATE VIEW View_AverageScores AS
SELECT student_id, AVG(score) AS average_score
FROM Scores
GROUP BY student_id;
