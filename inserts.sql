-- Insert sample data for Department
INSERT INTO Department (Dep_ID, Dep_Name) VALUES
('D000000001', 'Human Resources'),
('D000000002', 'Slot Floor'),
('D000000003', 'Janitorial'),
('D000000004', 'Card Table'),
('D000000005', 'Security');

-- Insert sample data for EmployeeRole
INSERT INTO EmployeeRole (Role_ID, Role_Title, Role_Tasks) VALUES
('R000000001', 'Director of Operations', 'Manage a diverse, multi-disciplined team of professionals'),
('R000000002', 'Shift Manager', 'Responsible for daily management of casino floor'),
('R000000003', 'Floor Supervisor', 'Manage and schedule slot attendants'),
('R000000004', 'Slot Attendant', 'Attend to customers in their sections'),
('R000000005', 'Human Resources', 'Manage records of employees');

-- Insert sample data for Employee
INSERT INTO Employee (
    Emp_Num, Emp_Role, Emp_First_Name, Emp_Last_Name, Emp_Hire_Date, 
    Emp_Pay_Rate, Emp_DOB, Emp_Address, Emp_Phone_Number, Emp_Email, 
    Emp_Gender, Emp_Fire_Date, Emp_Locker_Number, Emp_Vacation_Days, Emp_Sick_Days
) VALUES
--Director of Operations
('E000000001', 'R000000001', 'John', 'Doe', '2021-01-01', 3000, '1985-01-15', '123 Main St', '5550000001', 'johndoe@email.com', 'M', NULL, 'A001', 10, 5),
--Shift Managers
('E000000002', 'R000000002', 'Jane', 'Smith', '2021-02-15', 2000, '1990-02-28', '234 Elm St', '5550000002', 'janesmith@email.com', 'F', NULL, 'A002', 10, 5),
('E000000003', 'R000000002', 'James', 'Johnson', '2021-03-01', 1800, '1988-07-30', '345 Oak St', '5550000003', 'jamesjohnson@email.com', 'M', NULL, 'A003', 10, 5),
--Floor Supervisors
('E000000004', 'R000000003', 'Emily', 'Williams', '2021-04-01', 1700, '1995-04-15', '456 Pine St', '5550000004', 'emilywilliams@email.com', 'F', NULL, 'A004', 10, 5),
('E000000005', 'R000000003', 'Michael', 'Brown', '2021-05-01', 2800, '1980-09-10', '789 Maple St', '5550000005', 'michaelbrown@email.com', 'M', NULL, 'A005', 10, 5),
--Slot attendants
('E000000006', 'R000000004', 'Jessica', 'Davis', '2021-06-15', 1900, '1992-12-05', '890 Walnut St', '5550000006', 'jessicadavis@email.com', 'F', NULL, 'A006', 10, 5),
('E000000007', 'R000000004', 'Christopher', 'Miller', '2021-07-01', 1800, '1987-03-25', '901 Birch St', '5550000007', 'chrismiller@email.com', 'M', NULL, 'B009', 10, 10),
('E000000008', 'R000000004', 'Amanda', 'Johnson', '2021-08-01', 1900, '1993-06-20', '1001 Cedar St', '5550000008', 'amandajohnson@email.com', 'F', NULL, 'A008', 10, 5),
('E000000009', 'R000000004', 'Nathan', 'Smith', '2021-09-01', 1800, '1994-11-10', '1201 Willow St', '5550000009', 'nathansmith@email.com', 'M', NULL, 'A009', 10, 5),
('E000000010', 'R000000004', 'Bob', 'Sagot', '2017-09-01', 3000, '1991-04-06', '1291 Cool St', '1234567890', 'brianh@email.com', 'F', NULL, 'A129', 20, 25);


-- Insert sample data for Section
INSERT INTO Section (Section_ID, Section_Location, Section_Name) VALUES
('SEC0000001', 'NORTH', 'North slots'),
('SEC0000002', 'SOUTH', 'South slots'),
('SEC0000003', 'EAST', 'East Slots'),
('SEC0000004', 'WEST', 'West Slots');

-- Insert sample data for Skill
INSERT INTO Skill (Skill_ID, Skill_Type, Skill_Name, Skill_Description) VALUES
('SK00000001', 'Technical', 'Slot Machine Repair', 'Ability to repair and maintain slot machines'),
('SK00000002', 'Soft Skill', 'Customer Service', 'Ability to provide excellent customer service'),
('SK00000003', 'Technical', 'Card Dealing', 'Ability to deal cards professionally in various games'),
('SK00000004', 'Technical', 'Security Systems', 'Knowledge of security systems and protocols');

-- Insert sample data for Section_Skill
INSERT INTO Section_Skill (Section_ID, Skill_ID, Reason) VALUES
('SEC0000001', 'SK00000001', 'Slot machine maintenance and repair'),
('SEC0000002', 'SK00000002', 'Customer service and guest interaction'),
('SEC0000003', 'SK00000003', 'Card dealing and game management'),
('SEC0000004', 'SK00000004', 'Security and surveillance');

-- Insert sample data for Certificate
INSERT INTO Certificate (Cert_ID, Cert_Name, Cert_Type) VALUES
('CER0000001', 'Slot Technician Certification', 'Technical'),
('CER0000002', 'Card Dealer Certification', 'Technical'),
('CER0000003', 'Casino Security Certification', 'Technical');

-- Insert sample data for Schedule
INSERT INTO Schedule (Sch_ID, Created_By, Sch_Start_Date, Sch_End_Date) VALUES
('SCH0000001', 'E000000004', '2023-04-03', '2023-04-07'),
('SCH0000002', 'E000000004', '2023-04-10', '2023-04-14'),
('SCH0000003', 'E000000005', '2023-04-17', '2023-04-21'),
('SCH0000004', 'E000000005', '2023-04-24', '2023-04-28'),
('SCH0000005', 'E000000005', '2023-03-26', '2023-04-01'),
('SCH0000006', 'E000000005', '2023-02-12', '2023-02-18');

INSERT INTO Shift (
Shift_ID, Shift_Assigned_To, Shift_Covered_By, Sch_ID, Section_ID,
Shift_Is_Breaker, Shift_Start_Time, Shift_End_Time
) VALUES
('SH00000001', 'E000000006', NULL,         'SCH0000004', 'SEC0000001', 0, '2023-04-27 08:00:00', '2023-04-27 16:00:00'),
('SH00000002', 'E000000006', 'E000000007', 'SCH0000004', 'SEC0000001', 1, '2023-04-27 09:00:00', '2023-04-27 09:15:00'),
('SH00000003', 'E000000007', NULL,         'SCH0000001', 'SEC0000002', 0, '2023-04-03 08:00:00', '2023-04-03 16:00:00'),
('SH00000004', 'E000000008', NULL,         'SCH0000001', 'SEC0000002', 0, '2023-04-03 08:00:00', '2023-04-03 16:00:00'),
('SH00000005', 'E000000006', 'E000000007', 'SCH0000001', 'SEC0000002', 1, '2023-04-03 10:30:00', '2023-04-03 10:45:00'),
('SH00000006', 'E000000006', 'E000000007', 'SCH0000001', 'SEC0000002', 1, '2023-04-04 09:00:00', '2023-04-04 09:15:00'),
('SH00000007', 'E000000007', 'E000000006', 'SCH0000001', 'SEC0000002', 1, '2023-04-05 11:00:00', '2023-04-05 11:15:00'),
('SH00000008', 'E000000007', 'E000000006', 'SCH0000001', 'SEC0000002', 1, '2023-04-06 15:00:00', '2023-04-06 15:15:00'),
('SH00000009', 'E000000006', NULL,         'SCH0000006', 'SEC0000002', 0, '2023-02-15 08:00:00', '2023-02-15 16:00:00'),
('SH00000010', 'E000000007', NULL,         'SCH0000005', 'SEC0000002', 0, '2023-03-28 08:00:00', '2023-03-28 16:00:00'),
('SH00000011', 'E000000009', NULL,         'SCH0000005', 'SEC0000002', 0, '2023-03-27 08:00:00', '2023-03-27 16:00:00'),
('SH00000012', 'E000000008', NULL,         'SCH0000005', 'SEC0000002', 0, '2023-03-26 08:00:00', '2023-03-26 16:00:00'),
('SH00000013', 'E000000008', NULL, 'SCH0000001', 'SEC0000002', 0, CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE)),
('SH00000014', 'E000000007', NULL, 'SCH0000001', 'SEC0000002', 0, CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE)),
('SH00000015', 'E000000008', NULL, 'SCH0000001', 'SEC0000002', 0, CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE)),
('SH00000016', 'E000000009', NULL, 'SCH0000001', 'SEC0000002', 0, CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE));
-- Last 4 shifts are for testing purposes, they may not have a valid date/time.


-- Insert sample data for written warning
INSERT INTO Written_Warning (WW_ID, WW_Recipient, WW_Issuer, WW_Details, WW_Date_Issued, WW_Is_Active) VALUES
('WW00000001', 'E000000006', 'E000000002', 'Late for shift', '2023-03-01', 'Yes'),
('WW00000002', 'E000000006', 'E000000002', 'Not following procedures', '2023-03-10', 'Yes'),
('WW00000003', 'E000000007', 'E000000003', 'Unprofessional behavior', '2023-03-15', 'No'),
('WW00000004', 'E000000008', 'E000000002', 'Improper dress code', '2023-03-20', 'Yes'),
('WW00000005', 'E000000009', 'E000000004', 'Negligence on the job', '2023-03-25', 'Yes'),
('WW00000006', 'E000000008', 'E000000003', 'Insubordination', '2023-03-30', 'No'),
('WW00000007', 'E000000009', 'E000000002', 'Failure to complete tasks', '2023-04-05', 'Yes'),
('WW00000008', 'E000000006', 'E000000004', 'Excessive absenteeism', '2023-04-10', 'Yes');


--In house training
INSERT INTO InHouse_Training (
IH_ID, IH_Training_Attendee, IH_Training_Instructor, Skill_ID, IH_Training_Description,
IH_Training_Date, IH_Training_Status, IH_Training_Valid_Duration
) VALUES
('IHT0000004', 'E000000006', 'E000000001', 'SK00000001', 'Basic slot machine repair', '2023-03-10', 'YES', 365),
('IHT0000005', 'E000000007', 'E000000002', 'SK00000003', 'Card dealing for poker', '2023-02-20', 'YES', 365),
('IHT0000006', 'E000000005', 'E000000003', 'SK00000004', 'Security system basics', '2023-01-15', 'YES', 365),
('IHT0000007', 'E000000005', 'E000000003', 'SK00000004', 'Security system basics', '2023-01-15', 'NO', NULL),
('IHT0000008', 'E000000007', 'E000000003', 'SK00000004', 'Basic slot machine repair', '2023-01-15', 'YES', 30);

--Regulatory training
INSERT INTO Regulatory_Training (
R_ID, R_Training_Attendee, Cert_ID, R_Training_Description, R_Training_Date,
R_Training_Status, R_Training_Valid_Duration
) VALUES
('RT0000004', 'E000000006', 'CER0000001', 'Slot technician certification course', '2023-01-01', 'YES', 730),
('RT0000005', 'E000000007', 'CER0000002', 'Card dealer certification course', '2023-01-10', 'YES', 730),
('RT0000006', 'E000000005', 'CER0000003', 'Casino security certification course', '2023-01-20', 'YES', 730),
('RT0000007', 'E000000005', 'CER0000003', 'Casino security certification course', '2023-01-20', 'NO', NULL);

-- Insert sample data for Uniform
INSERT INTO Uniform (Uniform_ID, Uniform_Size, Uniform_Color, Uniform_Count) VALUES
('U00000001', 'S', 'Red', 5),
('U00000002', 'M', 'Red', 5),
('U00000003', 'L', 'Red', 5),
('U00000004', 'XL', 'Red', 5),
('U00000005', 'S', 'Red', 5),
('U00000006', 'M', 'Red', 5),
('U00000007', 'L', 'Red', 5),
('U00000008', 'XL', 'Red', 5);

-- Insert sample data for Uniform_Issue
INSERT INTO Uniform_Issue (Uniform_ID, Uniform_Issued_For, Uniform_Issued_By, Uniform_Issue_Date) VALUES
('U00000006', 'E000000001', 'E000000001', '2023-04-01'),
('U00000005', 'E000000002', 'E000000001', '2023-04-01'),
('U00000006', 'E000000003', 'E000000001', '2023-04-01'),
('U00000007', 'E000000004', 'E000000001', '2023-04-01'),
('U00000008', 'E000000005', 'E000000001', '2023-04-01'),
('U00000001', 'E000000006', 'E000000001', '2023-04-01'),
('U00000002', 'E000000007', 'E000000001', '2023-04-01'),
('U00000003', 'E000000008', 'E000000001', '2023-04-01'),
('U00000003', 'E000000009', 'E000000001', '2023-04-01'),
('U00000004', 'E0000000010', 'E000000001', '2023-04-01');
