DROP DATABASE IF EXISTS project3;
CREATE DATABASE project3;
USE project3;

-- ~~~~~~~~~~~~~~
-- ~~~~Tables~~~~
-- ~~~~~~~~~~~~~~

CREATE TABLE professors (
  professor_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  course_prefix CHAR(3) NOT NULL,
  course_number INT NOT NULL,
  credits INT NOT NULL
);

CREATE TABLE sections (
  section_id INT AUTO_INCREMENT PRIMARY KEY,
  course_id INT NOT NULL,
  professor_id INT NOT NULL,
  section_number INT NOT NULL,
  room VARCHAR(50) NOT NULL,
  days VARCHAR(10) NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,

  CONSTRAINT u_course_section UNIQUE(course_id, section_number),

  CONSTRAINT fk_section_course_id
  FOREIGN KEY (course_id)
  REFERENCES courses(course_id),

  CONSTRAINT fk_section_professor_id 
  FOREIGN KEY (professor_id)
  REFERENCES professors(professor_id)
);

CREATE TABLE students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  major VARCHAR(50) NOT NULL,
  graduation_year INT NOT NULL
);

CREATE TABLE sections_students (
  section_id INT NOT NULL,
  student_id INT NOT NULL,

  PRIMARY KEY (section_id, student_id),

  CONSTRAINT fk_sectionstudent_section_id
  FOREIGN KEY (section_id)
  REFERENCES sections(section_id),

  CONSTRAINT fk_sectionstudent_student_id
  FOREIGN KEY (student_id)
  REFERENCES students(student_id)
);

CREATE TABLE assignments (
  assignment_id INT AUTO_INCREMENT PRIMARY KEY,
  section_id INT NOT NULL,
  assignment_name VARCHAR(100) NOT NULL,

  CONSTRAINT fk_assignment_section_id
  FOREIGN KEY (section_id)
  REFERENCES sections(section_id)
);

CREATE TABLE assignments_students (
  assignment_id INT NOT NULL,
  student_id INT NOT NULL,
  assignment_grade DEC(5,2) NOT NULL,

  PRIMARY KEY (assignment_id, student_id),

  CONSTRAINT fk_assignmentstudent_assignment_id
  FOREIGN KEY (assignment_id)
  REFERENCES assignments(assignment_id),

  CONSTRAINT fk_assignmentstudent_student_id
  FOREIGN KEY (student_id)
  REFERENCES students(student_id)
);

-- ~~~~~~~~~~~~~~~
-- ~~~~Inserts~~~~
-- ~~~~~~~~~~~~~~~

INSERT INTO professors
  (first_name, last_name, email)
VALUES
  ("Vikas", "Gowda", "vthammannagowda@champlain.edu");

INSERT INTO courses
  (course_prefix, course_number, credits)
VALUES
  ('DAT', 210, 3),
  ('DAT', 410, 3),
  ('CSI', 300, 3);

INSERT INTO sections
  (course_id, professor_id, section_number, room, days, start_time, end_time)
VALUES
  (1, 1, 1, 'JOYC 210', 'MTh', TIME('11:30'), TIME('12:45')),
  (2, 1, 1, 'MIC 308', 'W', TIME('9:00'), TIME('11:45')),
  (3, 1, 1, 'JOYC 201', 'TF', TIME('13:00'), TIME('14:15')),
  (3, 1, 2, 'JOYC 201', 'TF', TIME('14:30'), TIME('15:45'));

INSERT INTO assignments
  (section_id, assignment_name)
VALUES
  (1, 'Quiz 1'),
  (1, 'Quiz 2'),
  (1, 'Project 1'),
  (1, 'Project 2'),
  (1, 'Final Exam'),
  (2, 'Quiz 1'),
  (2, 'Quiz 2'),
  (2, 'Project 1'),
  (2, 'Project 2'),
  (2, 'Final Exam'),
  (3, 'Quiz 1'),
  (3, 'Quiz 2'),
  (3, 'Project 1'),
  (3, 'Project 2'),
  (3, 'Final Exam'),
  (4, 'Quiz 1'),
  (4, 'Quiz 2'),
  (4, 'Project 1'),
  (4, 'Project 2'),
  (4, 'Final Exam');

INSERT INTO students
  (first_name, last_name, email, major, graduation_year) 
VALUES
  ("Jimbo", "James", "jimbojames@gmail.com", "Mathematics", 2027),
  ("Tom", "Claflin", "tclaflin1122@outlook.com", "Computer Science", 2027),
  ("Akiva", "Nugent", "nugent.akiva@yahoo.com", "Computer Science", 2028),
  ("Mason", "Lee", "leem@aol.com", "Data Analytics", 2028);

INSERT INTO sections_students
  (section_id, student_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 4),
  (2, 1),
  (2, 3),
  (2, 4),
  (3, 1),
  (3, 2),
  (4, 3),
  (4, 4);

-- Student 1
INSERT INTO assignments_students
  (assignment_id, student_id, assignment_grade)
VALUES
  (1, 1, 90),
  (2, 1, 86.7),
  (3, 1, 94.2),
  (4, 1, 88),
  (5, 1, 76),
  (6, 1, 99),
  (7, 1, 97.7),
  (8, 1, 96.5),
  (9, 1, 98.4),
  (10, 1, 99.3),
  (11, 1, 77.3),
  (12, 1, 79),
  (13, 1, 85.3),
  (14, 1, 81.2),
  (15, 1, 82);

-- Student 2
INSERT INTO assignments_students
  (assignment_id, student_id, assignment_grade)
VALUES
  (1, 2, 88),
  (2, 2, 91.5),
  (3, 2, 85),
  (4, 2, 90.2),
  (5, 2, 89),
  (11, 2, 86),
  (12, 2, 84.3),
  (13, 2, 89.5),
  (14, 2, 87),
  (15, 2, 90);

-- Student 3
INSERT INTO assignments_students
  (assignment_id, student_id, assignment_grade)
VALUES
  (6, 3, 78),
  (7, 3, 75.5),
  (8, 3, 80.1),
  (9, 3, 82),
  (10, 3, 79.6),
  (16, 3, 83),
  (17, 3, 85.7),
  (18, 3, 79),
  (19, 3, 80.3),
  (20, 3, 84.5);

-- Student 4
INSERT INTO assignments_students
  (assignment_id, student_id, assignment_grade)
VALUES
  (1, 4, 52.4),
  (2, 4, 48.3),
  (3, 4, 60),
  (4, 4, 55.6),
  (5, 4, 58.1),
  (6, 4, 45.2),
  (7, 4, 50.9),
  (8, 4, 42.7),
  (9, 4, 49),
  (10, 4, 53.3),
  (16, 4, 40),
  (17, 4, 46.8),
  (18, 4, 50),
  (19, 4, 38.9),
  (20, 4, 44.2);
