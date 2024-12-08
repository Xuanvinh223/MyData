CREATE DATABASE ExamJava
USE ExamJava
-- Create the Exam table
CREATE TABLE Exam (
  id INT PRIMARY KEY,
  exam_name VARCHAR(50),
  exam_date DATE,
  exam_time TIME
);

-- Insert some sample data into Exam table
INSERT INTO Exam (id, exam_name, exam_date, exam_time)
VALUES
  (1, 'Maths Final Exam', '2023-06-12', '09:00:00'),
  (2, 'English Mid-term Exam', '2023-08-15', '14:00:00'),
  (3, 'Science Quiz', '2023-05-22', '10:30:00');

-- Create the Student table
CREATE TABLE Student (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone VARCHAR(20)
);

-- Insert some sample data into Student table
INSERT INTO Student (id, first_name, last_name, email, phone)
VALUES
  (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
  (2, 'Jane', 'Smith', 'jane.smith@example.com', '555-123-4567'),
  (3, 'Bob', 'Johnson', 'bob.johnson@example.com', '987-654-3210');

-- Create the ExamEnrollment table
CREATE TABLE ExamEnrollment (
  exam_id INT,
  student_id INT,
  enrollment_date DATE,
  PRIMARY KEY (exam_id, student_id),
  FOREIGN KEY (exam_id) REFERENCES Exam(id),
  FOREIGN KEY (student_id) REFERENCES Student(id)
);

-- Insert some sample data into ExamEnrollment table
INSERT INTO ExamEnrollment (exam_id, student_id, enrollment_date)
VALUES
  (1, 1, '2023-05-01'),
  (1, 2, '2023-05-01'),
  (2, 2, '2023-07-01'),
  (3, 3, '2023-04-01');

-- Create the ExamResult table
CREATE TABLE ExamResult (
  id INT PRIMARY KEY,
  exam_id INT,
  student_id INT,
  grade DECIMAL(5, 2),
  exam_date DATE,
  FOREIGN KEY (exam_id) REFERENCES Exam(id),
  FOREIGN KEY (student_id) REFERENCES Student(id)
);

-- Insert some sample data into ExamResult table
INSERT INTO ExamResult (id, exam_id, student_id, grade, exam_date)
VALUES
  (1, 1, 1, 85.5, '2023-06-12'),
  (2, 1, 2, 92.0, '2023-06-12'),
  (3, 2, 2, 78.0, '2023-08-15'),
  (4, 3, 3, 96.3, '2023-05-22');




  SELECT CONCAT(dbo.Students.first_name, ' ', dbo.Students.last_name) AS Name, dbo.Students.email, dbo.Exams.exam_name, dbo.Exams.exam_date, dbo.Exams.exam_time
FROM Students
INNER JOIN dbo.ExamEnrollments ON dbo.Students.id = dbo.ExamEnrollments.student_id
INNER JOIN dbo.Exams ON dbo.ExamEnrollments.exam_id = dbo.Exams.id
INNER JOIN dbo.ExamResults ON dbo.Exams.id = dbo.ExamResults.exam_id AND dbo.Students.id = dbo.ExamResults.student_id;


SELECT CONCAT(dbo.Students.first_name, ' ', dbo.Students.last_name) AS Name, dbo.Students.email, COUNT(*) AS "Total Exams"
FROM dbo.Students
INNER JOIN dbo.ExamEnrollments ON dbo.Students.id = dbo.ExamEnrollments.student_id
GROUP BY dbo.Students.id, dbo.Students.first_name, dbo.Students.last_name, dbo.Students.email
ORDER BY "Total Exams" DESC
