-- Creating the database
CREATE DATABASE SchManagementDB;

-- Selecting the database
USE SchManagementDB;

-- Departments table
CREATE TABLE Departments (
    departmentID INT AUTO_INCREMENT PRIMARY KEY,
    departmentName VARCHAR(100) NOT NULL UNIQUE
);

-- Students table
CREATE TABLE Students (
    studentID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dateOfBirth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    contactNumber VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    enrollmentDate DATE NOT NULL,
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID)
);

-- Teachers table
CREATE TABLE Teachers (
    teacherID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    contactNumber VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    hireDate DATE NOT NULL,
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID)
);

-- Courses table
CREATE TABLE Courses (
    courseID INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(100) NOT NULL,
    description TEXT,
    credits INT CHECK (credits > 0),
    departmentID INT,
    teacherID INT,
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID),
    FOREIGN KEY (teacherID) REFERENCES Teachers(teacherID)
);

-- Enrollments table (junction table)
CREATE TABLE Enrollments (
    enrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    studentID INT,
    courseID INT,
    semester VARCHAR(20) NOT NULL,
    year YEAR NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Students(studentID),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
);

-- Grades table
CREATE TABLE Grades (
    gradeID INT AUTO_INCREMENT PRIMARY KEY,
    enrollmentID INT,
    grade CHAR(2),
    examScore DECIMAL(5,2),
    assignmentScore DECIMAL(5,2),
    FOREIGN KEY (enrollmentID) REFERENCES Enrollments(enrollmentID)
);

-- Classes table
CREATE TABLE Classes (
    classID INT AUTO_INCREMENT PRIMARY KEY,
    courseID INT,
    sectionName VARCHAR(10),
    schedule VARCHAR(50),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
);

-- Attendance table
CREATE TABLE Attendance (
    attendanceID INT AUTO_INCREMENT PRIMARY KEY,
    classID INT,
    studentID INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent') NOT NULL,
    FOREIGN KEY (classID) REFERENCES Classes(classID),
    FOREIGN KEY (studentID) REFERENCES Students(studentID)
);