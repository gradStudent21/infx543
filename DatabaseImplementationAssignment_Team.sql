
USE Master


IF  NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'PersonalHealthCareSystem')
    CREATE DATABASE [PersonalHealthCareSystem]
GO

USE [PersonalHealthCareSystem]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Drug]') AND type in (N'U'))
    DROP TABLE [dbo].[Drug]
GO
CREATE TABLE [dbo].[Drug] (
[DrugId] INTEGER  NOT NULL  
, [Drug_Name] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Drug] ADD CONSTRAINT [Drug_PK] PRIMARY KEY CLUSTERED (
[DrugId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Diagnose]') AND type in (N'U'))
    DROP TABLE [dbo].[Diagnose]
GO
CREATE TABLE [dbo].[Diagnose] (
[Diagnose_Category] VARCHAR(50)  NOT NULL  
, [DiagnoseId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Diagnose] ADD CONSTRAINT [Diagnose_PK] PRIMARY KEY CLUSTERED (
[DiagnoseId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
    DROP TABLE [dbo].[Location]
GO
CREATE TABLE [dbo].[Location] (
[Location_Name] VARCHAR(50)  NOT NULL  
, [LocationId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Location] ADD CONSTRAINT [Location_PK] PRIMARY KEY CLUSTERED (
[LocationId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Health_System]') AND type in (N'U'))
    DROP TABLE [dbo].[Health_System]
GO
CREATE TABLE [dbo].[Health_System] (
[Date_Time] DATETIME  NOT NULL  
, [DiagnoseId] INTEGER  NOT NULL  
, [UserId] INTEGER  NOT NULL  
, [DoctorId] INTEGER  NOT NULL  
, [ResearcherId] INTEGER  NOT NULL  
, [DrugId] INTEGER  NULL  
, [ZipCodeId] INTEGER  NOT NULL  
, [Drug_Dosage] INTEGER  NULL  
, [Drug_Frequency] VARCHAR(50)  NULL  
, [ExperimentId] INTEGER  NOT NULL  
, [TreatmentId] INTEGER  NOT NULL  
, [LocationId] INTEGER  NOT NULL  
, [Health_SystemId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Health_System] ADD CONSTRAINT [Health_System_PK] PRIMARY KEY CLUSTERED (
[Health_SystemId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Researcher]') AND type in (N'U'))
    DROP TABLE [dbo].[Researcher]
GO
CREATE TABLE [dbo].[Researcher] (
[Name] VARCHAR(50)  NOT NULL  
, [ResearcherId] INTEGER  NOT NULL  
, [SS#] INTEGER  NOT NULL  
, [Email] VARCHAR(50)  NOT NULL  
, [Phone] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Researcher] ADD CONSTRAINT [Researcher_PK] PRIMARY KEY CLUSTERED (
[ResearcherId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zip]') AND type in (N'U'))
    DROP TABLE [dbo].[Zip]
GO
CREATE TABLE [dbo].[Zip] (
[ZipCodeId] INTEGER  NOT NULL  
, [City_Name] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Zip] ADD CONSTRAINT [Zip_PK] PRIMARY KEY CLUSTERED (
[ZipCodeId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Family]') AND type in (N'U'))
    DROP TABLE [dbo].[Family]
GO
CREATE TABLE [dbo].[Family] (
[Family_Relation] VARCHAR(50)  NOT NULL  
, [FamilyId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Family] ADD CONSTRAINT [Family_PK] PRIMARY KEY CLUSTERED (
[FamilyId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
    DROP TABLE [dbo].[Doctor]
GO
CREATE TABLE [dbo].[Doctor] (
[UserId] INTEGER  NOT NULL  
, [DoctorId] INTEGER  NOT NULL  
, [InsuranceId] INTEGER  NULL  
, [SS#] INTEGER  NOT NULL  
, [Email] VARCHAR(50)  NOT NULL  
, [Phone] VARCHAR(50)  NOT NULL  
, [Name] VARCHAR(50) NOT NULL
, [LengthOfExperience] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Doctor] ADD CONSTRAINT [Doctor_PK] PRIMARY KEY CLUSTERED (
[DoctorId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Researcher_Specialization]') AND type in (N'U'))
    DROP TABLE [dbo].[Researcher_Specialization]
GO
CREATE TABLE [dbo].[Researcher_Specialization] (
[SpecializationId] INTEGER  NOT NULL  
, [ResearcherId] INTEGER  NOT NULL  
, [Researcher_SpecializationId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Researcher_Specialization] ADD CONSTRAINT [Researcher_Specialization_PK] PRIMARY KEY CLUSTERED (
[Researcher_SpecializationId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Readings]') AND type in (N'U'))
    DROP TABLE [dbo].[User_Readings]
GO
CREATE TABLE [dbo].[User_Readings] (
[ReadingId] INTEGER  NOT NULL  
, [UserId] INTEGER  NOT NULL  
, [User_ReadingId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[User_Readings] ADD CONSTRAINT [User_Readings_PK] PRIMARY KEY CLUSTERED (
[User_ReadingId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Specialization]') AND type in (N'U'))
    DROP TABLE [dbo].[Specialization]
GO
CREATE TABLE [dbo].[Specialization] (
[SpecializationId] INTEGER  NOT NULL  
, [Specialization_Name] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Specialization] ADD CONSTRAINT [Specialization_PK] PRIMARY KEY CLUSTERED (
[SpecializationId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Readings]') AND type in (N'U'))
    DROP TABLE [dbo].[Readings]
GO
CREATE TABLE [dbo].[Readings] (
[Reading_Name] VARCHAR(70)  NOT NULL  
, [ReadingId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Readings] ADD CONSTRAINT [Readings_PK] PRIMARY KEY CLUSTERED (
[ReadingId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
    DROP TABLE [dbo].[User]
GO
CREATE TABLE [dbo].[User] (
[UserId] INTEGER  NOT NULL  
, [Name] VARCHAR(50)  NOT NULL  
, [BirthDate] DATETIME  NOT NULL  
, [Address] VARCHAR(50)  NOT NULL  
, [DiagnoseId] INTEGER  NOT NULL  
, [SS#] INTEGER  NOT NULL  
, [Email] VARCHAR(50)  NOT NULL  
, [Phone] VARCHAR(50) NOT NULL  
, [OccupationId] INTEGER  NOT NULL  
, [DoctorId] INTEGER  NOT NULL  
, [InsuranceId] INTEGER  NOT NULL  
, [Ethnicity_UserId] INTEGER  NOT NULL  
, [Zip_UserId] INTEGER  NOT NULL  
, [Location_UserId] INTEGER  NOT NULL  
, [GenderId] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[User] ADD CONSTRAINT [User_PK] PRIMARY KEY CLUSTERED (
[UserId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Diagnosis]') AND type in (N'U'))
    DROP TABLE [dbo].[User_Diagnosis]
GO
CREATE TABLE [dbo].[User_Diagnosis] (
[UserId] INTEGER  NOT NULL  
, [DiagnoseId] INTEGER  NOT NULL  
, [DiagnoseDate] DATETIME  NOT NULL  
, [User_diagnosisId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[User_Diagnosis] ADD CONSTRAINT [User_Diagnosis_PK] PRIMARY KEY CLUSTERED (
[User_diagnosisId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender]') AND type in (N'U'))
    DROP TABLE [dbo].[Gender]
GO
CREATE TABLE [dbo].[Gender] (
[GenderId] INTEGER  NOT NULL  
, [Type] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Gender] ADD CONSTRAINT [Gender_PK] PRIMARY KEY CLUSTERED (
[GenderId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Drug]') AND type in (N'U'))
    DROP TABLE [dbo].[User_Drug]
GO
CREATE TABLE [dbo].[User_Drug] (
[UserId] INTEGER  NULL  
, [DrugId] INTEGER  NULL  
, [User_DrugId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[User_Drug] ADD CONSTRAINT [User_Drug_PK] PRIMARY KEY CLUSTERED (
[User_DrugId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Research_Experiment]') AND type in (N'U'))
    DROP TABLE [dbo].[Research_Experiment]
GO
CREATE TABLE [dbo].[Research_Experiment] (
[ExperimentId] INTEGER  NOT NULL  
, [ResearcherId] INTEGER  NOT NULL  
, [Experiement_StartDate] DATETIME  NOT NULL  
, [Experiment_EndDate] DATETIME  NULL  
, [Research_ExperimentId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Research_Experiment] ADD CONSTRAINT [Research_Experiement_PK] PRIMARY KEY CLUSTERED (
[Research_ExperimentId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ethnicity_User]') AND type in (N'U'))
    DROP TABLE [dbo].[Ethnicity_User]
GO
CREATE TABLE [dbo].[Ethnicity_User] (
[Ethnicity_UserId] INTEGER  NOT NULL  
, [EthnicityId] INTEGER  NOT NULL  
, [UserId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Ethnicity_User] ADD CONSTRAINT [Ethnicity_User_PK] PRIMARY KEY CLUSTERED (
[Ethnicity_UserId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Family]') AND type in (N'U'))
    DROP TABLE [dbo].[User_Family]
GO
CREATE TABLE [dbo].[User_Family] (
[UserId] INTEGER  NULL  
, [User_familyId] INTEGER  NOT NULL  
, [FamilyId] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[User_Family] ADD CONSTRAINT [User_Family_PK] PRIMARY KEY CLUSTERED (
[User_familyId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location_User]') AND type in (N'U'))
    DROP TABLE [dbo].[Location_User]
GO
CREATE TABLE [dbo].[Location_User] (
[UserId] INTEGER  NOT NULL  
, [Birth_Location] VARCHAR(50)  NOT NULL  
, [Living_Location] VARCHAR(50)  NOT NULL  
, [LocationId] INTEGER  NOT NULL  
, [Location_UserId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Location_User] ADD CONSTRAINT [Location_User_PK] PRIMARY KEY CLUSTERED (
[Location_UserId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zip_User]') AND type in (N'U'))
    DROP TABLE [dbo].[Zip_User]
GO
CREATE TABLE [dbo].[Zip_User] (
[ZipCodeId] INTEGER  NOT NULL  
, [UserId] INTEGER  NOT NULL  
, [Zip_UserId] INTEGER  NOT NULL  
, [Time] DATETIME  NOT NULL  
)
GO

ALTER TABLE [dbo].[Zip_User] ADD CONSTRAINT [Zip_User_PK] PRIMARY KEY CLUSTERED (
[Zip_UserId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ethnicity]') AND type in (N'U'))
    DROP TABLE [dbo].[Ethnicity]
GO
CREATE TABLE [dbo].[Ethnicity] (
[EthnicityId] INTEGER  NOT NULL  
, [Ethnicity_Type] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Ethnicity] ADD CONSTRAINT [Ethnicity_PK] PRIMARY KEY CLUSTERED (
[EthnicityId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor_Treatment]') AND type in (N'U'))
    DROP TABLE [dbo].[Doctor_Treatment]
GO
CREATE TABLE [dbo].[Doctor_Treatment] (
[DoctorId] INTEGER  NULL  
, [TreatmentId] INTEGER  NULL  
, [Treatment_StartDate] DATETIME  NULL  
, [Doctor_TreatmentId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Doctor_Treatment] ADD CONSTRAINT [Doctor_Treatment_PK] PRIMARY KEY CLUSTERED (
[Doctor_TreatmentId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Experiment]') AND type in (N'U'))
    DROP TABLE [dbo].[Experiment]
GO
CREATE TABLE [dbo].[Experiment] (
[ExperimentId] INTEGER  NOT NULL  
, [Experiment_Name] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Experiment] ADD CONSTRAINT [Experiment_PK] PRIMARY KEY CLUSTERED (
[ExperimentId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insurance]') AND type in (N'U'))
    DROP TABLE [dbo].[Insurance]
GO
CREATE TABLE [dbo].[Insurance] (
[InsuranceId] INTEGER  NOT NULL  
, [Insurance_Name] VARCHAR(50)  NULL  
, [Phone] VARCHAR(50)  NULL  
, [Insurane_Category] VARCHAR(50)  NULL  
, [Other_NonInsurance] VARCHAR(50)  NULL  
, [DoctorId] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[Insurance] ADD CONSTRAINT [Insurance_PK] PRIMARY KEY CLUSTERED (
[InsuranceId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insurance_Doctor]') AND type in (N'U'))
    DROP TABLE [dbo].[Insurance_Doctor]
GO
CREATE TABLE [dbo].[Insurance_Doctor] (
[Doctor_InsuranceId] INTEGER  NOT NULL  
, [DoctorId] INTEGER  NOT NULL  
, [InsuranceId] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[Insurance_Doctor] ADD CONSTRAINT [Insurance_Doctor_PK] PRIMARY KEY CLUSTERED (
[Doctor_InsuranceId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Treatment]') AND type in (N'U'))
    DROP TABLE [dbo].[Treatment]
GO
CREATE TABLE [dbo].[Treatment] (
[TreatmentId] INTEGER  NOT NULL  
, [Treatment_Name] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Treatment] ADD CONSTRAINT [Treatment_PK] PRIMARY KEY CLUSTERED (
[TreatmentId]
)
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Occupation]') AND type in (N'U'))
    DROP TABLE [dbo].[Occupation]
GO
CREATE TABLE [dbo].[Occupation] (
[OccupationId] INTEGER  NOT NULL  
, [Occupation_Name] VARCHAR(50)  NULL  
, [Occupation_Experience] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Occupation] ADD CONSTRAINT [Occupation_PK] PRIMARY KEY CLUSTERED (
[OccupationId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor_Specialization]') AND type in (N'U'))
    DROP TABLE [dbo].[Doctor_Specialization]
GO
CREATE TABLE [dbo].[Doctor_Specialization] (
[DoctorId] INTEGER  NOT NULL  
, [SpecializationId] INTEGER  NOT NULL  
, [Doctor_SpecializationId] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Doctor_Specialization] ADD CONSTRAINT [Doctor_Specialization_PK] PRIMARY KEY CLUSTERED (
[Doctor_SpecializationId]
)
GO

----=-------------------Add foreing key constraints------------------------
ALTER TABLE [dbo].[Zip_User] WITH CHECK ADD FOREIGN KEY([ZipCodeId])
REFERENCES [dbo].[Zip] ([ZipCodeId])
GO
ALTER TABLE [dbo].[Zip_User] WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO

ALTER TABLE [dbo].[Ethnicity_User] WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Ethnicity_User] WITH CHECK ADD FOREIGN KEY([EthnicityId]) 
REFERENCES [dbo].[Ethnicity]([EthnicityId])
GO

ALTER TABLE [dbo].[User_Family] WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[User_Family] WITH CHECK ADD FOREIGN KEY([FamilyId])
REFERENCES [dbo].[Family] ([FamilyId])
GO

ALTER TABLE [dbo].[Location_User] WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Location_User] WITH CHECK ADD FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO

ALTER TABLE [dbo].[User_Diagnosis] WITH CHECK ADD FOREIGN KEY([DiagnoseId])  
REFERENCES [dbo].[Diagnose] ([DiagnoseId])
GO
ALTER TABLE [dbo].[User_Diagnosis] WITH CHECK ADD FOREIGN KEY([UserId]) 
REFERENCES [dbo].[User] ([UserId])
GO

ALTER TABLE [dbo].[User_Readings] WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[User_Readings] WITH CHECK ADD FOREIGN KEY([ReadingId]) 
REFERENCES [dbo].[Readings] ([ReadingId])
GO

ALTER TABLE [dbo].[Researcher_Specialization] WITH CHECK ADD FOREIGN KEY([ResearcherId])
REFERENCES [dbo].[Researcher] ([ResearcherId])
GO
ALTER TABLE [dbo].[Researcher_Specialization] WITH CHECK ADD FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specialization] ([SpecializationId])
GO

ALTER TABLE [dbo].[Doctor_Specialization] WITH CHECK ADD FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specialization] ([SpecializationId])
GO
ALTER TABLE [dbo].[Doctor_Specialization] WITH CHECK ADD FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO

ALTER TABLE [dbo].[Research_Experiment] WITH CHECK ADD FOREIGN KEY([ResearcherId]) 
REFERENCES [dbo].[Researcher] ([ResearcherId])
GO
ALTER TABLE [dbo].[Research_Experiment] WITH CHECK ADD FOREIGN KEY([ExperimentId])
REFERENCES [dbo].[Experiment] ([ExperimentId])
GO

ALTER TABLE [dbo].[Doctor_Treatment] WITH CHECK ADD FOREIGN KEY ([TreatmentId]) 
REFERENCES [dbo].[Treatment] ([TreatmentId])
GO
ALTER TABLE [dbo].[Doctor_Treatment] WITH CHECK ADD FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO

ALTER TABLE [dbo].[User_Drug] WITH CHECK ADD FOREIGN KEY([UserId]) 
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[User_Drug] WITH CHECK ADD FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drug] ([DrugId])
GO

GO
ALTER TABLE [dbo].[Health_System] WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Health_System] WITH CHECK ADD FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO
ALTER TABLE [dbo].[Health_System] WITH CHECK ADD FOREIGN KEY([ResearcherId])
REFERENCES [dbo].[Researcher] ([ResearcherId])
GO

ALTER TABLE [dbo].[Insurance_Doctor] WITH CHECK ADD FOREIGN KEY([InsuranceId]) 
REFERENCES [dbo].[Insurance] ([InsuranceId])
GO
ALTER TABLE [dbo].[Insurance_Doctor] WITH CHECK ADD FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO

ALTER TABLE  [dbo].[User] WITH CHECK ADD FOREIGN KEY([InsuranceId])
REFERENCES [dbo].[Insurance] ([InsuranceId])
GO 
ALTER TABLE  [dbo].[User] WITH CHECK ADD FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([GenderId])
GO 
ALTER TABLE  [dbo].[User] WITH CHECK ADD FOREIGN KEY([OccupationId])
REFERENCES [dbo].[Occupation] ([OccupationId])
GO
ALTER TABLE [dbo].[Doctor] WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])


-----------------ADD CHECK Constraints----------
ALTER TABLE [dbo].[Doctor]
   ADD CONSTRAINT CHK_ColumnD_LengthOfExperience 
   CHECK ([LengthOfExperience] >= 4 AND [LengthOfExperience] <= 50);
GO

-----------------ADD Computed Columns------------
ALTER TABLE [dbo].[Health_System] ADD HealthScore AS (ExperimentId * TreatmentId * DiagnoseId * DrugId)
GO

------------Create stored Procedures-----------------------------------

SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PopulateUserInfo]
  
AS 
BEGIN 

   SET NOCOUNT ON; 
     
	INSERT INTO [dbo].[Location_User] ([UserId],[Birth_Location],[Living_Location],[LocationId],[Location_UserId])
	VALUES
		(1, 'Oakland, CA', 'Bellevue, NB', 1, 1),(2, 'Melbourne, AU', 'Beverly Hills, CA', 2, 2),
		(3, 'Lynnwood, NJ', 'Miami, FL', 3,3), (4, 'Seattle, WA', 'Paris, FR', 4,4), (5, 'Liverpool, UK', 'Ballard, WA', 5,5), 
		(6, 'Syracuse, NY', 'Barcelona, Spain', 6,6), (7, 'Vancouver, BC', 'Portland, OR', 7,7),
		(8, 'Sao Paulo, BR', 'Mumbai, India', 8,8), (9, 'Beijing, CH', 'Johanesburg, South Africa', 9,9), (10, 'Doha, Qatar', 'Manilla, Phillipines', 10,10)

     INSERT INTO [dbo].[Ethnicity_User] ([Ethnicity_UserId],[EthnicityId],[UserId])
     VALUES
           (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10)
      
	      
	 INSERT INTO [dbo].[Zip_User] ([ZipCodeId], [UserId] ,[Zip_UserId],[Time])
     VALUES
           (11976, 1,1, '2000-01-01'), (33109, 2,2, '1999-02-01'), (73301, 3,3, '1996-07-08'), (80301, 4,4, '2012-01-01'), (90210, 5,5, '2001-07-12'),
		   (91108, 6,6, '2003-09-16'), (94024, 7,7, '2007-09-21'), (98004, 8,8, '2008-12-01'), (98039, 9,9, '2000-07-11'), (89101, 10,10, '2005-09-11')	 

	
	INSERT INTO [dbo].[User_Readings] ([ReadingId],[UserId],[User_ReadingId])
     VALUES
           (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10)

	 
     INSERT INTO [dbo].[User_Family] ([UserId] ,[User_familyId] ,[FamilyId])
     VALUES
           (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10)

 
     INSERT INTO [dbo].[User_Drug] ([UserId] ,[DrugId] ,[User_DrugId])
     VALUES
             (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10)

    
    INSERT INTO [dbo].[User_Diagnosis] ([UserId],[DiagnoseId],[DiagnoseDate],[User_diagnosisId])
     VALUES

           (1,1, '2000-01-01',1), (2,2, '2012-11-01',2), (3,3, '2016-06-04',3), (4,4, '1999-08-27',4), (5,5, '2015-07-08',5),
		   (6,6, '1989-12-20',6), (7,7, '2008-01-21',7), (8,8, '2010-05-05',8), (9,9, '2011-09-01',9), (10,10, '2010-07-011',10)
        
 END
 
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PopulateDoctorTreatmentAndSpecializationAndInsurance]
  
AS 
BEGIN 

   SET NOCOUNT ON; 

   INSERT INTO [dbo].[Doctor_Specialization] ([DoctorId] ,[SpecializationId] ,[Doctor_SpecializationId])
     VALUES
           (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10)

    INSERT INTO [dbo].[Doctor_Treatment] ([DoctorId]  ,[TreatmentId] ,[Treatment_StartDate]  ,[Doctor_TreatmentId])
     VALUES
          (1,1, '2000-01-01', 1), (2,2, '2010-03-04', 2), (3,3, '2002-11-02', 3), (4,4, '2001-12-11', 4), (5,5, '1990-05-29', 5),
          (6,6, '2008-07-01', 6), (7,7, '1998-02-19', 7), (8,8, '2005-12-14', 8), (9,9, '1970-09-11', 9), (10,10, '1950-09-11', 10)

	INSERT INTO [dbo].[Insurance_Doctor] ([Doctor_InsuranceId] ,[DoctorId] ,[InsuranceId])
     VALUES
            (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10)

END
GO

CREATE PROCEDURE [dbo].[sp_PopulateResearchExperimentAndSpecialization]
  
AS 
BEGIN 

   SET NOCOUNT ON; 

  INSERT INTO [dbo].[Research_Experiment]  ([ExperimentId] ,[ResearcherId] ,[Experiement_StartDate] ,[Experiment_EndDate],[Research_ExperimentId])
     VALUES
           (1, 1, '2012-12-01', null, 1), (2, 2, '2000-01-01', '2016-01-01', 2), (3, 3, '2005-11-01', '2015-01-05', 3), (4, 4, '1999-07-11', null, 4), (5, 5, '2016-01-01', '2016-03-01', 5), 
		   (6, 6, '1989-11-01', '2016-01-01', 6), (7, 7, '2009-07-01', null, 7), (8, 8, '2012-12-01', null, 8), (9, 9, '2013-10-15', null, 9), (10, 10, '2006-04-01', '2016-03-01', 10)
  
  INSERT INTO [dbo].[Researcher_Specialization] ([SpecializationId] ,[ResearcherId] ,[Researcher_SpecializationId])
     VALUES
           (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10)
              

END

GO
--------------------------Create Views--------------------------------------------
CREATE VIEW UsersParticipatingOnCurrentMedicalExperiments
AS

SELECT hs.UserId, us.Name, us.Email, ex.Experiment_Name FROM [dbo].[Research_Experiment] re
 JOIN [dbo].[Health_System] hs on re.ExperimentId = hs.ExperimentId
 JOIN [dbo].[User] us on us.UserId = hs.UserId
 JOIN [dbo].[Experiment] ex ON ex.ExperimentId = hs.ExperimentId
WHERE Experiment_EndDate IS NULL
GO

CREATE VIEW DoctorsTreatmentByZipCode
AS
	SELECT hs.ZipCodeId,di.Diagnose_Category, d.Name As 'Doctor'
	FROM [dbo].[Health_System] hs
	JOIN [dbo].[User_Diagnosis] as ud on hs.DiagnoseId = ud.DiagnoseId
	JOIN [dbo].[Diagnose] as di on di.DiagnoseId = ud.DiagnoseId
	JOIN [dbo].[Doctor] as d on d.UserId = ud.UserId

GO

-----------------------------------Insert Data--------------------------------------
INSERT INTO [dbo].[Occupation]
           ([OccupationId]
           ,[Occupation_Name]
           ,[Occupation_Experience])
     VALUES
           (1 ,'Software Developer','10 years'),  
		   (2,'Musician','5 years'), 
		   (3,'Teacher','3 years'), 
		   (4,'Physician','15 years'), 
		   (5,'Politician','20 years'), 
		   (6,'Student','3 years'), 
		   (7,'Taxi driver','7 years'), 
		   (8,'Nurse','4 years'), 
		   (9,'Marketing Manager','5 years'), 
		   (10,'Accountant','6 years')
GO

INSERT INTO [dbo].[Zip]
           ([ZipCodeId]
           ,[City_Name])
     VALUES
           (91108, 'San Marino'),
		   (94024, 'Los Altos'),
           (11976, 'Water Mill'),
		   (33109, 'Miami Beach'),
		   (90210, 'Beverly Hills'),
		   (98039, 'Medina'),
		   (98004, 'Clyde Hill'),
		   (73301, 'Austin'),
		   (80301, 'Boulder'),
		   (89101, 'Las Vegas')
GO

INSERT INTO [dbo].[Ethnicity]
           ([EthnicityId]
           ,[Ethnicity_Type])
     VALUES
           (1,'White'),
		   (2, 'Black or African American'),
		   (3, 'Asian'),
		   (4, 'Native American'),
		   (5, 'European'),
		   (6, 'Middle Eastern'),
		   (7, 'Native Hawaiians or Other Pacific Islander'),
		   (8, 'Hispanic or Latino'),
		   (9, 'Multiracial'),
		   (10, 'Other race')
GO

INSERT INTO [dbo].[Family]
           ([Family_Relation]
           ,[FamilyId])
     VALUES
           ('Parent', 1),
           ('Child', 2),
		   ('Spouse', 3),
		   ('Sibling', 4),
		   ('GrandParents', 5),
		   ('GrandChild', 6),
		   ('Aunt', 7),
		   ('Uncle', 8),
		   ('Cousin', 9),
		   ('Nephew or Nience', 10)
GO

INSERT INTO [dbo].[Gender]
           ([GenderId]
           ,[Type])
     VALUES
           (1, 'Male'),
           (2, 'Female'),
		   (3, 'Other'),
		   (4, 'Transgender Female'),
		   (5, 'Transgender Male'),
		   (6, 'Transsexual Female'),
		   (7, 'Transsexual Male'),
		   (8, 'Agender'),
		   (9, 'Bigender'),
		   (10, 'Gender Variant')
GO

INSERT INTO [dbo].[Insurance]
           ([InsuranceId]
           ,[Insurance_Name]
           ,[Phone]
           ,[Insurane_Category]
           ,[Other_NonInsurance]
           ,[DoctorId])
     VALUES
           (1,'Wellpoint', '317-488-6000', 'Bronze',null,2),
		   (2,'UnitedHealthcare','1 (866) 633-2446', 'Gold',null,3),
		   (3,'Aetna', '1-800-US-AETNA', 'Silver',null,4),
		   (4,'Kaiser Permanente', '(800) 954-8000', 'Gold',null,9),
		   (5,'Cigna','1 (800) 997-1654', 'Silver',null,7),
		   (6,'Humana', '1 (800) 833-6917', 'Bronze',null,8),
			(7,'Health Care Service Corporation', '800-654-7385', 'Platinum',null,10),
			(8,'Highmark', '1-877-298-3918', 'Silver',null,1),
			(9,'Blue Shield Of California', '1 (800) 393-6130', 'Platinum',null,5),
			(10,'Independence Blue Cross', '1-800-ASK-BLUE Or (1-800-275-2583)', 'Silver',null,6)
GO

INSERT INTO [dbo].[Drug]
           ([DrugId]
           ,[Drug_Name])
     VALUES
           (1,'Lipitor'), 
           (2, 'Nexium'),
		   (3, 'Plavix'),
		   (4, 'Advair Diskus'),
		   (5, 'Abilify'),
		   (6, 'Seroquel'),
		   (7, 'Singulair'),
		   (8, 'Crestor'),
		   (9, 'Actos'),
		   (10, 'Epogen')
GO

INSERT INTO [dbo].[Treatment]
           ([TreatmentId]
           ,[Treatment_Name])
     VALUES
           (1, 'Hypertension'),
		   (2, 'Hyperlipidemia'),
		   (3, 'Diabetes'),
		   (4, 'Back pain'),
		   (5, 'Anxiety'),
		   (6, 'Obesity'),
		   (7, 'Allergic rhinitis'),
		   (8, 'Reflux esophagitis'),
		   (9, 'Respiratory problems'),
		   (10, 'Hypothyroidism')
           
GO

INSERT INTO [dbo].[Specialization]
           ([SpecializationId]
           ,[Specialization_Name])
     VALUES
  
(1,	'Orthopedic surgery'),
(2,	'Hematology and/or oncology'),
(3,	'Otolaryngology'),
(4,	'Cardiology'),
(5,	'Gastroenterology'),
(6,	'Urology'),
(7,	'Pulmonology'),
(8,	'Dermatology'),
(9,	'Geriatrics'),
(10, 'Neurology')

GO

INSERT INTO [dbo].[Experiment]
           ([ExperimentId]
           ,[Experiment_Name])
     VALUES
           
(1, 'Bed rest studies'),
(2,	'Alcohol, caffeine & nicotine studies'),
(3,	'Exercise, diet & nutrition studies'),
(4,	'Psychology studies (personality, perception, etc.)'),
(5,	'Cognitive studies (memory, concentration, etc.)'),
(6,	'Sensory studies - testing taste, smell, etc'),
(7,	'Visual studies'),
(8,	'Dermatological (skin) studies'),
(9,	 'Brain wave studies'),
(10, 'Egg & sperm studies')

GO

INSERT INTO [dbo].[Readings]
           ([Reading_Name]
           ,[ReadingId])
     VALUES
           ('Blood Pressure', 1),
		   ('A1C', 2),
		   ('White Blood Cells', 3),
		   ('Red Blood Cells',4),
		   ('Fats (lipids)', 5),
		   ('Proteins', 6),
		   ('Sugar (glucose)', 7),
		   ('Electrolytes (potassium, magnesium, sodium, and calcium)', 8),
		   ('Enzymes', 9),
		   ('Urinalysis', 10)
           
GO
INSERT INTO [dbo].[Researcher] ([Name],[ResearcherId] ,[SS#],[Email],[Phone])
     VALUES
           ('Grace Eldering', 1, 534178719, 'GraceE@gmail.com', '1-800-682-8208'),
		   ('Pearl Kendrick', 2, 534134780, 'PearlK@gmail.com', '1-800-783-7619'),
		   ('Isaac Ismach', 3, 334174652, 'IsaacI@gmail.com', '1-800-980-6210'),
		   ('Karl Landsteiner', 4, 278564072, 'KarlL@gmail.com', '1-800-657-0824'),
		   ('Francoise Barre-Sinoussi', 5, 479063077, 'FrancoiseB@gmail.com', '1-877-906-5817'),
		   ('Rachel Schneerson', 6, 479063077, 'Rachels@gmail.com', '1-877-543-2901'),
		   ('Leslie Collier', 7, 521833097, 'LeslieC@gmail.com', '1-800-786-2451'),
		   ('Mary Ellen Avery', 8, 535838007, 'MaryA@gmail.com', '1-800-790-4801'),
		   ('Benjamin Rubin', 9, 529237517, 'BenjaminR@gmail.com', '1-800-787-7461'),
		   ('Gertrude Elion', 10, 536803015, 'GertrudeEgmail.com', '1-877-936-3850')
       
GO

INSERT INTO [dbo].[Diagnose] ([Diagnose_Category] ,[DiagnoseId])
     VALUES
          ('Hypertension', 1), ('Hyperlipidemia', 2), ('Diabetes', 3), ('Back pain', 4), ('Anxiety', 5),
		  ('Obesity', 6), ('Allergic rhinitis', 7), ('Reflux esophagitis', 8), ('Respiratory problems', 9),
		  ('Hypothyroidism', 10)
GO


INSERT INTO [dbo].[User]
           ([UserId]
           ,[Name]
           ,[BirthDate]
           ,[Address]
           ,[DiagnoseId]
           ,[SS#]
           ,[Email]
           ,[Phone]
           ,[OccupationId]
           ,[DoctorId]
           ,[InsuranceId]
           ,[Ethnicity_UserId]
           ,[Zip_UserId]
           ,[Location_UserId]
           ,[GenderId])
     VALUES
	       (1,'Goertzen, Jacob', '1950-07-02', '2345 100th PL W, Reno, NV', 1, '534218769', 'jacobG@gmail.com', '2534577890', 1, 1,1, 1, 1, 1, 1),
		   (2,'Glenn, Myron', '1969-12-02', '11118 95th PL W, New York, NY', 2, '336217469', 'jacobG@gmail.com', '2564971890', 2, 2,2, 2, 2, 2, 2),
           (3,'Metz, Henry', '1969-12-02', '17819 95th PL W, Oakland,  CA', 3, '537217789', 'MetzH@gmail.com', '2536576890', 3, 3,3, 3, 3, 3, 3),
		   (4,'Flint, Everett', '1969-12-02', '21210 76h  Ave E, Seaatle, WA', 4, '536217769', 'FlintE@gmail.com', '2534577896', 4, 4,4, 4, 4, 4, 4),
		   (5,'Russell, Karen', '1969-12-02', '18976 115th AVe W, El Paso, TX', 5, '536217769', 'RussellK@gmail.com', '2634577890', 5, 5,5, 5, 5, 5, 5),
		   (6,'Johnson, Gail', '1969-12-02', '32450 30th PL W apt B, Bellevue, NB', 6, '536217769', 'JohnsonG@gmail.com', '4534577890', 6, 6,6, 6, 6, 6, 6),
		   (7,'Schmidt, Betty', '1969-12-02', 'Rue St Germains, Paris, FR', 7, '536217769', 'SchmidtB@gmail.com', '2834577890', 7, 7,7, 7, 7, 7, 7),
		   (8,'Yong, Terry', '1969-12-02', 'Main street, Vancouver, BC', 9, '536217769', 'YongT@gmail.com', '7534577867', 8, 8,8, 8, 8, 8, 8),
		   (9,'Kim, Helen', '1969-12-02', '11119 105th PL W, Lynnood, UT', 9, '536217769', 'HelenK@gmail.com', '4534577890', 9, 9,9, 9, 9, 9, 9),
		   (10,'Okoyo, Hasse', '1969-12-02', '89067 95th PL W apt 21, New York, NY', 10, '536217769', 'OkoyoH@gmail.com', '4334557899', 10, 10,10, 10, 10, 10, 10)
GO

INSERT INTO [dbo].[Location] ([Location_Name],[LocationId])
     VALUES
           ('Melbourne, AU', 1), ('Beverly Hills, CA', 2), ('Miami, FL', 3), ('Vancouver, BC', 4), ('Johanesburg, South Africa', 5), 
		   ('Mumbai, India', 6), ('Seattle, WA', 7), ('Barcelona, Spain', 8), ('Portland, OR', 9), ('Austin, TX', 10)
GO

EXEC [dbo].[sp_PopulateUserInfo]
GO
INSERT INTO [dbo].[Doctor]
           ([UserId]
           ,[DoctorId]
           ,[InsuranceId]
           ,[SS#]
           ,[Email]
           ,[Phone]
           ,[Name]
           ,[LengthOfExperience])
     VALUES
           (1,1,1, 534567819, 'Xingf@gmail.com', '1-800-456-7819', 'Xing Fu', 10),
           (2,2,2, 534567819, 'SharmilaA@gmail.com', '1-800-436-9819', 'Sharmila Ahmed', 5),
		   (3,3,3, 234567819, 'MaryW@gmail.com', '1-800-457-5819', 'Mary Wemple', 28),
		   (4,4,4, 234587819, 'JohnY@gmail.com', '1-800-416-2819', 'John Yuen', 7),
		   (5,5,5, 534557819, 'MannyE@gmail.com', '1-800-426-3819', 'Manny Eusebio', 10),
		   (6,6,6, 537567819, 'ChadM@gmail.com', '1-800-456-7819', 'Chad Marion', 9),
		   (7,7,7, 533567819, 'KirkA@gmail.com', '1-800-478-2819', 'Kirk Alexander', 13),
		   (8,8,8, 530567819, 'BenL@gmail.com', '1-800-456-7819', 'Ben Lacey', 6),
		   (9,9,9, 534767819, 'TonyH@gmail.com', '1-800-456-7819', 'Tony Huynh', 4),
		   (10,10,10, 534567819, 'MichaelW@gmail.com', '1-800-456-7819', 'Michael Wolfe', 11)
GO
EXEC [dbo].[sp_PopulateDoctorTreatmentAndSpecializationAndInsurance]

GO
EXEC [dbo].[sp_PopulateResearchExperimentAndSpecialization]

GO

INSERT INTO [dbo].[Health_System]
           ([Date_Time]
           ,[DiagnoseId]
           ,[UserId]
           ,[DoctorId]
           ,[ResearcherId]
           ,[DrugId]
           ,[ZipCodeId]
           ,[Drug_Dosage]
           ,[Drug_Frequency]
           ,[ExperimentId]
           ,[TreatmentId]
           ,[LocationId]
           ,[Health_SystemId])
     VALUES
           ('2015-01-01', 1, 1, 1, 1, 1, 33109, 10, 'twice a day', 1, 1, 1, 1),
		   ('2000-11-09', 2, 2, 2, 2, 2, 11976, 8, 'once a day', 2, 2, 2, 2),
		   ('2001-10-10', 3, 3, 3, 3, 3, 11976, 2, 'once a week', 3, 3, 3, 3),		
		   ('2005-05-18', 4, 4, 4, 4, 5, 73301, 9, 'three times a day', 4, 4, 4, 4),
		   ('1999-02-20', 5, 5, 5, 5, 7, 90210, 3, 'once a day', 5, 5, 5, 5),
		   ('1989-08-29', 6, 6, 6, 6, 8, 91108, 1, 'twice after lunch', 6, 6, 6, 6),
		   ('2016-03-14', 7, 7, 7, 7, 9, 94024, 8, 'twice in the afternoon', 7, 7, 7, 7),
		   ('2007-12-19', 8, 8, 8, 8, 6, 11976, 5, 'once a day', 8, 8, 8, 8),
		   ('2004-11-11', 9, 9, 9, 9, 10, 98039, 6, 'once a day', 9, 9, 9, 9),
		   ('2009-09-12', 10, 10, 10, 10, 1, 80301, 7, 'four times a day', 10, 10, 10, 10)

GO