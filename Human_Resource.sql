create database Human_Resource;

Use Human_Resource;


Create Table Department (
	Department_Id INT PRIMARY KEY IDENTITY(1,1),
	Department_Name Varchar(50) Not Null ,
	Description varchar(max) Not Null,
	CONSTRAINT UQ_Department_Department_Name Unique (Department_Name)
)

Create Table Role (
	Role_Id INT PRIMARY KEY IDENTITY(1,1),
	Role_Name VARCHAR(50) Not Null,
	Role_Description varchar(max) NOT NULL,
	CONSTRAINT UQ_Role_Role_Name Unique (Role_Name)
)


Create Table Permissions (
	Permissions_Id INT PRIMARY KEY IDENTITY(1,1),
	Permission_Name VARCHAR(50) Not Null, -- user or admin
	Permission_Description varchar(max) Not Null,
	CONSTRAINT UQ_Permissions_Permission_Name Unique (Permission_Name)
)


Create Table Team_Roles (
  Team_Role_Id INT PRIMARY KEY IDENTITY(1,1),
  Role_Name varchar(50) Not Null,   -- eg ( Team Lead , Team Member etc)
  Role_Description varchar(max) Not Null,
  CONSTRAINT UQ_Team_Roles_Role_Name Unique (Role_Name)
)  


Create Table Status (
	Status_Id INT PRIMARY KEY IDENTITY(1,1),
	Status_Name VARCHAR(50) Not Null,
	CONSTRAINT UQ_Status_Status_Name Unique (Status_Name)
)

Create Table Teams (
  Team_Id INT PRIMARY KEY IDENTITY(1,1),
  Team_Name varchar(50) Not Null,  
  Description varchar(max) Not Null,
  Department_Id INT Not Null,
  team_lead_employee_id INT Not Null,
  Team_Role_Id INT NOT Null,
  CONSTRAINT  FK_Teams_Department_Id FOREIGN KEY ( Department_Id ) REFERENCES  Department  ( Department_Id ) On Delete Cascade, 
  CONSTRAINT  FK_Teams_Team_Role_Id FOREIGN KEY ( Team_Role_Id ) REFERENCES  Team_Roles  ( Team_Role_Id ) On Delete Cascade, 
  CONSTRAINT UQ_Teams_Team_Name Unique (Team_Name)
)


Create Table Employee(
	Employee_Id INT PRIMARY KEY IDENTITY(1,1),
	First_Name VARCHAR(50) Not Null,
	Last_Name VARCHAR(50) Not Null,
	Email VARCHAR(50) UNIQUE Not Null,
	Phone VARCHAR(10) UNIQUE Not Null,
	Date_Joined DATE Not Null,
	Status_Id INT Not Null,
	Department_Id INT Not Null,
	Role_Id INT Not Null,
	Permissions_Id INT Not Null,
	Team_Id INT Null
	CONSTRAINT  FK_Employee_Status_Id  FOREIGN KEY ( Status_Id ) REFERENCES  Status  ( Status_Id ) ON DELETE NO Action,
	CONSTRAINT  FK_Employee_Department_Id  FOREIGN KEY ( Department_Id ) REFERENCES  Department  ( Department_Id ) ON DELETE NO Action,
	CONSTRAINT  FK_Employee_Role_Id FOREIGN KEY ( Role_Id ) REFERENCES  Role  ( Role_Id ) ON DELETE NO Action,
	CONSTRAINT  FK_Employee_Permission_Id  FOREIGN KEY ( Permissions_Id ) REFERENCES  Permissions  ( Permissions_Id ) ON DELETE NO Action,
	constraint FK_Employee_Team_Id FOREIGN KEY ( Team_Id ) REFERENCES  Teams  ( Team_Id ) ON DELETE NO Action,
	CONSTRAINT UQ_Employee_Name Unique (First_Name, Last_Name, Email )

)

select * from Employee
-- first run employee table 
alter table teams 
add CONSTRAINT  FK_Teams_team_lead_employee_id FOREIGN KEY ( team_lead_employee_id ) REFERENCES  Employee  ( Employee_Id ) ON DELETE NO Action;


Create Table Attendance(
	Attendance_Id INT PRIMARY KEY IDENTITY(1,1),
	Employee_Id INT Not Null,
	Date DATE Not Null DEFAULT CURRENT_TIMESTAMP,
	Check_In_Time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Check_Out_Time TIME NULL,
	Status_Id INT Not Null,	
	CONSTRAINT  FK_Attendance_Status_Id  FOREIGN KEY ( Status_Id ) REFERENCES  Status  ( Status_Id ) ON DELETE NO ACTION,
	CONSTRAINT  FK_Attendance_Employee_Id  FOREIGN KEY ( Employee_Id ) REFERENCES  Employee  ( Employee_Id ) On Delete Cascade,
)



Create Table Leave (
	Leave_Id INT PRIMARY KEY IDENTITY(1,1),
	Employee_Id INT Not Null,
	Leave_Type VARCHAR(50) Not Null,
	Start_Date DATE Not Null,
	End_Date DATE Not Null,
	Reason varchar(max) Not Null,
	Status_Id INT Not Null,	
	CONSTRAINT  FK_Leave_Status_Id  FOREIGN KEY ( Status_Id ) REFERENCES  Status  ( Status_Id ) ON DELETE NO ACTION,
	CONSTRAINT  FK_Leave_Employee_Id  FOREIGN KEY ( Employee_Id ) REFERENCES  Employee  ( Employee_Id ) On Delete Cascade,
 )




 Create Table Salary (
	Salary_Id INT PRIMARY KEY IDENTITY(1,1),
	Employee_Id INT Not Null,
	Base_Salary DECIMAL Not Null,
	Deductions DECIMAL Not Null,
	Total_Salary DECIMAL Not Null,
	Pay_Date DATE Not Null, 
	CONSTRAINT  FK_Salary_Employee_Id  FOREIGN KEY ( Employee_Id ) REFERENCES  Employee  ( Employee_Id ) On Delete Cascade,
 )

-- Only For  the Lead Engineeer can Review 
 Create Table Review (
	Review_Id INT PRIMARY KEY IDENTITY(1,1),
	Team_Id INT Not Null,
	Employee_Id INT Not Null,
	Reviewed_By INT Not Null,
	Review_Date Date Not Null,
	Comments varchar(max) Not Null,
	Performance_Rating Decimal Not Null, -- need to provide somme validation for which it cant go more then 10.00
	CONSTRAINT  FK_Review_Employee_Id  FOREIGN KEY ( Employee_Id ) REFERENCES  Employee  ( Employee_Id ) On Delete Cascade,
	CONSTRAINT  FK_Review_Reviewed_By FOREIGN KEY ( Reviewed_By ) REFERENCES  Employee  ( Employee_Id ) On Delete No Action,
	CONSTRAINT  FK_Review_Team_Id FOREIGN KEY ( Team_Id ) REFERENCES  Teams  ( Team_Id ) On Delete No Action
 )

 Create Table Bonus (
	Bonus_Id INT PRIMARY KEY IDENTITY(1,1),
	Employee_Id INT Not Null,
	Bonus_Amount DECIMAL,
	Reason varchar(max) Not Null, 
	Date_Awarded DATE Not Null ,
	CONSTRAINT  FK_Bonus_Employee_Id FOREIGN KEY ( Employee_Id ) REFERENCES  Employee  ( Employee_Id ) On Delete Cascade,
 )




 Create table Promotion (
	promotion_id INT PRIMARY KEY IDENTITY(1,1),
	Employee_Id INT Not Null,
	Old_Role_Id INT Not Null,
	New_Role_Id INT Not Null,
	Promotion_Date DATE Not Null,
	Reason varchar(max) Not Null,
	CONSTRAINT  FK_Promotion_Employee_Id FOREIGN KEY ( Employee_Id ) REFERENCES  Employee  ( Employee_Id ) On Delete Cascade,
 )

 
Create Table Signup (
  Signup_Id INT PRIMARY KEY IDENTITY(1,1),
  Username VARCHAR(50) Unique Not Null,
  Password VARCHAR(50) Not Null, 
  phone VARCHAR(10) Not Null,
  Status_Id INT Not Null,                      -- ENUM("Approved", "Rejected", "Pending") [default: "Pending"]
  Role_Id INT Not Null,  -- Default role assigned during signup
  Signup_Date DATE Not Null,
  Employee_Id INT Not Null, -- Links to an Employee record
  CONSTRAINT  FK_Signup_Employee_Id FOREIGN KEY ( Employee_Id ) REFERENCES  Employee  ( Employee_Id ) On Delete Cascade,
  CONSTRAINT  FK_Signup_role_Id FOREIGN KEY ( role_Id ) REFERENCES  Role  ( role_Id ) On Delete No Action,
  CONSTRAINT  FK_Signup_Status_Id FOREIGN KEY ( Status_Id ) REFERENCES  Status  ( Status_Id ) On Delete No Action,
)


Create Table Users (
  User_Id INT PRIMARY KEY IDENTITY(1,1),
  Employee_Id INT Not Null,
  Signup_Id INT Not Null,
  Role_Id INT Not Null,
  Permissions_Id INT Not Null,
  CONSTRAINT  FK_Users_Employee_Id FOREIGN KEY ( Employee_Id ) REFERENCES  Employee  ( Employee_Id ) On Delete Cascade,
  CONSTRAINT  FK_Users_Signup_Id FOREIGN KEY ( Signup_Id ) REFERENCES  Signup  ( Signup_Id ) On Delete No Action,
  CONSTRAINT  FK_Users_Role_Id FOREIGN KEY ( Role_Id ) REFERENCES  Role  ( Role_Id ) On Delete No Action,
  CONSTRAINT  FK_Users_Permissions_Id FOREIGN KEY ( Permissions_Id ) REFERENCES  Permissions  ( Permissions_Id ) On Delete No Action,

)

Create Table Login (
  Login_Id INT PRIMARY KEY IDENTITY(1,1),
  User_Id INT Not Null,
  Signup_Id INT Not Null,
  Permissions_Id INT Not Null,
  Login_Time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Logout_Time DATETIME Not Null, 
  CONSTRAINT  FK_Login_Signup_Id FOREIGN KEY ( Signup_Id ) REFERENCES  Signup  ( Signup_Id ) On Delete Cascade,
  CONSTRAINT  FK_Login_User_Id FOREIGN KEY ( User_Id ) REFERENCES  Users  ( User_Id )  On Delete No Action,
  CONSTRAINT  FK_Login_Permissions_Id FOREIGN KEY ( Permissions_Id ) REFERENCES  Permissions  ( Permissions_Id ) On Delete No Action,
)




