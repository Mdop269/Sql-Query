use Human_Resources

INSERT INTO Department (Department_Name, Description) VALUES
('Operations', 'Manages day-to-day business activities.'),
('Data Engineering', 'Builds and maintains data infrastructure.'),
('HR Department', 'Manages employee-related processes.'),
('Software Engineering', 'Develops and maintains software systems.'),
('DevOps', 'Combines software development and IT operations.'),
('Cybersecurity', 'Protects systems and data from threats.'),
('Cloud Engineering', 'Handles cloud-based solutions and infrastructure.'),
('Network Administration', 'Maintains and supports network systems.'),
('Quality Assurance', 'Ensures the quality of products and processes.'),
('Product Management', 'Oversees product planning and execution.');



INSERT INTO Role (Role_Name, Role_Description) VALUES
('Associate Engineer', 'Entry-level engineering role.'),
('Engineer', 'Standard engineering role.'),
('Senior Engineer', 'Experienced engineering role.'),
('Lead Engineer', 'Team lead for engineers.'),
('Director', 'Senior management role.'),
('Consultant', 'Advisory role on projects.'),
('HR', 'Human resources manager.'),
('Associate HR', 'Entry-level HR role.'),
('HR Specialist', 'Specialized HR role focused on recruitment and policy.'),
('Intern', 'Temporary role for trainees.'),
('Manager', 'Supervises teams and manages projects.'),
('Database Administrator', 'Manages and optimizes databases.');



INSERT INTO Permissions (Permission_Name, Permission_Description) VALUES
('Normal', 'Basic access rights.'),
('Admin', 'Full administrative privileges.'),
('Edit', 'Permission to modify content.'),
('View', 'Permission to view content.'),
('Create', 'Permission to create new records.'),
('Delete', 'Permission to delete existing records.'),
('Manage', 'Permission to manage system-level settings.'),
('Restricted', 'Limited access rights for specific tasks.');




INSERT INTO Team_Roles (Role_Name, Role_Description) VALUES
('Team Lead', 'Leads a team.'),
('Team Member', 'Member of a team.'),
('Project Manager', 'Manages project timelines and deliverables.'),
('Technical Consultant', 'Provides technical expertise to teams.'),
('Support Engineer', 'Handles support and troubleshooting tasks.');




INSERT INTO Status (Status_Name) VALUES
('Rejected'),
('Removed'),
('Approved'),
('Pending'),
('Available'),
('Busy'),
('Do Not Disturb'),
('Be Right Back'),
('Offline'),
('Not Available'),
('In Progress'),
('Escalated'),
('Under Review'),
('Completed'),
('Paused'),
('On Leave'),
('Training'),
('Out of Office');



INSERT INTO HR (Hr_First_Name, Hr_Last_Name, Hr_Email, Hr_Role_Id, CreatedBy, CreatedOn) VALUES
('John', 'Doe', 'john.doe@company.com', 7, 'Admin', GETDATE()),
('Jane', 'Smith', 'jane.smith@company.com', 8, 'Admin', GETDATE()),
('Michael', 'Brown', 'michael.brown@company.com', 7, 'Admin', GETDATE()),
('Emily', 'Davis', 'emily.davis@company.com', 8, 'Admin', GETDATE()),
('Sarah', 'Wilson', 'sarah.wilson@company.com', 7, 'Admin', GETDATE());



select * from Status

select * from Department

select * from Role

select * from Permissions

{
  "firstName": "Mohammed",
  "lastName": "Sunesara",
  "email": "mohammed.sunesara@godigitaltc.com",
  "phone": "9987520019",
  "statusId": 17,
  "departmentId": 4,
  "roleId": 10,
  "permissionsId": 1,
  "teamId": 1,
  "createdBy": 0,
  "changedBy": 0
}

{
  "firstName": "Mohammed",
  "lastName": "Sunesara",
  "email": "mohammed.sunesara@godigitaltc.com",
  "phone": "9987520019",
  "statusId": 17,
  "departmentId": 4,
  "roleId": 10,
  "permissionsId": 1,
  "teamId": 0,
  "createdBy": 1,
  "changedBy": 1
}

select * from Employee

select * from department;

select * from Team_Roles


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
	Team_Id INT Null,
	CreatedBy int,
	CreatedOn date not null DEFAULT GETDATE() ,


insert into Employee
(First_Name , Last_Name , Email , Phone , Date_Joined, Status_Id , Department_Id , Role_Id , Permissions_Id , CreatedBy)
values 
('Mohammed', 'Sunesara', 'mohammed.sunesara@godigitaltc.com', '9987520019', '05-01-2025' , 17 , 4 , 10, 1, 1)


{
  "teamName": "Eberls",
  "description": "Eberls is a dynamic and collaborative team dedicated to achieving excellence in their respective fields",
  "departmentId": 4,
  "teamLeadEmployeeId": 1,
  "teamRoleId": 1,
  "createdBy": 1,
  "changedBy": 1
}

select * from employee

select * from status

{
  "firstName": "Vansh",
  "lastName": "Tiwari",
  "email": "vansh.tiwari@godigitaltc.com",
  "phone": "9987520019",
  "statusId": 17,
  "departmentId": 4,
  "roleId": 10,
  "permissionsId": 1,
  "teamId": 1,
  "createdBy": 2,
  "changedBy": 1
}