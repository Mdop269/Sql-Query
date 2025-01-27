CREATE DATABASE  Institute ;
USE  Institute ;

CREATE TABLE  Users  (
   Id  BIGINT NOT NULL IDENTITY(1,1),
   UserName  NVARCHAR(50),
   Email  NVARCHAR(50) NOT NULL,
   Password  NVARCHAR(50) NOT NULL,
   SaltKey  NVARCHAR(32) NOT NULL,
   LastLoggedIn  DATETIME,
   ChangedOn  DATETIME,
   ChangedBy  BIGINT,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
  PRIMARY KEY ( Id )
);

CREATE TABLE  InstituteDepartments  (
   Id  BIGINT NOT NULL IDENTITY(1,1),
   Name  NVARCHAR(50) NOT NULL,
   ChangedOn  DATETIME,
   ChangedBy  BIGINT,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
  PRIMARY KEY ( Id )
);

ALTER TABLE  institute . institutedepartments  
ADD COLUMN  IsActive  BOOLEAN NULL ;

CREATE TABLE  InstituteCourses  (
   Id  BIGINT NOT NULL IDENTITY(1,1),
   Name  NVARCHAR(50),
   InstituteDepartmentId  BIGINT NOT NULL,
   ChangedOn  DATETIME,
   ChangedBy  BIGINT,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  FK_InstituteCourses_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteCourses_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteCourses_InstituteDepartmentId  FOREIGN KEY ( InstituteDepartmentId ) REFERENCES  InstituteDepartments  ( Id )
);

CREATE TABLE  InstituteGroups  (
   Id  BIGINT NOT NULL IDENTITY(1,1),
   Name  NVARCHAR(50) NOT NULL,
   ChangedOn  DATETIME,
   ChangedBy  BIGINT,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  FK_InstituteGroups_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteGroups_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id )
);

CREATE TABLE  InstituteInfo  (
   Id  BIGINT NOT NULL IDENTITY(1,1),
   Name  NVARCHAR(50) NOT NULL,
   ChangedOn  DATETIME,
   ChangedBy  BIGINT,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  FK_InstituteInfo_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteInfo_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id )
);

CREATE TABLE  PersonalDetails  (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   UserId  BIGINT NOT NULL,
   FirstName  NVARCHAR(50) NOT NULL,
   LastName  NVARCHAR(50) NOT NULL,
   SurName  NVARCHAR(50),
   Dob  DATETIME NOT NULL,
   Email  NVARCHAR(50) NOT NULL UNIQUE,
   PhoneNumber  NVARCHAR(50),
   LastEduction  BIGINT NOT NULL,
   ChangedOn  DATETIME,
   ChangedBy  BIGINT,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsActive  BOOLEAN,
  CONSTRAINT  FK_PersonalDetails_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_PersonalDetails_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_PersonalDetails_User  FOREIGN KEY ( UserId ) REFERENCES  Users  ( Id ) ,
  CONSTRAINT  FK_PersonalDetails_InstituteCourses  FOREIGN KEY ( LastEduction ) REFERENCES  InstituteCourses  ( Id )
);

CREATE TABLE  HighSchoolCourses  (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   InstituteCoursesId  BIGINT NOT NULL,
   SubjectName  NVARCHAR(50) NOT NULL,
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsActive  BOOLEAN NULL,
  CONSTRAINT  FK_HighSchoolCourses_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_HighSchoolCourses_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_HighSchoolCourses_InstituteCoursesId  FOREIGN KEY ( InstituteCoursesId ) REFERENCES  InstituteCourses  ( Id )
);

CREATE TABLE  UserEducation  (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   LastCompletedCourseId  BIGINT NOT NULL,
   UserId  BIGINT NOT NULL,
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsActive  BOOLEAN NULL,
   CompletedSubjectId  BIGINT NOT NULL,
  CONSTRAINT  FK_UserEducation_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_UserEducation_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_UserEducation_LastCompletedCourseId  FOREIGN KEY ( LastCompletedCourseId ) REFERENCES  InstituteCourses  ( Id ),
  CONSTRAINT  FK_UserEducation_CompletedSubjectId  FOREIGN KEY ( CompletedSubjectId ) REFERENCES  HighSchoolCourses  ( Id )
);

CREATE TABLE  CoursesEligibility  (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   ApplyCoursesId  BIGINT NOT NULL,
   RequiredCoursesId  BIGINT NOT NULL,
   Flag  BIGINT NOT NULL,
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsActive  BOOLEAN NULL,
   RequiredSubjectId  BIGINT NOT NULL,
  CONSTRAINT  FK_CoursesEligibility_ApplyCoursesId  FOREIGN KEY ( ApplyCoursesId ) REFERENCES  InstituteCourses  ( Id ),
  CONSTRAINT  FK_CoursesEligibility_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_CoursesEligibility_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_CoursesEligibility_RequiredCoursesId  FOREIGN KEY ( RequiredCoursesId ) REFERENCES  InstituteCourses  ( Id ),
  CONSTRAINT  FK_CoursesEligibility_RequiredSubjectId  FOREIGN KEY ( RequiredSubjectId ) REFERENCES  HighSchoolCourses  ( Id )
);

CREATE TABLE  InstituteAcademicYears (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   StartYear  NVARCHAR(50),
   EndYear  NVARCHAR(50),
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsCurrent  BOOLEAN NULL,
  CONSTRAINT  FK_InstituteAcademicYears_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteAcademicYears_CreatedBy  FOREIGN KEY( CreatedBy ) REFERENCES  Users  ( Id )
);

CREATE TABLE  InstituteSemesters (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   Name  NVARCHAR(50) NOT NULL,
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsCurrent  BOOLEAN NULL,
  CONSTRAINT  FK_InstituteSemesters_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteSemesters_CreatedBy  FOREIGN KEY( CreatedBy ) REFERENCES  Users  ( Id )
);

CREATE TABLE  InstituteCoursesSemesters (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   InstituteCoursesId  BIGINT NOT NULL,
   InstituteSemestersId  BIGINT NOT NULL,
   InstituteAcademicYearsId  BIGINT NOT NULL,
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsCurrent  BOOLEAN NULL,
  CONSTRAINT  FK_InstituteCoursesSemesters_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteCoursesSemesters_CreatedBy  FOREIGN KEY( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteCoursesSemesters_InstituteAcademicYearsId  FOREIGN KEY( InstituteAcademicYearsId ) REFERENCES  InstituteAcademicYears  ( Id ),
  CONSTRAINT  FK_InstituteCoursesSemesters_InstituteCoursesId  FOREIGN KEY( InstituteCoursesId ) REFERENCES  InstituteCourses  ( Id ),
  CONSTRAINT  FK_InstituteCoursesSemesters_InstituteSemestersId  FOREIGN KEY( InstituteSemestersId ) REFERENCES  InstituteSemesters  ( Id )
);

CREATE TABLE  InstituteSubjects (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   Name  NVARCHAR(50) NOT NULL,
   InstituteSemestersId  BIGINT NOT NULL,
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsActive  BOOLEAN NULL,
  CONSTRAINT  FK_InstituteSubjects_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteSubjects_CreatedBy  FOREIGN KEY( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteSubjects_InstituteSemestersId  FOREIGN KEY( InstituteSemestersId ) REFERENCES  InstituteSemesters  ( Id )
);

CREATE TABLE  InstituteChapters (
   Id  BIGINT PRIMARY KEY IDENTITY(1,1),
   Name  NVARCHAR(50) NOT NULL,
   InstituteSubjectsId  BIGINT NOT NULL,
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsActive  BOOLEAN NULL,
  CONSTRAINT  FK_InstituteChapters_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteChapters_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteChapters_InstituteSubjectsId  FOREIGN KEY ( InstituteSubjectsId ) REFERENCES  InstituteSubjects  ( Id )
);

CREATE TABLE  InstituteStudents  (
   Id  BIGINT NOT NULL IDENTITY(1,1),
   Name  NVARCHAR(50) NOT NULL,
   InstituteCoursesId  BIGINT NOT NULL,
   UserId  BIGINT NOT NULL,
   ChangedOn  DATETIME NULL,
   ChangedBy  BIGINT NULL,
   CreatedOn  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CreatedBy  BIGINT NOT NULL,
   IsActive  BOOLEAN NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  FK_InstituteStudents_ChangedBy  FOREIGN KEY ( ChangedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteStudents_CreatedBy  FOREIGN KEY ( CreatedBy ) REFERENCES  Users  ( Id ),
  CONSTRAINT  FK_InstituteStudents_InstituteCoursesId  FOREIGN KEY ( InstituteCoursesId ) REFERENCES  InstituteCourses  ( Id ),
  CONSTRAINT  FK_InstituteStudents_UserId  FOREIGN KEY ( UserId ) REFERENCES  Users  ( Id )
);


-- CREATE TABLE   StudentDetailsByCoursesId (
-- 	 Name  NVARCHAR(50) NOT NULL,
--      NumberOfStudentInSemester  BIGINT NOT NULL
-- );

-- CREATE table  StudentDetailsByCoursesId  AS
-- SELECT 
--     ic.Name AS CourseName,
--     COUNT(inst_stu.Id) AS NumberOfStudents,
--     pd.FirstName,
--     pd.LastName,
--     pd.Email,
--     pd.PhoneNumber,
--     pd.Dob,
--     pd.SurName
-- FROM 
--     InstituteStudents inst_stu
-- JOIN 
--     PersonalDetails pd ON inst_stu.UserId = pd.UserId
-- JOIN 
--     InstituteCourses ic ON inst_stu.InstituteCoursesId = ic.Id
-- GROUP BY 
--     ic.Name, pd.FirstName, pd.LastName, pd.Email, pd.PhoneNumber, pd.Dob, pd.SurName;

-- drop table StudentDetailsByCoursesId;

CREATE view  StudentDetailsByCoursesId  AS
SELECT 
    ic.Name AS CourseName,
    student_counts.NumberOfStudents,
    pd.FirstName,
    pd.LastName,
    pd.Email,
    pd.PhoneNumber,
    pd.Dob,
    pd.SurName
FROM 
    InstituteStudents inst_stu
JOIN 
    PersonalDetails pd ON inst_stu.UserId = pd.UserId
JOIN 
    InstituteCourses ic ON inst_stu.InstituteCoursesId = ic.Id
JOIN 
    (SELECT InstituteCoursesId, COUNT(Id) AS NumberOfStudents
     FROM InstituteStudents
     GROUP BY InstituteCoursesId) student_counts
     ON inst_stu.InstituteCoursesId = student_counts.InstituteCoursesId;


SELECT * FROM  StudentDetailsByCoursesId ;

CREATE VIEW  StudentCountByAcademicYear  AS
SELECT
	iay.StartYear,
    iay.EndYear,
    count(inst_stu.Id) as NumberOfStudents
FROM 
	institutestudents inst_stu
JOIN 
	institutecoursessemesters ics ON inst_stu.InstituteCoursesId = ics.InstituteCoursesId
JOIN 
	instituteacademicyears iay ON ics.InstituteAcademicYearsId = iay.Id
GROUP BY 
	iay.StartYear,iay.EndYear;


SELECT * FROM studentcountbyacademicyear;


CREATE VIEW StudentDetailsByAcademicYear AS
SELECT 
	iay.StartYear,
    iay.EndYear,
    inst_stu.Name
FROM
	institutestudents inst_stu
JOIN 
	institutecoursessemesters ics ON inst_stu.InstituteCoursesId = ics.InstituteCoursesId
JOIN 
	instituteacademicyears iay ON ics.InstituteAcademicYearsId = iay.Id;
	

SELECT 
	scay.StartYear,
    scay.EndYear,
    scay.NumberOfStudents,
    sday.Name
FROM
	studentcountbyacademicyear scay
JOIN
	studentdetailsbyacademicyear sday ON scay.StartYear = sday.StartYear and scay.EndYear = sday.EndYear;