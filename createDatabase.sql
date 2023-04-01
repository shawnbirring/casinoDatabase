USE master 
GO 

--Use if we want to drop database and create a new one--

/* IF EXISTS (
   SELECT name 
       FROM sys.databases
       WHERE name = "Casino_DB"
)
DROP DATABASE Casino_DB
GO */

CREATE DATABASE Casino_DB
GO 

USE Casino_DB

CREATE TABLE Employee (
    Emp_Num CHAR(10) PRIMARY KEY NOT NULL,
    FOREIGN KEY (Emp_Role) REFERENCES EmployeeRole(Role_ID)
    Emp_First_Name VARCHAR(20) NOT NULL,
    Emp_Last_Name VARCHAR(20) NOT NULL,
    Emp_Hire_Date DATE NOT NULL,
    Emp_Pay_Rate INT NOT NULL,
    Emp_DOB DATE NOT NULL,
    Emp_Address VARCHAR(50) NOT NULL,
    Emp_Phone_Number CHAR(10) UNIQUE NOT NULL,
    Emp_Email VARCHAR(25) UNIQUE NOT NULL,
    Emp_Gender CHAR(1) NOT NULL,
    Emp_Fire_Date DATE,
    Emp_Locker_Number VARCHAR(5) UNIQUE,
    Emp_Vacation_Days INT,
    Emp_Sick_Days INT
);

CREATE TABLE EmployeeRole (
    Role_ID CHAR(10) PRIMARY KEY NOT NULL,
    Role_Title VARCHAR(20) NOT NULL,
    Role_Tasks VARCHAR(100) NOT NULL
);

CREATE TABLE Leave (
    Leave_ID CHAR(10) PRIMARY KEY NOT NULL,
    FOREIGN Key (Emp_Num) REFERENCES Employee(Emp_Num) PRIMARY KEY NOT NULL,
    Leave_Start DATE NOT NULL,
    Leave_End DATE NOT NULL,
    Leave_Info VARCHAR(50)
);

CREATE TABLE Written_Warning (
    WW_ID PRIMARY KEY NOT NULL,
    FOREIGN Key (WW_Recipient) REFERENCES Employee(Emp_Num) NOT NULL,
    FOREIGN Key (WW_Issuer) REFERENCES Employee(Emp_Num) NOT NULL,
    WW_Details VARCHAR(50),
    WW_Date_Issued DATE NOT NULL,
    WW_Is_Active VARCHAR(3) NOT NULL
);

CREATE TABLE Uniform (
    Uniform_ID CHAR(10) PRIMARY KEY NOT NULL,
    Uniform_Size VARCHAR(10) NOT NULL,
    Uniform_Color VARCHAR(10) NOT NULL,
    Uniform_Count INT NOT NULL
);

CREATE TABLE Uniform_Issue (
    FOREIGN Key (Uniform_ID) REFERENCES Uniform(Uniform_ID) PRIMARY KEY NOT NULL,
    FOREIGN Key (Uniform_Issued_For) REFERENCES Employee(Emp_Num) PRIMARY KEY NOT NULL,
    FOREIGN Key (Uniform_Issued_By) REFERENCES Employee(Emp_Num) PRIMARY KEY NOT NULL,
    Uniform_Issue_Date DATE NOT NULL
);

CREATE TABLE Department (
    Dep_ID CHAR(10) PRIMARY KEY NOT NULL,
    Dep_Name VARCHAR(20) NOT NULL,
);

CREATE TABLE Department_History (
    FOREIGN Key (Dep_ID) REFERENCES Department(Dep_ID) PRIMARY KEY NOT NULL,
    FOREIGN Key (Emp_Num) REFERENCES Employee(Emp_Num) PRIMARY KEY NOT NULL,
    FOREIGN Key (Role_ID) REFERENCES Employee(Role_ID) PRIMARY KEY NOT NULL,
    Dep_Start_Date DATE NOT NULL,
    Dep_End_Date DATE
);

CREATE TABLE Shift (
    Shift_ID CHAR(10) PRIMARY KEY NOT NULL,
    FOREIGN Key (Shift_Assigned_To) REFERENCES Employee(Emp_Num) NOT NULL,
    FOREIGN Key (Shift_Covered_By) REFERENCES Employee(Emp_Num) NOT NULL,
    FOREIGN Key (Sch_ID) REFERENCES Schedule(Sch_ID) NOT NULL,
    FOREIGN Key (Section_ID) REFERENCES Section(Section_ID) NOT NULL,
    Shift_Is_Breaker BIT NOT NULL,
    Shift_Start_Time DATETIME NOT NULL,
    Shift_End_Time DATETIME NOT NULL,
);

CREATE TABLE Schedule (
    Sch_ID CHAR(10) PRIMARY KEY NOT NULL,
    FOREIGN Key (Created_By) REFERENCES Employee(Emp_Num) NOT NULL,
    Sch_Start_Date DATE NOT NULL,
    Sch_End_Date DATE NOT NULL,
);

CREATE TABLE Section (
    Section_ID CHAR(10) PRIMARY KEY NOT NULL,
    Section_Location VARCHAR(20) NOT NULL,
    Section_Name VARCHAR(20) NOT NULL
);

CREATE TABLE Shift_Inventory (
    FOREIGN Key (Shift_ID) REFERENCES Shift(Shift_ID) PRIMARY KEY NOT NULL,
    FOREIGN Key (Inventory_ID) REFERENCES Inventory(Inventory_ID) PRIMARY KEY NOT NULL,
    Uniform_Issue_Date DATE NOT NULL
);

CREATE TABLE Inventory (
    Inventory_ID CHAR(10) PRIMARY KEY NOT NULL,
    Item_Name VARCHAR(20) NOT NULL,
    Item_Price INT,
    Item_Quantity INT NOT NULL,
    Item_Description VARCHAR(50)
);

CREATE TABLE Section_Skill (
    FOREIGN Key (Section_ID) REFERENCES Section(Section_ID) PRIMARY KEY NOT NULL,
    FOREIGN Key (Skill_ID) REFERENCES Skill(Skill_ID) PRIMARY KEY NOT NULL,
    Reason VARCHAR(35)
);

CREATE TABLE Skill (
    Skill_ID CHAR(10) PRIMARY KEY NOT NULL,
    Skill_Type VARCHAR(20),
    Skill_Name VARCHAR(20) NOT NULL,
    Skill_Description VARCHAR(50)
);

CREATE TABLE Certificate (
    Cert_ID CHAR(10) PRIMARY KEY NOT NULL,
    Cert_Name VARCHAR(20) NOT NULL,
    Cert_Type VARCHAR(20)
);

CREATE TABLE InHouse_Training (
    FOREIGN Key (IH_Training_Attendee) REFERENCES Employee(Emp_Num) PRIMARY KEY NOT NULL,
    FOREIGN Key (IH_Training_Instructor) REFERENCES Employee(Emp_Num) PRIMARY KEY NOT NULL,
    FOREIGN Key (Skill_ID) REFERENCES Skill(Skill_ID) PRIMARY KEY NOT NULL,
    IH_Training_Description VARCHAR(50),
    IH_Training_Date DATE NOT NULL,
    IH_Training_Status VARCHAR(3) NOT NULL,
    IH_Training_Valid_Duration INT NOT NULL
);

CREATE TABLE Regulatory_Training (
    FOREIGN Key (IH_Training_Attendee) REFERENCES Employee(Emp_Num) PRIMARY KEY NOT NULL,
    FOREIGN Key (Cert_ID) REFERENCES Certificate(Cert_ID) PRIMARY KEY NOT NULL,
    R_Training_Description VARCHAR(50),
    R_Training_Date DATE NOT NULL,
    R_Training_Status VARCHAR(3) NOT NULL,
    R_Training_Valid_Duration INT NOT NULL
);