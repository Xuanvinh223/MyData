use master
go

CREATE DATABASE course_test;
GO

USE course_test;
GO
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(50),
  student_email VARCHAR(50),
  student_photo VARCHAR(50) NULL
);
GO
CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(50),
  course_teacher VARCHAR(50)
);
GO
CREATE TABLE marks (
  mark_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  score INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
GO
INSERT INTO students (student_id, student_name, student_email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Bob Johnson', 'bobjohnson@example.com'),
  (4, 'Alice Lee', 'alicelee@example.com'),
  (5, 'Michael Chen', 'michaelchen@example.com'),
  (6, 'Samantha Brown', 'samanthabrown@example.com'),
  (7, 'David Lee', 'davidlee@example.com'),
  (8, 'Emily Davis', 'emilydavis@example.com'),
  (9, 'Ryan Garcia', 'ryangarcia@example.com'),
  (10, 'Olivia Nguyen', 'olivianguyen@example.com');

INSERT INTO courses (course_id, course_name, course_teacher)
VALUES
  (1, 'Mathematics', 'Mr. Smith'),
  (2, 'English', 'Ms. Johnson'),
  (3, 'Science', 'Dr. Lee'),
  (4, 'History', 'Ms. Brown'),
  (5, 'Art', 'Mr. Garcia'),
  (6, 'Physical Education', 'Coach Davis'),
  (7, 'Computer Science', 'Mr. Nguyen'),
  (8, 'Music', 'Ms. Kim'),
  (9, 'Social Studies', 'Mr. Taylor'),
  (10, 'Spanish', 'Ms. Hernandez');

INSERT INTO marks (mark_id, student_id, course_id, score)
VALUES
  (1, 1, 1, 85),
  (2, 2, 1, 90),
  (3, 5, 1, 92),
  (4, 4, 2, 88),
  (5, 3, 2, 95),
  (6, 6, 3, 90),
  (7, 8, 5, 88),
  (8, 9, 4, 92),
  (9, 10, 9, 87),
  (10, 7, 10, 93);
