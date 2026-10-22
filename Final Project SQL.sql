--- SQL FINAL PROJECT ON BASIS College Management System ---


CREATE DATABASE CollegeManagement;

USE CollegeManagement;


# TABLE 1
CREATE TABLE Department (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50) NOT NULL UNIQUE,
Location VARCHAR(50)
);

# TABLE 2
create table Student (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(100) NOT NULL,
Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
City VARCHAR(50),
Email VARCHAR(100) UNIQUE,
DepartmentID INT,
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID)
);

# TABLE 3
create table Faculty (
FacultyID INT PRIMARY KEY,
FacultyName VARCHAR(100) NOT NULL,
Designation VARCHAR(50),
Salary DECIMAL(10,2) CHECK (Salary > 0),
DepartmentID INT,
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID)
);

# TABLE 4
create table Course (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100) NOT NULL,
Credits INT CHECK (Credits BETWEEN 1 AND 6),
DepartmentID INT,
FacultyID INT,
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID),
FOREIGN KEY (FacultyID)
REFERENCES Faculty(FacultyID)
);

# TABLE 5
CREATE TABLE Enrollment (
EnrollmentID INT PRIMARY KEY,
StudentID INT NOT NULL,
CourseID INT NOT NULL,
Marks DECIMAL(5,2) CHECK (Marks BETWEEN 0 AND 100),
Semester INT CHECK (Semester BETWEEN 1 AND 8),
FOREIGN KEY (StudentID)
REFERENCES Student(StudentID),
FOREIGN KEY (CourseID)
REFERENCES Course(CourseID),
UNIQUE (StudentID, CourseID)
);


INSERT INTO Department
(DepartmentID, DepartmentName, Location)
VALUES
(101, 'Computer Science', 'Block A'),
(102, 'Information Technology', 'Block B'),
(103, 'Mechanical Engineering', 'Block C'),
(104, 'Civil Engineering', 'Block D'),
(105, 'Electronics Engineering', 'Block E');

INSERT INTO Student
(StudentID, StudentName, Gender, City, Email, DepartmentID)
VALUES
(1, 'Aarav Sharma', 'Male', 'Pune', 'aarav@gmail.com', 101),
(2, 'Priya Patil', 'Female', 'Mumbai', 'priya@gmail.com', 101),
(3, 'Rahul Joshi', 'Male', 'Nashik', 'rahul@gmail.com', 102),
(4, 'Sneha Kulkarni', 'Female', 'Pune', 'sneha@gmail.com', 102),
(5, 'Vivek Shah', 'Male', 'Mumbai', 'vivek@gmail.com', 103),
(6, 'Ananya Deshmukh', 'Female', 'Aurangabad', 'ananya@gmail.com', 104),
(7, 'Rohan Mehta', 'Male', 'Pune', 'rohan@gmail.com', 101),
(8, 'Neha More', 'Female', 'Nashik', 'neha@gmail.com', 103),
(9, 'Karan Gupta', 'Male', 'Nagpur', 'karan@gmail.com', 102),
(10, 'Isha Jain', 'Female', 'Pune', 'isha@gmail.com', 101),
(11, 'Aditya Pawar', 'Male', 'Mumbai', 'aditya@gmail.com', 103),
(12, 'Meera Joshi', 'Female', 'Nashik', 'meera@gmail.com', 104),
(13, 'Arjun Patil', 'Male', 'Aurangabad', 'arjun@gmail.com', 105),
(14, 'Kavya Sharma', 'Female', 'Pune', 'kavya@gmail.com', 101),
(15, 'Sahil Khan', 'Male', 'Nagpur', 'sahil@gmail.com', 102),
(16, 'Riya Desai', 'Female', 'Mumbai', 'riya@gmail.com', 103),
(17, 'Manish Rao', 'Male', 'Nashik', 'manish@gmail.com', 104),
(18, 'Pallavi More', 'Female', 'Aurangabad', 'pallavi@gmail.com', 105),
(19, 'Akash Kulkarni', 'Male', 'Pune', 'akash@gmail.com', 101),
(20, 'Simran Singh', 'Female', 'Nagpur', 'simran@gmail.com', 102);

INSERT INTO Faculty
(FacultyID, FacultyName, Designation, Salary, DepartmentID)
VALUES
(201, 'Dr. Amit Verma', 'Professor', 85000, 101),
(202, 'Prof. Neha Singh', 'Assistant Professor', 65000, 101),
(203, 'Dr. Raj Malhotra', 'Professor', 90000, 102),
(204, 'Prof. Pooja Shah', 'Assistant Professor', 60000, 103),
(205, 'Dr. Kiran Rao', 'Professor', 82000, 104),
(206, 'Dr. Sameer Joshi', 'Professor', 88000, 105),
(207, 'Prof. Rakesh Patil', 'Assistant Professor', 62000, 102),
(208, 'Dr. Meena Kulkarni', 'Professor', 87000, 103),
(209, 'Prof. Anil Desai', 'Assistant Professor', 61000, 104),
(210, 'Dr. Swati Rao', 'Professor', 83000, 105);

INSERT INTO Course
(CourseID, CourseName, Credits, DepartmentID, FacultyID)
VALUES
(301, 'Database Management System', 4, 101, 201),
(302, 'Data Structures', 4, 101, 202),
(303, 'Computer Networks', 3, 102, 203),
(304, 'Thermodynamics', 4, 103, 204),
(305, 'Structural Engineering', 4, 104, 205),
(306, 'Operating Systems', 4, 102, 203),
(307, 'Digital Electronics', 4, 105, 206),
(308, 'Software Engineering', 3, 102, 207),
(309, 'Machine Design', 4, 103, 208),
(310, 'Environmental Engineering', 3, 104, 209);

INSERT INTO Enrollment
(EnrollmentID, StudentID, CourseID, Marks, Semester)
VALUES
(1, 1, 301, 88, 4),
(2, 1, 302, 92, 4),
(3, 2, 301, 76, 4),
(4, 2, 302, 81, 4),
(5, 3, 303, 85, 4),
(6, 3, 306, 90, 4),
(7, 4, 303, 72, 4),
(8, 4, 306, 78, 4),
(9, 5, 304, 95, 4),
(10, 5, 309, 88, 4),
(11, 6, 305, 82, 4),
(12, 6, 310, 86, 4),
(13, 7, 301, 91, 4),
(14, 7, 302, 87, 4),
(15, 8, 304, 89, 4),
(16, 8, 309, 79, 4),
(17, 9, 303, 86, 4),
(18, 9, 306, 81, 4),
(19, 10, 301, 94, 4),
(20, 10, 302, 89, 4),
(21, 11, 304, 84, 4),
(22, 11, 309, 88, 4),
(23, 12, 305, 91, 4),
(24, 12, 310, 85, 4),
(25, 13, 307, 93, 4),
(26, 14, 301, 87, 4),
(27, 15, 303, 79, 4),
(28, 16, 304, 92, 4),
(29, 17, 305, 76, 4),
(30, 18, 307, 84, 4);
show tables;
desc course;

-- Question 1: Display a college summary showing total number of departments, students, faculty, courses and enrollments.
SELECT
(SELECT COUNT(*) FROM Department) AS TotalDepartments,
(SELECT COUNT(*) FROM Student)    AS TotalStudents,
(SELECT COUNT(*) FROM Faculty)    AS TotalFaculty,
(SELECT COUNT(*) FROM Course)     AS TotalCourses,
(SELECT COUNT(*) FROM Enrollment) AS TotalEnrollments;

-- Question 2: Find names and cities of all students whose name starts with the letter ‘A’.
SELECT StudentName, City
FROM Student
WHERE StudentName LIKE 'A%' ;

-- Question 3: Classify enrollment marks into grades A, B and C and count each grade.
select case 
WHEN Marks >= 90 THEN 'A'
WHEN Marks >= 80 THEN 'B'
ELSE 'C'
END AS Grade,
COUNT(*) AS Total
FROM Enrollment
GROUP BY Grade;
-- Question 4: Find the highest, lowest and average marks obtained by students. 
SELECT 
MAX(Marks) AS HighestMarks,
MIN(Marks) AS LowestMarks,
ROUND(AVG(Marks), 2) AS AverageMarks
FROM Enrollment;

-- Question 5: Count the number of students in each department. 
SELECT d.DepartmentName, COUNT(s.StudentID) AS TotalStudents
FROM Department d
LEFT JOIN Student s 
ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentName;

-- Question 6: Calculate the average marks obtained in each course. 
SELECT
CourseID,
ROUND(AVG(Marks), 2) AS AverageMarks
FROM Enrollment
GROUP BY CourseID;


-- question 7: Display each student's name along with their department name. ( Joins)
SELECT
s.StudentName,
d.DepartmentName
FROM Student s
INNER JOIN Department d
ON s.DepartmentID = d.DepartmentID;
    
-- Question 8:Display student names, course names and marks obtained.
SELECT
s.StudentName,
c.CourseName,
e.Marks
FROM Enrollment e
INNER JOIN Student s
ON e.StudentID = s.StudentID
INNER JOIN Course c
ON e.CourseID = c.CourseID;
    
-- Question 9: Find departments whose total credits are more than 7, from highest to lowest.
SELECT DepartmentID, 
SUM(Credits) AS TotalCredits
FROM Course
GROUP BY DepartmentID
HAVING SUM(Credits) > 7
ORDER BY TotalCredits DESC;

-- Question 10: Find courses whose average marks are greater than 85. with course name 
SELECT
c.CourseID, c.CourseName,
ROUND(AVG(e.Marks), 2) AS AverageMarks
FROM Enrollment e
join course c
on e.courseID = c.courseID
GROUP BY c.CourseID, c.CourseName
HAVING AVG(e.Marks) > 85;

-- Question 11: Find faculty members whose salary is greater than the average faculty salary.
SELECT FacultyName, Salary
FROM Faculty
WHERE Salary > (
SELECT AVG(Salary)
FROM Faculty
);

-- Question 12 : Find students who are not enrolled in any course.
SELECT StudentID, StudentName
FROM Student
WHERE StudentID NOT IN (
SELECT StudentID
FROM Enrollment
);
-- Question 13 : Rank students based on their marks, from highest to lowest.
SELECT
StudentID,
CourseID,
Marks,
RANK() OVER (ORDER BY Marks DESC) AS StudentRank
FROM Enrollment;

-- Question 14 : Create a view to display faculty members whose salary is greater than ₹70,000.
create VIEW HighSalaryFaculty AS
select FacultyID, FacultyName, Designation, Salary
from Faculty
where Salary > 70000;

select * from 
HighSalaryFaculty;

-- Question 15 : Find the department with the second-highest number of students.
SELECT DepartmentID, COUNT(*) AS TotalStudents
FROM Student
GROUP BY DepartmentID
ORDER BY TotalStudents DESC
LIMIT 1 offset 2;

