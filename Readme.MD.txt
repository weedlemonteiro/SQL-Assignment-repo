# Student Exam Database

## Overview

This database is designed to store information about students, exams, scores, and subjects. It can be used to track students' performance in various exams for different subjects. The database consists of four main tables: Students, Exams, Scores, and Subjects.

## Tables

1. **Students:**
   - Fields: `student_id`, `first_name`, `last_name`, `birthdate`, `grade_level`.
   - Primary Key: `student_id`.

2. **Exams:**
   - Fields: `exam_id`, `exam_name`, `exam_date`.
   - Primary Key: `exam_id`.

3. **Scores:**
   - Fields: `score_id`, `student_id` (foreign key referencing `Students`), `exam_id` (foreign key referencing `Exams`), `score`.
   - Primary Key: `score_id`.
   - Foreign Keys: `student_id` references `Students(student_id)`, `exam_id` references `Exams(exam_id)`.

4. **Subjects:**
   - Fields: `subject_id`, `subject_name`.
   - Primary Key: `subject_id`.

## Usage

To use this database, follow these steps:

1. Set up a PostgreSQL database and execute the SQL statements in a database management tool or command line.
2. Connect your application to the database using appropriate credentials.
3. Use the provided queries or create your own to interact with the data.

## Queries

1. **Students Table:**
   - Contains information about students such as their names, birthdate, and grade level.
   - Example query: Retrieve information about a specific student (e.g., 'John Doe'):

     SELECT * FROM Students WHERE first_name = 'John' AND last_name = 'Doe';

2. **Exams Table:**
   - Contains information about exams, including the exam name and date.
   - Example query: Retrieve information about a specific exam (e.g., 'Midterm'):

     SELECT * FROM Exams WHERE exam_name = 'Midterm';
    

3. **Subjects Table:**
   - Contains different subject names.
   - Example query: Retrieve all subjects:

     SELECT * FROM Subjects;
     
4. **Scores Table:**
   - Records the scores of students in exams, referencing the `Students` and `Exams` tables.
   - Example query: Retrieve scores for a specific student (e.g., 'John Doe'):

     SELECT Exams.exam_name, Scores.score
     FROM Scores
     JOIN Exams ON Exams.exam_id = Scores.exam_id
     WHERE Scores.student_id = (SELECT student_id FROM Students WHERE first_name = 'John' AND last_name = 'Doe');
   

   - Example query: Calculate the average score for each student:

     SELECT student_id, AVG(score) AS average_score
     FROM Scores
     GROUP BY student_id;

   - Example query: Retrieve scores for a specific exam (e.g., 'Midterm'):

     SELECT Students.first_name, Students.last_name, Scores.score
     FROM Scores
     JOIN Students ON Students.student_id = Scores.student_id
     WHERE Scores.exam_id = (SELECT exam_id FROM Exams WHERE exam_name = 'Midterm');

These queries demonstrate how to retrieve information about students, exams, scores, and subjects from the database.

##Update

To update the data in the database, the `UPDATE` statement is used. Here are examples for updating various parts of the database:

1. **Update Student Information:**
   
   -- Update John Doe's birthdate and grade_level
   UPDATE Students
   SET birthdate = '2005-05-20', grade_level = 11
   WHERE first_name = 'John' AND last_name = 'Doe';

2. **Update Exam Information:**

   -- Update Midterm exam date
   UPDATE Exams
   SET exam_date = '2024-03-05'
   WHERE exam_name = 'Midterm';

3. **Update Score:**

   -- Update John Doe's score in the Midterm exam
   UPDATE Scores
   SET score = 88
   WHERE student_id = 1 AND exam_id = 1;

4. **Update Subject Name:**

   -- Update Computer Science to IT in Subjects table
   UPDATE Subjects
   SET subject_name = 'IT'
   WHERE subject_name = 'Computer Science';


Run `SELECT` queries first to verify which records will be affected before executing an `UPDATE` statement.
