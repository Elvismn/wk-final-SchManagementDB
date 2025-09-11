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

-- Payments table
CREATE TABLE Payments (
    paymentID INT AUTO_INCREMENT PRIMARY KEY,
    studentID INT,
    amount DECIMAL(10,2) NOT NULL,
    paymentDate DATE NOT NULL,
    method ENUM('Cash', 'Card', 'Mpesa', 'Bank') NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Students(studentID)
);

-- LibraryBooks table
CREATE TABLE LibraryBooks (
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    isbn VARCHAR(20) UNIQUE,
    category VARCHAR(50),
    availableCopies INT DEFAULT 0
);

-- Borrowing table
CREATE TABLE Borrowing (
    borrowID INT AUTO_INCREMENT PRIMARY KEY,
    studentID INT,
    bookID INT,
    borrowDate DATE NOT NULL,
    returnDate DATE,
    FOREIGN KEY (studentID) REFERENCES Students(studentID),
    FOREIGN KEY (bookID) REFERENCES LibraryBooks(bookID)
);

-- Indexes for performance
CREATE INDEX idx_student_department ON Students(departmentID);
CREATE INDEX idx_teacher_department ON Teachers(departmentID);
CREATE INDEX idx_course_department ON Courses(departmentID);
CREATE INDEX idx_course_teacher ON Courses(teacherID);
CREATE INDEX idx_enrollment_student ON Enrollments(studentID);
CREATE INDEX idx_enrollment_course ON Enrollments(courseID);
CREATE INDEX idx_grades_enrollment ON Grades(enrollmentID);
CREATE INDEX idx_classes_course ON Classes(courseID);
CREATE INDEX idx_attendance_student ON Attendance(studentID);
CREATE INDEX idx_attendance_class ON Attendance(classID);
CREATE INDEX idx_payments_student ON Payments(studentID);
CREATE INDEX idx_borrowing_student ON Borrowing(studentID);
CREATE INDEX idx_borrowing_book ON Borrowing(bookID);
