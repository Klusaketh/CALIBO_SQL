-- 1
CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    Marks INT
);

INSERT INTO Students VALUES
(1, 'Saketh', 21, 'CSE', 86),
(2, 'Rohit', 20, 'ECE', 79),
(3, 'Nikhil', 21, 'CSE', 93),
(4, 'Varun', 22, 'IT', 88),
(5, 'Akhil', 20, 'EEE', 76);

SELECT * FROM Students;


-- 2
CREATE DATABASE LibraryDB;

USE LibraryDB;

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Category VARCHAR(50),
    Publication_Year INT
);

CREATE TABLE Members (
    Member_ID INT PRIMARY KEY,
    Member_Name VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Borrowing (
    Borrowing_ID INT PRIMARY KEY,
    Book_ID INT,
    Member_ID INT,
    Borrow_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
);


-- 3
CREATE DATABASE HospitalDB;

USE HospitalDB;

CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Disease VARCHAR(50),
    Phone VARCHAR(15)
);

SELECT DATABASE();

SHOW DATABASES;


-- 4
CREATE TABLE EmployeeDetails (
    Emp_ID INT PRIMARY KEY AUTO_INCREMENT,
    Emp_Name VARCHAR(50),
    Age INT,
    Salary INT,
    Department VARCHAR(50)
) AUTO_INCREMENT = 101;

INSERT INTO EmployeeDetails
(Emp_Name, Age, Salary, Department)
VALUES
('Sanjay', 23, 36000, 'IT'),
('Keerthi', 25, 43000, 'HR'),
('Manoj', 24, 39000, 'IT'),
('Divya', 27, 51000, 'Finance'),
('Harsha', 23, 37000, 'Sales'),
('Vivek', 29, 56000, 'IT'),
('Swathi', 26, 46000, 'HR'),
('Teja', 28, 49000, 'Finance'),
('Naveen', 31, 61000, 'Sales'),
('Pooja', 25, 41000, 'IT');

SELECT * FROM EmployeeDetails;


-- 5
CREATE DATABASE CollegeManagement;

USE CollegeManagement;

CREATE TABLE Students (
    Student_ID INT UNSIGNED PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Age INT UNSIGNED NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Year INT UNSIGNED NOT NULL,
    CGPA DECIMAL(3,2) UNSIGNED NOT NULL
);

INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
VALUES
(101, 'Saketh', 'saketh@gmail.com', '9876500001', 21, 'CSE', 4, 8.60),
(102, 'Rohit', 'rohit@gmail.com', '9876500002', 20, 'ECE', 3, 7.80),
(103, 'Nikhil', 'nikhil@gmail.com', '9876500003', 22, 'CSE', 4, 9.20),
(104, 'Varun', 'varun@gmail.com', '9876500004', 19, 'EEE', 2, 8.10),
(105, 'Akhil', 'akhil@gmail.com', '9876500005', 21, 'MECH', 3, 7.60),
(106, 'Karthik', 'karthik@gmail.com', '9876500006', 23, 'CSE', 4, 9.40),
(107, 'Manoj', 'manoj@gmail.com', '9876500007', 20, 'IT', 2, 8.30),
(108, 'Harsha', 'harsha@gmail.com', '9876500008', 22, 'ECE', 4, 7.90),
(109, 'Rahul', 'rahul@gmail.com', '9876500009', 21, 'CSE', 3, 8.80),
(110, 'Vivek', 'vivek@gmail.com', '9876500010', 22, 'IT', 4, 9.10);

-- 5.1
SELECT * FROM Students;

-- 5.2
SELECT * FROM Students
WHERE Department = 'CSE';

-- 5.3
SELECT * FROM Students
WHERE CGPA > 8;

-- 5.4
SELECT * FROM Students
WHERE Age > 20;

-- 5.5
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
VALUES
(101, 'Test', 'test@gmail.com', '9999999999', 21, 'CSE', 4, 8.00);

-- 5.6
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
VALUES
(111, 'Test', 'saketh@gmail.com', '9999999998', 21, 'CSE', 4, 8.00);

-- 5.7
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
VALUES
(112, NULL, 'newstudent@gmail.com', '9999999997', 21, 'CSE', 4, 8.00);

-- 5.8
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
VALUES
(113, 'Test', 'negative@gmail.com', '9999999996', -20, 'CSE', 4, 8.00);

-- 5.9
ALTER TABLE Students
ADD Address VARCHAR(100);

-- 5.10
DESC Students;


-- 6
CREATE TABLE JoinStudents (
    Student_ID INT,
    Student_Name VARCHAR(50),
    Department_ID INT
);

INSERT INTO JoinStudents VALUES
(201, 'Aditya', 10),
(202, 'Sneha', 20),
(203, 'Varun', 10),
(204, 'Meghana', 30),
(205, 'Tarun', NULL);

CREATE TABLE Departments (
    Department_ID INT,
    Department_Name VARCHAR(50)
);

INSERT INTO Departments VALUES
(10, 'CSE'),
(20, 'ECE'),
(30, 'EEE'),
(40, 'MECH');

-- 6.1
SELECT Student_ID, Student_Name, Department_Name
FROM JoinStudents
INNER JOIN Departments
ON JoinStudents.Department_ID = Departments.Department_ID;

-- 6.2
SELECT Department_Name, Student_Name
FROM JoinStudents
RIGHT JOIN Departments
ON JoinStudents.Department_ID = Departments.Department_ID;

-- 6.3
SELECT Department_Name, Student_Name
FROM Departments
LEFT JOIN JoinStudents
ON Departments.Department_ID = JoinStudents.Department_ID;

-- 6.4
SELECT Student_Name
FROM JoinStudents
LEFT JOIN Departments
ON JoinStudents.Department_ID = Departments.Department_ID
WHERE Departments.Department_ID IS NULL;

-- 6.5
SELECT Department_Name
FROM JoinStudents
RIGHT JOIN Departments
ON JoinStudents.Department_ID = Departments.Department_ID
WHERE JoinStudents.Student_ID IS NULL;

-- 6.6
SELECT Student_Name, Department_Name
FROM JoinStudents
LEFT JOIN Departments
ON JoinStudents.Department_ID = Departments.Department_ID

UNION

SELECT Student_Name, Department_Name
FROM JoinStudents
RIGHT JOIN Departments
ON JoinStudents.Department_ID = Departments.Department_ID;


-- 7
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Manager_ID INT
);

INSERT INTO Employees VALUES
(1, 'Ramesh', NULL),
(2, 'Suresh', 1),
(3, 'Anjali', 1),
(4, 'Deepak', 2),
(5, 'Pavan', 2);

-- 7.1
SELECT
    e.Employee_Name AS Employee_Name,
    m.Employee_Name AS Manager_Name
FROM Employees e
LEFT JOIN Employees m
ON e.Manager_ID = m.Employee_ID;


-- 8
CREATE TABLE MultiStudents (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Department_ID INT
);

CREATE TABLE MultiDepartments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Department_ID INT
);

CREATE TABLE Enrollments (
    Student_ID INT,
    Course_ID INT
);

INSERT INTO MultiStudents VALUES
(301, 'Aditya', 10),
(302, 'Sneha', 20),
(303, 'Varun', 10),
(304, 'Meghana', 30),
(305, 'Tarun', 10);

INSERT INTO MultiDepartments VALUES
(10, 'CSE'),
(20, 'ECE'),
(30, 'EEE');

INSERT INTO Courses VALUES
(401, 'DBMS', 10),
(402, 'Python', 10),
(403, 'Digital Electronics', 20),
(404, 'Electrical Circuits', 30);

INSERT INTO Enrollments VALUES
(301, 401),
(301, 402),
(302, 403),
(303, 401),
(304, 404),
(305, 402);

-- 8.1
SELECT
    MultiStudents.Student_Name AS Student_Name,
    MultiDepartments.Department_Name AS Department_Name,
    Courses.Course_Name AS Course_Name
FROM MultiStudents
INNER JOIN MultiDepartments
ON MultiStudents.Department_ID = MultiDepartments.Department_ID
INNER JOIN Enrollments
ON MultiStudents.Student_ID = Enrollments.Student_ID
INNER JOIN Courses
ON Enrollments.Course_ID = Courses.Course_ID;

-- 8.2
SELECT
    MultiStudents.Student_Name AS Student_Name,
    MultiDepartments.Department_Name AS Department,
    Courses.Course_Name AS Course
FROM MultiStudents
INNER JOIN MultiDepartments
ON MultiStudents.Department_ID = MultiDepartments.Department_ID
INNER JOIN Enrollments
ON MultiStudents.Student_ID = Enrollments.Student_ID
INNER JOIN Courses
ON Enrollments.Course_ID = Courses.Course_ID
WHERE MultiDepartments.Department_Name = 'CSE';

-- 8.3
SELECT
    MultiStudents.Student_Name,
    Courses.Course_Name
FROM MultiStudents
INNER JOIN Enrollments
ON MultiStudents.Student_ID = Enrollments.Student_ID
INNER JOIN Courses
ON Enrollments.Course_ID = Courses.Course_ID;

-- 8.4
SELECT
    Department_Name,
    COUNT(MultiStudents.Student_ID) AS Student_Count
FROM MultiDepartments
LEFT JOIN MultiStudents
ON MultiDepartments.Department_ID = MultiStudents.Department_ID
GROUP BY Department_Name;

-- 8.5
SELECT
    Course_Name,
    COUNT(Enrollments.Student_ID) AS Student_Count
FROM Courses
LEFT JOIN Enrollments
ON Courses.Course_ID = Enrollments.Course_ID
GROUP BY Course_Name;

-- 8.6
SELECT
    MultiDepartments.Department_Name,
    Courses.Course_Name
FROM MultiDepartments
INNER JOIN Courses
ON MultiDepartments.Department_ID = Courses.Department_ID;

-- 8.7
SELECT
    MultiStudents.Student_Name,
    MultiDepartments.Department_Name
FROM MultiStudents
INNER JOIN MultiDepartments
ON MultiStudents.Department_ID = MultiDepartments.Department_ID
ORDER BY MultiStudents.Student_Name;

-- 8.8
SELECT
    MultiStudents.Student_Name,
    Courses.Course_Name
FROM MultiStudents
INNER JOIN Enrollments
ON MultiStudents.Student_ID = Enrollments.Student_ID
INNER JOIN Courses
ON Enrollments.Course_ID = Courses.Course_ID
WHERE Courses.Course_Name = 'DBMS';

-- 8.9
SELECT
    Department_Name,
    COUNT(*) AS Total_Students
FROM MultiDepartments
INNER JOIN MultiStudents
ON MultiDepartments.Department_ID = MultiStudents.Department_ID
GROUP BY Department_Name;

-- 8.10
SELECT
    Course_Name,
    COUNT(*) AS Total_Enrollments
FROM Courses
INNER JOIN Enrollments
ON Courses.Course_ID = Enrollments.Course_ID
GROUP BY Course_Name;

-- 8.11
SELECT
    MultiStudents.Student_Name,
    MultiDepartments.Department_Name,
    Courses.Course_Name
FROM MultiStudents
INNER JOIN MultiDepartments
ON MultiStudents.Department_ID = MultiDepartments.Department_ID
INNER JOIN Enrollments
ON MultiStudents.Student_ID = Enrollments.Student_ID
INNER JOIN Courses
ON Enrollments.Course_ID = Courses.Course_ID
ORDER BY MultiStudents.Student_ID;