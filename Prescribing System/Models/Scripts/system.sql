USE [master]
GO
/****** Object:  Database [E-Prescribing]    Script Date: 2022/08/10 11:49:34 ******/
CREATE DATABASE [E-Prescribing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-Prescribing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\E-Prescribing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E-Prescribing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\E-Prescribing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [E-Prescribing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-Prescribing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-Prescribing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-Prescribing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-Prescribing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-Prescribing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-Prescribing] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-Prescribing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-Prescribing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-Prescribing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-Prescribing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-Prescribing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-Prescribing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-Prescribing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-Prescribing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-Prescribing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-Prescribing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-Prescribing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-Prescribing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-Prescribing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-Prescribing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-Prescribing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-Prescribing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-Prescribing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-Prescribing] SET RECOVERY FULL 
GO
ALTER DATABASE [E-Prescribing] SET  MULTI_USER 
GO
ALTER DATABASE [E-Prescribing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-Prescribing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-Prescribing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-Prescribing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E-Prescribing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E-Prescribing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'E-Prescribing', N'ON'
GO
ALTER DATABASE [E-Prescribing] SET QUERY_STORE = OFF
GO
USE [E-Prescribing]
GO
/****** Object:  Table [dbo].[ActiveIngredient]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveIngredient](
	[ActiveIngreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ActiveStrengthID] [int] NULL,
 CONSTRAINT [ActiveIngredient$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ActiveIngreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActiveStrength]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveStrength](
	[StrengthID] [int] IDENTITY(1,1) NOT NULL,
	[Strength] [nvarchar](255) NULL,
 CONSTRAINT [ActiveStrength$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[StrengthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcuteDisease]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcuteDisease](
	[AcuteDiseaseID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[DiseaseID] [int] NULL,
	[PatientID] [int] NULL,
 CONSTRAINT [AcuteDisease$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[AcuteDiseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcuteMedication]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcuteMedication](
	[AcuteMedicationID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[MedicationID] [int] NULL,
 CONSTRAINT [AcuteMedication$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[AcuteMedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Allergy]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allergy](
	[AllergyID] [int] IDENTITY(1,1) NOT NULL,
	[ActiveIngredientID] [int] NULL,
	[PatientID] [int] NULL,
 CONSTRAINT [Allergy$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[AllergyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChronicMedHistory]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChronicMedHistory](
	[ChronicMedHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[PatientID] [int] NULL,
	[DiseaseID] [int] NULL,
 CONSTRAINT [ChronicMedHistory$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ChronicMedHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChronicMedication]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChronicMedication](
	[ChronicMedicationID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[MedicationID] [int] NULL,
 CONSTRAINT [ChronicMedication$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ChronicMedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](5) NULL,
	[ProvID] [int] NULL,
 CONSTRAINT [City$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConditionDiagnosis]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConditionDiagnosis](
	[IcdID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[PatientID] [int] NULL,
 CONSTRAINT [ConditionDiagnosis$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[IcdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContraIndication]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContraIndication](
	[ContraIndicaID] [int] IDENTITY(1,1) NOT NULL,
	[ActiveIngredientID] [int] NULL,
	[DiseaseID] [int] NULL,
 CONSTRAINT [ContraIndication$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ContraIndicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disease]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disease](
	[DiseaseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [Disease$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[DiseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[ContactNo] [bigint] NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[HighestQualification] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[SuburbID] [int] NULL,
	[MedPracID] [int] NULL,
 CONSTRAINT [Doctor$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dosage]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dosage](
	[DosageID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [nvarchar](255) NULL,
 CONSTRAINT [Dosage$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[DosageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalPractice]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalPractice](
	[MedPracID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ContactNo] [bigint] NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[PracticeNo] [int] NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[SuburbID] [int] NULL,
 CONSTRAINT [MedicalPractice$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[MedPracID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medication]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medication](
	[MedicationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[DosageID] [int] NULL,
	[ActiveIngredientID] [int] NULL,
	[ScheduleID] [int] NULL,
 CONSTRAINT [Medication$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[MedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicationInteraction]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationInteraction](
	[InteractionID] [int] IDENTITY(1,1) NOT NULL,
	[Medication1ID] [int] NULL,
	[Medication2ID] [int] NULL,
	[ActiveIngredient1ID] [int] NULL,
	[ActiveIngredient2ID] [int] NULL,
	[Effect] [nvarchar](255) NULL,
 CONSTRAINT [MedicationInteraction$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[InteractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[IdNumber] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[SuburbID] [int] NULL,
 CONSTRAINT [Patient$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacist]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacist](
	[PharmacistID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[ContactNo] [bigint] NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](max) NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[PharmacyID] [int] NULL,
	[SuburbID] [int] NULL,
 CONSTRAINT [Pharmacist$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PharmacistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[PharmacyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[ContactNo] [bigint] NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[LicenceNo] [bigint] NULL,
	[SuburbID] [nvarchar](255) NULL,
 CONSTRAINT [Pharmacy$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[PrescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[PatientID] [int] NULL,
	[DoctorID] [int] NULL,
 CONSTRAINT [Prescription$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionLine]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionLine](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [nvarchar](255) NULL,
	[Instruction] [nvarchar](255) NULL,
	[RepeatNo] [int] NULL,
	[RepeatLeftNo] [int] NULL,
	[Status] [nvarchar](255) NULL,
	[PrescriptionID] [int] NULL,
	[MedicationID] [int] NULL,
	[PharmacyID] [int] NULL,
 CONSTRAINT [PrescriptionLine$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Abbreviation] [nvarchar](255) NULL,
 CONSTRAINT [Province$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ProvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] NULL,
	[ScheduleNo] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suburb]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suburb](
	[SuburbID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[PostalCode] [varchar](5) NULL,
	[CityID] [int] NULL,
 CONSTRAINT [Suburb$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[SuburbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Role] [nvarchar](255) NULL,
 CONSTRAINT [User$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [ActiveIngredient$ActiveIngreID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ActiveIngredient$ActiveIngreID] ON [dbo].[ActiveIngredient]
(
	[ActiveIngreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ActiveIngredient$ActiveStrengthID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ActiveIngredient$ActiveStrengthID] ON [dbo].[ActiveIngredient]
(
	[ActiveStrengthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ActiveStrength$StrengthID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ActiveStrength$StrengthID] ON [dbo].[ActiveStrength]
(
	[StrengthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [AcuteDisease$DiseaseID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [AcuteDisease$DiseaseID] ON [dbo].[AcuteDisease]
(
	[DiseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [AcuteDisease$PatientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [AcuteDisease$PatientID] ON [dbo].[AcuteDisease]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [AcuteMedication$AcuteMedicationID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [AcuteMedication$AcuteMedicationID] ON [dbo].[AcuteMedication]
(
	[AcuteMedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [AcuteMedication$MedicationID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [AcuteMedication$MedicationID] ON [dbo].[AcuteMedication]
(
	[MedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [AcuteMedication$PatientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [AcuteMedication$PatientID] ON [dbo].[AcuteMedication]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Allergy$ActiveIngredientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Allergy$ActiveIngredientID] ON [dbo].[Allergy]
(
	[ActiveIngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Allergy$AllergyID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Allergy$AllergyID] ON [dbo].[Allergy]
(
	[AllergyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Allergy$PatientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Allergy$PatientID] ON [dbo].[Allergy]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ChronicMedHistory$ChronicMedHistoryID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ChronicMedHistory$ChronicMedHistoryID] ON [dbo].[ChronicMedHistory]
(
	[ChronicMedHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ChronicMedHistory$DiseaseID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ChronicMedHistory$DiseaseID] ON [dbo].[ChronicMedHistory]
(
	[DiseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ChronicMedHistory$PatientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ChronicMedHistory$PatientID] ON [dbo].[ChronicMedHistory]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ChronicMedication$MedicationID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ChronicMedication$MedicationID] ON [dbo].[ChronicMedication]
(
	[ChronicMedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ChronicMedication$MedicationID1]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ChronicMedication$MedicationID1] ON [dbo].[ChronicMedication]
(
	[MedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ChronicMedication$PatientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ChronicMedication$PatientID] ON [dbo].[ChronicMedication]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [City$CityID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [City$CityID] ON [dbo].[City]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [City$CityID1]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [City$CityID1] ON [dbo].[City]
(
	[ProvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [City$PostalCode]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [City$PostalCode] ON [dbo].[City]
(
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ConditionDiagnosis$Code]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ConditionDiagnosis$Code] ON [dbo].[ConditionDiagnosis]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ConditionDiagnosis$IcdID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ConditionDiagnosis$IcdID] ON [dbo].[ConditionDiagnosis]
(
	[IcdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ConditionDiagnosis$PatientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ConditionDiagnosis$PatientID] ON [dbo].[ConditionDiagnosis]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ContraIndication$ActiveIngredientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ContraIndication$ActiveIngredientID] ON [dbo].[ContraIndication]
(
	[ActiveIngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ContraIndication$ContraIndicaID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ContraIndication$ContraIndicaID] ON [dbo].[ContraIndication]
(
	[ContraIndicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ContraIndication$DiseaseID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [ContraIndication$DiseaseID] ON [dbo].[ContraIndication]
(
	[DiseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Disease$DiseaseID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Disease$DiseaseID] ON [dbo].[Disease]
(
	[DiseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Doctor$MedPracID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Doctor$MedPracID] ON [dbo].[Doctor]
(
	[MedPracID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Doctor$SuburbID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Doctor$SuburbID] ON [dbo].[Doctor]
(
	[SuburbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Dosage$DosageID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Dosage$DosageID] ON [dbo].[Dosage]
(
	[DosageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MedicalPractice$MedPracID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [MedicalPractice$MedPracID] ON [dbo].[MedicalPractice]
(
	[MedPracID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MedicalPractice$SuburbID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [MedicalPractice$SuburbID] ON [dbo].[MedicalPractice]
(
	[SuburbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Medication$DosageID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Medication$DosageID] ON [dbo].[Medication]
(
	[DosageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Medication$MedicationID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Medication$MedicationID] ON [dbo].[Medication]
(
	[MedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Medication$ScheduleID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Medication$ScheduleID] ON [dbo].[Medication]
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MedicationInteraction$ActiveIngredient1ID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [MedicationInteraction$ActiveIngredient1ID] ON [dbo].[MedicationInteraction]
(
	[ActiveIngredient1ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MedicationInteraction$ActiveIngredient2ID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [MedicationInteraction$ActiveIngredient2ID] ON [dbo].[MedicationInteraction]
(
	[ActiveIngredient2ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MedicationInteraction$Medication1ID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [MedicationInteraction$Medication1ID] ON [dbo].[MedicationInteraction]
(
	[Medication1ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MedicationInteraction$Medication2ID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [MedicationInteraction$Medication2ID] ON [dbo].[MedicationInteraction]
(
	[Medication2ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Patient$IdNumber]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Patient$IdNumber] ON [dbo].[Patient]
(
	[IdNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Patient$SuburbID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Patient$SuburbID] ON [dbo].[Patient]
(
	[SuburbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Pharmacist$PharmacyID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Pharmacist$PharmacyID] ON [dbo].[Pharmacist]
(
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Pharmacist$SuburbID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Pharmacist$SuburbID] ON [dbo].[Pharmacist]
(
	[SuburbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Pharmacy$PharmacyID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Pharmacy$PharmacyID] ON [dbo].[Pharmacy]
(
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Pharmacy$SuburbID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Pharmacy$SuburbID] ON [dbo].[Pharmacy]
(
	[SuburbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Prescription$DoctorID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Prescription$DoctorID] ON [dbo].[Prescription]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Prescription$PatientID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Prescription$PatientID] ON [dbo].[Prescription]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Prescription$PrescriptionID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Prescription$PrescriptionID] ON [dbo].[Prescription]
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PrescriptionLine$LineID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [PrescriptionLine$LineID] ON [dbo].[PrescriptionLine]
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PrescriptionLine$MedicationID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [PrescriptionLine$MedicationID] ON [dbo].[PrescriptionLine]
(
	[MedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PrescriptionLine$PharmacyID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [PrescriptionLine$PharmacyID] ON [dbo].[PrescriptionLine]
(
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PrescriptionLine$PrescriptionID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [PrescriptionLine$PrescriptionID] ON [dbo].[PrescriptionLine]
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Province$ProvID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Province$ProvID] ON [dbo].[Province]
(
	[ProvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Schedule$ScheduleID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Schedule$ScheduleID] ON [dbo].[Schedule]
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Suburb$CityID]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Suburb$CityID] ON [dbo].[Suburb]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Suburb$PostalCode]    Script Date: 2022/08/10 11:49:35 ******/
CREATE NONCLUSTERED INDEX [Suburb$PostalCode] ON [dbo].[Suburb]
(
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActiveIngredient] ADD  DEFAULT ((0)) FOR [ActiveStrengthID]
GO
ALTER TABLE [dbo].[AcuteDisease] ADD  DEFAULT ((0)) FOR [DiseaseID]
GO
ALTER TABLE [dbo].[AcuteDisease] ADD  DEFAULT ((0)) FOR [PatientID]
GO
ALTER TABLE [dbo].[AcuteMedication] ADD  DEFAULT ((0)) FOR [PatientID]
GO
ALTER TABLE [dbo].[AcuteMedication] ADD  DEFAULT ((0)) FOR [MedicationID]
GO
ALTER TABLE [dbo].[Allergy] ADD  DEFAULT ((0)) FOR [ActiveIngredientID]
GO
ALTER TABLE [dbo].[Allergy] ADD  DEFAULT ((0)) FOR [PatientID]
GO
ALTER TABLE [dbo].[ChronicMedHistory] ADD  DEFAULT ((0)) FOR [PatientID]
GO
ALTER TABLE [dbo].[ChronicMedHistory] ADD  DEFAULT ((0)) FOR [DiseaseID]
GO
ALTER TABLE [dbo].[ChronicMedication] ADD  DEFAULT ((0)) FOR [PatientID]
GO
ALTER TABLE [dbo].[ChronicMedication] ADD  DEFAULT ((0)) FOR [MedicationID]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF__City__PostalCode__02084FDA]  DEFAULT ((0)) FOR [PostalCode]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF__City__ProvID__02FC7413]  DEFAULT ((0)) FOR [ProvID]
GO
ALTER TABLE [dbo].[ConditionDiagnosis] ADD  DEFAULT ((0)) FOR [PatientID]
GO
ALTER TABLE [dbo].[ContraIndication] ADD  DEFAULT ((0)) FOR [ActiveIngredientID]
GO
ALTER TABLE [dbo].[ContraIndication] ADD  DEFAULT ((0)) FOR [DiseaseID]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ((0)) FOR [ContactNo]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ((0)) FOR [SuburbID]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ((0)) FOR [MedPracID]
GO
ALTER TABLE [dbo].[MedicalPractice] ADD  DEFAULT ((0)) FOR [ContactNo]
GO
ALTER TABLE [dbo].[MedicalPractice] ADD  DEFAULT ((0)) FOR [PracticeNo]
GO
ALTER TABLE [dbo].[MedicalPractice] ADD  DEFAULT ((0)) FOR [SuburbID]
GO
ALTER TABLE [dbo].[Medication] ADD  DEFAULT ((0)) FOR [DosageID]
GO
ALTER TABLE [dbo].[Medication] ADD  DEFAULT ((0)) FOR [ActiveIngredientID]
GO
ALTER TABLE [dbo].[Medication] ADD  DEFAULT ((0)) FOR [ScheduleID]
GO
ALTER TABLE [dbo].[MedicationInteraction] ADD  DEFAULT ((0)) FOR [Medication1ID]
GO
ALTER TABLE [dbo].[MedicationInteraction] ADD  DEFAULT ((0)) FOR [Medication2ID]
GO
ALTER TABLE [dbo].[MedicationInteraction] ADD  DEFAULT ((0)) FOR [ActiveIngredient1ID]
GO
ALTER TABLE [dbo].[MedicationInteraction] ADD  DEFAULT ((0)) FOR [ActiveIngredient2ID]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF__Patient__IdNumbe__1332DBDC]  DEFAULT ((0)) FOR [IdNumber]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF__Patient__Contact__14270015]  DEFAULT ((0)) FOR [ContactNo]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF__Patient__SuburbI__151B244E]  DEFAULT ((0)) FOR [SuburbID]
GO
ALTER TABLE [dbo].[Pharmacist] ADD  DEFAULT ((0)) FOR [ContactNo]
GO
ALTER TABLE [dbo].[Pharmacist] ADD  DEFAULT ((0)) FOR [PharmacyID]
GO
ALTER TABLE [dbo].[Pharmacist] ADD  DEFAULT ((0)) FOR [SuburbID]
GO
ALTER TABLE [dbo].[Pharmacy] ADD  DEFAULT ((0)) FOR [ContactNo]
GO
ALTER TABLE [dbo].[Pharmacy] ADD  DEFAULT ((0)) FOR [LicenceNo]
GO
ALTER TABLE [dbo].[Pharmacy] ADD  DEFAULT ((0)) FOR [SuburbID]
GO
ALTER TABLE [dbo].[Prescription] ADD  DEFAULT ((0)) FOR [PatientID]
GO
ALTER TABLE [dbo].[Prescription] ADD  DEFAULT ((0)) FOR [DoctorID]
GO
ALTER TABLE [dbo].[PrescriptionLine] ADD  DEFAULT ((0)) FOR [RepeatNo]
GO
ALTER TABLE [dbo].[PrescriptionLine] ADD  DEFAULT ((0)) FOR [RepeatLeftNo]
GO
ALTER TABLE [dbo].[PrescriptionLine] ADD  DEFAULT ((0)) FOR [PrescriptionID]
GO
ALTER TABLE [dbo].[PrescriptionLine] ADD  DEFAULT ((0)) FOR [MedicationID]
GO
ALTER TABLE [dbo].[PrescriptionLine] ADD  DEFAULT ((0)) FOR [PharmacyID]
GO
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ((0)) FOR [ScheduleID]
GO
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ((0)) FOR [ScheduleNo]
GO
ALTER TABLE [dbo].[Suburb] ADD  CONSTRAINT [DF__Suburb__PostalCo__245D67DE]  DEFAULT ((0)) FOR [PostalCode]
GO
ALTER TABLE [dbo].[Suburb] ADD  CONSTRAINT [DF__Suburb__CityID__25518C17]  DEFAULT ((0)) FOR [CityID]
GO
ALTER TABLE [dbo].[AcuteDisease]  WITH CHECK ADD  CONSTRAINT [AcuteDisease$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DiseaseAcuteDisease] FOREIGN KEY([DiseaseID])
REFERENCES [dbo].[Disease] ([DiseaseID])
GO
ALTER TABLE [dbo].[AcuteDisease] CHECK CONSTRAINT [AcuteDisease$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DiseaseAcuteDisease]
GO
ALTER TABLE [dbo].[AcuteDisease]  WITH CHECK ADD  CONSTRAINT [AcuteDisease$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientAcuteDisease] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[AcuteDisease] CHECK CONSTRAINT [AcuteDisease$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientAcuteDisease]
GO
ALTER TABLE [dbo].[AcuteMedication]  WITH CHECK ADD  CONSTRAINT [FK_AcuteMedication_Medication] FOREIGN KEY([MedicationID])
REFERENCES [dbo].[Medication] ([MedicationID])
GO
ALTER TABLE [dbo].[AcuteMedication] CHECK CONSTRAINT [FK_AcuteMedication_Medication]
GO
ALTER TABLE [dbo].[AcuteMedication]  WITH CHECK ADD  CONSTRAINT [FK_AcuteMedication_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[AcuteMedication] CHECK CONSTRAINT [FK_AcuteMedication_Patient]
GO
ALTER TABLE [dbo].[Allergy]  WITH CHECK ADD  CONSTRAINT [Allergy$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ActiveIngredientAllergy] FOREIGN KEY([ActiveIngredientID])
REFERENCES [dbo].[ActiveIngredient] ([ActiveIngreID])
GO
ALTER TABLE [dbo].[Allergy] CHECK CONSTRAINT [Allergy$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ActiveIngredientAllergy]
GO
ALTER TABLE [dbo].[Allergy]  WITH CHECK ADD  CONSTRAINT [Allergy$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientAllergy] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Allergy] CHECK CONSTRAINT [Allergy$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientAllergy]
GO
ALTER TABLE [dbo].[ChronicMedHistory]  WITH CHECK ADD  CONSTRAINT [FK_ChronicMedHistory_Disease] FOREIGN KEY([DiseaseID])
REFERENCES [dbo].[Disease] ([DiseaseID])
GO
ALTER TABLE [dbo].[ChronicMedHistory] CHECK CONSTRAINT [FK_ChronicMedHistory_Disease]
GO
ALTER TABLE [dbo].[ChronicMedHistory]  WITH CHECK ADD  CONSTRAINT [FK_ChronicMedHistory_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[ChronicMedHistory] CHECK CONSTRAINT [FK_ChronicMedHistory_Patient]
GO
ALTER TABLE [dbo].[ChronicMedication]  WITH CHECK ADD  CONSTRAINT [FK_ChronicMedication_Medication] FOREIGN KEY([MedicationID])
REFERENCES [dbo].[Medication] ([MedicationID])
GO
ALTER TABLE [dbo].[ChronicMedication] CHECK CONSTRAINT [FK_ChronicMedication_Medication]
GO
ALTER TABLE [dbo].[ChronicMedication]  WITH CHECK ADD  CONSTRAINT [FK_ChronicMedication_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[ChronicMedication] CHECK CONSTRAINT [FK_ChronicMedication_Patient]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [City$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ProvinceCity] FOREIGN KEY([ProvID])
REFERENCES [dbo].[Province] ([ProvID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [City$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ProvinceCity]
GO
ALTER TABLE [dbo].[ConditionDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_ConditionDiagnosis_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[ConditionDiagnosis] CHECK CONSTRAINT [FK_ConditionDiagnosis_Patient]
GO
ALTER TABLE [dbo].[ContraIndication]  WITH CHECK ADD  CONSTRAINT [FK_ContraIndication_ActiveIngredient] FOREIGN KEY([ActiveIngredientID])
REFERENCES [dbo].[ActiveIngredient] ([ActiveIngreID])
GO
ALTER TABLE [dbo].[ContraIndication] CHECK CONSTRAINT [FK_ContraIndication_ActiveIngredient]
GO
ALTER TABLE [dbo].[ContraIndication]  WITH CHECK ADD  CONSTRAINT [FK_ContraIndication_Disease] FOREIGN KEY([DiseaseID])
REFERENCES [dbo].[Disease] ([DiseaseID])
GO
ALTER TABLE [dbo].[ContraIndication] CHECK CONSTRAINT [FK_ContraIndication_Disease]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].MedicalPracticeDoctor] FOREIGN KEY([MedPracID])
REFERENCES [dbo].[MedicalPractice] ([MedPracID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].MedicalPracticeDoctor]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbDoctor] FOREIGN KEY([SuburbID])
REFERENCES [dbo].[Suburb] ([SuburbID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbDoctor]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserDoctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserDoctor]
GO
ALTER TABLE [dbo].[MedicalPractice]  WITH CHECK ADD  CONSTRAINT [MedicalPractice$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbMedicalPractice] FOREIGN KEY([SuburbID])
REFERENCES [dbo].[Suburb] ([SuburbID])
GO
ALTER TABLE [dbo].[MedicalPractice] CHECK CONSTRAINT [MedicalPractice$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbMedicalPractice]
GO
ALTER TABLE [dbo].[Medication]  WITH CHECK ADD  CONSTRAINT [Medication$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ActiveIngredientMedication] FOREIGN KEY([ActiveIngredientID])
REFERENCES [dbo].[ActiveIngredient] ([ActiveIngreID])
GO
ALTER TABLE [dbo].[Medication] CHECK CONSTRAINT [Medication$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ActiveIngredientMedication]
GO
ALTER TABLE [dbo].[Medication]  WITH CHECK ADD  CONSTRAINT [Medication$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DosageMedication] FOREIGN KEY([DosageID])
REFERENCES [dbo].[Dosage] ([DosageID])
GO
ALTER TABLE [dbo].[Medication] CHECK CONSTRAINT [Medication$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DosageMedication]
GO
ALTER TABLE [dbo].[MedicationInteraction]  WITH CHECK ADD  CONSTRAINT [FK_MedicationInteraction_ActiveIngredient] FOREIGN KEY([ActiveIngredient1ID])
REFERENCES [dbo].[ActiveIngredient] ([ActiveIngreID])
GO
ALTER TABLE [dbo].[MedicationInteraction] CHECK CONSTRAINT [FK_MedicationInteraction_ActiveIngredient]
GO
ALTER TABLE [dbo].[MedicationInteraction]  WITH CHECK ADD  CONSTRAINT [FK_MedicationInteraction_ActiveIngredient1] FOREIGN KEY([ActiveIngredient2ID])
REFERENCES [dbo].[ActiveIngredient] ([ActiveIngreID])
GO
ALTER TABLE [dbo].[MedicationInteraction] CHECK CONSTRAINT [FK_MedicationInteraction_ActiveIngredient1]
GO
ALTER TABLE [dbo].[MedicationInteraction]  WITH CHECK ADD  CONSTRAINT [FK_MedicationInteraction_Medication] FOREIGN KEY([Medication1ID])
REFERENCES [dbo].[Medication] ([MedicationID])
GO
ALTER TABLE [dbo].[MedicationInteraction] CHECK CONSTRAINT [FK_MedicationInteraction_Medication]
GO
ALTER TABLE [dbo].[MedicationInteraction]  WITH CHECK ADD  CONSTRAINT [FK_MedicationInteraction_Medication1] FOREIGN KEY([Medication2ID])
REFERENCES [dbo].[Medication] ([MedicationID])
GO
ALTER TABLE [dbo].[MedicationInteraction] CHECK CONSTRAINT [FK_MedicationInteraction_Medication1]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Patient$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbPatient] FOREIGN KEY([SuburbID])
REFERENCES [dbo].[Suburb] ([SuburbID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Patient$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbPatient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Patient$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserPatient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Patient$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserPatient]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PharmacyPharmacist] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacy] ([PharmacyID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PharmacyPharmacist]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbPharmacist] FOREIGN KEY([SuburbID])
REFERENCES [dbo].[Suburb] ([SuburbID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbPharmacist]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserPharmacist] FOREIGN KEY([PharmacistID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserPharmacist]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [Prescription$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DoctorPrescription] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [Prescription$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DoctorPrescription]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [Prescription$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientPrescription] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [Prescription$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientPrescription]
GO
ALTER TABLE [dbo].[PrescriptionLine]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionLine_Medication] FOREIGN KEY([MedicationID])
REFERENCES [dbo].[Medication] ([MedicationID])
GO
ALTER TABLE [dbo].[PrescriptionLine] CHECK CONSTRAINT [FK_PrescriptionLine_Medication]
GO
ALTER TABLE [dbo].[PrescriptionLine]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionLine_Pharmacy] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacy] ([PharmacyID])
GO
ALTER TABLE [dbo].[PrescriptionLine] CHECK CONSTRAINT [FK_PrescriptionLine_Pharmacy]
GO
ALTER TABLE [dbo].[PrescriptionLine]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionLine_Prescription] FOREIGN KEY([PrescriptionID])
REFERENCES [dbo].[Prescription] ([PrescriptionID])
GO
ALTER TABLE [dbo].[PrescriptionLine] CHECK CONSTRAINT [FK_PrescriptionLine_Prescription]
GO
ALTER TABLE [dbo].[Suburb]  WITH CHECK ADD  CONSTRAINT [Suburb$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].CitySuburb] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Suburb] CHECK CONSTRAINT [Suburb$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].CitySuburb]
GO
/****** Object:  StoredProcedure [dbo].[AddPatientForTesting]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPatientForTesting]
	
AS
BEGIN
	DECLARE @NewID int
	DECLARE @i int = 1
	WHILE @i < 30
	BEGIN
		INSERT INTO dbo.[User]
			(Username, Password, Role)
		VALUES('temp' + CAST(@i AS nvarchar(5)) + '@mail.com', '12345678', 'Patient')
		SELECT @NewID = SCOPE_IDENTITY()
		INSERT INTO dbo.[Patient]
			(PatientID, FirstName, LastName, IdNumber, EmailAddress, ContactNo, AddressLine1, AddressLine2, SuburbID)
		VALUES(@NewID,'TEMP'+CAST(@i AS nvarchar(5)),
			'LAST'+CAST(@i AS nvarchar(5)),000000000000+@i,
			'temp' + CAST(@i AS nvarchar(5)) + '@mail.com',
			 00000000 +@i,
			'address line 1',
			'address line 2',
			1)
		SET @i = @i + 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CheckEmail]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckEmail]
	@email nvarchar(max)
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From [Patient]
	Where EmailAddress = @email;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckID]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckID]
	@id nvarchar(max)
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From [Patient]
	Where IdNumber = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCities]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCities]
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From [City]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllMedPracs]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllMedPracs]
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From MedicalPractice
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPharmacies]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPharmacies]
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From Pharmacy
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProvinces]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllProvinces]
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From Province
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSuburbs]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllSuburbs]
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From Suburb
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsersWithPaging]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsersWithPaging]
	@PageSize int
AS
BEGIN
	DECLARE @PageNumber int
	SET @PageNumber = 1
	DECLARE @MaxTablePage AS float
	SELECT  @MaxTablePage = COUNT(*) FROM dbo.[User]
	SET @MaxTablePage = CEILING(@MaxTablePage/@PageSize)
	WHILE @MaxTablePage >= @PageNumber
	BEGIN
		SELECT *
		FROM dbo.[User]
		ORDER BY UserId
		OFFSET @PageSize * (@PageNumber -1) ROWS
		FETCH NEXT @PageSize ROWS ONLY
		SET @PageNumber = @PageNumber + 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserWithId]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserWithId]
	@id int
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From [User]
	Where UserID = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserWithUsername]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserWithUsername]
	@username nvarchar(max)
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From [User]
	Where Username = @username;
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Login]
	@username nvarchar(max),
	@password nvarchar(max)
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From [User]
	Where Username = @username AND Password = @password;
END
GO
/****** Object:  StoredProcedure [dbo].[RegisterPatient]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterPatient]
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(max),
	@LastName nvarchar(max),
	@IdNumber nvarchar(max),
	@ContactNo nvarchar(max),
	@EmailAddress nvarchar(max),
	@AddressLine1 nvarchar(max),
	@AddressLine2 nvarchar(max),
	@SuburbID int,
	@Username nvarchar(max),
	@Password nvarchar(max),
	@Role nvarchar(max)
AS
BEGIN
	--SET NOCOUNT ON;
	--SET XACT_ABORT ON;
	DECLARE @NewID int
	INSERT INTO [User] (Username, Password, Role) 
	VALUES (@EmailAddress, @Password, @Role)
	SELECT @NewID = SCOPE_IDENTITY()
	INSERT INTO [Patient] (PatientID, FirstName, LastName, IdNumber, ContactNo, EmailAddress, AddressLine1, AddressLine2, SuburbID)
	VALUES (@NewID, @FirstName, @LastName, @IdNumber, @ContactNo, @EmailAddress, @AddressLine1, @AddressLine2, @SuburbID)
	--SET NOCOUNT OFF;
	--SET XACT_ABORT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SearchForDoctors]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchForDoctors]
	@Search nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON
		SELECT DoctorID, Concat(FirstName,' ', LastName) as Name
		FROM dbo.Doctor
		WHERE FirstName LIKE '%' + @Search + '%'
	union
		select DoctorID, concat(FirstName,' ', LastName) as Name
		from dbo.Doctor
		where LastName Like '%' + @Search + '&'
END
GO
/****** Object:  StoredProcedure [dbo].[SearchForMedication]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchForMedication]
	@Search nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON
		SELECT MedicationID, Name
		FROM dbo.Medication
		WHERE Name LIKE '%' + @Search + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SearchForPatients]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchForPatients]
	@Search nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON
		SELECT PatientID, Concat(FirstName,' ', LastName) as Name
		FROM dbo.Patient
		WHERE FirstName LIKE '%' + @Search + '%'
	union
		select PatientID, concat(FirstName,' ', LastName) as Name
		from dbo.Patient
		where LastName Like '%' + @Search + '&'
END
GO
/****** Object:  StoredProcedure [dbo].[SearchForPharmacists]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchForPharmacists]
	@Search nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON
		SELECT PharmacistID, Concat(FirstName,' ', LastName) as Name
		FROM dbo.Pharmacist
		WHERE FirstName LIKE '%' + @Search + '%'
	union
		select PharmacistID, concat(FirstName,' ', LastName) as Name
		from dbo.Pharmacist
		where LastName Like '%' + @Search + '&'
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 2022/08/10 11:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
	@UserId int,
	@Username nvarchar(50),
	@Password nvarchar(50),
	@Role nvarchar(30)
AS
BEGIN
	UPDATE dbo.[User] SET Username = @Username, Password = @Password, Role = @Role
	WHERE UserID = @UserId;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveIngredient].[ActiveIngreID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveIngredient', @level2type=N'COLUMN',@level2name=N'ActiveIngreID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveIngredient].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveIngredient', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveIngredient].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveIngredient', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveIngredient].[ActiveStrengthID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveIngredient', @level2type=N'COLUMN',@level2name=N'ActiveStrengthID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveIngredient].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveIngredient', @level2type=N'CONSTRAINT',@level2name=N'ActiveIngredient$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveIngredient].[ActiveIngreID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveIngredient', @level2type=N'INDEX',@level2name=N'ActiveIngredient$ActiveIngreID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveIngredient].[ActiveStrengthID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveIngredient', @level2type=N'INDEX',@level2name=N'ActiveIngredient$ActiveStrengthID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveIngredient]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveIngredient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveStrength].[StrengthID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveStrength', @level2type=N'COLUMN',@level2name=N'StrengthID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveStrength].[Strength]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveStrength', @level2type=N'COLUMN',@level2name=N'Strength'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveStrength].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveStrength', @level2type=N'CONSTRAINT',@level2name=N'ActiveStrength$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveStrength].[StrengthID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveStrength', @level2type=N'INDEX',@level2name=N'ActiveStrength$StrengthID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ActiveStrength]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ActiveStrength'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[AcuteDiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'COLUMN',@level2name=N'AcuteDiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[DiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'COLUMN',@level2name=N'DiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'COLUMN',@level2name=N'PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'CONSTRAINT',@level2name=N'AcuteDisease$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[DiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'INDEX',@level2name=N'AcuteDisease$DiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'INDEX',@level2name=N'AcuteDisease$PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DiseaseAcuteDisease]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'CONSTRAINT',@level2name=N'AcuteDisease$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].DiseaseAcuteDisease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteDisease].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientAcuteDisease]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteDisease', @level2type=N'CONSTRAINT',@level2name=N'AcuteDisease$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].PatientAcuteDisease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteMedication].[AcuteMedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteMedication', @level2type=N'COLUMN',@level2name=N'AcuteMedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteMedication].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteMedication', @level2type=N'COLUMN',@level2name=N'PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteMedication].[MedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteMedication', @level2type=N'COLUMN',@level2name=N'MedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteMedication].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteMedication', @level2type=N'CONSTRAINT',@level2name=N'AcuteMedication$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteMedication].[AcuteMedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteMedication', @level2type=N'INDEX',@level2name=N'AcuteMedication$AcuteMedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteMedication].[MedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteMedication', @level2type=N'INDEX',@level2name=N'AcuteMedication$MedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteMedication].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteMedication', @level2type=N'INDEX',@level2name=N'AcuteMedication$PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[AcuteMedication]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcuteMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[AllergyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'COLUMN',@level2name=N'AllergyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[ActiveIngredientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'COLUMN',@level2name=N'ActiveIngredientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'COLUMN',@level2name=N'PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'CONSTRAINT',@level2name=N'Allergy$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[ActiveIngredientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'INDEX',@level2name=N'Allergy$ActiveIngredientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[AllergyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'INDEX',@level2name=N'Allergy$AllergyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'INDEX',@level2name=N'Allergy$PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ActiveIngredientAllergy]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'CONSTRAINT',@level2name=N'Allergy$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].ActiveIngredientAllergy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Allergy].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientAllergy]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allergy', @level2type=N'CONSTRAINT',@level2name=N'Allergy$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].PatientAllergy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory].[ChronicMedHistoryID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory', @level2type=N'COLUMN',@level2name=N'ChronicMedHistoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory].[Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory', @level2type=N'COLUMN',@level2name=N'PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory].[DiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory', @level2type=N'COLUMN',@level2name=N'DiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory', @level2type=N'CONSTRAINT',@level2name=N'ChronicMedHistory$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory].[ChronicMedHistoryID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory', @level2type=N'INDEX',@level2name=N'ChronicMedHistory$ChronicMedHistoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory].[DiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory', @level2type=N'INDEX',@level2name=N'ChronicMedHistory$DiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory', @level2type=N'INDEX',@level2name=N'ChronicMedHistory$PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedHistory]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedication].[ChronicMedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedication', @level2type=N'COLUMN',@level2name=N'ChronicMedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedication].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedication', @level2type=N'COLUMN',@level2name=N'PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedication].[MedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedication', @level2type=N'COLUMN',@level2name=N'MedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedication].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedication', @level2type=N'CONSTRAINT',@level2name=N'ChronicMedication$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedication].[MedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedication', @level2type=N'INDEX',@level2name=N'ChronicMedication$MedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedication].[MedicationID1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedication', @level2type=N'INDEX',@level2name=N'ChronicMedication$MedicationID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedication].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedication', @level2type=N'INDEX',@level2name=N'ChronicMedication$PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ChronicMedication]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChronicMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[CityID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[PostalCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'COLUMN',@level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[ProvID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'COLUMN',@level2name=N'ProvID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'CONSTRAINT',@level2name=N'City$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[CityID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'INDEX',@level2name=N'City$CityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[CityID1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'INDEX',@level2name=N'City$CityID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[PostalCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'INDEX',@level2name=N'City$PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[City].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ProvinceCity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'CONSTRAINT',@level2name=N'City$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].ProvinceCity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis].[IcdID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis', @level2type=N'COLUMN',@level2name=N'IcdID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis].[Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis', @level2type=N'COLUMN',@level2name=N'PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis', @level2type=N'CONSTRAINT',@level2name=N'ConditionDiagnosis$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis].[Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis', @level2type=N'INDEX',@level2name=N'ConditionDiagnosis$Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis].[IcdID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis', @level2type=N'INDEX',@level2name=N'ConditionDiagnosis$IcdID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis', @level2type=N'INDEX',@level2name=N'ConditionDiagnosis$PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ConditionDiagnosis]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionDiagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ContraIndication].[ContraIndicaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContraIndication', @level2type=N'COLUMN',@level2name=N'ContraIndicaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ContraIndication].[ActiveIngredientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContraIndication', @level2type=N'COLUMN',@level2name=N'ActiveIngredientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ContraIndication].[DiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContraIndication', @level2type=N'COLUMN',@level2name=N'DiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ContraIndication].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContraIndication', @level2type=N'CONSTRAINT',@level2name=N'ContraIndication$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ContraIndication].[ActiveIngredientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContraIndication', @level2type=N'INDEX',@level2name=N'ContraIndication$ActiveIngredientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ContraIndication].[ContraIndicaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContraIndication', @level2type=N'INDEX',@level2name=N'ContraIndication$ContraIndicaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ContraIndication].[DiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContraIndication', @level2type=N'INDEX',@level2name=N'ContraIndication$DiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[ContraIndication]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContraIndication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Disease].[DiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Disease', @level2type=N'COLUMN',@level2name=N'DiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Disease].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Disease', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Disease].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Disease', @level2type=N'CONSTRAINT',@level2name=N'Disease$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Disease].[DiseaseID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Disease', @level2type=N'INDEX',@level2name=N'Disease$DiseaseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Disease]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Disease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[DoctorID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[FirstName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[LastName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[ContactNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'ContactNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[EmailAddress]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[HighestQualifaction]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'HighestQualification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[AddressLine1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'AddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[AddressLine2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'AddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[MedPracID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'MedPracID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'CONSTRAINT',@level2name=N'Doctor$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[MedPracID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'INDEX',@level2name=N'Doctor$MedPracID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'INDEX',@level2name=N'Doctor$SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].MedicalPracticeDoctor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'CONSTRAINT',@level2name=N'Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].MedicalPracticeDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbDoctor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'CONSTRAINT',@level2name=N'Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].SuburbDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Doctor].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserDoctor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'CONSTRAINT',@level2name=N'Doctor$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].UserDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Dosage].[DosageID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dosage', @level2type=N'COLUMN',@level2name=N'DosageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Dosage].[FormName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dosage', @level2type=N'COLUMN',@level2name=N'FormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Dosage].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dosage', @level2type=N'CONSTRAINT',@level2name=N'Dosage$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Dosage].[DosageID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dosage', @level2type=N'INDEX',@level2name=N'Dosage$DosageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Dosage]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dosage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[MedPracID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'COLUMN',@level2name=N'MedPracID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[ContactNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'COLUMN',@level2name=N'ContactNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[EmailAddress]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[PracticeNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'COLUMN',@level2name=N'PracticeNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[AddressLine1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'COLUMN',@level2name=N'AddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[AddressLine2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'COLUMN',@level2name=N'AddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'COLUMN',@level2name=N'SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'CONSTRAINT',@level2name=N'MedicalPractice$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[MedPracID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'INDEX',@level2name=N'MedicalPractice$MedPracID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'INDEX',@level2name=N'MedicalPractice$SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicalPractice].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbMedicalPractice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicalPractice', @level2type=N'CONSTRAINT',@level2name=N'MedicalPractice$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].SuburbMedicalPractice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[MedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'COLUMN',@level2name=N'MedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[DosageID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'COLUMN',@level2name=N'DosageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[ActiveIngredientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'COLUMN',@level2name=N'ActiveIngredientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[ScheduleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'COLUMN',@level2name=N'ScheduleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'CONSTRAINT',@level2name=N'Medication$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[DosageID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'INDEX',@level2name=N'Medication$DosageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[MedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'INDEX',@level2name=N'Medication$MedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[ScheduleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'INDEX',@level2name=N'Medication$ScheduleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].ActiveIngredientMedication]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'CONSTRAINT',@level2name=N'Medication$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].ActiveIngredientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Medication].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DosageMedication]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Medication', @level2type=N'CONSTRAINT',@level2name=N'Medication$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].DosageMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[InteractionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'COLUMN',@level2name=N'InteractionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[Medication1ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'COLUMN',@level2name=N'Medication1ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[Medication2ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'COLUMN',@level2name=N'Medication2ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[ActiveIngredient1ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'COLUMN',@level2name=N'ActiveIngredient1ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[ActiveIngredient2ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'COLUMN',@level2name=N'ActiveIngredient2ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[Effect]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'COLUMN',@level2name=N'Effect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'CONSTRAINT',@level2name=N'MedicationInteraction$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[ActiveIngredient1ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'INDEX',@level2name=N'MedicationInteraction$ActiveIngredient1ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[ActiveIngredient2ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'INDEX',@level2name=N'MedicationInteraction$ActiveIngredient2ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[Medication1ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'INDEX',@level2name=N'MedicationInteraction$Medication1ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction].[Medication2ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction', @level2type=N'INDEX',@level2name=N'MedicationInteraction$Medication2ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[MedicationInteraction]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MedicationInteraction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[FirstName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[LastName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[IdNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'IdNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[ContactNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'ContactNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[EmailAddress]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[AddressLine1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'AddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[AddressLine2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'AddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'COLUMN',@level2name=N'SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'CONSTRAINT',@level2name=N'Patient$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[IdNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'INDEX',@level2name=N'Patient$IdNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'INDEX',@level2name=N'Patient$SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbPatient]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'CONSTRAINT',@level2name=N'Patient$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].SuburbPatient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Patient].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserPatient]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patient', @level2type=N'CONSTRAINT',@level2name=N'Patient$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].UserPatient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[PharmacistID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'PharmacistID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[FirstName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[LastName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[ContactNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'ContactNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[EmailAddress]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[AddressLine1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'AddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[AddressLine2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'AddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[PharmacyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'PharmacyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'COLUMN',@level2name=N'SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'CONSTRAINT',@level2name=N'Pharmacist$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[PharmacyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'INDEX',@level2name=N'Pharmacist$PharmacyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'INDEX',@level2name=N'Pharmacist$SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PharmacyPharmacist]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'CONSTRAINT',@level2name=N'Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].PharmacyPharmacist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].SuburbPharmacist]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'CONSTRAINT',@level2name=N'Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].SuburbPharmacist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacist].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].UserPharmacist]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacist', @level2type=N'CONSTRAINT',@level2name=N'Pharmacist$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].UserPharmacist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[PharmacyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'COLUMN',@level2name=N'PharmacyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[AddressLine1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'COLUMN',@level2name=N'AddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[AddressLine2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'COLUMN',@level2name=N'AddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[ContactNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'COLUMN',@level2name=N'ContactNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[EmailAddress]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[LicenceNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'COLUMN',@level2name=N'LicenceNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'COLUMN',@level2name=N'SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'CONSTRAINT',@level2name=N'Pharmacy$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[PharmacyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'INDEX',@level2name=N'Pharmacy$PharmacyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy', @level2type=N'INDEX',@level2name=N'Pharmacy$SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Pharmacy]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pharmacy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[PrescriptionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'COLUMN',@level2name=N'PrescriptionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'COLUMN',@level2name=N'PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[DoctorID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'COLUMN',@level2name=N'DoctorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'CONSTRAINT',@level2name=N'Prescription$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[DoctorID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'INDEX',@level2name=N'Prescription$DoctorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[PatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'INDEX',@level2name=N'Prescription$PatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[PrescriptionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'INDEX',@level2name=N'Prescription$PrescriptionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].DoctorPrescription]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'CONSTRAINT',@level2name=N'Prescription$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].DoctorPrescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Prescription].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].PatientPrescription]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prescription', @level2type=N'CONSTRAINT',@level2name=N'Prescription$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].PatientPrescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[LineID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'LineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[Quantity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[Instruction]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'Instruction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[RepeatNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'RepeatNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[RepeatLeftNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'RepeatLeftNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[PrescriptionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'PrescriptionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[MedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'MedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[PharmacyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'COLUMN',@level2name=N'PharmacyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'CONSTRAINT',@level2name=N'PrescriptionLine$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[LineID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'INDEX',@level2name=N'PrescriptionLine$LineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[MedicationID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'INDEX',@level2name=N'PrescriptionLine$MedicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[PharmacyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'INDEX',@level2name=N'PrescriptionLine$PharmacyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine].[PrescriptionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine', @level2type=N'INDEX',@level2name=N'PrescriptionLine$PrescriptionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[PrescriptionLine]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrescriptionLine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Province].[ProvID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Province', @level2type=N'COLUMN',@level2name=N'ProvID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Province].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Province', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Province].[Abbreviation]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Province', @level2type=N'COLUMN',@level2name=N'Abbreviation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Province].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Province', @level2type=N'CONSTRAINT',@level2name=N'Province$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Province].[ProvID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Province', @level2type=N'INDEX',@level2name=N'Province$ProvID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Schedule].[ScheduleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'COLUMN',@level2name=N'ScheduleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Schedule].[ScheduleNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'COLUMN',@level2name=N'ScheduleNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Schedule].[ScheduleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'INDEX',@level2name=N'Schedule$ScheduleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Schedule]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb].[SuburbID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb', @level2type=N'COLUMN',@level2name=N'SuburbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb].[PostalCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb', @level2type=N'COLUMN',@level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb].[CityID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb', @level2type=N'CONSTRAINT',@level2name=N'Suburb$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb].[CityID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb', @level2type=N'INDEX',@level2name=N'Suburb$CityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb].[PostalCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb', @level2type=N'INDEX',@level2name=N'Suburb$PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[Suburb].[[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb]].CitySuburb]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suburb', @level2type=N'CONSTRAINT',@level2name=N'Suburb$[C:\Users\Kingsly\Documents\Work\Programming\Adv_Projects\ONP400\E-PrescribingDB_be.accdb].CitySuburb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[User].[UserID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[User].[Username]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[User].[Password]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[User].[Role]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[User].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'CONSTRAINT',@level2name=N'User$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'E-PrescribingDB.[User]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User'
GO
USE [master]
GO
ALTER DATABASE [E-Prescribing] SET  READ_WRITE 
GO
